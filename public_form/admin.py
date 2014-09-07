#encoding=utf-8
from django.contrib import admin
from django import forms
from django.forms.extras import widgets
from django.utils.translation import ugettext as _
from Cooper.admin import user_admin_site
from itertools import chain
from django.contrib.admin import ModelAdmin
from django.contrib import admin

from public_form.models import human_proxy
class human_proxy_modeladmin(ModelAdmin):
	model = human_proxy
	list_per_page = 600
	list_display = ('name',)
	list_display_links = ('name', )
	change_list_template = 'public_form_self.html'
user_admin_site.register(human_proxy, human_proxy_modeladmin)
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
		""" if user clicked "edit this page", return back to main site """
		response = super(Public_PersonAdmin, self).response_change(request, obj)

		if request.GET.get('next') != '' and not request.REQUEST.get('_addanother', False) and not request.REQUEST.get('_continue', False):
			response['location'] = reverse('public_form:entry_page_to_gestioci')

		if request.REQUEST.get('_addanother', False) or request.REQUEST.get('_continue', False):
			response['location'] = reverse("member:General_person_change",  args=[obj.id] ) + "?next=public_form"

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


user_admin_site.register(Project, ProjectAdmin)


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
