#encoding=utf-8
from django.core.exceptions import ObjectDoesNotExist
from django.db import models
from django.contrib.admin import ModelAdmin
from decimal import Decimal
from datetime import date, timedelta, datetime
from django.utils.translation import ugettext_lazy as _

class bot_sales_invoice ( object ):
	def __init__( self, queryset ):
		self.sales_base = Decimal ("0.00")
		self.sales_invoiced_vat = Decimal ("0.00")
		self.sales_assigned_vat = Decimal ("0.00")
		self.sales_total = Decimal ("0.00")
		for item in queryset.all():
			self.sales_base += item.value()
			self.sales_invoiced_vat += item.invoiced_vat()
			self.sales_assigned_vat += item.assigned_vat()
			self.sales_total += item.total()

class bot_purchases_invoice ( object ):
	def __init__( self, queryset ):
		self.purchases_base = Decimal ("0.00")
		self.purchases_vat = Decimal ("0.00")
		self.purchases_irpf = Decimal ("0.00")
		self.purchases_total = Decimal ("0.00")
		for item in queryset.all():
			self.purchases_base += item.value()
			self.purchases_vat += item.vat()
			self.purchases_irpf += item.irpf()
			self.purchases_total += item.total()

from Finances.models import iCf_Self_Employed, Company, Company
class bot_cooper( object ):
	def __init__(self, user):
		self.user = user
	def cooper(self, request=None):
		c = None
		try:
			c = iCf_Self_Employed.objects.get(user__id=self.user.id)
		except (KeyError, iCf_Self_Employed.DoesNotExist):
			if request:
				from django.contrib import messages
				if not request.user.is_superuser:
					messages.error(request, 'El teu usuari ha sigut creat però el teu perfil de soci encara no està creat.')
				return iCf_Self_Employed.objects.filter(id=-1)
		else:
			return c
	def clients(self):
		try:
			return self.cooper().clients.select_related()
		except:
			return Company.objects.filter(id=-1)
	def providers(self):
		try:
			return self.cooper().providers.select_related()
		except:
			return Company.objects.filter(id=-1)
class bot_icf_self_employed( bot_cooper ):
	def __init__(self, num_ces):
		self.num_ces = num_ces
		from Finances.models import iCf_Self_Employed
		try:
			self.user = iCf_Self_Employed.objects.get(ic_membership__ic_CESnum = num_ces).user
		except ObjectDoesNotExist:
			self.user = None


from Finances.models import iCf_Period
class bot_period( object ):
	def __init__(self, user=None):
		self.user = user
	def period(self, notify=True, request=None):
		qs_opened_periods = self.get_opened_periods ( self.user )
		if qs_opened_periods.count() > 1:
			Error =  _(u"Error, there are more than one opened period. Please correct dates")
		elif qs_opened_periods.count() == 0:
			Error = _(u'No existeix cap trimestre obert, no es pot continuar amb aquesta operació.')
		else:
			return qs_opened_periods[0]
		if notify and Error is not None :
			from django.contrib import messages
			if request:
				if not request.user.is_superuser:
					messages.error(request, Error)
		return None

	@staticmethod
	def get_opened_periods(user):
		#Get extradays that this user has to close
		from Finances.models import iCf_Self_Employed, iCf_Period
		try:
			nExtraDays = 0 if user.is_superuser else iCf_Self_Employed.objects.get(user=user).extra_days 
		except:
			nExtraDays = 0

		#Return queryset
		return 	iCf_Period.objects.filter( 
				first_day__lte=datetime.now(), 
				date_close__gte=datetime.now() - timedelta(days=nExtraDays) 
				)
	@staticmethod
	def get_opened_periods_list(user):
		bot_
		#Get extradays that this user has to close
		from Finances.models import iCf_Self_Employed, iCf_Period
		try:
			nExtraDays = 0 if user.is_superuser else iCf_Self_Employed.objects.get(user=user).extra_days 
		except:
			nExtraDays = 0

		#Return queryset
		return 	iCf_Period.objects.filter( 
				first_day__lte=datetime.now(), 
				date_close__gte=datetime.now() - timedelta(days=nExtraDays) 
				)
class bot_assigned_vat(object):
	def __init__(self, current_cooper, percent_invoiced_vat):
		if current_cooper:
			self.assigned_vat = current_cooper.assigned_vat
		else:
			self.assigned_vat = 0

		self.oficial_vat = percent_invoiced_vat.value
	def assigned_vat(self):
		if self.oficial_vat == 0:
			return 0
		elif self.assigned_vat >= 8:
			if self.oficial_vat == 21:
				return self.assigned_vat
			elif self.oficial_vat == 10:
				return 8
			elif self.oficial_vat == 4:
				return 4
		elif self.assigned_vat >= 4:
			if self.oficial_vat == 21:
				return self.assigned_vat
			elif self.oficial_vat == 10:
				return self.assigned_vat
			elif self.oficial_vat == 4:
				return 4
		else:
			return self.assigned_vat

class bot_period_tax(object):
	def __init__(self, base):
		from Finances.models import tax
		try:
			tax = tax.objects.filter(min_base__lte=base, max_base__gte=base)[0].value
		except:
			tax = -1
		self.tax = tax

class bot_object(object):
	def __init__(self, field, obj):
		self.field = field
		self.obj = obj
	def value(self):
		field = self.field
		obj = self.obj
		value = None
		try:
			value = getattr(obj,field)
		except:
			try:
				value = getattr(obj, field)(obj)
			except:
				try:
					value = getattr(obj, field)()
				except:
					value = "Sin Valor"
		return value
	@staticmethod
	def get_value_or_zero(value):
		return 0 if value is None else value

class bot_period_close( object ):
	def __init__(self, period, cooper, obj = None, recalculate=True):
		self.cooper = cooper
		self.period = period
		if cooper and period:
			self.period_close = self.load_period_close( obj, recalculate )
	def load_period_close(self, obj=None, recalculate = False):
		from Finances.models import iCf_Period_close
		if obj is None:
			pc = iCf_Period_close(self.period, self.cooper)
			pc.period = self.period
			pc.cooper = self.cooper
			pc.advanced_tax = self.cooper.advanced_tax
		else:
			pc = obj

		if recalculate:
			from bots import bot_sales_invoice
			from Finances.models import iCf_Sale, iCf_Purchase, tax
			bot = bot_sales_invoice( 
				iCf_Sale.objects.filter(
					period=self.period, 
					cooper=self.cooper )
				)
			pc.sales_base = bot.sales_base
			pc.sales_invoiced_vat = bot.sales_invoiced_vat
			pc.sales_assigned_vat = bot.sales_assigned_vat
			pc.sales_total = bot.sales_total

			from bots import bot_purchases_invoice
			bot = bot_purchases_invoice( 
				iCf_Purchase.objects.filter(
					period=self.period, 
					cooper=self.cooper) 
				)
			pc.purchases_base = bot.purchases_base 
			pc.purchases_vat = bot.purchases_vat
			pc.purchases_irpf = bot.purchases_irpf
			pc.purchases_total = bot.purchases_total
			#QUOTA
			pc.period_tax = bot_period_tax (pc.sales_base).tax
			pc.advanced_tax = self.cooper.advanced_tax
		return pc

	def load_period_close_form(self, form, fields, initial = True ):
		for field in fields:
			if str(field) =="period":
				value = self.period 
			elif str(field) == "cooper":
				value = self.cooper.id
			else:
				value = bot_object( field, self.period_close ).value()

			if initial:
				form.initial[field] = value
			else:
				form.base_fields[field].initial = value

	def set_period_close_form_readonly(self, form_array):
		form_array.base_fields['period'].widget.attrs['disabled'] = True
		form_array.base_fields['cooper'].widget.attrs['disabled'] = True
		form_array.base_fields['sales_base'].widget.attrs['readonly'] = True
		form_array.base_fields['sales_invoiced_vat'].widget.attrs['readonly'] = True
		form_array.base_fields['sales_assigned_vat'].widget.attrs['readonly'] = True
		form_array.base_fields['sales_total'].widget.attrs['readonly'] = True
		form_array.base_fields['purchases_base'].widget.attrs['readonly'] = True
		form_array.base_fields['purchases_vat'].widget.attrs['readonly'] = True
		form_array.base_fields['purchases_irpf'].widget.attrs['readonly'] = True
		form_array.base_fields['purchases_total'].widget.attrs['readonly'] = True
		form_array.base_fields['oficial_vat_total'].widget.attrs['readonly'] = True
		form_array.base_fields['assigned_vat_total'].widget.attrs['readonly'] = True
		form_array.base_fields['period_tax'].widget.attrs['readonly'] = True
		form_array.base_fields['advanced_tax'].widget.attrs['readonly'] = True
		form_array.base_fields['total'].widget.attrs['readonly'] = True
		form_array.base_fields['total_to_pay'].widget.attrs['readonly'] = True

class bot_filters(object):
	@staticmethod
	def filterbydefault(request, instance, entity, extra_context):
		referer = request.META.get('HTTP_REFERER', '')
		showall = request.META['PATH_INFO'] in referer and not request.GET.has_key('timeframe')
		if not showall and not request.GET.has_key('period__id__exact'):
			current_period= bot_period(request.user).period(False)
			if current_period:
				q = request.GET.copy()
				q['period__id__exact'] = current_period.id
				request.GET = q
				request.META['QUERY_STRING'] = request.GET.urlencode()
				from django.http import HttpResponseRedirect
				return HttpResponseRedirect( request.path + "?" + request.GET.urlencode() )
		return super(entity,instance).changelist_view(request, extra_context=extra_context)

class bot_currency(object):
	def __init__(self, currency):
		self.currency = currency
	def get_change(self, value):
		return (u"%s raó de canvi: Pendiente { moneda: [%s] moneda: [%s] moneda: [%s]}") % (value, value, value, value)

from Finances.models import period_payment, iCf_Sale_movement, status_CHOICE_PENDING, manage_CHOICE_COOPER
from datetime import date
class bot_period_payment(object):
	def __init__(self, period_close):
		self.period_close = period_close
	def create_sales_movements_for_period(self):
		current_payments = period_payment.objects.filter( period_close = self.period_close )
		for payment in current_payments:
			new_sales_movement = iCf_Sale_movement( 
							cooper = self.period_close.cooper,
							concept = self.period_close.period.label,
							value = payment.value,
							currency = payment.currency,
							planned_date = date.today()
							)
			new_sales_movement.save()

from django.db.models import Sum
from Finances.models import iCf_Period_close, iCf_Sale, iCf_Purchase,  iCf_Sale_movement, iCf_Purchase_movement

DEFAULT_CURRENCY = "EURO"
class bot_balance(object):
	def __init__(self, period, cooper):
		self.period = period
		self.cooper = cooper
	def total(self, currency = None ):
		sales_invoice_total = 0
		purchases_invoice_total = 0

		if currency is None:
			sales_invoice_total = 0 # iCf_Period_close.objects.filter(period=self.period).filter(cooper=self.cooper.pk).aggregate(Sum('sales_base'))["sales_base__sum"]
			purchases_invoice_total = 0 #iCf_Period_close.objects.filter(period=self.period).filter(cooper=self.cooper.pk).aggregate(Sum('purchases_base'))["purchases_base__sum"]
			sales_movement_total = 0# iCf_Sale_movement.objects.filter(cooper=self.cooper.pk).filter( planned_date__gte=self.period.first_day).aggregate(Sum('value'))["value__sum"]
			purchase_movement_total = 0# iCf_Purchase_movement.objects.filter(cooper=self.cooper.pk).filter( petition_date__gte=self.period.first_day).aggregate(Sum('value'))["value__sum"]
		else:
			sales_movement_total = 0 #iCf_Sale_movement.objects.filter(cooper=self.cooper.pk).filter( planned_date__gte=self.period.first_day, currency = currency, execution_date__isnull = False).aggregate(Sum('value'))["value__sum"]
			purchase_movement_total =0 # iCf_Purchase_movement.objects.filter(cooper=self.cooper.pk).filter( petition_date__gte=self.period.first_day, currency = currency,execution_date__isnull = False).aggregate(Sum('value'))["value__sum"]
		sales_movement_total = 0 # bot_object.get_value_or_zero(sales_movement_total)
		sales_invoice_total = 0 # bot_object.get_value_or_zero(sales_invoice_total)
		purchases_invoice_total = 0 # bot_object.get_value_or_zero(purchases_invoice_total)
		purchase_movement_total = 0# bot_object.get_value_or_zero(purchase_movement_total)
		return sales_invoice_total - purchases_invoice_total + sales_movement_total - purchase_movement_total
	def total_previous(self, currency = None):
		sales_invoice_total = 0 #self.cooper.icf_periods_closed.exclude(record_type=self.period).aggregate(Sum('sales_base'))["sales_base__sum"]
		purchases_invoice_total = 0 #self.cooper.icf_periods_closed.exclude(record_type=self.period).aggregate(Sum('purchases_base'))["purchases_base__sum"]
		#iCf_Purchase.objects.filter(cooper=self.cooper.pk).exclude(period=self.period).purchases_base

		sales_movement_total = 0#iCf_Sale_movement.objects.filter(cooper=self.cooper.pk).filter( planned_date__lte=self.period.first_day, execution_date__isnull = False).aggregate(Sum('value'))["value__sum"]
		purchase_movement_total = 0#iCf_Purchase_movement.objects.filter(cooper=self.cooper.pk).filter( petition_date__lte=self.period.first_day, execution_date__isnull = False).aggregate(Sum('value'))["value__sum"]

		sales_movement_total = bot_object.get_value_or_zero(sales_movement_total)
		sales_invoice_total = bot_object.get_value_or_zero(sales_invoice_total)
		purchases_invoice_total = bot_object.get_value_or_zero(purchases_invoice_total)
		purchase_movement_total = bot_object.get_value_or_zero(purchase_movement_total)

		return sales_invoice_total - purchases_invoice_total + sales_movement_total - purchase_movement_total
'''
class bot_period_closer( object ):
	def __init__( self, user, period ):
		self.user = user
		self.period = period
		self.load()

	def load ( self ):
		self.load_bbdd_period_close()
		self.load_self_period_close ()
		self.check_integrity()

	def check_integrity ( self ):
		if self.bbdd_period_close.id is None:
			pc.status = "No created"
			print pc.status
		else:
			self_period = pc._meta
			bbdd_period = self.bbdd_period_close._meta

			for field in self_period.fields:
				if field.name not in( "id", "Savings_donation", "donation_eco", "closed", "CESnumber", "VAT_type" ):
					if getattr(pc, field.name) != getattr(self.bbdd_period_close, field.name):
						print field.name
						print "--" + str( getattr(pc, field.name) )
						print "--" + str( getattr(self.bbdd_period_close, field.name) )

	def load_bbdd_period_close ( self ):
		ob = PeriodClose.objects.filter(user=self.user, period = self.period)
		self.bbdd_period_close = PeriodClose(period=self.period, user=self.user)
		for period in ob:
			self.bbdd_period_close = period

	def load_self_period_close ( self ):
		pc = PeriodClose(period=self.period, user=self.user)
		#SALES
		from Finances.models import SalesInvoice
		self.sales = SalesInvoice.objects.filter(period=self.period, user=self.user)
		from decimal import Decimal
		sales_total = sales_invoicedVAT = sales_assignedVAT = sales_totalVAT = Decimal('0.00')
		for item in self.sales.all():
			sales_total += item.value
			sales_invoicedVAT += item.invoicedVAT()
			sales_assignedVAT += item.assignedVAT()
			sales_totalVAT += item.total()
		pc.Sales_total =self. sales_total )
		pc.Sales_invoicedVAT =self. sales_invoicedVAT )
		pc.Sales_assignedVAT =self. sales_assignedVAT )
		pc.Sales_totalVAT =self. sales_totalVAT )

		#PURCHASES
		from Finances.models import PurchaseInvoice
		self.purchases = PurchaseInvoice.objects.filter(period=self.period, user=self.user)
		purchases_total = purchases_vat = purchases_irpf = purchases_totalVAT = Decimal('0.00')
		for item in self.purchases.all():
			purchases_total += item.value
			purchases_vat += item.vat()
			purchases_irpf += item.irpf()
			purchases_totalVAT += item.total()

		pc.Purchases_total =self. purchases_total )
		pc.Purchases_vat =self. purchases_vat )
		pc.Purchases_irpf =self. purchases_irpf )
		pc.Purchases_totalVAT =self. purchases_totalVAT )

		#VATS
		totalVAT1 =self. (sales_invoicedVAT - purchases_vat) )
		totalVAT1 = totalVAT1 if totalVAT1 > 0 else 0
		pc.VAT_1 =  totalVAT1

		totalVAT2 =self. (sales_assignedVAT - purchases_vat) )
		totalVAT1 = totalVAT2 if totalVAT2 > 0 else 0
		pc.VAT_2 =  totalVAT2

		if self.bbdd_period_close is not None:
			pc.VAT_type = self.bbdd_period_close.VAT_type
		else:
			pc.VAT_type = 1

		#TAX
		from Finances.models import periodTaxes
		self.taxes = periodTaxes.objects.filter(min_base__lte=sales_total, max_base__gte=sales_total)
		value = Decimal('0.00')
		if self.taxes.count() == 1:
			value =self. self.taxes[0].value ) 
		else:
			value = 'Consultar'
		pc.periodTAX = value
		from Finances.models import Soci
		self.cooper = Soci.objects.get(user=self.user)

		if self.bbdd_period_close.id is not None:
			pc.preTAX = self.bbdd_period_close.preTAX
		else:
			pc.preTAX = 0

		if self.bbdd_period_close.id is not None:
			pc.periodTAXeuro = self.bbdd_period_close.periodTAXeuro
		else:
			pc.periodTAXeuro = 0
			
		if self.bbdd_period_close.id is not None:
			pc.donation_euro = self.bbdd_period_close.donation_euro
		else:
			pc.donation_euro = 0

class bot_period_manager ( object ):
	def __init__ ( self, period ):
		self.period = period
		from Finances.models import Soci
		self.coopers = set( cooper for cooper in Soci.objects.filter ( user__date_joined__lte = self.period.date_close ))

	def render ( self ):
		for coop in self.coopers:
			btp = bot_period_close ( coop.user, self.period)'''
