#encoding=utf-8
from models import Soci, SalesInvoice, PurchaseInvoice, Client, Provider, PeriodClose, period, periodTaxes
from django.utils.translation import ugettext_lazy as _
from django import forms
from datetime import *
from django.http import HttpResponseRedirect
from decimal import Decimal
from localflavor.es.forms import *
from django.db.models import F

class PeriodManager(object):
	@staticmethod
	def get_opened_period(user):
		#Get current user soci record
		obj_Soci = Soci.objects.filter(user=user)
		if obj_Soci.count()>0:
			#Get extradays
			nExtraDays = obj_Soci[0].extra_days if obj_Soci else 0
			#Return queryset
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
				return HttpResponseRedirect( request.path + "?" + request.GET.urlencode() )
		return super(entity,instance).changelist_view(request, extra_context=extra_context)

class SociAdminForm(forms.ModelForm):
	model = Soci
	class Meta:
		localized_fields = ('preTAX', )

class SalesInvoiceForm(forms.ModelForm):
	model = SalesInvoice

	def __init__(self, *args, **kwargs):
		#Initialice to current period only if new (self.instance.user = none)
		super(SalesInvoiceForm, self).__init__(*args, **kwargs)
		qs_Period = PeriodManager.get_opened_period ( self.request.user )
		if qs_Period and not self.instance.user:
			self.initial['period'] = qs_Period[0].pk
	def clean_date(self):
		cleaned_data = self.cleaned_data
		date = cleaned_data.get('date')
		period = cleaned_data.get('period')
		if date > period.date_close:
			raise forms.ValidationError(_(u"La data ha de ser menor que el dia final del periode"))
		return date

	def clean(self):
		cleaned_data = self.cleaned_data
		#New or Edit
		if self.instance.pk:
			pk =self.instance.pk
		else:
			pk=0
		#index unique = user, period, numfac + IVA
		user = cleaned_data.get('user')
		period = cleaned_data.get('period')
		num = cleaned_data.get('num')
		iva = cleaned_data.get('percentInvoicedVAT')
		if SalesInvoice.objects.filter( user=user, 
										period=period, 
										num=num, percentInvoicedVAT=iva).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix una factura amb aquest número"))

		return cleaned_data

	class Meta:
		localized_fields = ('value', 'invoicedVAT', 'assignedVAT', 'total')

class PurchaseInvoiceForm(forms.ModelForm):
	model = PurchaseInvoice
	def __init__(self, *args, **kwargs):
		#Initialice to current period only if new (self.instance.user = none)
		super(PurchaseInvoiceForm, self).__init__(*args, **kwargs)
		qs_Period = PeriodManager.get_opened_period ( self.request.user )
		if qs_Period and not self.instance.user:
			self.initial['period'] = qs_Period[0].pk
	def clean_date(self):
		cleaned_data = self.cleaned_data
		date = cleaned_data.get('date')
		period = cleaned_data.get('period')
		if date > period.date_close:
			raise forms.ValidationError(_(u"La data ha de ser menor que el dia final del periode"))
		return date

	def clean(self):
		cleaned_data = self.cleaned_data
		if self.instance.pk:
			pk =self.instance.pk
		else:
			pk=0
		user = self.cleaned_data.get('user')
		period = cleaned_data.get('period')
		num = cleaned_data.get('num')
		iva = cleaned_data.get('percentExpencedVAT')
		existing = PurchaseInvoice.objects.filter( user=user, 
										period=period, 
										num=num, percentExpencedVAT=iva).exclude(pk=pk)
		if existing.count() > 0:
			raise forms.ValidationError(_(u"Ja existeix una factura amb aquest número"))
		return cleaned_data

	class Meta:
		localized_fields = ('value', )

class CardIDValidator():
	def validate(self, CIF, oID):
		if CIF == "" and oID == "":
			raise forms.ValidationError(_(u"Has d'introduïr o CIF/NIF/NIE o Altres identificadors. Un dels dos."))
		if CIF != "" and oID != "":
			raise forms.ValidationError(_(u"Has d'introduïr o CIF/NIF/NIE o Altres identificadors. No tots dos."))
		if CIF != "":
			myValidator = ESIdentityCardNumberField()
			myValidator.clean(CIF)

class ClientForm(forms.ModelForm):

	def clean_CIF(self):
		cleaned_data = self.cleaned_data
		CIF = cleaned_data.get('CIF')
		return CIF.replace(" ","").replace("-","")

	def clean(self):
		cleaned_data = self.cleaned_data
		CIF = cleaned_data.get('CIF')
		oID = cleaned_data.get('otherCIF')

		validator = CardIDValidator()
		validator.validate( CIF, oID)

		if self.instance.pk:
			pk =self.instance.pk
		else:
			pk=0
			
		if Client.objects.filter( user=self.request.user, name=cleaned_data.get('name')).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un Proveïdor amb aquest Nom Fiscal"))
		if CIF and Client.objects.filter( user=self.request.user, CIF=CIF).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un Client amb aquest identificador"))
		if oID and Client.objects.filter( user=self.request.user, otherCIF=oID).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un Client amb aquest identificador"))

		return cleaned_data

	class Meta:
		model = Client

class ProviderForm(forms.ModelForm):

	def clean_CIF(self):
		cleaned_data = self.cleaned_data
		CIF = cleaned_data.get('CIF')
		return CIF.replace(" ","").replace("-","")

	def clean(self):
		cleaned_data = self.cleaned_data
		CIF = cleaned_data.get('CIF')
		oID = cleaned_data.get('otherCIF')
		
		validator = CardIDValidator()
		validator.validate(CIF, oID)

		if self.instance.pk:
			pk =self.instance.pk
		else:
			pk=0

		if Provider.objects.filter( user=self.request.user, name=cleaned_data.get('name')).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un Proveïdor amb aquest Nom Fiscal"))
		if CIF and Provider.objects.filter( user=self.request.user, CIF=CIF).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un Proveïdor amb aquest identificador"))
		if oID and Provider.objects.filter( user=self.request.user, otherCIF=oID).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un Proveïdor amb aquest identificador"))

		return cleaned_data

	class Meta:
		model = Provider

class PeriodCloseForm(forms.ModelForm):

	VAT_1 = forms.DecimalField(label=_(u"IVA Facturat - Despeses (€)"), localize=True, required=False)
	VAT_2 = forms.DecimalField(label=_(u"IVA Assignat - Despeses (€)"), localize=True, required=False)

	Savings = forms.DecimalField(label=_(u"IVA Facturat - Assignat (€)"), localize=True, required=False)

	TotalVAT = forms.DecimalField(label=_(u"Total IVA (€)"), localize=True, required=False)
	TotalIRPF = forms.DecimalField(label=_(u"Total IRPF (€)"), localize=True, required=False)

	subTotalEuro = forms.DecimalField(label=_(u"Total Quota i Aportació (€)"), localize=True, required=False)
	subTotalEco = forms.DecimalField(label=_(u"Total Quota i Aportació (ECOS)"), localize=True, required=False)
	TotalEuro = forms.DecimalField(label=_(u"TOTAL A ABONAR (€)"), help_text = _(u"Total a abonar trimestre (IVA, IRPF, Quota i Aportació) €"), localize=True, required=False)
	TotalEco = forms.DecimalField(label=_(u"TOTAL A ABONAR (ECOS)"), help_text = _(u"Total a abonar trimestre (IVA, IRPF, Quota i Aportació) ECOS"), localize=True, required=False)

	def __init__(self, *args, **kwargs):
		super(PeriodCloseForm, self).__init__(*args, **kwargs)

		#Recalculate values if editing
		user = self.instance.user
		if user:
			#PERIOD
			qs_Sales = SalesInvoice.objects.filter(period=self.instance.period, user=user)
			sales_total = sales_invoicedVAT = sales_assignedVAT = sales_totalVAT = Decimal('0.00')
			for item in qs_Sales.all():
				sales_total += item.value
				sales_invoicedVAT += item.invoicedVAT()
				sales_assignedVAT += item.assignedVAT()
				sales_totalVAT += item.total()

			self.initial['Sales_total'] = Decimal ( "%.2f" % sales_total )
			self.initial['Sales_invoicedVAT'] = Decimal ( "%.2f" % sales_invoicedVAT )
			self.initial['Sales_assignedVAT'] = Decimal ( "%.2f" % sales_assignedVAT )
			self.initial['Sales_totalVAT'] = Decimal ( "%.2f" % sales_totalVAT )

			qs_Purchase = PurchaseInvoice.objects.filter(period=self.instance.period, user=self.instance.user)
			purchases_total = purchases_expencedVAT = purchases_IRPFRetention = purchases_totalVAT = Decimal('0.00')
			for item in qs_Purchase.all():
				purchases_total += item.value
				purchases_expencedVAT += item.expencedVAT()
				purchases_IRPFRetention += item.IRPFRetention()
				purchases_totalVAT += item.total()

			self.initial['Purchases_total'] = Decimal ( "%.2f" % purchases_total )
			self.initial['Purchases_expencedVAT'] = Decimal ( "%.2f" % purchases_expencedVAT )
			self.initial['Purchases_IRPFRetention'] = Decimal ( "%.2f" % purchases_IRPFRetention )
			self.initial['Purchases_totalVAT'] = Decimal ( "%.2f" % purchases_totalVAT )

			#VATS
			totalVAT1 = Decimal ( "%.2f" % (sales_invoicedVAT - purchases_expencedVAT) )
			if totalVAT1 < 0:
				totalVAT1 = 0
			totalVAT2 = Decimal ( "%.2f" % (sales_assignedVAT - purchases_expencedVAT) )
			if totalVAT2 < 0:
				totalVAT2 = 0
			self.initial['VAT_1'] =  totalVAT1
			self.initial['VAT_2'] =  totalVAT2

			#QUOTA
			qs_Tax = periodTaxes.objects.filter(min_base__lte=sales_total, max_base__gte=sales_total)
			value = Decimal('0.00')
			if qs_Tax.count() == 1:
				value = Decimal ( "%.2f" % qs_Tax[0].taxId ) 
			else:
				value = 'Consultar'
			self.initial['periodTAX'] = value

	def clean_CESnumber(self):
		cleaned_data = self.cleaned_data
		ptax= cleaned_data.get('periodTAXeco')
		donation = cleaned_data.get('donation_eco')
		ces = cleaned_data.get('CESnumber')

		mustInputCes = Decimal ( ptax ) > 0 or Decimal ( donation ) > 0
		print mustInputCes
		print ces == ""
		if mustInputCes and ces == "":
			raise forms.ValidationError(_(u"Tens que especificar el teu compte CES"))
		return ces

	class Meta:
		model = PeriodClose
		localized_fields = ('Sales_total', 'Sales_invoicedVAT', 'Sales_assignedVAT', 'Sales_totalVAT',
							'Purchases_total', 'Purchases_expencedVAT', 'Purchases_IRPFRetention', 'Purchases_totalVAT',
							'Savings', 'TotalVAT', 'TotalIRPF', 'Savings',
							'Savings_donation', 'periodTAX', 'preTAX', 'periodTAXeuro', 'periodTAXeco', 'donation_euro', 'donation_eco',
							'subTotalEuro', 'subTotalEco', 'TotalEuro', 'TotalEco', 'payment_entity')
