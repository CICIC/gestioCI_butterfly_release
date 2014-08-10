from django.contrib import admin

from django import forms
from django.forms.extras import widgets

from django.utils.translation import ugettext as _

from Cooper.admin import user_admin_site

from Welcome.models import iC_Akin_Membership
from Welcome.admin import AkinMembershipAdmin
user_admin_site.register(iC_Akin_Membership, AkinMembershipAdmin)

from Welcome.models import iC_Person_Membership
from Welcome.admin import PersonMembershipAdmin
user_admin_site.register(iC_Person_Membership, PersonMembershipAdmin)

from Welcome.models import iC_Project_Membership
from Welcome.admin import ProjectMembershipAdmin
user_admin_site.register(iC_Project_Membership, ProjectMembershipAdmin)

from Welcome.models import Fee
from Welcome.admin import FeeAdmin
user_admin_site.register(Fee, FeeAdmin)

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

class RegistrationProfileAdmin(ModelAdmin):
	list_filter= (only_pending_filter, 'record_type',)
	model = RegistrationProfile
	list_display = ('user', 'activation_key', 'person', 'record_type' )

admin.site.register(RegistrationProfile, RegistrationProfileAdmin)