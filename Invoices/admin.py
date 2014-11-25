#encoding=utf-8

from django.contrib.auth import *
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import admin
from django.contrib.auth.models import *
#from django.contrib.auth.models import User
from django.contrib.admin.sites import AdminSite
from django.contrib import admin
from django.contrib.admin import ModelAdmin
from django.contrib import messages

#To read settings.MEDIA_URL
from django.conf import settings

from django.core.exceptions import ValidationError
from django.core.exceptions import FieldError

from django import forms

from django.forms.util import ErrorList

from django.db import models
from django.db import IntegrityError, transaction
from django.db.models import Sum, Max, Count
from django.db import connection

from django.core.validators import *

from django.utils.translation import ugettext_lazy as _

from forms import *

#Generic import
import csv
from csvimport.models import CSVImport
#Soci special import
from Invoices.models import CSVImport

#Application
from Invoices.models import *

from datetime import date, timedelta
from decimal import Decimal

from tools_upgrader.action import *

#For cardid validation
from localflavor.es.forms import *
from django.db.models import F

#for filtering
from django.http import HttpResponseRedirect

class UserAdminAuthenticationForm(AuthenticationForm):
	"""	Same as Django's AdminAuthenticationForm but allows to login any user who is not staff.	"""
	this_is_the_login_form = forms.BooleanField(widget=forms.HiddenInput,
								initial=1,
								error_messages={'required': _(u"Si us plau, torna a validar-te perquè la teva sessió ha expirat.")})
 
	def clean(self):
		username = self.cleaned_data.get('username')
		password = self.cleaned_data.get('password')
		message = _(u"Si us plau, introduïu un nom d'usuari i clau correcta per un compte de personal. Observeu que ambdós camps són sensibles a majúscules.")#ERROR_MESSAGE
		username = username.replace("COOP","")
		if username and password:
			self.user_cache = authenticate(username=username,
			password=password)
			if self.user_cache is None:
				if u'@' in username:
					# Mistakenly entered e-mail address instead of username?
					# Look it up.
					try:
						user = User.objects.get(email=username)
					except (User.DoesNotExist, User.MultipleObjectsReturned):
						# Nothing to do here, moving along.
						pass
					else:
						if user.check_password(password):
							message = _(u"El teu e-mail no és el teu nom d'usuari"
										" Prova '%s'.") % user.username
				raise forms.ValidationError(message)
			# Removed check for is_staff here!
			elif not self.user_cache.is_active:
				raise forms.ValidationError(message)
		self.check_for_test_cookie()
		return self.cleaned_data

class UserAdmin(AdminSite):
	login_form = UserAdminAuthenticationForm
	# Anything we wish to add or override
	def has_permission(self, request):
		"""  Removed check for is_staff."""
		return request.user.is_active
user_admin_site = UserAdmin(name='usersadmin')

#Use this in like => list_filter = (onlyownedFilter,)
class onlyownedFilter(admin.SimpleListFilter):
	# Human-readable title which will be displayed in the
	# right admin sidebar just above the filter options.
    	title = _(u'Hola usuari')

	# Parameter for the filter that will be used in the URL query.
	parameter_name = 'onlyowned'

	def lookups(self, request, model_admin):
		return (
			('Mine', _(u'les meves factures')),
		)

	def get_queryset(self, request, queryset):
	# Compare the requested value (either '80s' or '90s')
	# to decide how to filter the queryset.
		if self.value() == 'Mine':
			return queryset.filter(user=request.user)

class CoopAdmin(admin.ModelAdmin):
	fields = ['name', ]
	list_display = ('name', )
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]


class First_Period_Filter (admin.SimpleListFilter):
	title = _(u'primer període')
	parameter_name = 'first_period'

	def lookups(self, request, model_admin):
		qs_periods = period.objects.all()
		yFilters = ()
		for ob_period in qs_periods:
			yFilters = yFilters + ((ob_period.id, ob_period.period()),)
		return yFilters

	def get_queryset(self, request, queryset):
		if self.value():
			qs_period = period.objects.get( id = self.value() )
			qs = queryset.filter ( user__date_joined__lt = qs_period.date_close )
			return qs

		return queryset

class Closing_Filter (admin.SimpleListFilter):
    title = _(u'Resultats (Selecciona avanç un Període)')
    parameter_name = 'closing'

    def lookups(self, request, model_admin):
        return (
            ('1', _('Coopers that have periodclosed and has closed')),
			('2', _('Coopers that have periodclosed')),
			('3', _('Coopers that have not periodclosed')),
        )

    def get_queryset(self, request, queryset):
		if request.GET.has_key('first_period'):
			id_period = request.GET['first_period']
			if self.value() == '1':
				qs = queryset.filter( user__periodclose__period_id = id_period, user__periodclose__closed = True )
				return qs
			if self.value() == '2':
				qs = queryset.filter( user__periodclose__period_id = id_period, user__periodclose__closed = False )
				return qs
			if self.value() == '3':
				qs = queryset.exclude( user__periodclose__period_id = id_period )
				return qs

class SociAdmin(admin.ModelAdmin):
	form = SociAdminForm
	model = 'Soci'
	list_per_page = 600
	fields = ['user', 'coop_number', 'IVA_assignat', 'coop', 'extra_days', 'preTAX']
	list_display = ('firstname', 'lastname', 'coopnumber', 'email', 'IVA_assignat', 'coop', 'extra_days', 'preTAX', 'date_joined')
	search_fields = ['coop_number', 'user__username', 'user__first_name']
	list_filter = ('coop',  First_Period_Filter, Closing_Filter )

	def date_joined(self,obj):
		return obj.user.date_joined
	date_joined.short_description = _(u"Data d'alta")
	date_joined.admin_order_field = 'user__date_joined'
	def firstname(self,obj):
		return obj.user.first_name
	firstname.admin_order_field = 'user__first_name'
	firstname.short_description = _(u"Nom")

	def lastname(self,obj):
		return obj.user.last_name
	lastname.admin_order_field = 'user__last_name'
	lastname.short_description = _(u"Cognom")

	def coopnumber(self,obj):
		return "%04d" % obj.coop_number
	coopnumber.short_description = _(u"nº COOP")
	coopnumber.admin_order_field = 'coop_number'

	def first_period(self, obj):
		qs = period.objects.filter(date_close__gt = (obj.user.date_joined  ) , first_day__lte = obj.user.date_joined  + timedelta(days=9) )
		if qs.count() > 0:
			return qs[0].period()
		return None
	first_period.short_description = _(u"Primer període")

	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]

class SalesInvoiceAdmin(admin.ModelAdmin):
	form = SalesInvoiceForm
	date_hierarchy = "date"
	list_per_page = 1000
	readonly_fields = ('percentAssignedVAT', )
	fields = ['user', 'period', 'num', 'client', 'date', 'value', 'percentInvoicedVAT', 'percentAssignedVAT']
	list_display = ('SociNum', 'SociName', 'clientName',  'ClientCIF', 'date', 'number', 'value', 'percentInvoicedVAT', 'percentAssignedVAT', 'invoicedVAT', 'assignedVAT', 'total')
	list_filter = ('period', )
	search_fields = ['user__soci__coop_number', 'user__username', 'user__first_name']
	list_export = ('SociNum', 'SociName', 'period', 'number', 'clientName', 'ClientCIF', 'date', 'value', 'percentInvoicedVAT', 'invoicedVAT', 'percentAssignedVAT', 'assignedVAT', 'total')
	change_list_template = 'admin/Invoices/SalesInvoices/change_list.html'

	def save_model(self, request, obj, form, change):
		if getattr(obj, 'user', None) is None:
			obj.user = request.user
		obj.save()
	
	def changelist_view(self, request, extra_context=None):
		#Get Totals
		response = super(SalesInvoiceAdmin, self).changelist_view(request, extra_context)
		try:
			qs_queryset = response.context_data["cl"].query_set
		except:
			qs_queryset = None
		if qs_queryset and extra_context is None:
			extra_context = {}
			sales_total = sales_invoicedVAT = sales_assignedVAT = sales_totalVAT = Decimal('0.00')
			for item in qs_queryset.all():
				sales_total += item.value
				sales_invoicedVAT += item.invoicedVAT()
				sales_assignedVAT += item.assignedVAT()
				sales_totalVAT += item.total()
			extra_context['Sales_total'] = Decimal ( "%.2f" % sales_total )
			extra_context['Sales_invoicedVAT'] = Decimal ( "%.2f" % sales_invoicedVAT )
			extra_context['Sales_assignedVAT'] = Decimal ( "%.2f" % sales_assignedVAT )
			extra_context['Sales_totalVAT'] = Decimal ( "%.2f" % sales_totalVAT )
		#Filter by default
		return PeriodManager.filterbydefault(request, self, SalesInvoiceAdmin, extra_context)

	def SociNum (self, obj):
		getSoci = Soci.objects.get( user=obj.user )
		return getSoci
	SociNum.short_description = _(u"Nº Soci")
	SociNum.admin_order_field = "user__soci__coop_number"

	def SociName (self, obj):
		return obj.user.first_name + ' ' + obj.user.last_name
	SociName.short_description = _(u"Nom Soci")
	SociName.admin_order_field = "user__first_name"

	def clientName (self, obj):
		return obj.client.name
	clientName.short_description = _(u"Client")

	def ClientCIF (self, obj):
		if obj.client.CIF:
			return obj.client.CIF
		else:
			return obj.client.otherCIF
	ClientCIF.short_description = _(u"Client (ID) ")
	actions = [export_as_csv_action("Exportar CSV", fields=list_export, header=True, force_fields=True),]

class SalesInvoiceUser(admin.ModelAdmin):
	form = SalesInvoiceForm
	model = SalesInvoice
	date_hierarchy = "date"
	change_list_template = 'admin/Invoices/SalesInvoices/change_list.html'
	readonly_fields = ('percentAssignedVAT', )
	fields = ['period', 'num', 'client', 'date', 'value', 'percentInvoicedVAT']
	list_display = ('period', 'number', 'num', 'client', 'date', 'value', 'percentInvoicedVAT', 'invoicedVAT', 'percentAssignedVAT', 'assignedVAT', 'total')
	list_display_links = ( 'number', )
	list_editable = ('period', 'num', 'client', 'date', 'value', 'percentInvoicedVAT')
	list_export = ('period', 'number', 'clientName', 'clientCif', 'date', 'value', 'percentInvoicedVAT', 'invoicedVAT', 'percentAssignedVAT', 'assignedVAT', 'total')

	list_filter = ('period',)
	search_fields = ['num', 'client__name', 'client__CIF', 'client__otherCIF']
	actions = [export_as_csv_action("Exportar CSV", fields=list_export, header=True, force_fields=True),]

	def clientName(self, obj):
		return obj.client.name
	clientName.short_description = _(u"Client")

	def clientCif(self, obj):
		if obj.client.CIF:
			return obj.client.CIF
		else:
			return obj.client.otherCIF
	clientCif.short_description = _(u"Client (ID) ")
 
	def save_model(self, request, obj, form, change):
		if getattr(obj, 'user', None) is None:
			obj.user = request.user
		obj.save()
		#New or Edit
		if obj:
			pk = obj.pk
		else:
			pk=0
		if SalesInvoice.objects.filter( user=obj.user, 
									period=obj.period, 
									num=obj.num).exclude(pk=pk).count() > 0:
			messages.warning(request, _(u"Ja existeix una factura amb aquest número. S'ha gravat perquè l'IVA es diferent"))

	def get_queryset(self, request):
		if request.user.is_superuser:
			return SalesInvoice.objects.all()
		return SalesInvoice.objects.filter(user=request.user)

	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == "client":
				kwargs["queryset"] = Client.objects.filter(user=request.user)
		return super(SalesInvoiceUser, self).formfield_for_foreignkey(db_field, request, **kwargs)

	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(SalesInvoiceUser, self).get_form(request, obj=None, **kwargs)
		def form_wrapper(*args, **kwargs):
			a = ModelForm(*args, **kwargs)
			a.request = request
			return a
		return form_wrapper

	def get_changelist_form(self, request, **kwargs):
		kwargs['form'] = SalesInvoiceForm
		SalesInvoiceForm.request = request
		return super(SalesInvoiceUser, self).get_changelist_form(request, **kwargs)

	def changelist_view(self, request, extra_context=None):
		#Get totals
		response = super(SalesInvoiceUser, self).changelist_view(request, extra_context)
		try:
			qs_queryset = response.context_data["cl"].query_set
		except:
			qs_queryset = None

		if qs_queryset and extra_context is None:
			extra_context = {}
			sales_total = sales_invoicedVAT = sales_assignedVAT = sales_totalVAT = Decimal('0.00')
			for item in qs_queryset.all():
				sales_total += item.value
				sales_invoicedVAT += item.invoicedVAT()
				sales_assignedVAT += item.assignedVAT()
				sales_totalVAT += item.total()
			extra_context['Sales_total'] = Decimal ( "%.2f" % sales_total )
			extra_context['Sales_invoicedVAT'] = Decimal ( "%.2f" % sales_invoicedVAT )
			extra_context['Sales_assignedVAT'] = Decimal ( "%.2f" % sales_assignedVAT )
			extra_context['Sales_totalVAT'] = Decimal ( "%.2f" % sales_totalVAT )

		#Filter by period
		return PeriodManager.filterbydefault(request, self, SalesInvoiceUser, extra_context)

class PurchaseInvoiceAdmin(admin.ModelAdmin):
	form = PurchaseInvoiceForm
	date_hierarchy = "date"
	list_per_page = 1000
	fields = ['user', 'period', 'num', 'provider', 'date', 'value', 'percentExpencedVAT', 'percentIRPFRetention']
	list_display = ('SociNum', 'SociName', 'providerName', 'providerCIF', 'date', 'num', 'value', 'percentExpencedVAT','expencedVAT', 'percentIRPFRetention', 'IRPFRetention', 'total')
	change_list_template = 'admin/Invoices/PurchaseInvoices/change_list.html'
	list_filter = ('period', )
	search_fields = ['user__soci__coop_number', 'user__username', 'user__first_name']
	list_export = ('SociNum', 'SociName', 'num', 'providerName', 'providerCIF', 'date', 'value', 'percentExpencedVAT', 'expencedVAT', 'percentIRPFRetention', 'IRPFRetention', 'total')

	def save_model(self, request, obj, form, change):
		if getattr(obj, 'user', None) is None:
			obj.user = request.user
		obj.save()

	def changelist_view(self, request, extra_context=None):
		#Calculate Totals
		response = super(PurchaseInvoiceAdmin, self).changelist_view(request, extra_context)
		try:
			qs_queryset = response.context_data["cl"].query_set
		except:
			qs_queryset = None
		if qs_queryset and extra_context is None:
			extra_context = {}
			purchases_total = purchases_expencedVAT = purchases_IRPFRetention = purchases_totalVAT = Decimal('0.00')
			for item in qs_queryset.all():
				purchases_total += item.value
				purchases_expencedVAT += item.expencedVAT()
				purchases_IRPFRetention += item.IRPFRetention()
				purchases_totalVAT += item.total()
			extra_context['Purchases_total']  = Decimal ( "%.2f" % purchases_total )
			extra_context['Purchases_expencedVAT'] = Decimal ( "%.2f" % purchases_expencedVAT )
			extra_context['Purchases_IRPFRetention'] = Decimal ( "%.2f" % purchases_IRPFRetention )
			extra_context['Purchases_totalVAT']  = Decimal ( "%.2f" % purchases_totalVAT )
		return PeriodManager.filterbydefault(request, self, PurchaseInvoiceAdmin, extra_context)

	def SociNum (self, obj):
		getSoci = Soci.objects.get( user=obj.user )
		return getSoci
	SociNum.short_description = _(u"Nº Soci")
	SociNum.admin_order_field = "user__soci__coop_number"
	def SociName (self, obj):
		return obj.user.first_name + ' ' + obj.user.last_name
	SociName.short_description = _(u"Nom Soci")
	SociName.admin_order_field = "user__first_name"
	def providerName (self, obj):
		return obj.provider.name
	providerName.short_description = _(u"Proveïdor")

	def providerCIF (self, obj):
		if obj.provider.CIF:
			return obj.provider.CIF
		else:
			return obj.provider.otherCIF
	providerCIF.short_description = _(u"Proveïdor (ID) ")
	actions = [export_as_csv_action("Exportar CSV", fields=list_export, header=True, force_fields=True),]

class PurchaseInvoiceUser(admin.ModelAdmin):
	form = PurchaseInvoiceForm
	date_hierarchy = "date"
	fields = ['period', 'num', 'provider', 'date', 'value', 'percentExpencedVAT', 'percentIRPFRetention']
	list_editable = ( 'period', 'num', 'provider', 'date', 'value', 'percentExpencedVAT', 'percentIRPFRetention')
	list_display = ('number', 'period', 'num', 'provider', 'date', 'value', 'percentExpencedVAT', 'expencedVAT', 'percentIRPFRetention', 'IRPFRetention', 'total')
	list_display_links = ( 'number', )
	list_export = ('num', 'providerName', 'providerCif', 'date', 'value', 'percentExpencedVAT', 'expencedVAT', 'percentIRPFRetention', 'IRPFRetention', 'total')
	list_filter = ('period',)
	search_fields = ['num', 'provider__name', 'provider__CIF', 'provider__otherCIF']
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
	change_list_template = 'admin/Invoices/PurchaseInvoices/change_list.html'

	def providerName(self, obj):
		return obj.provider.name
	providerName.short_description = _(u"Proveïdor")

	def providerCif(self, obj):
		if obj.provider.CIF:
			return obj.provider.CIF
		else:
			return obj.provider.otherCIF
	providerCif.short_description = _(u"Proveïdor (ID) ")

	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == "provider":
				kwargs["queryset"] = Provider.objects.filter(user=request.user)
		return super(PurchaseInvoiceUser, self).formfield_for_foreignkey(db_field, request, **kwargs)

	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(PurchaseInvoiceUser, self).get_form(request, obj=None, **kwargs)
		def form_wrapper(*args, **kwargs):
			a = ModelForm(*args, **kwargs)
			a.request = request
			return a
		return form_wrapper

	def get_changelist_form(self, request, **kwargs):
		kwargs['form'] = PurchaseInvoiceForm
		PurchaseInvoiceForm.request = request
		return super(PurchaseInvoiceUser, self).get_changelist_form(request, **kwargs)

	def save_model(self, request, obj, form, change):
		if getattr(obj, 'user', None) is None:
			obj.user = request.user
		obj.save()
		#New or Edit
		if obj:
			pk = obj.pk
		else:
			pk=0
		if PurchaseInvoice.objects.filter( user=obj.user, 
									period=obj.period, 
									num=obj.num).exclude(pk=pk).count() > 0:
			messages.warning(request, _(u"Ja existeix una factura amb aquest número. S'ha gravat perquè l'IVA es diferent"))

	def get_queryset(self, request):
		if request.user.is_superuser:
			return PurchaseInvoice.objects.all()
		return PurchaseInvoice.objects.filter(user=request.user)

	def changelist_view(self, request, extra_context=None):
		#Calculate Totals
		response = super(PurchaseInvoiceUser, self).changelist_view(request, extra_context)
		try:
			qs_queryset = response.context_data["cl"].query_set
		except:
			qs_queryset = None
		if qs_queryset and extra_context is None:
			extra_context = {}
			purchases_total = purchases_expencedVAT = purchases_IRPFRetention = purchases_totalVAT = Decimal('0.00')
			for item in qs_queryset.all():
				purchases_total += item.value
				purchases_expencedVAT += item.expencedVAT()
				purchases_IRPFRetention += item.IRPFRetention()
				purchases_totalVAT += item.total()
			extra_context['Purchases_total']  = Decimal ( "%.2f" % purchases_total )
			extra_context['Purchases_expencedVAT'] = Decimal ( "%.2f" % purchases_expencedVAT )
			extra_context['Purchases_IRPFRetention'] = Decimal ( "%.2f" % purchases_IRPFRetention )
			extra_context['Purchases_totalVAT']  = Decimal ( "%.2f" % purchases_totalVAT )

		return PeriodManager.filterbydefault(request, self, PurchaseInvoiceUser, extra_context)

class ClientAdmin(admin.ModelAdmin):
	form =ClientForm
	fields = ['user', 'name', 'CIF', 'otherCIF']
	list_display = ('user', 'name', 'CIF', 'otherCIF')
	search_fields = ['name', 'CIF', 'otherCIF']
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]

	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(ClientAdmin, self).get_form(request, obj=None, **kwargs)
		def form_wrapper(*args, **kwargs):
			a = ModelForm(*args, **kwargs)
			a.request = request
			return a
		return form_wrapper

	def save_model(self, request, obj, form, change):
		obj.name = obj.name.upper().replace("-", "").replace(".","").replace("/","").replace("-","").replace(",","")

		if getattr(obj, 'user', None) is None:
			obj.user = request.user
		obj.save()

	def get_queryset(self, request):
		if request.user.is_superuser:
			return Client.objects.all()
		return Client.objects.filter(user=request.user)

class ClientUser(admin.ModelAdmin):
	form =ClientForm
	fields = ['name', 'CIF', 'otherCIF']
	list_display = ('name', 'CIF', 'otherCIF')
	search_fields = ['name', 'CIF', 'otherCIF']
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]

	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(ClientUser, self).get_form(request, obj=None, **kwargs)
		def form_wrapper(*args, **kwargs):
			a = ModelForm(*args, **kwargs)
			a.request = request
			return a
		return form_wrapper

	def save_model(self, request, obj, form, change):
		obj.name = obj.name.upper().replace("-", "").replace(".","").replace("/","").replace("-","").replace(",","")

		if getattr(obj, 'user', None) is None:
			obj.user = request.user
		obj.save()

	def get_queryset(self, request):
		if request.user.is_superuser:
			return Client.objects.all()
		return Client.objects.filter(user=request.user)

class ProviderAdmin(admin.ModelAdmin):
	form =ProviderForm
	fields = ['user', 'name', 'CIF', 'otherCIF']
	list_display = ('user', 'name', 'CIF', 'otherCIF')
	search_fields = ['name', 'CIF', 'otherCIF']
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]

	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(ProviderAdmin, self).get_form(request, obj=None, **kwargs)
		def form_wrapper(*args, **kwargs):
			a = ModelForm(*args, **kwargs)
			a.request = request
			return a
		return form_wrapper

	def save_model(self, request, obj, form, change):
		if obj.CIF is None and obj.otherCIF is None:
			raise ValidationError(_(u"Especifica identitat"))
			return
		obj.name = obj.name.upper().replace("-","").replace(".","").replace("/","").replace("-","").replace(",","")
		
		if getattr(obj, 'user', None) is None:
			obj.user = request.user
		obj.save()

	def get_queryset(self, request):
		if request.user.is_superuser:
			return Provider.objects.all()
		return Provider.objects.filter(user=request.user)

class ProviderUser(admin.ModelAdmin):
	form =ProviderForm
	fields = ['name', 'CIF', 'otherCIF']
	list_display = ('name', 'CIF', 'otherCIF')
	search_fields = ['name', 'CIF', 'otherCIF']
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]

	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(ProviderUser, self).get_form(request, obj=None, **kwargs)
		def form_wrapper(*args, **kwargs):
			a = ModelForm(*args, **kwargs)
			a.request = request
			return a
		return form_wrapper

	def save_model(self, request, obj, form, change):
		if obj.CIF is None and obj.otherCIF is None:
			raise ValidationError(_(u"Especifica identitat"))
			return
		obj.name = obj.name.upper().replace("-","").replace(".","").replace("/","").replace("-","").replace(",","")
		
		if getattr(obj, 'user', None) is None:
			obj.user = request.user
		obj.save()

	def get_queryset(self, request):
		if request.user.is_superuser:
			return Provider.objects.all()
		return Provider.objects.filter(user=request.user)

class PeriodAdmin(admin.ModelAdmin):
	fields = ['label', 'first_day', 'date_open', 'date_close']
	list_display = ('label', 'first_day', 'date_open', 'date_close')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
	def save_model(self, request, obj, form, change):
		if getattr(obj, 'user', None) is None:
			obj.user = request.user
		obj.save()
	def get_queryset(self, request):
			if request.user.is_superuser:
					return period.objects.all()
			return period.objects.filter(user=request.user)

class PeriodCloseAdmin(admin.ModelAdmin):
	form = PeriodCloseForm
	change_list_template = "admin/Invoices/Periodclose/change_listAdmin.html"
	list_filter = ('period', 'closed')
	list_per_page = 1000
	search_fields = ['CESnumber', 'user__username', 'user__first_name']
	list_display = ('SociNum', 'SociName', 'period', 
		'BaseSalesF', 'BaseSalesC', 'Sales_invoicedVAT', 'Sales_assignedVAT','Sales_totalVAT',
		'BasePurchasesF', 'BasePurchasesC', 'Purchases_expencedVAT', 'Purchases_IRPFRetention', 'Purchases_totalVAT',
		'VAT_1', 'VAT_2', 
		'Savings', 
		'VAT_type',
		'Savings_donation',
		'periodTAX', 'preTAX', 'periodTAXeuro', 'periodTAXeco',
		'TotalVAT', 'TotalIRPF',
		'donation_euro', 'donation_eco',
		'subTotalEuro', 'subTotalEco', 'TotalEuro', 'TotalEco', 'closed', 
		'paymentEntities'
	)

	radio_fields = {"refund_entity": admin.HORIZONTAL}
	list_export = ('period', 'SociNum', 'SociName', 'Sales_total', 'Sales_invoicedVAT', 'Sales_assignedVAT', 'Sales_totalVAT',
		'Purchases_total', 'Purchases_expencedVAT', 'Purchases_IRPFRetention', 'Purchases_totalVAT',
		'VAT_1', 'VAT_2', 'VAT_type',
		'Savings', 'Savings_donation',
		'TotalVAT', 'TotalIRPF',
		'periodTAX',
		'periodTAXeuro', 'periodTAXeco',
		'donation_euro', 'donation_eco',
		'subTotalEuro', 'subTotalEco', 'TotalEuro', 'TotalEco', 'CESnumber',
		'paymentEntities')


	fieldsets = (
		(_(u"Nº COOP"), {
			'fields': ('user',)
		}),
		(_(u'Període'), {
			'fields': ('period',)
		}),
		(_('Emeses'), {
			'fields': (('Sales_total', 'Sales_invoicedVAT'), ('Sales_totalVAT', 'Sales_assignedVAT'))
		}),
		(_('Despeses'), {
			'fields': (('Purchases_total', 'Purchases_expencedVAT'), ('Purchases_totalVAT', 'Purchases_IRPFRetention'))
		}),
		(_('Seleccio IVA'), {
			'fields': (('VAT_1', 'VAT_2'), 'VAT_type')
		}),
		(_('Estalvi'), {
			'fields': ('Savings', 'Savings_donation')
		}),
		(_('Total impostos'), {
			'fields': (('TotalVAT', 'TotalIRPF', ),)
		}),
		(_('Quota Trimestral'), {
			'fields': ('periodTAX', 'preTAX', 'periodTAXeuro', 'periodTAXeco')
		}),
		(_('Aportacio a la CIC'), {
			'fields': ('donation_euro', 'donation_eco')
		}),
		(_('Totals'), {
			'fields': (('subTotalEuro', 'subTotalEco'), ('TotalEuro', 'TotalEco'), 'CESnumber')
		}),
		(_('Pagaments'), {
			'fields': ('payment_entity',)
		}),
		(_('Tancar'), {
			'fields': ('closed',)
		}),
	)

	def VAT_1(self, obj):
		return obj.Sales_invoicedVAT- obj.Purchases_expencedVAT
	VAT_1.decimal = True
	VAT_1.short_description = _(u'IVA Facturat - Despeses (€)')
	def VAT_2(self, obj):
		return obj.Sales_assignedVAT - obj.Purchases_expencedVAT
	VAT_2.decimal = True
	VAT_2.short_description = _(u'IVA Assignat - Despeses (€)')

	def SociNum (self, obj):
		getSoci = Soci.objects.get(user=obj.user)
		return getSoci
	SociNum.short_description = _(u"Nº Soci")
	def SociName (self, obj):
		return obj.user.first_name + ' ' + obj.user.last_name
	SociName.short_description = _(u"Nom Soci")
	def BaseSalesF (self, obj):
		return obj.Sales_total
	BaseSalesF.short_description = _(u"Base Imposable segons Factures Emeses")
	def BaseSalesC (self, obj):
		return obj.Sales_total
	BaseSalesC.short_description = _(u"Base Imposable segons Càlcul Trimestral")
	def BasePurchasesF (self, obj):
		return obj.Purchases_total
	BasePurchasesF.short_description = _(u"Base Imposable segons Factures Despeses")
	def BasePurchasesC (self, obj):
		return obj.Purchases_totalVAT
	BasePurchasesC.short_description = _(u"Base Imposable segons Càlcul Trimestral")
	def paymentEntities(self, obj):
		return  ' / '.join([str(item.entity) for item in obj.payment_entity.all()])
	paymentEntities.short_description = _("Pagaments")
	def get_form(self, request, obj=None, **kwargs):
		form = super(PeriodCloseAdmin, self).get_form(request, obj, **kwargs)

		if obj:
			user = obj.user
			if request.user.is_superuser:
				period_object =  obj.period
				period_value = obj.period.id
				
			else:
				qs_Period = PeriodManager.get_opened_period(obj.user) 

				period_object = qs_Period[0] if qs_Period.count() == 1 else 0
				period_value = qs_Period[0].id if qs_Period.count() == 1 else 0

			#form.base_fields['period'].initial = period_object
			#form.base_fields['period'].widget.attrs['disabled'] = True
			#SALES
			#TODO: Query access to total amount (Can do this with calculated fields?)
			#qs_Sales = SalesInvoice.objects.filter(period=period_value, user=request.user).values('period').annotate(Sales_total_aux=Sum('value'))
			#value = qs_Sales.values('Sales_total_aux')[0].get('Sales_total_aux') if qs_Sales.values('Sales_total_aux').count() > 0 else 0
			qs_Sales = SalesInvoice.objects.filter(period=period_value, user=request.user)
			sales_total = sales_invoicedVAT = sales_assignedVAT = sales_totalVAT = Decimal('0.00')
			for item in qs_Sales.all():
				sales_total += item.value
				sales_invoicedVAT += item.invoicedVAT()
				sales_assignedVAT += item.assignedVAT()
				sales_totalVAT += item.total()

			form.base_fields['Sales_total'].initial = Decimal ( "%.2f" % sales_total )
			form.base_fields['Sales_invoicedVAT'].initial = Decimal ( "%.2f" % sales_invoicedVAT )
			form.base_fields['Sales_assignedVAT'].initial = Decimal ( "%.2f" % sales_assignedVAT )
			form.base_fields['Sales_totalVAT'].initial = Decimal ( "%.2f" % sales_totalVAT )

			form.base_fields['Sales_total'].widget.attrs['readonly'] = True
			form.base_fields['Sales_invoicedVAT'].widget.attrs['readonly'] = True
			form.base_fields['Sales_assignedVAT'].widget.attrs['readonly'] = True
			form.base_fields['Sales_totalVAT'].widget.attrs['readonly'] = True
			
			enabledClosedCheckbox =  period_object.date_open <= datetime.date(datetime.now()) <= period_object.date_close
			if not enabledClosedCheckbox:
				form.base_fields['closed'].widget.attrs['disabled'] = True

			#PURCHASES
			#qs_Purchase = PurchaseInvoice.objects.filter(period=period_value, user=request.user).values('period').annotate(Purchase_total_aux=Sum('value'))
			#value =  Purchase.values('Purchase_total_aux')[0].get('Purchase_total_aux') if Purchase.values('Purchase_total_aux').count() > 0 else 0
			qs_Purchase = PurchaseInvoice.objects.filter(period=period_value, user=request.user)
			purchases_total = purchases_expencedVAT = purchases_IRPFRetention = purchases_totalVAT = Decimal('0.00')
			for item in qs_Purchase.all():
				purchases_total += item.value
				purchases_expencedVAT += item.expencedVAT()
				purchases_IRPFRetention += item.IRPFRetention()
				purchases_totalVAT += item.total()

			form.base_fields['Purchases_total'].initial = Decimal ( "%.2f" % purchases_total )
			form.base_fields['Purchases_expencedVAT'].initial = Decimal ( "%.2f" % purchases_expencedVAT )
			form.base_fields['Purchases_IRPFRetention'].initial = Decimal ( "%.2f" % purchases_IRPFRetention )
			form.base_fields['Purchases_totalVAT'].initial = Decimal ( "%.2f" % purchases_totalVAT )

			form.base_fields['Purchases_total'].widget.attrs['readonly'] = True
			form.base_fields['Purchases_expencedVAT'].widget.attrs['readonly'] = True
			form.base_fields['Purchases_IRPFRetention'].widget.attrs['readonly'] = True
			form.base_fields['Purchases_totalVAT'].widget.attrs['readonly'] = True

			#VATS
			totalVAT1 = Decimal ( "%.2f" % (sales_invoicedVAT - purchases_expencedVAT) )
			if totalVAT1 < 0:
				totalVAT1 = 0
			totalVAT2 = Decimal ( "%.2f" % (sales_assignedVAT - purchases_expencedVAT) )
			if totalVAT2 < 0:
				totalVAT2 = 0
			form.base_fields['VAT_1'].initial =  totalVAT1
			form.base_fields['VAT_2'].initial =  totalVAT2

			form.base_fields['VAT_1'].widget.attrs['readonly'] = True
			form.base_fields['VAT_2'].widget.attrs['readonly'] = True

			#QUOTA
			qs_Tax = periodTaxes.objects.filter(min_base__lte=sales_total, max_base__gte=sales_total)
			value = Decimal('0.00')
			if qs_Tax.count() == 1:
				value = Decimal ( "%.2f" % qs_Tax[0].taxId ) 
			else:
				value = 'Consultar'
			form.base_fields['periodTAX'].initial = value
			form.base_fields['periodTAX'].widget.attrs['readonly'] = True

			qs_Soci = Soci.objects.get(user=user)
			form.base_fields['preTAX'].initial = qs_Soci.preTAX
			form.base_fields['preTAX'].widget.attrs['readonly'] = True

			#TOTALS
			form.base_fields['subTotalEuro'].widget.attrs['readonly'] = True
			form.base_fields['subTotalEco'].widget.attrs['readonly'] = True
			form.base_fields['TotalEuro'].widget.attrs['readonly'] = True
			form.base_fields['TotalEco'].widget.attrs['readonly'] = True

		return form

	def changelist_view(self, request, extra_context=None):
		#Get totals
		response = super(PeriodCloseAdmin, self).changelist_view(request, extra_context)
		try:
			qs_queryset = response.context_data["cl"].query_set
		except:
			qs_queryset = None

		if qs_queryset and extra_context is None and request.GET.has_key('period__id__exact'):
			extra_context = {}
			
			id_period = request.GET['period__id__exact']
			qs_period = period.objects.get(id=id_period)
			qs_all_coopers = Soci.objects.filter ( user__date_joined__lte = qs_period.date_close )

			extra_context['Total_coopers'] = qs_all_coopers.count()
			extra_context['Total_coopers_url'] = "/admin/Invoices/soci/?first_period=" + id_period
			
			extra_context['Coopers_periodclose_closed'] = qs_all_coopers.filter(user__periodclose__period_id=id_period, user__periodclose__closed = True).count()
			extra_context['Coopers_periodclose_closed_url'] =  "/admin/Invoices/soci/?closing=1&first_period=" + id_period

			extra_context['Coopers_periodclose'] = qs_all_coopers.filter(user__periodclose__period_id=id_period, user__periodclose__closed = False).count()
			extra_context['Coopers_periodclose_url'] = "/admin/Invoices/soci/?closing=2&first_period=" + id_period

			extra_context['Coopers_not_periodclose'] = qs_all_coopers.exclude(user__periodclose__period_id=id_period, user__periodclose__isnull=False).count()
			extra_context['Coopers_not_periodclose_url'] = "/admin/Invoices/soci/?closing=3&first_period=" + id_period

		return PeriodManager.filterbydefault(request, self, PeriodCloseAdmin, extra_context)

	class Media:
			js = (
				'PeriodClose.js',   # app static folder
			)
	actions = [export_as_csv_action("Exportar CSV", fields=list_export, header=True, force_fields=True),]

class PeriodCloseUser(admin.ModelAdmin):
	form = PeriodCloseForm

	change_form_template = 'admin/Invoices/Periodclose/change_form.html'
	change_list_template = 'admin/Invoices/Periodclose/change_list.html'

	radio_fields = {"refund_entity": admin.HORIZONTAL}
	filter_horizontal = ('payment_entity',)
	list_display = ('edit_link', 'Sales_total', 'Sales_invoicedVAT', 'Sales_assignedVAT', 'Sales_totalVAT',
		'Purchases_total', 'Purchases_expencedVAT', 'Purchases_IRPFRetention', 'Purchases_totalVAT',
		'VAT_1', 'VAT_2', 'VAT_type',
		'Savings', 'Savings_donation',
		'TotalVAT', 'TotalIRPF',
		'periodTAX', 'preTAX',
		'periodTAXeuro', 'periodTAXeco',
		'donation_euro', 'donation_eco',
		'subTotalEuro', 'subTotalEco', 'TotalEuro', 'TotalEco', 'CESnumber', 'closed',
		'paymentEntities',
		'refund_entity')
	list_export = ('period', 'Sales_total', 'Sales_invoicedVAT', 'Sales_assignedVAT', 'Sales_totalVAT',
		'Purchases_total', 'Purchases_expencedVAT', 'Purchases_IRPFRetention', 'Purchases_totalVAT',
		'VAT_1', 'VAT_2', 'VAT_type',
		'Savings', 'Savings_donation',
		'TotalVAT', 'TotalIRPF',
		'periodTAX', 'preTAX',
		'periodTAXeuro', 'periodTAXeco',
		'donation_euro', 'donation_eco',
		'subTotalEuro', 'subTotalEco', 'TotalEuro', 'TotalEco', 'CESnumber',
		'paymentEntities')
	
	fieldsets = (
		(_('Emeses'), {
			'fields': (('Sales_total', 'Sales_invoicedVAT'), ('Sales_totalVAT', 'Sales_assignedVAT'))
		}),
		(_('Despeses'), {
			'fields': (('Purchases_total', 'Purchases_expencedVAT'), ('Purchases_totalVAT', 'Purchases_IRPFRetention'))
		}),
		(_('Seleccio IVA'), {
			'fields': (('VAT_1', 'VAT_2'), 'VAT_type')
		}),
		(_('Estalvi'), {
			'fields': ('Savings', 'Savings_donation')
		}),
		(_('Total impostos'), {
			'fields': (('TotalVAT', 'TotalIRPF', ),)
		}),
		(_('Quota Trimestral'), {
			'fields': ('periodTAX', 'preTAX', 'periodTAXeuro', 'periodTAXeco')
		}),
		(_('Aportacio a la CIC'), {
			'fields': ('donation_euro', 'donation_eco')
		}),
		(_('Totals'), {
			'fields': (('subTotalEuro', 'subTotalEco'), ('TotalEuro', 'TotalEco'), 'CESnumber')
		}),
		(_('Pagaments'), {
			'fields': ('payment_entity',)
		}),
		(_('Tancar'), {
			'fields': ('closed',)
		}),
	)

	def VAT_1(self, obj):
		if obj.VAT_type == 1:
			vat = obj.Sales_invoicedVAT- obj.Purchases_expencedVAT
			return 0 if vat < 0 else vat
		return 0
	VAT_1.decimal = True
	VAT_1.short_description = _(u'IVA Facturat - Despeses (€)')
	def VAT_2(self, obj):
		if obj.VAT_type == 2:
			vat = obj.Sales_assignedVAT - obj.Purchases_expencedVAT
			return 0 if vat < 0 else vat
		return 0
	VAT_2.decimal = True
	VAT_2.short_description = _(u'IVA Assignat - Despeses (€)')
	def paymentEntities(self, obj):
		return  ' / '.join([str(item.entity) for item in obj.payment_entity.all()])
	paymentEntities.short_description = _("Pagaments")
	def __init__(self, *args, **kwargs):
		super(PeriodCloseUser, self).__init__(*args, **kwargs)
		self.list_display_links = (None, )

	def get_form(self, request, obj=None, **kwargs):
		form = super(PeriodCloseUser, self).get_form(request, obj, **kwargs)

		user = request.user
		#PERIOD
		qs_Period = PeriodManager.get_opened_period( user ) 

		if qs_Period.count() == 1:
			period_object = qs_Period[0] 
			period_value = qs_Period[0].id
		elif request.GET.has_key('period__id__exact'):
                	id_period = request.GET['period__id__exact']
                	qs_period = period.objects.get(id=id_period)
			period_object = qs_period
			period_value = qs_period.id
		else:
			return form

		
		#form.base_fields['period'].initial = period_object
		#form.base_fields['period'].widget.attrs['disabled'] = True
		#SALES
		#TODO: Query access to total amount (Can do this with calculated fields?)
		#qs_Sales = SalesInvoice.objects.filter(period=period_value, user=request.user).values('period').annotate(Sales_total_aux=Sum('value'))
		#value = qs_Sales.values('Sales_total_aux')[0].get('Sales_total_aux') if qs_Sales.values('Sales_total_aux').count() > 0 else 0
		qs_Sales = SalesInvoice.objects.filter(period=period_value, user=request.user)
		sales_total = sales_invoicedVAT = sales_assignedVAT = sales_totalVAT = Decimal('0.00')
		for item in qs_Sales.all():
			sales_total += item.value
			sales_invoicedVAT += item.invoicedVAT()
			sales_assignedVAT += item.assignedVAT()
			sales_totalVAT += item.total()

		form.base_fields['Sales_total'].initial = Decimal ( "%.2f" % sales_total )
		form.base_fields['Sales_invoicedVAT'].initial = Decimal ( "%.2f" % sales_invoicedVAT )
		form.base_fields['Sales_assignedVAT'].initial = Decimal ( "%.2f" % sales_assignedVAT )
		form.base_fields['Sales_totalVAT'].initial = Decimal ( "%.2f" % sales_totalVAT )

		form.base_fields['Sales_total'].widget.attrs['readonly'] = True
		form.base_fields['Sales_invoicedVAT'].widget.attrs['readonly'] = True
		form.base_fields['Sales_assignedVAT'].widget.attrs['readonly'] = True
		form.base_fields['Sales_totalVAT'].widget.attrs['readonly'] = True
		
		qs_Soci = Soci.objects.get(user=request.user)
		if period_object:
			enabledClosedCheckbox =  period_object.date_open <= datetime.date(datetime.now()) <=  (period_object.date_close + timedelta(days=qs_Soci.extra_days))
		if not enabledClosedCheckbox:
			form.base_fields['closed'].widget.attrs['disabled'] = True

		#PURCHASES
		#qs_Purchase = PurchaseInvoice.objects.filter(period=period_value, user=request.user).values('period').annotate(Purchase_total_aux=Sum('value'))
		#value =  Purchase.values('Purchase_total_aux')[0].get('Purchase_total_aux') if Purchase.values('Purchase_total_aux').count() > 0 else 0
		qs_Purchase = PurchaseInvoice.objects.filter(period=period_value, user=request.user)
		purchases_total = purchases_expencedVAT = purchases_IRPFRetention = purchases_totalVAT = Decimal('0.00')
		for item in qs_Purchase.all():
			purchases_total += item.value
			purchases_expencedVAT += item.expencedVAT()
			purchases_IRPFRetention += item.IRPFRetention()
			purchases_totalVAT += item.total()

		form.base_fields['Purchases_total'].initial = Decimal ( "%.2f" % purchases_total )
		form.base_fields['Purchases_expencedVAT'].initial = Decimal ( "%.2f" % purchases_expencedVAT )
		form.base_fields['Purchases_IRPFRetention'].initial = Decimal ( "%.2f" % purchases_IRPFRetention )
		form.base_fields['Purchases_totalVAT'].initial = Decimal ( "%.2f" % purchases_totalVAT )

		form.base_fields['Purchases_total'].widget.attrs['readonly'] = True
		form.base_fields['Purchases_expencedVAT'].widget.attrs['readonly'] = True
		form.base_fields['Purchases_IRPFRetention'].widget.attrs['readonly'] = True
		form.base_fields['Purchases_totalVAT'].widget.attrs['readonly'] = True

		#VATS
		totalVAT1 = Decimal ( "%.2f" % (sales_invoicedVAT - purchases_expencedVAT) )
		if totalVAT1 < 0:
			totalVAT1 = 0
		totalVAT2 = Decimal ( "%.2f" % (sales_assignedVAT - purchases_expencedVAT) )
		if totalVAT2 < 0:
			totalVAT2 = 0
		form.base_fields['VAT_1'].initial =  totalVAT1
		form.base_fields['VAT_2'].initial =  totalVAT2

		form.base_fields['VAT_1'].widget.attrs['readonly'] = True
		form.base_fields['VAT_2'].widget.attrs['readonly'] = True

		#QUOTA
		qs_Tax = periodTaxes.objects.filter(min_base__lte=sales_total, max_base__gte=sales_total)
		value = Decimal('0.00')
		if qs_Tax.count() == 1:
			value = Decimal ( "%.2f" % qs_Tax[0].taxId ) 
		else:
			value = 'Consultar'
		form.base_fields['periodTAX'].initial = value
		form.base_fields['periodTAX'].widget.attrs['readonly'] = True

		qs_Soci = Soci.objects.get(user=user)
		form.base_fields['preTAX'].initial = qs_Soci.preTAX
		form.base_fields['preTAX'].widget.attrs['readonly'] = True

		#TOTALS
		form.base_fields['subTotalEuro'].widget.attrs['readonly'] = True
		form.base_fields['subTotalEco'].widget.attrs['readonly'] = True
		form.base_fields['TotalEuro'].widget.attrs['readonly'] = True
		form.base_fields['TotalEco'].widget.attrs['readonly'] = True

		return form

	def get_queryset(self, request):
		if request.user.is_superuser:
			return PeriodClose.objects.all()
		return PeriodClose.objects.filter(user=request.user)

	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == "period":
			kwargs["queryset"] = PeriodManager.get_opened_period( request.user ) 
		return super(PeriodCloseUser, self).formfield_for_foreignkey(db_field, request, **kwargs)

	def save_model(self, request, obj, form, change):

		if getattr(obj, 'user', None) is None:
			obj.user = request.user
			qs_Period = PeriodManager.get_opened_period( request.user )
			if qs_Period.count() > 0:
				obj.period = qs_Period[0]
		obj.save()

		#Reset preTAX
		qs_PeriodClose = PeriodClose.objects.filter(user=obj.user)
		needResetPreTax = obj.closed and obj.preTAX > 0
		if needResetPreTax:
			qs_Soci = Soci.objects.get(user=request.user)
			qs_Soci.preTAX = 0
			qs_Soci.save()

	def edit_link(self, obj):
		canEdit = False
		qs_Period = PeriodManager.get_opened_period( obj.user ) 
		if qs_Period.count() == 1:
			canEdit = qs_Period[0] == obj.period and obj.closed == False

		if canEdit:
			return u'<a href="/soci/%s/%s/%s">%s</a>' % (
				 obj._meta.app_label, obj._meta.module_name, obj.id, obj.period)
		else:
			return obj.period
	edit_link.allow_tags = True
	edit_link.short_description = _(u"Període")
	
	def exists_opened_period(self, user):
		qs_Period = PeriodManager.get_opened_period( user ) 
		if qs_Period:
			if qs_Period.count() > 1:
				print "Error, there are more than one opened period. Please correct dates"
			return qs_Period.count() == 1
		return False

	def exists_closed_period(self, user):
		#Check for existing period
		qs_Period = PeriodManager.get_opened_period( user ) 
		if qs_Period.count() == 1:
			qs_PeriodClose = PeriodClose.objects.filter(user=user, period = qs_Period[0])
			return qs_PeriodClose.count() == 1 
		return False

	def exists_closed_period_done(self, user):
		#Check for existing period
		qs_Period = PeriodManager.get_opened_period( user ) 
		if qs_Period.count() == 1:
			qs_PeriodClose = PeriodClose.objects.filter(user=user, period = qs_Period[0])
			exists = qs_PeriodClose.count() == 1 
			if exists:
				return qs_PeriodClose[0].closed == True
		return False

	def has_add_permission(self, request):
		return self.exists_opened_period( request.user ) and not self.exists_closed_period( request.user )

	def has_change_permission(self, request, obj=None):
		if obj:
			return self.exists_opened_period( obj.user ) and self.exists_closed_period( obj.user ) and not self.exists_closed_period_done ( obj.user )
		else:
			return True

	def get_actions(self, request):
		actions = super(PeriodCloseUser, self).get_actions(request)
		del actions['delete_selected']
		return actions

	# to hide change and add buttons on main page:
	def get_model_perms(self, request): 
		return {'historial':True, 
				'canAdd': self.exists_opened_period( request.user ) and not self.exists_closed_period( request.user ),
				'canEdit': self.exists_opened_period( request.user ) and self.exists_closed_period( request.user ) and not self.exists_closed_period_done ( request.user )}


	class Media:
			js = (
				'PeriodClose.js',   # app static folder
			)
	actions = [export_as_csv_action("Exportar CSV", fields=list_export, header=True, force_fields=True),]

class periodTaxesAdmin(admin.ModelAdmin):
	fields = ['taxId', 'min_base', 'max_base']
	list_display = ('taxId', 'min_base', 'max_base')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]

class periodTaxesUser(admin.ModelAdmin):
	fields = ['taxId', 'min_base', 'max_base']
	list_display = ('taxId', 'min_base', 'max_base')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
	def get_actions(self, request):
		actions = super(periodTaxesUser, self).get_actions(request)
		del actions['delete_selected']
		return actions

	def has_add_permission(self, request):
		return False

	def has_delete_permission(self, request):
		return False

	def __init__(self, *args, **kwargs):
		super(periodTaxesUser, self).__init__(*args, **kwargs)
		self.list_display_links = (None,)

	# to hide change and add buttons on main page:
	def get_model_perms(self, request): 
		return {'view': True}

class refundEntitiesAdmin(admin.ModelAdmin):
	fields = ['entity', 'concept', 'number']
	list_display = ('entity', 'concept', 'number')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]

class refundEntitiesUser(admin.ModelAdmin):
	fields = ['entity', 'concept', 'number']
	list_display = ('entity', 'concept', 'number')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
	def get_actions(self, request):
		actions = super(refundEntitiesUser, self).get_actions(request)
		del actions['delete_selected']
		return actions

	def has_add_permission(self, request):
		return False

	def has_delete_permission(self, request):
		return False

	def __init__(self, *args, **kwargs):
		super(refundEntitiesUser, self).__init__(*args, **kwargs)
		self.list_display_links = (None,)

	# to hide change and add buttons on main page:
	def get_model_perms(self, request): 
		return {'view': True}

class paymentEntitiesUser(admin.ModelAdmin):
	fields = ['entity', 'concept', 'number']
	list_display = ('entity', 'concept', 'number')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]

	def get_actions(self, request):
		actions = super(paymentEntitiesUser, self).get_actions(request)
		del actions['delete_selected']
		return actions

	def has_add_permission(self, request):
		return False

	def has_delete_permission(self, request):
		return False

	def __init__(self, *args, **kwargs):
		super(paymentEntitiesUser, self).__init__(*args, **kwargs)
		self.list_display_links = (None,)

	# to hide change and add buttons on main page:
	def get_model_perms(self, request): 
		return {'view': True}

class paymentEntitiesAdmin(admin.ModelAdmin):
	fields = ['entity', 'concept', 'number']
	list_display = ('entity', 'concept', 'number')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]

admin.site.register(SalesInvoice, SalesInvoiceAdmin)
admin.site.register(PurchaseInvoice, PurchaseInvoiceAdmin)
admin.site.register(period, PeriodAdmin)
admin.site.register(PeriodClose, PeriodCloseAdmin)
admin.site.register(periodTaxes, periodTaxesAdmin)
admin.site.register(refundEntities, refundEntitiesAdmin)
admin.site.register(paymentEntities, paymentEntitiesAdmin)

admin.site.register(Soci, SociAdmin)
admin.site.register(Coop, CoopAdmin)
admin.site.register(VATS)
admin.site.register(Client, ClientAdmin)
admin.site.register(Provider, ProviderAdmin)

user_admin_site.register(SalesInvoice, SalesInvoiceUser)
user_admin_site.register(PurchaseInvoice, PurchaseInvoiceUser)
user_admin_site.register(Client, ClientUser)
user_admin_site.register(Provider, ProviderUser)
user_admin_site.register(PeriodClose, PeriodCloseUser)
user_admin_site.register(periodTaxes, periodTaxesUser)
user_admin_site.register(paymentEntities, paymentEntitiesUser)
user_admin_site.register(refundEntities, refundEntitiesUser)

