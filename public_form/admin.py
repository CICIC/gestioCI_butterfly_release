from django.contrib import admin

from django import forms
from django.forms.extras import widgets

from django.utils.translation import ugettext as _

from Cooper.admin import user_admin_site

from Welcome.models import iC_Akin_Membership
from Welcome.admin import Public_AkinMembershipAdmin
class Public_AkinMembershipAdmin(Public_AkinMembershipAdmin):
	list_editable = ( "join_fee", "ic_CESnum",)
	def queryset(self, request):
		from public_form import bots
		return iC_Akin_Membership.objects.filter(person=bots.user_registration_bot().get_person(request.user))
user_admin_site.register(iC_Akin_Membership, Public_AkinMembershipAdmin)

from Welcome.models import iC_Person_Membership
from Welcome.admin import PersonMembershipAdmin
class PersonMembershipAdmin(PersonMembershipAdmin):
		def queryset(self, request):
			from public_form import bots
			return iC_Person_Membership.objects.filter(person=bots.user_registration_bot().get_person(request.user))
user_admin_site.register(iC_Person_Membership, PersonMembershipAdmin)

from Welcome.models import iC_Project_Membership
from Welcome.admin import ProjectMembershipAdmin
class ProjectMembershipAdmin(ProjectMembershipAdmin):
		def queryset(self, request):
			from public_form import bots
			return iC_Project_Membership.objects.filter(person=bots.user_registration_bot().get_person(request.user))
user_admin_site.register(iC_Project_Membership, ProjectMembershipAdmin)

from Welcome.models import Fee
from Welcome.admin import FeeAdmin
class FeeAdmin(FeeAdmin):
		def queryset(self, request):
			from public_form import bots
			return Fee.objects.filter(human=bots.user_registration_bot().get_person(request.user))
user_admin_site.register(Fee, FeeAdmin)

from General.models import Person
from General.admin import Public_PersonAdmin

class Public_PersonAdmin(Public_PersonAdmin):
		def queryset(self, request):
			from public_form import bots
			return Person.objects.filter(id=bots.user_registration_bot().get_person(request.user).id)
user_admin_site.register(Person, Public_PersonAdmin)

from General.models import Project
from General.admin import Public_ProjectAdmin
class Public_ProjectAdmin(Public_PersonAdmin):
		def queryset(self, request):
			from public_form import bots
			return Project.objects.filter(id=bots.user_registration_bot().get_pr(request.user).id)
user_admin_site.register(Project, Public_ProjectAdmin)

from public_form.models import RegistrationProfile
from django.contrib import admin
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
		if self.value() ==  'Pending':
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