from django.db import models
from django.contrib.admin import ModelAdmin
from decimal import Decimal
from datetime import date, timedelta, datetime

class bot_sales_invoice ( object ):
	def __init__( self, queryset ):
		self.sales_base = Decimal ("0.00")
		self.sales_invoicedVAT = Decimal ("0.00")
		self.sales_assignedVAT = Decimal ("0.00")
		self.sales_total = Decimal ("0.00")
		for item in queryset.all():
			self.sales_base += item.value()
			self.sales_invoicedVAT += item.invoicedVAT()
			self.sales_assignedVAT += item.assignedVAT()
			self.sales_total += item.total()

class bot_purchases_invoice ( object ):
	def __init__( self, queryset ):
		self.purchases_base = Decimal ("0.00")
		self.purchases_expencedVAT = Decimal ("0.00")
		self.purchases_IRPFRetention = Decimal ("0.00")
		self.purchases_total = Decimal ("0.00")
		for item in queryset.all():
			self.purchases_base += item.value()
			self.purchases_expencedVAT += item.expencedVAT()
			self.purchases_IRPFRetention += item.IRPFRetention()
			self.purchases_total += item.total()

class PeriodManager(object):
	@staticmethod
	def get_opened_period(user):
		#Get current user cooper record
		from Invoices.models import cooper
		obj_cooper = cooper.objects.filter(user=user)
		if obj_cooper.count()>0:
			#Get extradays
			nExtraDays = obj_cooper[0].extra_days if obj_cooper else 0
			#Return queryset
			from Invoices.models import period
			qs_Period =  period.objects.filter( first_day__lte=datetime.now(), 
											date_close__gte=datetime.now() - timedelta(days=nExtraDays) 
										)
			if qs_Period.count() > 1:
				return period.objects.filter(pk=qs_Period[0].pk) 
			else:
				return qs_Period
		return None
	@staticmethod
	def filterbydefault(request, instance, entity, extra_context):
		referer = request.META.get('HTTP_REFERER', '')
		showall = request.META['PATH_INFO'] in referer and not request.GET.has_key('timeframe')

		if not showall and not request.GET.has_key('period__id__exact'):
			qs_Period = PeriodManager.get_opened_period( request.user ) 

			if qs_Period:
				period_value = qs_Period[0].id if qs_Period.count() == 1 else 0
				q = request.GET.copy()
				q['period__id__exact'] = period_value
				request.GET = q
				request.META['QUERY_STRING'] = request.GET.urlencode()
				from django.http import HttpResponseRedirect
				return HttpResponseRedirect( request.path + "?" + request.GET.urlencode() )
		return super(entity,instance).changelist_view(request, extra_context=extra_context)
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
			self.period_close.status = "No created"
			print self.period_close.status
		else:
			self_period = self.period_close._meta
			bbdd_period = self.bbdd_period_close._meta

			for field in self_period.fields:
				if field.name not in( "id", "Savings_donation", "donation_eco", "closed", "CESnumber", "VAT_type" ):
					if getattr(self.period_close, field.name) != getattr(self.bbdd_period_close, field.name):
						print field.name
						print "--" + str( getattr(self.period_close, field.name) )
						print "--" + str( getattr(self.bbdd_period_close, field.name) )

	def load_bbdd_period_close ( self ):
		ob = PeriodClose.objects.filter(user=self.user, period = self.period)
		self.bbdd_period_close = PeriodClose(period=self.period, user=self.user)
		for period in ob:
			self.bbdd_period_close = period

	def load_self_period_close ( self ):
		self.period_close = PeriodClose(period=self.period, user=self.user)
		#SALES
		from Invoices.models import SalesInvoice
		self.sales = SalesInvoice.objects.filter(period=self.period, user=self.user)
		from decimal import Decimal
		sales_total = sales_invoicedVAT = sales_assignedVAT = sales_totalVAT = Decimal('0.00')
		for item in self.sales.all():
			sales_total += item.value
			sales_invoicedVAT += item.invoicedVAT()
			sales_assignedVAT += item.assignedVAT()
			sales_totalVAT += item.total()
		self.period_close.Sales_total = Decimal ( "%.2f" % sales_total )
		self.period_close.Sales_invoicedVAT = Decimal ( "%.2f" % sales_invoicedVAT )
		self.period_close.Sales_assignedVAT = Decimal ( "%.2f" % sales_assignedVAT )
		self.period_close.Sales_totalVAT = Decimal ( "%.2f" % sales_totalVAT )

		#PURCHASES
		from Invoices.models import PurchaseInvoice
		self.purchases = PurchaseInvoice.objects.filter(period=self.period, user=self.user)
		purchases_total = purchases_expencedVAT = purchases_IRPFRetention = purchases_totalVAT = Decimal('0.00')
		for item in self.purchases.all():
			purchases_total += item.value
			purchases_expencedVAT += item.expencedVAT()
			purchases_IRPFRetention += item.IRPFRetention()
			purchases_totalVAT += item.total()

		self.period_close.Purchases_total = Decimal ( "%.2f" % purchases_total )
		self.period_close.Purchases_expencedVAT = Decimal ( "%.2f" % purchases_expencedVAT )
		self.period_close.Purchases_IRPFRetention = Decimal ( "%.2f" % purchases_IRPFRetention )
		self.period_close.Purchases_totalVAT = Decimal ( "%.2f" % purchases_totalVAT )

		#VATS
		totalVAT1 = Decimal ( "%.2f" % (sales_invoicedVAT - purchases_expencedVAT) )
		totalVAT1 = totalVAT1 if totalVAT1 > 0 else 0
		self.period_close.VAT_1 =  totalVAT1

		totalVAT2 = Decimal ( "%.2f" % (sales_assignedVAT - purchases_expencedVAT) )
		totalVAT1 = totalVAT2 if totalVAT2 > 0 else 0
		self.period_close.VAT_2 =  totalVAT2

		if self.bbdd_period_close is not None:
			self.period_close.VAT_type = self.bbdd_period_close.VAT_type
		else:
			self.period_close.VAT_type = 1

		#TAX
		from Invoices.models import periodTaxes
		self.taxes = periodTaxes.objects.filter(min_base__lte=sales_total, max_base__gte=sales_total)
		value = Decimal('0.00')
		if self.taxes.count() == 1:
			value = Decimal ( "%.2f" % self.taxes[0].taxId ) 
		else:
			value = 'Consultar'
		self.period_close.periodTAX = value
		from Invoices.models import Soci
		self.cooper = Soci.objects.get(user=self.user)

		if self.bbdd_period_close.id is not None:
			self.period_close.preTAX = self.bbdd_period_close.preTAX
		else:
			self.period_close.preTAX = 0

		if self.bbdd_period_close.id is not None:
			self.period_close.periodTAXeuro = self.bbdd_period_close.periodTAXeuro
		else:
			self.period_close.periodTAXeuro = 0
			
		if self.bbdd_period_close.id is not None:
			self.period_close.donation_euro = self.bbdd_period_close.donation_euro
		else:
			self.period_close.donation_euro = 0

class bot_period_manager ( object ):
	def __init__ ( self, period ):
		self.period = period
		from Invoices.models import Soci
		self.coopers = set( cooper for cooper in Soci.objects.filter ( user__date_joined__lte = self.period.date_close ))

	def render ( self ):
		for coop in self.coopers:
			btp = bot_period_close ( coop.user, self.period)'''