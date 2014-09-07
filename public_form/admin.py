#encoding=utf-8
from django.contrib import admin
from django import forms
from django.forms.extras import widgets
from django.utils.translation import ugettext as _
from Cooper.admin import user_admin_site
from itertools import chain
from django.contrib.admin import ModelAdmin
from django.contrib import admin

from django.contrib.admin import SimpleListFilter

class type_human_filter (SimpleListFilter):

	title = _(u'Sessions Acollida i Avaluació')
	parameter_name = 'learn_session_id'

	def lookups(self, request, model_admin):
		from General.models import Human
		from django.db.models import Count
		welcome_sessions = Human.objects.filter(assist_sessions__record_type__clas="welcome_session")
		assistance_to_welcome = welcome_sessions.values("assist_sessions").annotate(total_assistants=Count("id")).order_by()
		yFilters = ()

		for loop_session in assistance_to_welcome:

			if loop_session["assist_sessions"]:
				from Welcome.models import Learn_Session
				session = Learn_Session.objects.get(id=loop_session["assist_sessions"])

				message =  _(u"%s asistents %s. ")
				from django.utils import formats
				date = formats.date_format(session.datetime, "SHORT_DATETIME_FORMAT")
				message = message % (date, loop_session["total_assistants"])
				yFilters = yFilters + ((session.id, message),)
		return yFilters

	def queryset(self, request, queryset):
		#do nothing will be managed in jQuery and templatetags
		return queryset

from public_form.models import human_proxy
from public_form.forms import human_proxy_form
class human_proxy_modeladmin(ModelAdmin):
	model = human_proxy

	form = human_proxy_form
	list_per_page = 15
	list_display = ('edit_link', 'email', 'website', 'telephone_land')
	list_display_links = ('edit_link', )
	change_list_template = 'public_form_self.html'
	change_form_template = 'public_form_change_self.html'
	search_fields = ('name',)
	list_filter = (type_human_filter, )
	def get_actions(self, request):
		actions = super(human_proxy_modeladmin, self).get_actions(request)
		del actions['delete_selected']
		return actions
	def edit_link(self, obj):
		if obj is None:
			return "(None)"
		else:
			url = "/cooper/public_form/human_proxy/?human=%s" % (obj.id)
			message = obj.name
			return "<a href='%s'>%s</a>" % (url, message)
	edit_link.allow_tags = True
	edit_link.short_description = _(u"Període")
	class Media:
		css = {
		'all': ('public_form_self.css',)
		}

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
