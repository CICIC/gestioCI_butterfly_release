from django.contrib.admin.utils import (unquote, flatten_fieldsets, get_deleted_objects,
	model_format_dict, NestedObjects, lookup_needs_distinct)
from django.utils.encoding import force_text
IS_POPUP_VAR = '_popup'
TO_FIELD_VAR = '_to_field'
from functools import partial, reduce, update_wrapper
from django import forms
import warnings
'''
reverseadmin
============
Module that makes django admin handle OneToOneFields in a better way.

A common use case for one-to-one relationships is to "embed" a model
inside another one. For example, a Person may have multiple foreign
keys pointing to an Address entity, one home address, one business
address and so on. Django admin displays those relations using select
boxes, letting the user choose which address entity to connect to a
person. A more natural way to handle the relationship is using
inlines. However, since the foreign key is placed on the owning
entity, django admins standard inline classes can't be used. Which is
why I created this module that implements "reverse inlines" for this
use case.

Example:

	from django.db import models
	class Address(models.Model):
		street = models.CharField(max_length = 255)
		zipcode = models.CharField(max_length = 10)
		city = models.CharField(max_length = 255)
	class Person(models.Model):
		name = models.CharField(max_length = 255)
		business_addr = models.OneToOneField(Address,
											 related_name = 'business_addr')
		home_addr = models.OneToOneField(Address, related_name = 'home_addr')

This is how standard django admin renders it:

	http://img9.imageshack.us/i/beforetz.png/

Here is how it looks when using the reverseadmin module:

	http://img408.imageshack.us/i/afterw.png/

You use reverseadmin in the following way:

	from django.contrib import admin
	from models import Person
	from reverseadmin import ReverseModelAdmin
	class PersonAdmin(ReverseModelAdmin):
		inline_type = 'tabular'
	admin.site.register(Person, PersonAdmin)

inline_type can be either "tabular" or "stacked" for tabular and
stacked inlines respectively.

The module is designed to work with Django 1.1.1. Since it hooks into
the internals of the admin package, it may not work with later Django
versions.
'''
from django.contrib.admin import helpers, ModelAdmin
from django.contrib.admin.options import InlineModelAdmin
from django.db import transaction
from django.db.models import OneToOneField
from django.forms import ModelForm
from django.forms.formsets import all_valid
from django.forms.models import BaseModelFormSet
from django.forms.models import (modelform_factory, formset_factory, modelformset_factory,
	inlineformset_factory, BaseInlineFormSet, modelform_defines_fields)
from django.utils.encoding import force_unicode
from django.utils.functional import curry
from django.utils.safestring import mark_safe
from django.utils.translation import ugettext as _

class ReverseInlineFormSet(BaseModelFormSet):
	'''
	A formset with either a single object or a single empty
	form. Since the formset is used to render a required OneToOne
	relation, the forms must not be empty.
	'''
	model = None
	parent_fk_name = ''
	min_num = 1
	extra = 1
	max_num = 1

	def __init__(self,
				 data = None,
				 files = None,
				 instance = None,
				 prefix = None,
				 save_as_new = False,
				 queryset = None,
				 parent_fk_name = None,
				 model = None,
				 fields = None):

		self.model = model
		self.fields = fields
		if not self.model and instance:
			self.model = instance._meta.model
			model = self.model
		if instance:
			qs =  model.objects.filter(pk = instance.id)
		else:
			if model:
				qs = model.objects.filter(pk = -1)
			else:
				qs = None
			self.extra = 1

		super(ReverseInlineFormSet, self).__init__(data, files,
													   prefix = prefix,
													   queryset = qs)
	def get_queryset(self):
		if not hasattr(self, '_queryset'):
			if self.queryset is not None:
				qs = self.queryset
			else:
				qs = self.model._default_manager.get_queryset()

			# If the queryset isn't already ordered we need to add an
			# artificial ordering here to make sure that all formsets
			# constructed from this queryset have the same form order.
			if not qs.ordered:
				qs = qs.order_by(self.model._meta.pk.name)

			# Removed queryset limiting here. As per discussion re: #13023
			# on django-dev, max_num should not prevent existing
			# related objects/inlines from being displayed.
			self._queryset = qs
		return self._queryset


def reverse_inlineformset_factory(parent_model,
								  model,
								  parent_fk_name,
								  form = ModelForm,
								  fields = None,
								  exclude = None,
								  formfield_callback = lambda f: f.formfield(),
								  instance = None):

	if hasattr(instance, parent_fk_name):
		instance = getattr(instance, parent_fk_name)
	else:
		instance = None

	formset = ReverseInlineFormSet(None,None, instance, None, False, None, parent_fk_name, model) 
	form.fields = fields
	form = modelform_factory(model, form=form,fields=fields)
	attrs = {'form': form, 'can_order': False, 'can_delete': False,
			'min_num': 1, 'max_num': 1,
			'absolute_max': 1, 'validate_min': 1,
			'validate_max': 1, 'fields':fields}
	FormSet = type(form.__name__ + str('FormSet'), (ReverseInlineFormSet,), attrs)
	FormSet.model = model
	if instance:
		qs =  model.objects.filter(pk = instance.id)
	else:
		if model:
			qs = model.objects.filter(pk = -1)
		else:
			qs = None
	FormSet.queryset = qs
	FormSet.parent_fk_name = parent_fk_name
	return FormSet


class ReverseInlineModelAdmin(InlineModelAdmin):
	'''
	Use the name and the help_text of the owning models field to
	render the verbose_name and verbose_name_plural texts.
	'''
	def __init__(self,
				 parent_model,
				 parent_fk_name,
				 model, admin_site,
				 inline_type,
				 fields = None):
		self.template = 'admin/edit_inline/%s.html' % inline_type
		self.parent_fk_name = parent_fk_name
		self.model = model
		field_descriptor = getattr(parent_model, self.parent_fk_name)
		field = field_descriptor.field
		self.verbose_name_plural = field.verbose_name.title()
		self.verbose_name = field.help_text
		self.fields = fields
		if not self.verbose_name:
			self.verbose_name = self.verbose_name_plural
		super(ReverseInlineModelAdmin, self).__init__(parent_model, admin_site)

	def get_formset(self, request, obj = None, **kwargs):
		fields = self.fields
		if self.exclude is None:
			exclude = []
		else:
			exclude = list(self.exclude)
		# if exclude is an empty list we use None, since that's the actual
		# default
		exclude = (exclude + kwargs.get("exclude", [])) or None

		defaults = {
			"form": self.form,
			"fields": fields,
			"exclude": exclude,
			"formfield_callback": curry(self.formfield_for_dbfield, request=request),
			"instance": obj
		}
		defaults.update(kwargs)
		return reverse_inlineformset_factory(self.parent_model,
											 self.model,
											 self.parent_fk_name,
											 **defaults)

from Welcome.admin import AutoRecordName	
class ReverseModelAdmin(ModelAdmin):
	'''
	Patched ModelAdmin class. The change_view method is overridden to
	allow the reverse inline formsets to be saved before the parent
	model.
	'''
	def __init__(self, model, admin_site):
		super(ReverseModelAdmin, self).__init__(model, admin_site)
		if self.exclude is None:
			self.exclude = []
		self.inline_instances = []
		for inline in self.inline_reverse:
			field = model._meta.get_field(inline[0])
			name = field.name
			parent = field.related.parent_model
			inline = ReverseInlineModelAdmin(model, name, parent, admin_site, self.inline_type, inline[1])
			self.inline_instances.append(inline)
			self.exclude.append(name)
		self.inlines = self.inline_instances
	def _create_formsets(self, request, obj):
		"Helper function to generate formsets for add/change_view."
		formsets = []
		inline_instances = []
		prefixes = {}
		get_formsets_args = [request]
		if obj.pk:
			get_formsets_args.append(obj)
		for FormSet, inline in self.get_formsets_with_inlines(*get_formsets_args):
			prefix = FormSet.get_default_prefix()
			prefixes[prefix] = prefixes.get(prefix, 0) + 1
			if prefixes[prefix] != 1 or not prefix:
				prefix = "%s-%s" % (prefix, prefixes[prefix])
			formset_params = {
				'instance': getattr(obj, inline.parent_fk_name),
				'prefix': prefix,
				'queryset': inline.get_queryset(request),
			}
			if request.method == 'POST':
				formset_params.update({
					'data': request.POST,
					'files': request.FILES,
					'save_as_new': '_saveasnew' in request.POST
				})
			formsets.append(FormSet(**formset_params))
			inline_instances.append(inline)
		return formsets, inline_instances
	def get_inline_instances(self, request, obj=None):
		return self.inline_instances


	@transaction.atomic
	def change_view(self, request, object_id, form_url='', extra_context=None):
		"The 'change' admin view for this model."
		model = self.model
		opts = model._meta

		obj = self.get_object(request, unquote(object_id))

		if not self.has_change_permission(request, obj):
			raise PermissionDenied

		if obj is None:
			raise Http404(_('%(name)s object with primary key %(key)r does not exist.') % {'name': force_text(opts.verbose_name), 'key': escape(object_id)})
		
		if request.method == 'POST' and "_saveasnew" in request.POST:
			return self.add_view(request, form_url=reverse('admin:%s_%s_add' % (
				opts.app_label, opts.model_name),
				current_app=self.admin_site.name))

		ModelForm = self.get_form(request, obj)
		formsets = []
		if request.method == 'POST':
			form = ModelForm(request.POST, request.FILES, instance=obj)
			if form.is_valid():
				form_validated = True
				new_object = self.save_form(request, form, change=True)
			else:
				form_validated = False
				new_object = form.instance

			formsets, inline_instances = self._create_formsets(request, new_object)
			if all_valid(formsets) and form_validated:
				self.save_model(request, new_object, form, True)
				self.save_related(request, form, formsets, True)
				change_message = self.construct_change_message(request, form, formsets)
				self.log_change(request, new_object, change_message)
				return self.response_change(request, new_object)

		else:
			form = ModelForm(instance=obj)
			formsets, inline_instances = self._create_formsets(request, obj)

		adminForm = helpers.AdminForm(form, self.get_fieldsets(request, obj),
			self.get_prepopulated_fields(request, obj),
			self.get_readonly_fields(request, obj),
			model_admin=self)
		media = self.media + adminForm.media

		inline_admin_formsets = []
		for inline, formset in zip(inline_instances, formsets):
			fieldsets = list(inline.get_fieldsets(request, obj))
			readonly = list(inline.get_readonly_fields(request, obj))
			prepopulated = dict(inline.get_prepopulated_fields(request, obj))
			inline_admin_formset = helpers.InlineAdminFormSet(inline, formset,
				fieldsets, prepopulated, readonly, model_admin=self)
			inline_admin_formsets.append(inline_admin_formset)
			media = media + inline_admin_formset.media

		context = dict(self.admin_site.each_context(),
			title=_('Change %s') % force_text(opts.verbose_name),
			adminform=adminForm,
			object_id=object_id,
			original=obj,
			is_popup=(IS_POPUP_VAR in request.POST or
					  IS_POPUP_VAR in request.GET),
			to_field=request.POST.get(TO_FIELD_VAR,
									  request.GET.get(TO_FIELD_VAR)),
			media=media,
			inline_admin_formsets=inline_admin_formsets,
			errors=helpers.AdminErrorList(form, formsets),
			app_label=opts.app_label,
			preserved_filters=self.get_preserved_filters(request),
		)
		context.update(extra_context or {})
		return self.render_change_form(request, context, change=True, obj=obj, form_url=form_url)
