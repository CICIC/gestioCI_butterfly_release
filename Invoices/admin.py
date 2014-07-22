#encoding=utf-8
'''
 1) COMMON IMPORTS
 2) TOOLS
 3) SITE REGISTER
	3.1) Admin
	3.2) Cooper
'''
'''
 1) COMMON IMPORTS
 2) 
 3) 
'''
 #Localization
from django.utils.translation import ugettext_lazy as _
'''
 1) 
 2) TOOLS
 3) 
'''

from django.contrib.admin import SimpleListFilter
#Use this in like => list_filter = (onlyownedFilter,)
class onlyownedFilter(SimpleListFilter):
	# Human-readable title which will be displayed in the
	# right admin sidebar just above the filter options.
    	title = _(u'Hola usuari')

	# Parameter for the filter that will be used in the URL query.
	parameter_name = 'onlyowned'

	def lookups(self, request, model_admin):
		return (
			('Mine', _(u'les meves factures')),
		)

	def queryset(self, request, queryset):
	# Compare the requested value (either '80s' or '90s')
	# to decide how to filter the queryset.
		if self.value() == 'Mine':
			return queryset.filter(user=request.user)

#Use this in a ModelAdmin.list_filter property
class First_Period_Filter (SimpleListFilter):
	title = _(u'primer període')
	parameter_name = 'first_period'

	def lookups(self, request, model_admin):
		qs_periods = period.objects.all()
		yFilters = ()
		for ob_period in qs_periods:
			yFilters = yFilters + ((ob_period.id, ob_period.period()),)
		return yFilters

	def queryset(self, request, queryset):
		if self.value():
			qs_period = period.objects.get( id = self.value() )
			qs = queryset.filter ( user__date_joined__lt = qs_period.date_close )
			return qs

		return queryset

#Use this in a ModelAdmin.list_filter property
class Closing_Filter (SimpleListFilter):
    title = _(u'Resultats (Selecciona avanç un Període)')
    parameter_name = 'closing'

    def lookups(self, request, model_admin):
        return (
            ('1', _('Coopers that have periodclosed and has closed')),
			('2', _('Coopers that have periodclosed')),
			('3', _('Coopers that have not periodclosed')),
        )

    def queryset(self, request, queryset):
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

'''
 1) 
 2) SITE REGISTER
 3) 
'''
#Base entity
from django.contrib.admin import ModelAdmin

# Import models
from Invoices.models import *

# Export csv plugin
from Invoices.action import export_as_csv_action

#Use this by registrating of ModelAdmin in admin.site to specific soci csv import
from django import forms
class CSVImportAdmin(ModelAdmin):
	''' Custom model to not have much editable!'''
	readonly_fields = ['file_name',
					   'upload_method',
					   'error_log_html',
					   'import_user']
	fields = [
				'model_name',
				'field_list',
				'upload_file',
				'file_name',
				'encoding',
				'upload_method',
				'error_log_html',
				'import_user']
	formfield_overrides = {
		models.CharField: {'widget': forms.Textarea(attrs={'rows':'4',
			   'cols':'60'})},
		}

	def save_model(self, request, obj, form, change):
		form.save()
		#TODO: Use a command  from App.management.commands.myCSVimporterLib import Command
		#      cmd = Command()
		if obj.upload_file:
			obj.file_name = obj.upload_file.name
			obj.encoding = ''
			defaults = self.filename_defaults(obj.file_name)
			members = open(settings.MEDIA_BASE + str(obj.upload_file))
			data = csv.DictReader(members)
			default_password = 'tsc_eclub'
			errors = [] 
			error = False
			coopnum = None
			for row in data:
				try:
					name = row['name'][0:29]
					lastname = row['lastname'][0:29]
					email = row['email']
					coop = row['coop']
					coopnum = row['coopnum']
					coopnum=coopnum.replace("COOP","")
					passw = row['password']
					vat = row['iva']
					vat = vat.replace("%","")
					tax = row['tax']
				except:
					errors.append("\n S'han de revisar les columnes")
					error = True
				
				if not error and not coopnum:
					errors.append("\n Falta num soci")
				
				r_coop= Coop.objects.filter(name=coop)
				if not error and not r_coop:
					errors.append("\n Per %s no trobem la cooperativa %s" % (coopnum, coop))

				if not vat:
					vat = 0
				if not tax:
					tax = 0

				if coopnum and r_coop:
					user = None
					with transaction.atomic():
						try:
							try:
								user = User.objects.get(username = coopnum)
							except:
								print "not existing " + coopnum
								user = None
							
							if user:
								user.first_name = name
								user.last_name = lastname
								user.save()
							else:
								user = User.objects.create_user(coopnum, email, passw)
								user.is_staff = False
								user.first_name = name
								user.last_name = lastname
								user.save()

								if user:
									from django.contrib.auth.models import Group
									g = Group.objects.get(name='SOCI') 
									g.user_set.add(user)
									
									soci = Soci (user=user, coop=r_coop[0], coop_number=coopnum, IVA_assignat=vat, preTAX=tax)
									soci.save()
						except IntegrityError as e:
							errors.append("\n" + str(e))
							errors.append("\n" + str(row))
						except Exception as e:
							print e
							print lastname
							print name

			#errors = ["Finalitzat el procés"]
			if errors or error:
				obj.error_log = '\n'.join(errors)

			obj.import_user = str(request.user)
			obj.import_date = datetime.now()
			obj.save()
			

	def filename_defaults(self, filename):
		""" Override this method to supply filename based data """
		defaults = []
		splitters = {'/':-1, '.':0, '_':0}
		for splitter, index in splitters.items():
			if filename.find(splitter)>-1:
				filename = filename.split(splitter)[index]
		return defaults

#GENERATE CONTROL PANEL MENU
'''
3.1) ADMIN
'''
#Add any Invoice new Entity for ADMIN  below:
from django.contrib import admin
# Import forms


admin.site.register(vats)
admin.site.register(currencies)

class coop_admin(ModelAdmin):
	fields = ['name', ]
	list_display = ('name', )
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
admin.site.register(coop, coop_admin)
from Invoices.forms import cooper_admin_form
class cooper_admin(ModelAdmin):
	form = cooper_admin_form
	model = 'cooper'
	list_per_page = 600
	fields = ['user', 'coop_number', 'IVA_assignat', 'coop', 'extra_days', 'preTAX']
	list_display = ('firstname', 'lastname', 'coopnumber', 'email', 'IVA_assignat', 'coop', 'extra_days', 'preTAX', 'date_joined')
	search_fields = ['coop_number', 'user__username', 'user__first_name']
	list_filter = ('coop',  First_Period_Filter, Closing_Filter )
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
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
admin.site.register(cooper, cooper_admin)

class tax_admin(ModelAdmin):
	fields = ['taxId', 'min_base', 'max_base']
	list_display = ('taxId', 'min_base', 'max_base')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
admin.site.register(tax, tax_admin)
from Invoices.forms import client_form
class client_admin(ModelAdmin):
	form = client_form
	fields = ['name', 'CIF', 'otherCIF']
	list_display = ('name', 'CIF', 'otherCIF')
	search_fields = ['name', 'CIF', 'otherCIF']
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
	def save_model(self, request, obj, form, change):
		obj.name = obj.name.upper().replace("-", "").replace(".","").replace("/","").replace("-","").replace(",","")
		obj.save()
admin.site.register(client, client_admin)

from Invoices.forms import provider_form
class provider_admin(ModelAdmin):
	form = provider_form
	fields = ['name', 'CIF', 'otherCIF', 'iban']
	list_display = ('name', 'CIF', 'otherCIF', 'iban')
	search_fields = ['name', 'CIF', 'otherCIF']
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
	def save_model(self, request, obj, form, change):
		if obj.CIF is None and obj.otherCIF is None:
			raise ValidationError(_(u"Especifica identitat"))
			return
		else:
			obj.save()
admin.site.register(provider, provider_admin)

class PeriodAdmin(ModelAdmin):
	fields = ['label', 'first_day', 'date_open', 'date_close']
	list_display = ('label', 'first_day', 'date_open', 'date_close')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
admin.site.register(period, PeriodAdmin)

class EmailNotificationAdmin(ModelAdmin):
	class Media:
			js = (
				'EmailNotification.js',   # app static folder
			)
	fields = ['efrom', 'eto', 'ento', 'sent_to_user', 'subject', 'body', 'period', 'is_active', 'notification_type', 'offset_days', 'pointed_date'  ]
	list_display = ('efrom', 'ento', 'sent_to_user_filter', 'subject', 'period', 'is_active', 'on_time','execution_date', 'notification_type', 'pointed_date_filter' )
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
admin.site.register(EmailNotification, EmailNotificationAdmin)

#Use this by registrating of ModelAdmin in admin.site to specific soci csv import
class CSVImportAdmin(ModelAdmin):
	''' Custom model to not have much editable!'''
	readonly_fields = ['file_name',
					   'upload_method',
					   'error_log_html',
					   'import_user']
	fields = [
				'model_name',
				'field_list',
				'upload_file',
				'file_name',
				'encoding',
				'upload_method',
				'error_log_html',
				'import_user']
	formfield_overrides = {
		models.CharField: {'widget': forms.Textarea(attrs={'rows':'4',
			   'cols':'60'})},
		}

	def save_model(self, request, obj, form, change):
		form.save()
		#TODO: Use a command  from App.management.commands.myCSVimporterLib import Command
		#      cmd = Command()
		if obj.upload_file:
			obj.file_name = obj.upload_file.name
			obj.encoding = ''
			defaults = self.filename_defaults(obj.file_name)
			members = open(settings.MEDIA_BASE + str(obj.upload_file))
			data = csv.DictReader(members)
			default_password = 'tsc_eclub'
			errors = [] 
			error = False
			coopnum = None
			for row in data:
				try:
					name = row['name'][0:29]
					lastname = row['lastname'][0:29]
					email = row['email']
					coop = row['coop']
					coopnum = row['coopnum']
					coopnum=coopnum.replace("COOP","")
					passw = row['password']
					vat = row['iva']
					vat = vat.replace("%","")
					tax = row['tax']
				except:
					errors.append("\n S'han de revisar les columnes")
					error = True
				
				if not error and not coopnum:
					errors.append("\n Falta num soci")
				
				r_coop= Coop.objects.filter(name=coop)
				if not error and not r_coop:
					errors.append("\n Per %s no trobem la cooperativa %s" % (coopnum, coop))

				if not vat:
					vat = 0
				if not tax:
					tax = 0

				if coopnum and r_coop:
					user = None
					with transaction.atomic():
						try:
							try:
								user = User.objects.get(username = coopnum)
							except:
								print "not existing " + coopnum
								user = None
							
							if user:
								user.first_name = name
								user.last_name = lastname
								user.save()
							else:
								user = User.objects.create_user(coopnum, email, passw)
								user.is_staff = False
								user.first_name = name
								user.last_name = lastname
								user.save()

								if user:
									from django.contrib.auth.models import Group
									g = Group.objects.get(name='SOCI') 
									g.user_set.add(user)
									
									soci = Soci (user=user, coop=r_coop[0], coop_number=coopnum, IVA_assignat=vat, preTAX=tax)
									soci.save()
						except IntegrityError as e:
							errors.append("\n" + str(e))
							errors.append("\n" + str(row))
						except Exception as e:
							print e
							print lastname
							print name

			#errors = ["Finalitzat el procés"]
			if errors or error:
				obj.error_log = '\n'.join(errors)

			obj.import_user = str(request.user)
			obj.import_date = datetime.now()
			obj.save()
			

	def filename_defaults(self, filename):
		""" Override this method to supply filename based data """
		defaults = []
		splitters = {'/':-1, '.':0, '_':0}
		for splitter, index in splitters.items():
			if filename.find(splitter)>-1:
				filename = filename.split(splitter)[index]
		return defaults
admin.site.register(CSVImport, CSVImportAdmin)

'''
3.2) USER
'''
#Add any Invoice new Entity for COOPER below:
from Cooper.admin import user_admin_site

class tax_user(ModelAdmin):
	fields = ['taxId', 'min_base', 'max_base']
	list_display = ('taxId', 'min_base', 'max_base')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
	def get_actions(self, request):
		actions = super(tax_user, self).get_actions(request)
		del actions['delete_selected']
		return actions

	def has_add_permission(self, request):
		return False

	def has_delete_permission(self, request):
		return False

	def __init__(self, *args, **kwargs):
		super(tax_user, self).__init__(*args, **kwargs)
		self.list_display_links = (None,)

	# to hide change and add buttons on main page:
	def get_model_perms(self, request): 
		return {'view': True}
#user_admin_site.register(tax, tax_user)

from django.contrib import admin
class sales_line_inline(admin.TabularInline):
	model = sales_line
	fields = ['value', 'percentInvoicedVAT']
	extra = 1

from Invoices.forms import sales_invoice_form
class sales_invoice_admin (ModelAdmin):
	form = sales_invoice_form
	model = sales_invoice
	date_hierarchy = "date"
	change_list_template = 'admin/Invoices/SalesInvoices/change_list.html'
	fields = ['period', 'num', 'client', 'date', 'who_manage', 'status', 'dateTransfer']
	list_display = ('period', 'number', 'num', 'client', 'date', 'value', 'invoicedVAT', 'assignedVAT', 'total', 'who_manage', 'status', 'dateTransfer')
	list_display_links = ( 'number', )
	list_editable = ('period', 'num', 'client', 'date', 'who_manage', 'status', 'dateTransfer')
	list_export = ('period', 'number', 'clientName', 'clientCif', 'date', 'value', 'invoicedVAT', 'assignedVAT', 'total', 'who_manage', 'status', 'dateTransfer')
	list_filter = ('period',)
	actions = [export_as_csv_action("Exportar CSV", fields=list_export, header=True, force_fields=True),]
	inlines = [sales_line_inline]

	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(sales_invoice_admin, self).get_form(request, obj, **kwargs)
		class ModelFormMetaClass(ModelForm):
			def __new__(cls, *args, **kwargs):
				kwargs['request'] = request
				return ModelForm(*args, **kwargs)
		return ModelFormMetaClass
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
		obj.type = 0
		if getattr(obj, 'cooper', None) is None:
			try:
				obj.cooper = cooper.objects.get(user = request.user)
			except:
				obj.cooper = None
		obj.save()
		#New or Edit
		if obj:
			pk = obj.pk
		else:
			pk=0

	def queryset(self, request):
		if request.user.is_superuser:
			return sales_invoice.objects.all()
		return sales_invoice.objects.filter(cooper=coopers.object.get(user=request.user))

	def changelist_view(self, request, extra_context=None):
		#Get totals
		response = super(sales_invoice_admin, self).changelist_view(request, extra_context)
		try:
			qs_queryset = response.context_data["cl"].query_set
		except:
			qs_queryset = None
		if qs_queryset and extra_context is None:
			extra_context = {}
			from bots import bot_sales_invoice
			bot = bot_sales_invoice( qs_queryset )
			extra_context['Sales_base'] = Decimal ( "%.2f" % bot.sales_base )
			extra_context['Sales_invoicedVAT'] = Decimal ( "%.2f" % bot.sales_invoicedVAT )
			extra_context['Sales_assignedVAT'] = Decimal ( "%.2f" % bot.sales_assignedVAT )
			extra_context['Sales_total'] = Decimal ( "%.2f" % bot.sales_total )

		#Filter by period
		from Invoices.bots import PeriodManager
		return PeriodManager.filterbydefault(request, self, sales_invoice_admin, extra_context)
		def get_form(self, request, obj=None, **kwargs):
			ModelForm = super(sales_invoice_admin, self).get_form(request, obj, **kwargs)
			class ModelFormMetaClass(ModelForm):
				def __new__(cls, *args, **kwargs):
					kwargs['request'] = request
					return ModelForm(*args, **kwargs)
			return ModelFormMetaClass
user_admin_site.register(sales_invoice, sales_invoice_admin)

class purchases_line_inline(admin.TabularInline):
	model = purchases_line
	fields = ['value', 'percentExpencedVAT', 'percentIRPFRetention']
	extra = 1

from Invoices.forms import purchases_invoice_form
class purchases_invoice_admin (ModelAdmin):
	form = purchases_invoice_form
	model = purchases_invoice
	date_hierarchy = "date"
	change_list_template = 'admin/Invoices/PurchaseInvoices/change_list.html'
	fields = ['period', 'num', 'provider', 'date', 'who_manage', 'status', 'dateTransfer']
	list_display = ('period', 'number', 'num', 'provider', 'date', 'value', 'expencedVAT', 'IRPFRetention', 'total', 'who_manage', 'status', 'dateTransfer')
	list_display_links = ( 'number', )
	list_editable = ('period', 'num', 'provider', 'date', 'who_manage', 'status', 'dateTransfer')
	list_export = ('period', 'num', 'providerName', 'providerCif', 'date', 'value', 'expencedVAT', 'IRPFRetention', 'total', 'who_manage', 'status', 'dateTransfer')
	list_filter = ('period',)
	actions = [export_as_csv_action("Exportar CSV", fields=list_export, header=True, force_fields=True),]
	inlines = [purchases_line_inline]
	def providerName(self, obj):
		return obj.provider.name
	providerName.short_description = _(u"provider")

	def providerCif(self, obj):
		if obj.provider.CIF:
			return obj.provider.CIF
		else:
			return obj.provider.otherCIF
	providerCif.short_description = _(u"provider (ID) ")

	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(purchases_invoice_admin, self).get_form(request, obj, **kwargs)
		class ModelFormMetaClass(ModelForm):
			def __new__(cls, *args, **kwargs):
				kwargs['request'] = request
				return ModelForm(*args, **kwargs)
		return ModelFormMetaClass

	def save_model(self, request, obj, form, change):
		obj.type = 1
		if getattr(obj, 'cooper ', None) is None:
			try:
				obj.cooper = cooper.objects.get(user = request.user)
			except:
				print "purchases invoice. asigno cooper vacío"
				obj.cooper = None
		obj.save()
		#New or Edit
		if obj:
			pk = obj.pk
		else:
			pk=0
	def queryset(self, request):
		if request.user.is_superuser:
			return purchases_invoice.objects.all()
		return purchases_invoice.objects.filter(cooper=coopers.object.get(user=request.user))

	def changelist_view(self, request, extra_context=None):
		#Get totals
		response = super(purchases_invoice_admin, self).changelist_view(request, extra_context)
		try:
			qs_queryset = response.context_data["cl"].query_set
		except:
			qs_queryset = None
		if qs_queryset and extra_context is None:
			extra_context = {}
			from bots import bot_purchases_invoice
			bot = bot_purchases_invoice( qs_queryset )
			extra_context['Purchases_base'] = Decimal ( "%.2f" % bot.purchases_base )
			extra_context['Purchases_expencedVAT'] = Decimal ( "%.2f" % bot.purchases_expencedVAT )
			extra_context['Purchases_IRPFRetention'] = Decimal ( "%.2f" % bot.purchases_IRPFRetention )
			extra_context['Purchases_total'] = Decimal ( "%.2f" % bot.purchases_total )

		#Filter by period
		from Invoices.bots import PeriodManager
		return PeriodManager.filterbydefault(request, self, purchases_invoice_admin, extra_context)
user_admin_site.register(purchases_invoice, purchases_invoice_admin)
