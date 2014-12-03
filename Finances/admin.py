#encoding=utf-8
#
'''
  See model map on [GestioCI][Manual][Base de Datos][Facturación]
  https://wiki.enredaos.net/index.php?title=GestioCI-Base_de_datos#Facturaci.C3.B3n
'''
#
from django.utils.translation import ugettext_lazy as _
from django.contrib import admin
from django.contrib.admin import ModelAdmin
from django_mptt_admin.admin import DjangoMpttAdmin

from Finances.forms import *
from Finances.models import *
from Finances.bots import *
from Finances.filters import *

from mptt.admin import MPTTModelAdmin

from General.models import Company, Unit
from Cooper.admin import user_admin_site
from tools_upgrader.action import export_as_csv_action, export_all_as_csv_action
#
class AutoRecordName(admin.ModelAdmin):
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
				from Finances.models import iCf_Self_Employed
				try:

					# Extract: User, icf_Self_Employed, icf_Period_close
					try:
						user = request.user
					except:
						print "user logged is required"
					else:
						try:
							icf_se = user.fk_icf_self_employed.all().first()
						except:
							print "Finances/admin.py/class AutoRecordName.get_queryset()"
							print user.username + " necesito el seu id de iC_Self_Employed"
							print "Aquest user no es habilitat per usar l'entorn de facturació. Pots utilitzar el codi següent per incloure'l:"
							print " from tools_upgrader.objects import Self_Employed_auth "
							print " Self_Employed_auth(icf_se, user)._get_user_member_field() "
						else:
							# ... recupera i/o crear el registre de tancament de periode actual
							from Finances.bots import bot_period
							icf_pc = bot_period(user).period(True, request).get_period_closed(icf_se)
					#
					# Filter conditional
					queryset = None
					# ... Filtering Invoices
					#
					if hasattr(self.model, "rel_icfe_sales"):
						return icf_pc.icf_sales.all()
					if hasattr(self.model, "rel_icfe_purchases"):
						return icf_pc.icf_purchases.all() 
					#
					# ... Filtering Period_Close.
					#
					if hasattr(self.model, "rel_icfse_icf_period_close"):
						return icf_se.icf_periods_closed.all()

					# Filtering generic entities:
					current_human = None
					current_registration = iCf_Self_Employed.objects.get(user=request.user)
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
#
class tax_admin(ModelAdmin):
	fields = ['value', 'min_base', 'max_base']
	list_display = ('value', 'min_base', 'max_base')
#
class iCf_Tax_user(ModelAdmin):
	fields = ['value', 'min_base', 'max_base']
	list_display = ('value', 'min_base', 'max_base')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
	def get_actions(self, request):
		actions = super(iCf_Tax_user, self).get_actions(request)
		del actions['delete_selected']
		return actions
	def has_delete_permission(self, request):
		return False
	def has_add_permission(self, request):
		return False
	def __init__(self, *args, **kwargs):
		super(iCf_Tax_user, self).__init__(*args, **kwargs)
		self.list_display_links = (None,)
	# to hide change and add buttons on main page:
	def get_model_perms(self, request): 
		return {'view': True}
#
class iCf_Period_admin(MPTTModelAdmin):
	change_list_template = "django-mptt-admin/change_list.html"
	model = iCf_Period
	exclude = ['label']
	list_display = ('__unicode__', 'first_day', 'date_open', 'date_close')
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
	def save_model(self, request, obj, form, change):
		# To be deprecated:
		if form.is_valid():
			obj.label = obj.name
			obj.save()
#
class cooper_admin(ModelAdmin):
	form = cooper_admin_form
	model = 'iCf_Self_Employed'
	list_per_page = 600
	fields = ['user', 'coop_number', 'assigned_vat', 'Company', 'extra_days', 'advanced_tax']
	list_display = ('user','coopnumber', 'email', 'assigned_vat', 'Company', 'extra_days', 'advanced_tax', 'date_joined')
	list_display_links = ('user','coopnumber')
	search_fields = ['coop_number', 'user__username', 'user__first_name']
	list_filter = (First_Period_Filter, Closing_Filter )
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
		qs = iCf_Period.objects.filter(date_close__gt = (obj.user.date_joined  ) , first_day__lte = obj.user.date_joined  + timedelta(days=9) )
		if qs.count() > 0:
			return qs[0]
		return None
	first_period.short_description = _(u"Període inicial")
class icf_self_employed_companies_user(ModelAdmin):
	model = 'icf_self_employed_proxy_companies'
	fields = ['clients', 'providers']
	filter_horizontal = ('clients', 'providers')
	list_display = ('coop_number', 'cooper_clients', 'cooper_providers')
	list_display_links = ('coop_number',)

	def get_queryset(self, request):
		return iCf_Self_Employed.objects.filter(user=request.user)
	def cooper_clients(self, obj):
		return "\n".join([ p.__unicode__() + "<br>" for p in obj.clients.all()])
	cooper_clients.allow_tags = True
	cooper_clients.short_description = _(u"Els meus clients")
	def cooper_providers(self, obj):
		return "\n".join([ p.__unicode__() + "<br>" for p in obj.providers.all()])
	cooper_providers.allow_tags = True
	cooper_providers.short_description = _(u"Els meus proveïdors")
	def get_model_perms(self, request): 
		icf_self_employed = bot_cooper( request.user ).cooper( request )
		perms = {}
		if icf_self_employed:
			perms = {'direct_to_change_form':True, 
						'change_form_url': str(bot_cooper( request.user ).cooper().id) }
		return perms
class iCf_Self_Employed_companies_admin(icf_self_employed_companies_user):
	model = 'icf_self_employed_proxy_companies'
	fields = ['clients', 'providers']
	filter_horizontal = ('clients', 'providers')
	list_display = ('coop_number', 'cooper_clients', 'cooper_providers')
	list_display_links = ('coop_number',)

	def get_queryset(self, request):
		return iCf_Self_Employed.objects.filter(user=request.user)
	def cooper_clients(self, obj):
		return "\n".join([ p.__unicode__() + "<br>" for p in obj.clients.all()])
	cooper_clients.allow_tags = True
	cooper_clients.short_description = _(u"Els meus clients")
	def cooper_providers(self, obj):
		return "\n".join([ p.__unicode__() + "<br>" for p in obj.providers.all()])
	cooper_providers.allow_tags = True
	cooper_providers.short_description = _(u"Els meus proveïdors")
	def get_model_perms(self, request): 
		return {'direct_to_change_form':False }
#
class invoice_admin(AutoRecordName):
	list_filter = ('who_manage', 'period')
	model = iCf_Invoice
	def status(self, obj):
		return obj.status()
	status.short_description = _(u"Estat")
	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(invoice_admin, self).get_form(request, obj, **kwargs)
		ModelForm.request = request 
		return ModelForm
	def get_changelist_form(self, request, **kwargs):
		current_form = self.form
		current_form.request = request

		current_period = bot_period(request.user).period( True, request )
		if current_period and not hasattr(self, 'period'):
			current_form.period = current_period

		if hasattr(self.model, 'status'):
			current_form.status = self.model.status
		else:
			current_form.status = None

		current_cooper = bot_cooper(request.user).cooper(request)
		if current_cooper and not hasattr(self.model, 'icf_self_employed'):
			current_form.icf_self_employed  = current_cooper 

		kwargs['form'] = current_form
		return super(invoice_admin, self).get_changelist_form(request, **kwargs)
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if db_field.name == "client":
			if request.user.is_superuser:
				clients = Company.objects.all()
			else:
				clients = bot_cooper(request.user).clients()
			kwargs["queryset"] = clients

		if db_field.name == "period":
			if request.user.is_superuser:
				periods = iCf_Period_close.objects.all()
			else:
				periods = iCf_Period_close.objects.filter(rel_icfse_icf_period_close__user = request.user)
			kwargs["queryset"] = periods
		
		if db_field.name == "Company":
			if request.user.is_superuser:
				providers = Company.objects.all()
			else:
				providers = bot_cooper(request.user).providers()
			kwargs["queryset"] = providers
		return super(invoice_admin, self).formfield_for_foreignkey(db_field, request, **kwargs)
	class Media:
			js = (
				'invoice.js',   # app static folder
			)
#
class AutoRecordNameTabular(admin.TabularInline):
	def save_model(self, request, obj, form, change):
		instance = form.save(commit=False)
		if not hasattr(instance, 'name'):
			print ('AUTO NAME SAVE hasnot name!! '+str(obj))
		#if instance.name is None or instance.name == '':
		instance.name = instance.__unicode__()
		instance.save()
		form.save_m2m()
		return instance
#
class iCf_Sale_inline(AutoRecordNameTabular):
	iCf_Sale.lines.through.__unicode__ = lambda x: "" #delete ugly header ->> TODO, remove from template
	model = iCf_Sale.lines.through
	fields = ("value", "percent_invoiced_vat")
	extra = 1
	verbose_name=_(u'Línia de factura emesa')
	verbose_name_plural=_(u'Línies de factura emesa')
#
class iCf_Purchase_inline(AutoRecordNameTabular):
	iCf_Purchase.lines.through.__unicode__ = lambda x: "" #delete ugly header ->> TODO, remove from template
	model = iCf_Purchase.lines.through
	fields = ('value', 'percent_vat', 'percent_irpf')
	extra = 1
	verbose_name=_(u'Línia de factura despesa')
	verbose_name_plural=_(u'Línies de factura despesa')
#
class iCf_Sale_user (invoice_admin):
	form = sales_invoice_form
	model = iCf_Sale
	change_list_template = 'iCf_Sale/change_list.html'
	fields = ['client',] + ['period', 'num', 'date'] + ['unit', 'who_manage']
	list_display =  ('client',) + ('period', 'number', 'num', 'date', 'value') + ('invoiced_vat', 'assigned_vat', 'total', ) + ('who_manage', 'status', 'transfer_date')
	list_editable =  ('client',) + ('num', 'date') + ('who_manage',)
	list_export = ( 'clientName', 'clientCif') + ('period', 'number', 'num', 'date', 'value') + ('invoiced_vat', 'assigned_vat', 'total', ) + ('who_manage', 'status', 'transfer_date')
	inlines = [iCf_Sale_inline]
	actions = [export_as_csv_action("Exportar CSV", fields=list_export, header=True, force_fields=True),]
	list_display_links = ( 'number', )
	def clientName(self, obj):
		cli = obj.sale_invoices_clients
		if cli.name:
			return cli.name
		else:
			return cli
	clientName.short_description = _(u"Client")
	def clientCif(self, obj):
		cli = obj.sale_invoices_clients
		if cli.id_card_non_es:
			return cli.id_card_es
		else:
			return obj.client.id_card_non_es
	clientCif.short_description = _(u"Client (ID) ")
	def changelist_view(self, request, extra_context=None):
		response = super(iCf_Sale_user, self).changelist_view(request, extra_context)
		try:
			qs_queryset = response.context_data["cl"].get_queryset()
		except:
			qs_queryset = None
		if qs_queryset and extra_context is None:
			extra_context = {}

			bot = bot_sales_invoice( qs_queryset )
			extra_context['sales_base'] = Decimal ( "%.2f" % bot.sales_base )
			extra_context['sales_invoiced_vat'] = Decimal ( "%.2f" % bot.sales_invoiced_vat )
			extra_context['sales_assigned_vat'] = Decimal ( "%.2f" % bot.sales_assigned_vat )
			extra_context['sales_total'] = Decimal ( "%.2f" % bot.sales_total )
		#Filter by period
		return super(iCf_Sale_user, self).changelist_view(request, extra_context)
#
class sales_invoice_admin(iCf_Sale_user):
	fields = iCf_Sale_user.fields + ['status', 'transfer_date']
	list_display = ('rel_icfe_sales',) + iCf_Sale_user.list_display
	list_display_links = ( 'number', )
	list_editable = iCf_Sale_user.list_editable + ('transfer_date', )
	list_export = ('rel_icfe_sales',) + iCf_Sale_user.list_export 
	#list_filter = ('icf_self_employed','period', 'transfer_date')
	actions = iCf_Sale_user.actions + [export_all_as_csv_action(_(u"Exportar tots CSV"), fields=list_export, header=True, force_fields=True),]
#
class iCf_Purchase_user (invoice_admin):
	form = purchases_invoice_form
	model = iCf_Purchase
	change_list_template = 'iCf_Purchase/change_list.html'
	fields = ['provider',] + ['period', 'num', 'date'] + ['unit','who_manage', 'expiring_date']
	list_display =  ('provider',) + ('period', 'number', 'num', 'date', 'value') + ('vat', 'irpf', 'total') + ('who_manage', 'status', 'expiring_date', 'transfer_date')
	list_editable =  ('provider',) + ('num', 'date') + ('who_manage', 'expiring_date')
	list_export = ( 'providerName', 'providerCif') + ('period', 'number', 'num', 'date', 'value') + ('vat', 'irpf', 'total') + ('who_manage', 'status', 'expiring_date', 'transfer_date')
	inlines = [iCf_Purchase_inline]
	actions = [export_as_csv_action("Exportar CSV", fields=list_export, header=True, force_fields=True),]
	list_display_links = ( 'number', )
	list_per_page = 1000
	def providerName(self, obj):
		return obj.provider.name
	providerName.short_description = _(u"provider")
	def providerCif(self, obj):
		if obj.provider.CIF:
			return obj.provider.CIF
		else:
			return obj.provider.otherCIF
	providerCif.short_description = _(u"provider (ID) ")
	def changelist_view(self, request, extra_context=None):
		#Get totals
		response = super(iCf_Purchase_user, self).changelist_view(request, extra_context)
		try:
			qs_queryset = response.context_data["cl"].get_queryset()
		except:
			qs_queryset = None
		if qs_queryset and extra_context is None:
			extra_context = {}

			bot = bot_purchases_invoice( qs_queryset )
			extra_context['purchases_base'] = Decimal ( "%.2f" % bot.purchases_base )
			extra_context['purchases_vat'] = Decimal ( "%.2f" % bot.purchases_vat )
			extra_context['purchases_irpf'] = Decimal ( "%.2f" % bot.purchases_irpf )
			extra_context['purchases_total'] = Decimal ( "%.2f" % bot.purchases_total )

		#Filter by period
		#from Finances.bots import bot_filters
		#return bot_filters.filterbydefault(request, self, iCf_Purchase_user, extra_context)
		#
		return super(iCf_Purchase_user, self).changelist_view(request, extra_context)
#
class purchases_invoice_admin (iCf_Purchase_user):
	fields = iCf_Purchase_user.fields + ['status', 'transfer_date']
	list_display = ('icf_self_employed',) + iCf_Purchase_user.list_display
	list_editable = iCf_Purchase_user.list_editable + ('transfer_date',)
	list_export = ('icf_self_employed',) + iCf_Purchase_user.list_export
	#TODO list_filter = ('rel_icfe_purchases__icf_self_employed_periods_closed','period',)
	list_filter = ('period',)
	actions = iCf_Purchase_user.actions + [export_all_as_csv_action(_(u"Exportar tots CSV"), fields=list_export, header=True, force_fields=True),]
#
class period_payment_inline(admin.TabularInline):
	model = period_payment
	form = period_payment_inline_form
#
# PERIOD CLOSE ********************************************************
#
class iCf_Period_close_user(ModelAdmin):
	model = iCf_Period_close
	change_form_template = 'iCf_Period_close/change_form.html'
	form = period_close_form
	#inlines = [period_payment_inline]
	list_display = ('edit_link', 'print_link') + period_close_base_fields
	list_export = period_close_base_fields
	fieldsets = (
		(_(u'Període'), {'fields': ('record_type',) }),
		(_('Emeses'), {'fields': (('sales_base', 'sales_invoiced_vat'), ('sales_total', 'sales_assigned_vat'))}),
		(_('Despeses'), {'fields': (('purchases_base', 'purchases_vat'), ('purchases_total', 'purchases_irpf'))}),
		(_('Seleccio IVA'), { 'fields': (('oficial_vat_total', 'assigned_vat_total'), 'vat_type') }),
		(_('Estalvi'), {'fields': ('savings_with_assigned_vat', 'savings_with_assigned_vat_donation')}),
		(_('Aportacio a la CIC'), {'fields': ('donation',)}),
		(_('Total impostos'), {'fields': (('total_vat', 'total_irpf'),)}),
		(_('Quota Trimestral'), {'fields': ('period_tax', 'advanced_tax' )}),
		(_('Totals'), {'fields': ('total', 'total_to_pay', 'total_balance', 'total_acumulated')}),
		(_('Tancar'), {'fields': ('closed',)}),
	)
	actions = [export_as_csv_action("Exportar CSV", fields=list_export, header=True, force_fields=True),]
	ordering = ['record_type__icf_period__first_day']
	def savings_with_assigned_vat(self, obj):
		return obj.savings_with_assigned_vat()
	savings_with_assigned_vat.decimal = True
	savings_with_assigned_vat.short_description = _(u'IVA Facturat - Assignat (€)')
	def oficial_vat_total(self, obj):

		return obj.oficial_vat_total()
	oficial_vat_total.decimal = True
	oficial_vat_total.short_description = _(u'IVA Facturat - Despeses (€)')
	def assigned_vat_total(self, obj):

		return obj.assigned_vat_total()
	assigned_vat_total.decimal = True
	assigned_vat_total.short_description = _(u'IVA Assignat - Despeses (€)')
	def total_vat(self, obj):
		return obj.total_vat()
	def total_irpf(self, obj):

		return obj.total_irpf()
	def save_model(self, request, obj, form, change):

		#As we disable cooper and periods controls, we loaded their values in get_form so reload
		if obj.period is None:
			obj.period = form.period
			obj.icf_self_employed = form.icf_self_employed
		obj.save()

		if obj.closed and obj.advanced_tax > 0:
			c = iCf_Self_Employed.objects.get(pk=obj.icf_self_employed.id)
			c.advanced_tax = 0
			c.save()

		form.save_m2m()

		if obj.closed:
			from Finances.bots import bot_period_payment
			bot_period_payment(obj).create_sales_movements_for_period()
	def edit_link(self, obj):
		if obj is None:
			can_edit = False
		else:
			can_edit = self.exists_opened_period( obj.rel_icfse_icf_period_close.all().first().user ) and self.exists_closed_period( obj.rel_icfse_icf_period_close.all().first().user ) and not self.exists_closed_period_done ( obj )
		if can_edit:
			try:
				return u'<a href="/cooper/%s/%s/%s">%s</a>' % (obj._meta.app_label, obj._meta.model_name, obj.id, obj.period)
			except:
				return u'<a href="/cooper/%s/%s/%s">%s</a>' % (obj._meta.app_label, obj._meta.model_name, obj.id, obj.__unicode__(short_description = True))
		else:
			return obj.period
	edit_link.allow_tags = True
	edit_link.short_description = _(u"Període")
	def print_link(self, obj):

		if obj is None:
			can_print = False
		else:
			can_print = self.exists_closed_period_done ( obj )
		if can_print:
			try:
				return u'<a href="/invoices/print/%s">%s</a>' % ( obj.id, obj.period())
			except:
				return u'<a href="/invoices/print/%s">%s</a>' % ( obj.id, obj.period().encode("utf-8"))
		else:
			return (u"-")
	print_link.allow_tags = True
	print_link.short_description = _(u"PDF")
	def exists_opened_period(self, user):

		return bot_period(user).period(False) is not None
	def exists_closed_period(self, user):

		current_period = bot_period(user).period(False)
		current_cooper = bot_cooper(user).cooper(False)
		if current_period is not None:
			return self.model.objects.filter(record_type=current_period).count()>0
		return False
	def exists_closed_period_done(self, pc):

		return iCf_Period_close.objects.get(pk=pc.id).closed
	def has_add_permission(self, request):
		return True
		if request.user.is_superuser:
			 return True
		return self.exists_opened_period( request.user ) and not self.exists_closed_period( request.user )
	def has_change_permission(self, request, obj=None):
		return True
		if request.user.is_superuser:
			return True
		if obj is None:
			return True
		else:
			return self.exists_opened_period( obj.icf_self_employed.user ) and self.exists_closed_period( obj.icf_self_employed.user ) and not self.exists_closed_period_done ( obj )
	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(iCf_Period_close_user, self).get_form(request, obj, **kwargs)
		ModelForm.is_new = obj is None
		ModelForm.request = request
		if obj:
			ModelForm.obj = obj
		ModelForm.current_fields = self.list_export
		if obj is not None:
			ModelForm.period = obj.period
			ModelForm.cooper = obj.cooper
			#bot_period_close( obj.period, obj.cooper, obj).set_period_close_form_readonly(ModelForm)
		return ModelForm

	class Media:
			js = (
				'iCf_Period_close/iCf_Period_close.js',   # app static folder
			)

class iCf_Period_close_admin (iCf_Period_close_user):
	change_list_template = 'iCf_Period_close/change_list_admin.html'
	list_display = ('cooper', ) + iCf_Period_close_user.list_display
	list_export = ('cooper',) + iCf_Period_close_user.list_export
	list_per_page = 1000
	actions = iCf_Period_close_user.actions + [export_all_as_csv_action(_(u"Exportar tots CSV"), fields=list_export, header=True, force_fields=True),]
	def edit_link(self, obj):
		if obj is None:
			can_edit = False
		else:
			can_edit = True
		if can_edit:
			try:
				return u'<a href="/admin/%s/%s/%s">%s</a>' % (obj._meta.app_label, obj._meta.model_name, obj.id, obj.period)
			except:
				return u'<a href="/admin/%s/%s/%s">%s</a>' % (obj._meta.app_label, obj._meta.model_name, obj.id, obj.__unicode__(short_description = True))
		else:
			return obj.period
	edit_link.allow_tags = True
	edit_link.short_description = _(u"Període")
	search_fields = ['coop_number', 'user__username', 'user__first_name']
	list_filter = ('record_type',  First_Period_Filter, Closing_Filter )
	def get_queryset(self, request):
		return iCf_Period_close.objects.all()
	def changelist_view(self, request, extra_context=None):
		#Get totals
		response = super(iCf_Period_close_admin, self).changelist_view(request, extra_context)
		try:
			qs_queryset = response.context_data["cl"].query_set
		except:
			qs_queryset = None

		if qs_queryset and extra_context is None:
			totals = {}
			numeric_fields = ('sales_base', 'sales_invoiced_vat', 'sales_assigned_vat', 'sales_total', 
							'purchases_base', 'purchases_vat', 'purchases_irpf', 'purchases_total',
							'oficial_vat_total', 'assigned_vat_total', 'savings_with_assigned_vat', 'savings_with_assigned_vat_donation',
							'total_vat', 'total_irpf','period_tax', 'advanced_tax','donation', 'total', 'total_to_pay')
			#init
			for field in numeric_fields:
					totals[field] = Decimal ( "0.00" )

			for period_closed in qs_queryset:
				#load values
				for field in numeric_fields:
					try:
						#print command will rise exception, so don't remove!!!
						print (Decimal ( "%.2f" % bot_object( field, period_closed ).value() ))
						totals[field] = Decimal ( "%.2f" % bot_object( field, period_closed ).value() )
					except:
						try:
							totals[field] = bot_object( field, period_closed ).value()()
						except:
							totals[field] = 0

			#send to template
			extra_context = {}
			for field in numeric_fields:
				extra_context[field] = totals[field]

		#Filter by period
		from Finances.bots import bot_filters
		return response #bot_filters.filterbydefault(request, self, iCf_Period_close_user, extra_context)
#

# *********************************************************************
#
class balance_line_inline(admin.TabularInline):
	model = iCf_Invoice
	fields = ['status', 'date', 'transfer_date']
	extra = 0
	def status(self, obj):
		return obj.status()
	def total(self, obj):
		return obj.total()
	def get_queryset(self, request):
		current_period = bot_period(request.user).period()
		if current_period:
			return self.model.objects.filter(
					who_manage=manage_CHOICE_COOP).exclude(
					date__lte=current_period.first_day,
					transfer_date__isnull=True)
		else:
			return self.model.objects.filter(who_manage=manage_CHOICE_COOP)
	def has_delete_permission(self, request, obj=None):
		return request.user.is_superuser
	def has_add_permission(self, request, obj=None):
		return False
#
class sales_invoice_inline_balance(balance_line_inline):
	model = iCf_Sale
	fk_name= "icf_self_employed"
	form = invoice_form_balance
	fields = ['client', 'total'] + balance_line_inline.fields
	def get_readonly_fields(self, request, obj=None):
		if request.user.is_superuser:
			return ()
		else:
			return balance_line_inline.readonly_fields + ( 'client',) + ( 'date',  'total', 'transfer_date', )
class purchases_invoice_inline_balance(balance_line_inline):
	model = iCf_Purchase
	form = invoice_form_balance
	fields = ['provider', 'total', 'status', 'expiring_date', 'transfer_date']
	def get_readonly_fields(self, request, obj=None):
		if request.user.is_superuser:
			return ()
		else:
			#if self.instance.transfer_date is not None:
			#	rfields = balance_line_inline.readonly_fields + ( 'expiring_date', )
			return ( 'provider', ) + ( 'date',  'total', 'transfer_date', )
#
class sales_movement_inline(admin.TabularInline):
	form = movement_form_balance
	model = iCf_Sale_movement
	fields = ['value', 'concept', 'planned_date', 'execution_date', 'status', 'currency']
	list_filter = ('status', 'currency')
	extra = 0
	def has_delete_permission(self, request, obj=None):
		return request.user.is_superuser
	def get_readonly_fields(self, request, obj=None):
		if request.user.is_superuser:
			return self.readonly_fields
		else:
			#if self.instance.transfer_date is not None:
			#	rfields = balance_line_inline.readonly_fields + ( 'expiring_date', )
			return ( 'execution_date', )
class purchases_movement_inline(admin.TabularInline):
	model = iCf_Purchase_movement
	form = movement_form_balance
	fields = [ 'value', 'concept', 'petition_date', 'acceptation_date', 'execution_date', 'status', 'currency']
	extra = 0
	def has_delete_permission(self, request, obj=None):
		return request.user.is_superuser
	def get_readonly_fields(self, request, obj=None):
		if request.user.is_superuser:
			return self.readonly_fields
		else:
			#if self.instance.transfer_date is not None:
			#	rfields = balance_line_inline.readonly_fields + ( 'expiring_date', )
			return ( 'acceptation_date', 'execution_date', )
#
class icf_self_employed_user_balance(ModelAdmin):
	model = iCf_Period_close
	list_per_page = 600
	fields = ['coop_number']
	readonly_fields = ['coop_number']
	list_display = ('coop_number', 'balance', 'balance_euro', 'balance_eco', 'balance_btc')
	list_display_links = ('coop_number', )
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
	inlines = [sales_invoice_inline_balance, purchases_invoice_inline_balance, sales_movement_inline, purchases_movement_inline]
	def has_add_permission(self, request, obj=None):
		return False
	def get_actions(self, request):
		actions = super(icf_self_employed_user_balance, self).get_actions(request)
		del actions['delete_selected']
		return actions

	def has_delete_permission(self, request, obj=None):
		return False

	def balance_euro(self, obj):
		current_period = bot_period(obj.user).period()
		bot = bot_balance(current_period, obj)
		euro = Unit.objects.get(name="Euro")
		return bot.total_previous() + bot.total(euro)
	balance_euro.short_description = _(u"Balanç EURO")

	def balance_btc(self, obj):
		current_period = bot_period(obj.user).period()
		bot = bot_balance(current_period, obj)
		fair = Unit.objects.get(name="FairCoin")
		return bot.total_previous(fair) + bot.total(fair)
	balance_btc.short_description = _(u"Balanç BTC")

	def balance_eco(self, obj):
		current_period = bot_period(obj.user).period()
		bot = bot_balance(current_period, obj)
		eco = Unit.objects.get(code="eco") 
		return bot.total_previous(eco) + bot.total(eco)
	balance_eco.short_description = _(u"Balanç ECOS")
	def balance(self, obj):
		current_period = bot_period(obj.user).period()
		bot = bot_balance(current_period, obj)
		return bot.total_previous() + bot.total()
	balance.short_description = _(u"Balanç saldo")

	def get_form(self, request, obj=None, **kwargs):
		ModelForm = super(icf_self_employed_user_balance, self).get_form(request, obj, **kwargs)
		ModelForm.request = request 
		ModelForm.balance_euro = Decimal ( "%.2f" % self.balance_euro( obj ) )
		ModelForm.balance_btc = Decimal ( "%.2f" % self.balance_btc( obj ) )
		ModelForm.balance_eco = Decimal ( "%.2f" % self.balance_eco( obj ) )
		ModelForm.balance = Decimal ( "%.2f" % self.balance( obj ) )
		return ModelForm

	def get_model_perms(self, request): 
		if request.user.is_superuser:
			return {'historial':True, 
				'canAdd': False,
				'canEdit': True }
		else:
			icf_self_employed = bot_cooper( request.user ).cooper( request )
			perms = {}
			if icf_self_employed:
				perms = {'direct_to_change_form':True, 
						'change_form_url': str(icf_self_employed.id) }
			return perms

#
class cooper_admin_transaction( icf_self_employed_user_balance):
	model = 'icf_self_employed_proxy_transactions'

# Moviments *****************************************************************************
#
class movements_admin(ModelAdmin):
	form = movement_form_balance
	#list_filter = ('icf_self_employed', 'currency',)
	list_editable = ('execution_date', 'currency')
	def status(self, obj):
		return movement_STATUSES[obj.status()][1]
	status.short_description = (u"Estat")
class sales_movements_admin(movements_admin):
	model = iCf_Sale_movement
	fields = ['icf_self_employed', 'value', 'concept', 'planned_date', 'execution_date', 'status', 'currency']
	list_display = ('icf_self_employed', 'value', 'concept', 'planned_date', 'execution_date', 'status', 'currency')
#
class purchases_movements_admin(movements_admin):
	model = iCf_Purchase_movement
	fields = ['icf_self_employed', 'value', 'concept', 'petition_date', 'execution_date', 'status', 'currency']
	list_display = ('icf_self_employed', 'value', 'concept', 'petition_date', 'execution_date', 'status', 'currency')
#
# *******************************************************************************************

# Development & superuser 
admin.site.register(iCf_Type, DjangoMpttAdmin)
admin.site.register(iCf_Record_Type, MPTTModelAdmin)
admin.site.register(iCf_Record, ModelAdmin)
#
# Master
admin.site.register(iCf_Tax, tax_admin)
admin.site.register(iCf_Duty)
admin.site.register(iCf_Period, iCf_Period_admin)
admin.site.register(iCf_Period_close, iCf_Period_close_admin)
#
user_admin_site.register(icf_self_employed_proxy_companies, icf_self_employed_companies_user)
#
user_admin_site.register(iCf_Tax, iCf_Tax_user)
#
user_admin_site.register(iCf_Sale, iCf_Sale_user)
user_admin_site.register(iCf_Sale_line)
user_admin_site.register(iCf_Purchase, iCf_Purchase_user)
user_admin_site.register(iCf_Purchase_line)
#
user_admin_site.register(iCf_Period_close, iCf_Period_close_user)
user_admin_site.register(icf_self_employed_proxy_balance)
#
# Invoicing system
# user_admin_site.register(iCf_Tax, iCf_Tax_user)
#admin.site.register(icf_self_employed_proxy_transactions, cooper_admin_transaction)
#
# admin.site.register(iCf_Period_close, iCf_Period_close_admin)
# admin.site.register(iCf_Self_Employed, cooper_admin)
# admin.site.register(iCf_Purchase_movement, purchases_movements_admin)
# admin.site.register(iCf_Sale_movement, sales_movements_admin)
# admin.site.register(iCf_Purchase, purchases_invoice_admin)

# admin.site.register(iCf_Sale, sales_invoice_admin)
