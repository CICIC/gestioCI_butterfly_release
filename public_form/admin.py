#encoding=utf-8
from django.contrib import admin
from django import forms
from django.forms.extras import widgets
from django.utils.translation import ugettext as _
from Cooper.admin import user_admin_site
from itertools import chain
from django.contrib.admin import ModelAdmin
from django.contrib import admin
from Welcome.models import Learn_Session, Project
from General.models import Human
from Cooper.admin import user_admin_site
from django.core.exceptions import ObjectDoesNotExist
from django.db.models import Count
from django.contrib import messages
from django.contrib.admin import SimpleListFilter
from django.utils.safestring import mark_safe

class type_session_filter (SimpleListFilter):

	title = _(u'Sessions Acollida i Avaluació')
	parameter_name = 'learn_session_id'

	def lookups(self, request, model_admin):

		welcome_sessions = Learn_Session.objects.filter(record_type__clas="welcome_session")
		yFilters = ()
		for session in welcome_sessions:
			message =  _(u"%s asistents %s. ")
			from django.utils import formats
			date = formats.date_format(session.datetime, "SHORT_DATETIME_FORMAT")
			message = message % (date, session.assistants.count())
			yFilters = yFilters + ((session.id, message),)
		return yFilters

	def queryset(self, request, queryset):
		#do nothing will be managed in jQuery and templatetags
		return queryset


class type_human_filter (SimpleListFilter):

	title = _(u"Registe d'assistencia")
	parameter_name = 'human_id'

	def lookups(self, request, model_admin):

		try:
			current_human = None
			if request.GET.has_key("human_id"):
				current_human = Human.objects.get(id=request.GET.get("human_id"))
		except:
			pass
		from Welcome.models import Learn_Session
		try:
			current_session = Learn_Session.objects.get(id=request.GET.get("learn_session_id", -1))
		except ObjectDoesNotExist:
				current_session = None

		if current_session and current_human:
			assistance_to_welcome = current_session.assistants.all()
			self.title = _(u"Assistents de la sessio: ") + current_session.name
		elif current_session:
			assistance_to_welcome = current_session.assistants.all()
			self.title = _(u"Assistents de la sessio: ") + current_session.name
		elif current_human:
			assistance_to_welcome = current_human.assist_sessions.all()
			self.title = _(u"Del huma")
		else:
			return

		yFilters = ()
		for loop_session in assistance_to_welcome:
			if loop_session:
				yFilters = yFilters + ((loop_session.id, loop_session.__str__()),)
		return yFilters

	def queryset(self, request, queryset):
		#do nothing will be managed in jQuery and templatetags
		return queryset

from public_form.models import human_proxy
from public_form.forms import human_proxy_form
from public_form.admin import type_human_filter, type_session_filter
class human_proxy_modeladmin(admin.ModelAdmin):
	model = human_proxy
	form = human_proxy_form
	list_per_page = 8
	list_display = ('edit_link', "name", "email", "telephone_land", "telephone_cell", "website")
	list_display_links = ('edit_link', )
	change_list_template = 'public_form_self.html'
	change_form_template = 'public_form_change_self.html'
	search_fields = ('name',)
	list_filter = (type_human_filter, type_session_filter )
	def get_actions(self, request):
		actions = super(human_proxy_modeladmin, self).get_actions(request)
		del actions['delete_selected']
		return actions

	def edit_link(self, obj):
		if obj is None:
			return "(None)"
		else:
			url = "/cooper/public_form/human_proxy/?human_id=%s" % (obj.id)
			message = obj.name 
			_class = "class='no_assistant'"
			img_link = "/cooper/General/human/%s" % (obj.id)
			img_link_next = "next=/cooper/public_form/human_proxy"
			img_url = "/static/user_images/Anon_user.png"
			if obj.assist_sessions:
				for session in obj.assist_sessions.all():
					url = "/cooper/public_form/human_proxy/?human_id=%s" % (obj.id)
					_class = "class='assistant'"
			try:
				is_project = Project.objects.get(id=obj.id)
				img_url = "/static/user_images/Project_user.png"
				img_link = "/cooper/General/project/%s/?%s" % (obj.id, img_link_next)
			except ObjectDoesNotExist:
				try:
					is_person = Person.objects.get(id=obj.id)
					img_url = "/static/user_images/Person_user.png"
					img_link = "/cooper/General/person/%s/?%s" % (obj.id, img_link_next)
				except:
					pass
					message = message + obj.name.__str__()

			return mark_safe("<a href='%s'><img src='%s' class='user_grid'></a> | <a %s href='%s'>%s</a>" % (img_link, img_url, _class, url, message))
	edit_link.allow_tags = True
	edit_link.short_description = " "
	def make_mentor_link(self, obj):
		if obj is None:
			return "(None)"
		else:
			url = "/cooper/public_form/human_proxy/?human_id=%s" % (obj.id)
			message = _(u"Fer-lo mentor del projecte seleccionat")
			_class = "class='no_assistant'"
			img_link = "/cooper/General/human/%s" % (obj.id)
			img_link_next = "next=/cooper/public_form/human_proxy"
			img_url = "/static/user_images/Anon_user.png"
			if obj.assist_sessions:
				for session in obj.assist_sessions.all():
					url = "/cooper/public_form/human_proxy/?human_id=%s" % (obj.id)
					_class = "class='assistant'"
			try:
				is_project = Project.objects.get(id=obj.id)
				img_url = "/static/user_images/Project_user.png"
				img_link = "/cooper/General/project/%s/?%s" % (obj.id, img_link_next)
			except ObjectDoesNotExist:
				try:
					is_person = Person.objects.get(id=obj.id)
					img_url = "/static/user_images/Person_user.png"
					img_link = "/cooper/General/person/%s/?%s" % (obj.id, img_link_next)
				except:
					pass
					message = message

			return mark_safe("<a href='%s'><img src='%s' class='user_grid'></a> | <a %s href='%s'>%s</a>" % (img_link, img_url, _class, url, message))
	make_mentor_link.allow_tags = True
	make_mentor_link.short_description = _(u"Mentor")

	def save_model(self, request, obj, form, change):
		current_project = obj

		if form.is_valid():
			current_project = Project(name=obj.name, email=obj.email, telephone_land = obj.telephone_land, telephone_cell = obj.telephone_cell, website = obj.website)
			current_project.save()
			param = ""
			if request.GET.has_key("learn_session_id"):
				param = "&learn_session_id=%s" % (current_session.id)
			messages.info(request, "/cooper/public_form/human_proxy/?human_id=%s%s" % (current_project.id, param))
			return HttpResponseRedirect(
						"/cooper/public_form/human_proxy/?human_id=%s%s" % (current_project.id, param))
		else:
			messages.errors(request, form.errors)
		return HttpResponseRedirect(
						"/cooper/public_form/human_proxy/?human_id=%s%s" % (current_project.id, param))
	class Media:
		css = {
		'all': ('public_form_self.css',)
		}
		js = (	'public_form_self.js', )

from General.models import Human
user_admin_site.register(human_proxy, human_proxy_modeladmin)
from public_form.models import RegistrationProfile
user_admin_site.register(RegistrationProfile)
admin.site.register(human_proxy, human_proxy_modeladmin)

from Welcome.models import iC_Akin_Membership
from Welcome.admin import Public_AkinMembershipAdmin
class Public_AkinMembershipAdmin(Public_AkinMembershipAdmin):

	#list_editable = ("join_fee", "ic_CESnum",)
	def queryset(self, request):
		from public_form import bots
		return iC_Akin_Membership.objects.filter(person=bots.user_registration_bot().get_person(request.user))
#user_admin_site.register(iC_Akin_Membership, Public_AkinMembershipAdmin)


from Welcome.models import iC_Person_Membership
from Welcome.admin import PersonMembershipAdmin
class PersonMembershipAdmin(PersonMembershipAdmin):
	def queryset(self, request):
		from public_form import bots
		return iC_Person_Membership.objects.filter(person=bots.user_registration_bot().get_person(request.user))
#user_admin_site.register(iC_Person_Membership, PersonMembershipAdmin)


from Welcome.models import iC_Project_Membership
from Welcome.admin import ProjectMembershipAdmin
class ProjectMembershipAdmin(ProjectMembershipAdmin):
	def queryset(self, request):
		from public_form import bots
		return iC_Project_Membership.objects.filter(human_persons__human=bots.user_registration_bot().get_person(request.user))
#user_admin_site.register(iC_Project_Membership, ProjectMembershipAdmin)


from Welcome.models import Fee
from Welcome.admin import Public_FeeAdmin
class Public_FeeAdmin(Public_FeeAdmin):
	def queryset(self, request):
		from public_form import bots
		if bots.user_registration_bot().get_person(request.user):
			ref_pro = bots.user_registration_bot().get_person(request.user).rel_humans.filter(relation__clas='reference').values('human')
			fees = Fee.objects.filter(human=bots.user_registration_bot().get_person(request.user))
			if fees.count() > 0:
				# añadir al queryset los ref_projects del person TODO
				return fees
			else:
				fees = Fee.objects.filter(human__in=ref_pro)
			#print 'FEES ok: '+str(fees)
			return fees
		return Fee.objects.all()
user_admin_site.register(Fee, Public_FeeAdmin)


from General.models import Person
from General.admin import Public_PersonAdmin

from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse

class Public_PersonAdmin(Public_PersonAdmin):
	def response_change(self, request, obj):
		from django.http import HttpResponseRedirect, HttpResponse
		from django.core.urlresolvers import reverse
		response = super(Public_PersonAdmin, self).response_change(request, obj)
		if request.GET.has_key('next'):
			if request.GET.get('next') != '' and not request.REQUEST.get('_addanother', False) and not request.REQUEST.get('_continue', False):
				if request.GET.get('next') == 'public_form':
					response['location'] = reverse('public_form:entry_page_to_gestioci')
				else:
					response['location'] = request.GET.get('next') + "?human_id=" + str(obj.id)

			if request.REQUEST.get('_addanother', False) or request.REQUEST.get('_continue', False):
				response['location'] = response['location'] + "?next=" + request.GET.get('next')
		return response

	def queryset(self, request):
		from public_form import bots
		if request.user.is_superuser:
			return Person.objects.all()
		else:
			return Person.objects.filter(id=bots.user_registration_bot().get_person(request.user).id)

	class Media:
		css = {
			'all': ('admin_record.css',)# 'selfemployed.css',)
		}
		js = ("general.js",)
user_admin_site.register(Person, Public_PersonAdmin)

from General.admin import Address
class Public_Address(admin.ModelAdmin):
	def queryset(self, request):
		from public_form import bots
		if request.user.is_superuser:
			return Address.objects.all()
		else:
			return Address.objects.filter(id=bots.user_registration_bot().get_person(request.user).id)
user_admin_site.register(Address, Public_Address)


from General.models import Project
from General.admin import ProjectAdmin

class Public_ProjectAdmin(ProjectAdmin):

	def response_change(self, request, obj):

		response = super(Public_ProjectAdmin, self).response_change(request, obj)
		if request.GET.has_key('next'):
			if request.GET.get('next') != '' and not request.REQUEST.get('_addanother', False) and not request.REQUEST.get('_continue', False):
				if request.GET.get('next') == 'public_form':
					response['location'] = reverse('public_form:entry_page_to_gestioci')
				else:
					response['location'] = request.GET.get('next') + "?human_id=" + str(obj.id)

			if request.REQUEST.get('_addanother', False) or request.REQUEST.get('_continue', False):
				response['location'] = response['location'] + "?next=" + request.GET.get('next')
		return response
user_admin_site.register(Project, Public_ProjectAdmin)


from public_form.models import RegistrationProfile

from django.contrib.admin import ModelAdmin
from django.contrib.admin import SimpleListFilter
#Use this in like => list_filter = (onlyownedFilter,)

class only_pending_filter(SimpleListFilter):
	title = _(u'Estat')

	# Parameter for the filter that will be used in the URL query.
	parameter_name = 'only_pending_filter'

	def lookups(self, request, model_admin):
		return (
			('Pending', _(u'Pendents')),
		)

	def queryset(self, request, queryset):
	# Compare the requested value (either '80s' or '90s')
	# to decide how to filter the queryset.
		if self.value() == 'Pending':
			return queryset.exclude(activation_key = "ALREADY_ACTIVATED")

class only_membership_filter(SimpleListFilter):
	title = _(u'Tipus')

	# Parameter for the filter that will be used in the URL query.
	parameter_name = 'only_membership_filter'

	def lookups(self, request, model_admin):
		from Welcome.models import iC_Type
		#typ = iC_Record_Type.objects.get(clas='iC_Membership')
		#types = iC_Record_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght)
		#from Welcome.models import iC_Type
		choice_one = iC_Type.objects.get(clas="iC_Akin_Membership")
		choice_two = iC_Type.objects.get(clas="iC_Person_Membership")
		choice_three = iC_Type.objects.get(clas="iC_Project_Membership")
		CHOICES = (
			(choice_one.id, choice_one.name),
			(choice_two.id, choice_two.name),
			(choice_three.id, choice_three.name),
		)
		return CHOICES

	def queryset(self, request, queryset):
		return queryset.filter(record_type = self.value())

class RegistrationProfileAdmin(ModelAdmin):
	list_filter= (only_pending_filter, only_membership_filter)
	model = RegistrationProfile
	list_display = ('user', 'activation_key', 'person', 'record_type' )

admin.site.register(RegistrationProfile, RegistrationProfileAdmin)
