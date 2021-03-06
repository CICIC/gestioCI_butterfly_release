#encoding=utf-8
from django.contrib import admin

from django import forms
from django.forms.extras import widgets

from django.utils.translation import ugettext as _

from mptt.admin import MPTTModelAdmin
from mptt.fields import TreeForeignKey, TreeManyToManyField
from mptt.forms import MPTTAdminForm, TreeNodeChoiceField
from django.utils.html import escape, escapejs
from Welcome.models import *
from General.models import Image

from django.forms.models import BaseInlineFormSet

from django.forms.formsets import formset_factory

# ********************************************************************
# See (tools_upgrader/admin.py)> NOTICE(20112014): Widget wrapper for foreign and m2m fields.
#from General.widgets import ForeignKeyRawIdWidgetWrapperAdmin
#class AutoRecordName(ForeignKeyRawIdWidgetWrapperAdmin):
# ********************************************************************
class AutoRecordName(admin.ModelAdmin):
	class Media:
		css = {
			'all': ('admin_record.css',)
		}
		js = (
			"admin/js/core.js",
			"admin/js/jquery.js",
			"admin/js/jquery.init.js",
			'welcome.js',
		)

	#*************************************************************
	# See Manual, reference [GestioCI-Codi] Section: Funcionalitats > Punts d'entrada
	# on url: 
	# (https://wiki.enredaos.net/index.php?title=GestioCI-Codi&section=44#Punts_d.27entrada)
	#
	# So,
	# Here, AutoRecordName must filter its queryset by current logged user.
	# See further comments:
	def get_queryset(self, request):
		# ... by being a [superuser], no filtering on query.
		if request.user.is_superuser:
			return self.model.objects.all()
		else:
			# ... by being [staff] should filter around different app's ambits. 
			#
			# .. See Forum, discussion on [GestioCI] Sistema "d'autentificación" en el entorno virtual 
			# (http://projects.cooperativa.cat/boards/4/topics/15)
			#
			# Should manage, by v8 release, django.contrib.auth.Groups {iC_Welcome, iCf_Finances}
			# 
			if request.user.is_staff:
				return self.model.objects.all()
			else:
				# ... by being [Member] (selfemployed or not) should filter
				# filter owned [iC_Record] row objects by its [ic_membership] field.
				#
				# ... So check for RegistrationProfile matchings this user.
				#
				# See WIP monthly paper, talk [ciCICdev/November|#GESTIO_DEV: Help here]
				# in its section: [Plan Butterfly|Página de entrada a gestiocI, alta socio].
				# on url: 
				# (https://wiki.enredaos.net/index.php?title=Talk:CICICdev/november#P.C3.A1gina_de_entrada_a_gestiocI.2C_alta_socio)
				#
				#
				# See Manual, reference [GestioCI-Codi] Section: Funcionalitats > Punts d'entrada > django.contrib.auth.models.Group
				# on url: 
				# (https://wiki.enredaos.net/index.php?title=GestioCI-Codi#django.contrib.auth.models.Group)
				#
				from public_form.models import RegistrationProfile
				try:
					current_registration = RegistrationProfile.objects.get(user=request.user)
					# ... by having [General.Person] attr maybe be {General.Human and Person} friendly so should filter
					if hasattr(self.model, "person"):
						# ... casting to General.Person
						# ... filter owned [iC_Record] row objects by [human] field.
						try:
							current_human = Human.objects.get(id=current_registration.person.id)
							if self.model.objects.filter(human=current_human).count()>0:
								return self.model.objects.filter(human=current_human)
						except:
							# ... this human can be specific person of the entity
							# ... casting to General.Person
							# ... filter owned [iC_Record] row objects by [person] field.
							try:
								current_human = Human.objects.get(id=current_registration.person.id)
								if self.model.objects.filter(person=current_human).count()>0:
									return self.model.objects.filter(person=current_human)
							except:
								# Question: can be a user logged neither a General.Person neither a General.Human?
								# Please, open issue on project board topics.
								# on url:
								# (http://projects.cooperativa.cat/boards/4/topics)
								# Reporting:
								# File: [Welcome/admin.py] 
								# Class: AutoRecordName(admin.ModelAdmin)
								# Issue: (question above!)
								#
								pass
					#
					# ... by having [General.ic_project] attr maybe {General.Project friendly} friendly so should filter
					if hasattr(self.model, "ic_project"):
						try:
							# ... casting General.Project
							# ... filter owned [iC_Record] row objects by [human] field.
							current_human = Human.objects.get(id=current_registration.project.id)
							if self.model.objects.filter(human=current_human).count()>0:
								return self.model.objects.filter(human=current_human)
						except:
							pass
					#
					# ... by having [Welcome.ic_membership] attr, human (project) can be located through it, so should filter
					if hasattr(self.model, "ic_membership"):
						try:
							# ... casting to General.Project
							# ... filter owned [iC_Record] row objects by [ic_membership__human] field.
							current_human = Human.objects.get(id=current_registration.project.id)
							if self.model.objects.filter(ic_membership__human=current_human).count()>0:
								return self.model.objects.filter(ic_membership__human=current_human)
						except:
							pass
					# ... by having [Welcome.ic_self_employed] attr, go one tree branch step futher than previous and filter
					# ... filter owned [iC_Record] row objects by [ic_self_employed__ic_membership__human] field.
					if hasattr(self.model, "ic_self_employed"):
						try:
							current_human = Human.objects.get(id=current_registration.project.id)
							if self.model.objects.filter(ic_self_employed__ic_membership__human=current_human).count()>0:
								return self.model.objects.filter(ic_self_employed__ic_membership__human=current_human)
						except:
							pass
					#
					# Returning if success in every knows situation,
					# shouldn't catch any current_human
					#
					if current_human:
						return self.model.objects.filter(human=current_human)
				except:
					pass
				#
				# None criteria to filter so better don't return anything
				# Many any Question on comments through the code can resolve situation.
				# Please, open issue on project board topics.
				# on url:
				# (http://projects.cooperativa.cat/boards/4/topics)
				# Reporting:
				# File: [Welcome/admin.py] 
				# Class: AutoRecordName(admin.ModelAdmin)
				# Issue: (function ending bad!)
				#
				pass
				return self.model.objects.filter(id=-1)
	# ***** end of AUTORECORD: get_queryset() definition block ***********************

	def save_model(self, request, obj, form, change):
		instance = form.save(commit=False)
		if hasattr(instance, 'ic_project') and instance.ic_project is None:
			print ('SAVE_MODEL: not ic_project! put CIC to '+instance.name)
			instance.ic_project = Project.objects.get(nickname='CIC')
		if not hasattr(instance, 'human') or instance.human is None:
			if hasattr(instance, 'project'):# and instance.project is not None:
				print ('SAVE_MODEL: not human! put project...')
				instance.human = instance.project
			if hasattr(instance, 'person'):# and instance.person is not None:
				print ('SAVE_MODEL: not human! put person...')
				instance.human = instance.person

		if hasattr(self, 'record_type') and self.record_type is not None:
			#print instance.record_type.clas
			if instance.record_type.clas == 'iC_Stallholder' or instance.record_type.clas == 'iC_Self_Employed':
				if hasattr(instance.ic_membership, 'selfemployed_recs'):
					recs = instance.ic_membership.selfemployed_recs.filter(end_date=None)
					#print 'RECS: '+str(recs)
					if recs.count() > 1: # TODO rise a real exeption
						#print 'ERRORR!!! '
						print ("Hi ha més d'un registre d'autoocupat sense data de baixa ¿??")
						return False
					elif recs.count() > 0: # TODO rise a real exeption
						print ('ERROR!! ')
						print ("El soci ja te 1 registre d'autoocupat sense data de baixa!")
						return False

			if instance.record_type.clas == 'iC_Person_Membership' or instance.record_type.clas == 'iC_Project_Membership':
				icms = instance.human.ic_membership_set.filter(end_date=None)
				if icms.count() > 0:
					if icms.first().id == instance.id:
						#print 'Update! ...instance.save() '
						pass
					else:
						print ('ERROR!! ')
						print ('Ja tenim registre alta: '+str(icms))
						return False
		else:
			print ('W.admin.AutoRecordName.save_model: No tenemos Record_Type!!')

		#if not hasattr(instance,'name') or instance.name is None or instance.name == '':

		instance.name = instance.__unicode__() # Here the Auto Name, the unicode MUST NOT use the 'name' to build! otherwise it grows to infinity...

		instance.save()
		form.save_m2m()
		return instance
	def response_add(self, request, obj):
		from django.http import HttpResponseRedirect, HttpResponse
		from django.core.urlresolvers import reverse
		response = super(AutoRecordName, self).response_add(request, obj)
		if request.GET.has_key('next'):
			if request.GET.get('next') != '' and not request.REQUEST.get('_addanother', False) and not request.REQUEST.get('_continue', False):
				response['location'] = request.GET.get('next')

			if request.REQUEST.get('_addanother', False) or request.REQUEST.get('_continue', False):
				response['location'] = response['location'] + "?next=" + request.GET.get('next')
		return response
	def response_change(self, request, obj):
		from django.http import HttpResponseRedirect, HttpResponse
		from django.core.urlresolvers import reverse
		response = super(AutoRecordName, self).response_change(request, obj)
		if request.GET.has_key('next'):
			if request.GET.get('next') != '' and not request.REQUEST.get('_addanother', False) and not request.REQUEST.get('_continue', False):
				response['location'] = request.GET.get('next')

			if request.REQUEST.get('_addanother', False) or request.REQUEST.get('_continue', False):
				response['location'] = response['location'] + "?next=" + request.GET.get('next')
		return response
	def response_delete(self, request, obj_display):
		from django.http import HttpResponseRedirect, HttpResponse
		from django.core.urlresolvers import reverse
		response = super(AutoRecordName, self).response_delete(request, obj_display)
		if request.GET.has_key('next'):
			if request.GET.get('next') != '' and not request.REQUEST.get('_addanother', False) and not request.REQUEST.get('_continue', False):
				response['location'] = request.GET.get('next')

			if request.REQUEST.get('_addanother', False) or request.REQUEST.get('_continue', False):
				response['location'] = response['location'] + "?next=" + request.GET.get('next')
		return response

'''
		from django.http import HttpResponseRedirect, HttpResponse
		from django.core.urlresolvers import reverse
		response = super(AutoRecordName, self).response_change(request, obj)
		if request.GET.has_key('next'):
			if request.GET.get('next') != '' and not request.REQUEST.get('_addanother', False) and not request.REQUEST.get('_continue', False):
				if request.GET.get('next') == 'public_form':
					response['location'] = reverse('public_form:entry_page_to_gestioci')
				else:
					response['location'] = request.GET.get('next')

			if request.REQUEST.get('_addanother', False) or request.REQUEST.get('_continue', False):
				response['location'] = response['location'] + "?next=" + request.GET.get('next')
		return response

	def save_formset(self, request, form, formset, change):
		def set_relAddrContract_member(instance):
			if not instance.ic_membership:
				print 'SAVE_FORMSET: put ic_membership > '+str(request.ic_membership)
				#instance.ic_membership = request.ic_membership
			instance.save()
		if formset.model == iC_Address_Contract:
			print 'SAVE_FORMSET: put ic_membership??'
			instances = formset.save(commit=False)
			if formset.model == iC_Address_Contract:
				map(set_relAddrContract_member, instances)

			formset.save_m2m()
			return instances
		else:
			return formset.save()
'''



#---------	M E M B E R S H I P ' S
from tools_upgrader.reverseadmin import ReverseModelAdmin

class Public_AkinMembershipAdmin(ReverseModelAdmin):
	model = iC_Akin_Membership
	list_display = ['name', 'person', 'join_date',  '_has_id_card',]
	raw_id_fields = ( 'ic_membership',)
	readonly_fields = ('_has_id_card', '_person_link', '_memberships')
	fieldsets = (
		(None, {
			'fields':(('_person_link',),
					('join_date', 'ic_membership', '_memberships', ),
					('description', '_has_id_card'))
		}),
	)
	inline_type = 'stacked'
	person = ( 'person', ('id_card', 'name', 'surnames', 'email', 'nickname2', 'telephone_cell','telephone_land') )
	inline_reverse = ( person,)


class AkinMembershipAdmin(Public_AkinMembershipAdmin):
	list_display = ['name', 'person', 'join_date',  '_has_id_card',]
	#raw_id_fields = ('person', 'ic_membership',)
	readonly_fields = ('record_type', 'name', 'ic_project', '_has_id_card', '_person_link', '_memberships')
	fieldsets = (
		(None, {
			'fields':(('record_type', 'ic_project', '_has_id_card'),
								( '_person_link', 'ic_membership', '_memberships' ),
								('join_date', 'end_date'),
								('description', 'name'))
		}),
	)



class Public_MembershipAdmin(AutoRecordName):
	model = iC_Membership

	raw_id_fields = ('human',)
	readonly_fields = ('ic_CESnum', 'join_fee', 'join_date', 'human', '_human_link',)
	fieldsets = (
		(None, {
			'fields':(('human', '_human_link', 'ic_CESnum'),
								('contribution', 'virtual_market'), #'labor_contract'),
								('join_fee', 'join_date'), #'end_date'),
								('expositors', 'description'))
		}),
	)
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == 'record_type':
			typ = iC_Record_Type.objects.get(clas='iC_Membership')
			kwargs['queryset'] = iC_Record_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
		if db_field.name == 'contribution':
			typ = Relation.objects.get(clas='contribute')
			kwargs['queryset'] = Relation.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
		return super(Public_MembershipAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

class MembershipAdmin(Public_MembershipAdmin):
	#model = iC_Membership
	readonly_fields = ('_join_fee_payed', '_human_link', 'ic_project', '_joinfee_link', '_is_selfemployed')
	change_list_template = "admin/Welcome/membership/change_list.html"
	search_fields = ('name', 'ic_CESnum',)
	list_display = ['name', 'record_type', 'human', 'ic_CESnum', '_is_selfemployed', 'ic_project', '_join_fee_payed']
	#list_filter = ('record_type',)
	raw_id_fields = ('human', 'expositors',)
	fieldsets = (
		(None, {
			'fields':(
				('record_type', 'name', 'ic_project'),
				('human','_human_link', 'ic_CESnum'),
				('contribution', 'virtual_market'),# 'labor_contract'),
				('join_fee', '_joinfee_link', 'join_date', 'end_date', '_join_fee_payed'),
				('expositors', 'description'))
		}),
	)
	# to hide change and add buttons on main page:
	def get_model_perms(self, request):
		return {'view': True}


class PersonMembershipAdmin(AutoRecordName):
	model = iC_Person_Membership
	readonly_fields = ('record_type', 'name', 'ic_project', '_join_fee_payed', '_person_link',
											'_joinfee_link', '_ic_selfemployed_list', '_expositors_list')

	search_fields = ('name', 'ic_CESnum')
	list_display = ['name', 'person', 'ic_CESnum', 'join_date', '_join_fee_payed']
	raw_id_fields = ('person', 'join_fee', 'expositors',)
	fieldsets = (
		(None, {
			'fields':(
				('record_type',),
				('ic_CESnum', 'ic_project',),
				('person', '_person_link',),
				('join_fee', '_joinfee_link', '_join_fee_payed'),
				('contribution', 'virtual_market'),
				('join_date', 'end_date'),
				('expositors', '_expositors_list',),
				('labor_contract','_ic_selfemployed_list',),
				('description',))
		}),
	)
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == 'contribution':
			typ = Relation.objects.get(clas='contribute')
			kwargs['queryset'] = Relation.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
		return super(PersonMembershipAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

class ProjectMembershipAdmin(AutoRecordName):
	model = iC_Project_Membership
	readonly_fields = ('record_type', 'name', 'ic_project', '_join_fee_payed', '_project_link',
										'_joinfee_link', '_ic_selfemployed_list', '_expositors_list',)

	search_fields = ('name', 'ic_CESnum')
	list_display = ['name', 'project', 'ic_CESnum', 'join_date', '_join_fee_payed']
	raw_id_fields = ('project', 'join_fee', 'expositors',)
	fieldsets = (
		(None, {
			'fields':(
				('record_type', 'name',),
				('ic_CESnum', 'ic_project',),
				('project', '_project_link',),
				('join_fee', '_joinfee_link', '_join_fee_payed'),
				('contribution', 'virtual_market'),
				('join_date', 'end_date',),
				('expositors', '_expositors_list',),
				('_ic_selfemployed_list', 'description'))
		}),
	)
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == 'contribution':
			typ = Relation.objects.get(clas='contribute')
			kwargs['queryset'] = Relation.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
		return super(ProjectMembershipAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)



class SE_relAddressContractInlineSet(BaseInlineFormSet):

	def __init__(self, *args, **kwargs):
		super(SE_relAddressContractInlineSet, self).__init__(*args, **kwargs)

		#if hasattr(kwargs['instance'], 'ic_membership'):
			#print 'INLINESET: '+str(kwargs['instance'].ic_membership)
			#print kwargs['instance']
		#	self.queryset = iC_Address_Contract.objects.filter(ic_membership=kwargs['instance'].ic_membership)

class SE_relAddressContractInline(admin.StackedInline):
	model = iC_Address_Contract
	#fk_name = 'selfemployed'#'selfemployed'#'ic_self_employed'
	extra = 0
	raw_id_fields = ('address',)
	readonly_fields = ('_address_link',)
	#formset = SE_relAddressContractInlineSet
	#form = SE_relAddressContractInlineForm
	fieldsets = (
		(' ', {
			'classes': ('collapse',),
			'fields': (
							('company', 'address', '_address_link',),
							('doc_type', 'price', 'price_unit',),
							('start_date', 'end_date',))
		}),
	)
	verbose_name = _(u"reg Contracte d'Adreça")
	verbose_name_plural = _(u"reg Contractes d'Adreça")

	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == 'doc_type':
			typ = iC_Document_Type.objects.get(clas='iC_Address_Contract')
			kwargs['queryset'] = iC_Document_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
		if db_field.name == 'price_unit':
			typs = Unit_Type.objects.filter(clas__icontains='currency')
			kwargs['queryset'] = Unit.objects.filter(unit_type=typs)
		return super(SE_relAddressContractInline, self).formfield_for_foreignkey(db_field, request, **kwargs)



from Welcome.forms import SelfEmployedForm
class Public_SelfEmployedAdmin(AutoRecordName):
	class Media:
		css = {
			'all': ('admin_record.css', 'selfemployed.css',)
		}
		js = ('welcome.js', 'selfemployed.js',)

	model = iC_Self_Employed
	list_display = ['name', '_member_link', 'ic_membership', 'join_date', 'record_type', 'rel_fees']# '_join_fee_payed']
	form = SelfEmployedForm

	readonly_fields = ('_member_link', '_join_fee', '_rel_fees', '_has_assisted_welcome', '_rel_id_cards', 
						'_rel_address_contract', '_rel_licences', '_rel_insurances', '_has_assisted_socialcoin', 
						'_main_address_render', '_other_address_render', 'print_task_list', 'print_certificate', 
						'_user_member', '_akin_members')

	raw_id_fields = ('mentor_membership', 'ic_membership', 'rel_fees', 'rel_address_contracts', 'rel_licences', 'rel_insurances')

	fieldsets = (#MembershipAdmin.fieldsets + (
		(_(u"Fase 1: Acollida i Avaluació"), {
			#'classes': ('collapse',),
			'fields': (
				('ic_membership', '_member_link', ),
				('_has_assisted_welcome',),
				('_rel_id_cards',),
			)
		}),
		(_(u"Fase 2: Llista de tasques pendents"), {
			'classes': ('welcome',),
			'fields': (
					('_main_address_render', '_other_address_render'),
					('rel_insurances', '_rel_insurances',),
					('_join_fee'),
					('_rel_fees',),
					('print_task_list'),
					)# 'rel_address_contracts', 'rel_insurances', 'rel_licences', ))
		}),
		(_(u"Fase 3:  Moneda social i Alta"), {
			'classes': ('welcome',),
			'fields': (
				('_has_assisted_socialcoin',),
				('_akin_members'),
				('mentor_membership', 'mentor_comment',),
				('ic_CESnum',),
				('join_date', ),
				('assigned_vat', 'extra_days',),
				('print_certificate',),
				('_user_member')
			)}),
	)
	def save_model(self, request, obj, form, change):

		if form.is_valid():

			if obj.ic_membership and form.cleaned_data.get("ic_CESnum"):
				obj.ic_membership.ic_CESnum = form.cleaned_data.get("ic_CESnum")
				obj.ic_membership.save()

			if obj.ic_membership:
				if not obj.ic_membership.ic_company:
					from General.models import Company
					inter = Company.objects.get(name="Interprofessionals")
					obj.ic_membership.ic_company = inter

			if change and form.cleaned_data.get("join_date"):
				from django.core.exceptions import ObjectDoesNotExist
				from public_form.models import RegistrationProfile

				current_person = obj.ic_membership.human.persons.first()
				current_project = obj.ic_membership.ic_project
				try:
					current_registration = RegistrationProfile.objects.get(person=current_person, project = current_project, record_type = obj.record_type)
				except ObjectDoesNotExist:
					from public_form.models import RegistrationProfile
					user = RegistrationProfile.objects.create_active_user(
								obj.ic_membership.ic_CESnum,
								current_person.email,
								admin,
								current_person,
								current_project,
								obj.record_type)
			obj.save()


	'''
	mem = 'none'
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == 'ic_membership':
			print 'VALUE: '+str(db_field)
			print 'SET: '+str(kwargs)
			#mem = kwargs['queryset']
			print 'MEM: '+self.mem
		return super(SelfEmployedAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

	'''
	def get_form(self, request, obj=None, **kwargs):
		#save obj so we can use it in self.formfield_for_manytomany()
		self.obj = obj
		return super(Public_SelfEmployedAdmin, self).get_form(request, obj, **kwargs)

	def formfield_for_manytomany(self, db_field, request, **kwargs):
		if db_field.name == 'rel_fees':
			kwargs['queryset'] = Fee.objects.filter(record_type__parent__clas='quarterly_fee')
		elif db_field.name == 'mentor_mentorship':
			#TODO: show persons of membership
			#https://wiki.enredaos.net/index.php?title=Talk:CICICdev_butterfly_rev/11102014#I.29_ALTA_PROJECTE_AUTOOCUPAT / .18
			#typ = iC_Record_Type.objects.get(clas='Fee')
			#kwargs['queryset'] = iC_Record_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
			pass
		elif db_field.name == 'rel_images':
			#self.obj is object assigned self.get_form()
			kwargs['queryset'] = db_field.rel.to.objects.filter(id__in=self.obj.rel_images.all())


		return super(Public_SelfEmployedAdmin, self).formfield_for_manytomany(db_field, request, **kwargs)
	def response_change(self, request, obj):
		#Every time this window in invoked "_popup", 
		#save button wont save to list_display but stay in list_change.
		from django.http import HttpResponseRedirect, HttpResponse
		from django.core.urlresolvers import reverse

		response = super(AutoRecordName, self).response_change(request, obj)

		obj_id = obj.id if obj.id else 0
		if request.GET.has_key('next'):
			response['location'] = response['location'] + "/" + str(obj_id) + "/?next=" + request.GET.get('next')
		elif request.GET.has_key('_popup'):
			response['location'] = response['location'] + str(obj_id) + "?_popup=1"
		return response

class SelfEmployedAdmin(Public_SelfEmployedAdmin):
	class Media:
		css = {
			'all': ('admin_record.css', 'selfemployed.css',)
		}
		js = ('welcome.js',)

	model = iC_Self_Employed
	list_display = ['name', 'ic_membership', 'join_date', 'record_type', 'mentor_membership']# '_join_fee_payed']
	#formset = SelfEmployedForm
	#readonly_fields = ('name', 'record_type', '_rel_id_cards', '_member_link', '_rel_address_contract')
	#raw_id_fields = ('rel_address_contracts', 'ic_membership',)# 'rel_fees')
	'''
	fieldsets = (#MembershipAdmin.fieldsets + (
		(_(u"fase 1: Autoocupat"), {
			#,
			'fields': (
				('ic_membership', '_member_link', 'organic',),
				('rel_fees', '_rel_fees',),
				('_has_assisted_welcome',)
			)
		}),
		(_(u"fase 3: Alta"), {
			'classes': ('collapse', 'welcome',),
			'fields': (
				('join_date', ),
				('assigned_vat', 'review_vat', 'last_review_date'),
				('rel_accountBank',),
				('mentor_membership', 'mentor_comment',))
		}),
		(_(u"fase 2: Llista de tasques"), {
			'classes': ('collapse', 'welcome',),
			'fields': (
					('_rel_id_cards',),
					('_has_assisted_socialcoin',))# 'rel_address_contracts', 'rel_insurances', 'rel_licences', 'rel_images'))
		}),
	)
	'''
	#filter_horizontal = ('rel_fees',)
	#inlines = [
		#SE_relAddressContractInline,
	#]



class Public_StallholderAdmin(Public_SelfEmployedAdmin):
	class Media:
		css = {
			'all': ('admin_record.css', 'selfemployed.css',)
		}
		js = ('welcome.js', 'selfemployed.js',)

	model = iC_Stallholder
	list_display = ['name', '_member_link', 'ic_membership', 'join_date', 'record_type']# '_join_fee_payed']

	readonly_fields = ('_member_link', '_join_fee', '_rel_fees', '_has_assisted_welcome', '_rel_id_cards', '_rel_address_contract', '_rel_licences', '_rel_insurances', '_has_assisted_socialcoin', '_main_address_render', '_other_address_render', 'print_task_list', 'print_certificate', '_user_member', '_rel_images', '_akin_members')
	fieldsets = (
		(_(u"Fase 1: Acollida i Avaluació"), {
			#'classes': ('collapse',),
			'fields': (
				('ic_membership', '_member_link'),
				('_has_assisted_welcome',),
				('_rel_id_cards',),
				('organic', 'tent_type',),
			)
		}),
		(_(u"Fase 2: Llista de tasques pendents"), {
			'classes': ('welcome',),
			'fields': (
					('_main_address_render', '_other_address_render'),
					('rel_insurances', '_rel_insurances',  ),
					('_join_fee'),
					('_rel_fees',),
					('print_task_list'),
					)
		}),
		(_(u"Fase 3:  Moneda social i Alta"), {
			'classes': ('welcome',),
			'fields': (
				('_has_assisted_socialcoin',),
				('_akin_members'),
				('rel_images', '_rel_images' ),
				('mentor_membership', 'mentor_comment',),
				('ic_CESnum',),
				('join_date', ),
				('assigned_vat', 'extra_days',),
				('print_certificate',),
				('_user_member')
			)}),
	)
	def save_model(self, request, obj, form, change):
		super(Public_StallholderAdmin,self).save_model(request, obj, form, change)
		if form.is_valid():
			if obj.ic_membership:
				if not obj.ic_membership.ic_company:
					from General.models import Company
					xipu = Company.objects.get(name="XIPU")
					obj.ic_membership.ic_company = xipu
					obj.save()
	
class StallholderAdmin(Public_StallholderAdmin):

	pass



#---------	F E E ' S

class Public_FeeAdmin(AutoRecordName):
	class Media:
		css = {
			'all': ('admin_record.css', 'selfemployed.css',)
		}
		js = ('fee.js',)

	model = Fee
	readonly_fields = ('name', 'record_type', 'human', 'project',
									'issue_date', 'deadline_date', 'payment_date',
									'_ic_membership', '_ic_selfemployed', '_auto_amount', '_erase_account', '_min_fee_data')

	search_fields = ('name', 'human__name')
	list_display = ['name', 'human', 'amount', 'unit', 'payment_type', 'deadline_date', '_is_payed']
	list_filter = ('unit',)
	raw_id_fields = ('human', 'rel_account')
	fieldsets = (
		(None, {
			'fields': (
				#('record_type', 'project'),
				('human', '_ic_membership', '_ic_selfemployed'),
				('unit', 'amount', '_auto_amount'),
				('issue_date', 'deadline_date', '_min_fee_data'),
				('payment_type', 'payment_date'),
				('rel_account', '_erase_account',)# 'name')
			)
		}),
	)
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == 'record_type':
			typ = iC_Record_Type.objects.get(clas='Fee')
			kwargs['queryset'] = iC_Record_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
		if db_field.name == 'unit':
			typs = Unit_Type.objects.filter(clas__icontains='currency')
			kwargs['queryset'] = Unit.objects.filter(unit_type=typs)
		return super(Public_FeeAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

	def get_readonly_fields(self, request, obj=None):
		if obj and obj.record_type.clas.startswith('('):
			return self.readonly_fields + ('amount',)
		return self.readonly_fields


class FeeAdmin(Public_FeeAdmin):
	#model = Fee
	readonly_fields = ('name', 'project', '_ic_membership', '_ic_selfemployed', '_auto_amount', '_erase_account', '_min_fee_data')
	#editable_fields = ('unit', 'payment_type',)

	#search_fields = ('name', 'unit')
	#list_display = ['name', 'human', 'amount', 'unit', 'payment_type', 'deadline_date', '_is_payed']
	#list_filter = ('unit',)
	#raw_id_fields = ('human', 'rel_account')

	fieldsets = (
		(None, {
			'fields': (
				('record_type', 'project'),
				('human', '_ic_membership', '_ic_selfemployed'),
				('unit', 'amount', '_auto_amount'),
				('issue_date', 'deadline_date', '_min_fee_data'),
				('payment_type', 'payment_date'),
				('rel_account', '_erase_account')# 'name')
			)
		}),
	)
	'''
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == 'record_type':
			typ = iC_Record_Type.objects.get(clas='Fee')
			kwargs['queryset'] = iC_Record_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
		if db_field.name == 'unit':
			typs = Unit_Type.objects.filter(clas__icontains='currency')
			kwargs['queryset'] = Unit.objects.filter(unit_type=typs)
		return super(FeeAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

	def get_readonly_fields(self, request, obj=None):
		if obj and obj.record_type.clas.startswith('('):
			return self.readonly_fields + ('amount',)
		return self.readonly_fields
	'''



#---------	I C _ D O C U M E N T S

class AddressContractAdmin(AutoRecordName):
	model = iC_Address_Contract
	readonly_fields = ('name', '_ic_membership', '_ic_selfemployed', '_address_link', '_min_addrcontract_data')

	list_display = ['name', 'doc_type', 'company', 'address', '_ic_membership']
	search_fields = ('name', 'company', 'doc_type')
	#list_filter = ('doc_type', 'company')
	raw_id_fields = ('address',)
	fieldsets = (
		(None, {
			'fields': (
				('_ic_membership', '_ic_selfemployed'),
				('doc_type', '_min_addrcontract_data',),
				('address', '_address_link'),
				('company',),
				('price', 'price_unit'),
				('start_date', 'end_date'),
				('doc_file',),
				('description',)
			)
		}),
	)
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == 'doc_type':
			typ = iC_Document_Type.objects.get(clas='iC_Address_Contract')
			kwargs['queryset'] = iC_Document_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
		if db_field.name == 'price_unit':
			typs = Unit_Type.objects.filter(clas__icontains='currency')
			kwargs['queryset'] = Unit.objects.filter(unit_type=typs)
		return super(AddressContractAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

class LicenceAdmin(AutoRecordName):
	model = iC_Licence
	readonly_fields = ('name', '_ic_membership', '_ic_selfemployed', '_erase_address', '_erase_job', '_min_licence_data')

	list_display = ['name', 'doc_type', 'number', 'end_date', '_ic_membership']
	search_fields = ('name', 'number', 'doc_type')
	#list_filter = ('doc_type', 'company')
	raw_id_fields = ('rel_address', 'rel_job',)
	fieldsets = (
		(None, {
			'fields': (
				('_ic_membership', '_ic_selfemployed'),
				('doc_type', '_min_licence_data',),
				('number',),
				('start_date', 'end_date'),
				('doc_file',),
				('rel_address', '_erase_address'),
				('rel_job', '_erase_job'),
				('description',)
			)
		}),
	)
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == 'doc_type':
			typ = iC_Document_Type.objects.get(clas='iC_Licence')
			kwargs['queryset'] = iC_Document_Type.objects.filter(lft__gte=typ.lft, rght__lte=typ.rght, tree_id=typ.tree_id)
		return super(LicenceAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

class InsuranceAdmin(AutoRecordName):
	model = iC_Insurance
	readonly_fields = ('name', '_ic_membership', '_ic_selfemployed', '_erase_address', '_erase_job', '_min_insurance_data')

	list_display = ['name', 'doc_type', 'number', 'end_date', '_ic_membership']
	search_fields = ('name', 'number', 'doc_type')
	#list_filter = ('doc_type', 'company')
	raw_id_fields = ('rel_address', 'rel_job',)
	fieldsets = (
		(None, {
			'fields': (
				('_ic_membership', '_ic_selfemployed'),
				('doc_type', '_min_insurance_data',),
				('company',),
				('number',),
				('price', 'price_unit'),
				('start_date', 'end_date'),
				('doc_file',),
				('rel_address', '_erase_address'),
				('rel_job', '_erase_job'),
				('description',)
			)
		}),
	)
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == 'doc_type':
			typ = iC_Document_Type.objects.get(clas='iC_Insurance')
			kwargs['queryset'] = iC_Document_Type.objects.filter(lft__gte=typ.lft, rght__lte=typ.rght, tree_id=typ.tree_id)
		if db_field.name == 'price_unit':
			typs = Unit_Type.objects.filter(clas__icontains='currency')
			kwargs['queryset'] = Unit.objects.filter(unit_type=typs)
		return super(InsuranceAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

from General.admin import Css_Mixin
class ImageAdmin(Css_Mixin):
	pass
from django.core.exceptions import ObjectDoesNotExist

#---------	O T H E R	 I C _ R E C O R D S

class LearnSessionAdmin(AutoRecordName):
	model = Learn_Session
	readonly_fields = ('name', '_assistants_link', '_num_assistants',)

	list_display = ['name', 'nonmaterial', 'datetime', '_num_assistants', 'address', 'facilitator']
	list_filter = ('nonmaterial', 'datetime',)
	search_fields = ('name', 'address',)
	raw_id_fields = ('address', 'assistants',)
	fieldsets = (
		(None, {
			'fields': (
				('nonmaterial', 'datetime', 'duration'),
				('address', 'facilitator'),
				('assistants', '_assistants_link',),
				('description',),
				('record_type', 'name')
			)
		}),
	)
	def formfield_for_foreignkey(self, db_field, request, **kwargs):

		session_type = request.GET.get('nonmaterial', None)
		try:
			filter_type = iC_Type.objects.get(clas=session_type)
			if session_type == "welcome_session":
				nonmaterial_id = "1"
			else:
				nonmaterial_id = "2"
		except ObjectDoesNotExist:
			filter_type = None

		if db_field.name == 'record_type':
			typ = iC_Record_Type.objects.get(clas='Learn_Session')
			kwargs['queryset'] = iC_Record_Type.objects.filter(lft__gte=typ.lft, rght__lte=typ.rght, tree_id=typ.tree_id)
			if filter_type:
				kwargs['initial'] = filter_type.id

		if db_field.name == 'nonmaterial':
			from General.models import Type
			typ = Type.objects.filter(clas='ic_learn')
			kwargs['queryset'] = Nonmaterial.objects.filter(nonmaterial_type=typ)
			try:
				nonmat = Nonmaterial.objects.get(id=nonmaterial_id)
				if nonmat:
					kwargs['queryset'] = Nonmaterial.objects.filter(id=nonmaterial_id)
					kwargs['initial'] = nonmat
			except:
				pass
		if db_field.name == 'facilitator':
			job = Job.objects.filter(clas='ic_facilitate')
			#print job
			kwargs['queryset'] = Human.objects.filter(jobs=job)
		return super(LearnSessionAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)


# Register your models here.
from Cooper.admin import user_admin_site
admin.site.register(iC_Type, MPTTModelAdmin) # can be commented after creating 'Membership', 'Document' and 'Payment' types
#admin.site.register(iC_Record) # can be commented
admin.site.register(iC_Record_Type, MPTTModelAdmin) # can be commented

admin.site.register(iC_Person_Membership, PersonMembershipAdmin)

admin.site.register(iC_Project_Membership, ProjectMembershipAdmin)

user_admin_site.register(iC_Akin_Membership, Public_AkinMembershipAdmin)
admin.site.register(iC_Akin_Membership, AkinMembershipAdmin)

user_admin_site.register(iC_Person_Membership, PersonMembershipAdmin)
user_admin_site.register(iC_Project_Membership, ProjectMembershipAdmin)

user_admin_site.register(iC_Membership, Public_MembershipAdmin)
admin.site.register(iC_Membership, MembershipAdmin)

user_admin_site.register(iC_Self_Employed, Public_SelfEmployedAdmin)
admin.site.register(iC_Self_Employed, SelfEmployedAdmin)

user_admin_site.register(iC_Stallholder, Public_StallholderAdmin)
admin.site.register(iC_Stallholder, StallholderAdmin)


#admin.site.register(iC_Document)
admin.site.register(iC_Document_Type, MPTTModelAdmin)

admin.site.register(iC_Labor_Contract)

admin.site.register(iC_Address_Contract, AddressContractAdmin)

admin.site.register(iC_Insurance, InsuranceAdmin)

admin.site.register(iC_Licence, LicenceAdmin)

#admin.site.register(Fee, Public_FeeAdmin)
admin.site.register(Fee, FeeAdmin)

admin.site.register(Learn_Session, LearnSessionAdmin)
user_admin_site.register(Learn_Session, LearnSessionAdmin)
admin.site.register(Project_Accompaniment)
admin.site.register(Image, ImageAdmin)

admin.site.register(Payment_Type, MPTTModelAdmin)
