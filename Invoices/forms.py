#encoding=utf-8
from models import cooper, sales_invoice, purchases_invoice, client, provider, period, tax
from django.utils.translation import ugettext_lazy as _
from django import forms
from datetime import *
from django.http import HttpResponseRedirect
from decimal import Decimal
from localflavor.es.forms import *
from django.db.models import F

from Invoices.bots import PeriodManager

class cooper_admin_form(forms.ModelForm):
	model = cooper
	class Meta:
		localized_fields = ('preTAX', )

class CardIDValidator():
	def validate(self, CIF, oID):
		if CIF == "" and oID == "":
			raise forms.ValidationError(_(u"Has d'introduïr o CIF/NIF/NIE o Altres identificadors. Un dels dos."))
		if CIF != "" and oID != "":
			raise forms.ValidationError(_(u"Has d'introduïr o CIF/NIF/NIE o Altres identificadors. No tots dos."))
		if CIF != "":
			myValidator = ESIdentityCardNumberField()
			myValidator.clean(CIF)

class client_form(forms.ModelForm):
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
		if client.objects.filter( name=cleaned_data.get('name')).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un Proveïdor amb aquest Nom Fiscal"))
		if CIF and client.objects.filter( CIF=CIF).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un client amb aquest identificador"))
		if oID and client.objects.filter( otherCIF=oID).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un client amb aquest identificador"))
		return cleaned_data
	class Meta:
		model = client

class provider_form(forms.ModelForm):
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

		if provider.objects.filter( name=cleaned_data.get('name')).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un Proveïdor amb aquest Nom Fiscal"))
		if CIF and provider.objects.filter( CIF=CIF).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un Proveïdor amb aquest identificador"))
		if oID and provider.objects.filter( otherCIF=oID).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix un Proveïdor amb aquest identificador"))

		return cleaned_data
	class Meta:
		model = provider

class sales_invoice_form(forms.ModelForm):
	model = sales_invoice
	def __init__(self, *args, **kwargs):
		#Initialice to current period only if new
		self.request = kwargs.pop('request', None)
		super(sales_invoice_form, self).__init__(*args, **kwargs)
		qs_Period = PeriodManager.get_opened_period ( self.request.user )
		if qs_Period and not self.instance.period:
			self.initial['period'] = qs_Period[0].pk
	def clean_date(self):
		cleaned_data = self.cleaned_data
		date = cleaned_data.get('date')
		period = cleaned_data.get('period')
		if date > period.date_close:
			raise forms.ValidationError(_(u"La data ha de ser menor que el dia final del periode"))
		return date
	def clean_status(self):
		status = self.cleaned_data.get('status') 
		if self.cleaned_data.get('who_manage') == 1:
			if  status is None:
				raise forms.ValidationError(_(u"Selecciona un estat per la transferència"))
		else:
			status = None
		return status
	def clean(self):
		cleaned_data = self.cleaned_data
		pk = self.instance.pk if self.instance.pk else 0
		cooper = cleaned_data.get('cooper')
		period = cleaned_data.get('period')
		num = cleaned_data.get('num')
		if sales_invoice.objects.filter( cooper = cooper, 
										 period = period, 
										 num = num).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix una factura amb aquest número"))
		return cleaned_data
	class Meta:
		localized_fields = ('value', 'invoicedVAT', 'assignedVAT', 'total')
class purchases_invoice_form(forms.ModelForm):
	model = purchases_invoice
	def __init__(self, *args, **kwargs):
		self.request = kwargs.pop('request', None)

		super(purchases_invoice_form, self).__init__(*args, **kwargs)
		qs_Period = PeriodManager.get_opened_period ( self.request.user )
		if qs_Period and not self.instance.period:
			self.initial['period'] = qs_Period[0].pk
	def clean_date(self):
		cleaned_data = self.cleaned_data
		date = cleaned_data.get('date')
		period = cleaned_data.get('period')
		if date > period.date_close:
			raise forms.ValidationError(_(u"La data ha de ser menor que el dia final del periode"))
		return date
	def clean_who_manage(self):
		if self.cleaned_data.get('who_manage') == 1:
			if not self.cleaned_data.get('provider').iban:
				raise forms.ValidationError(_(u"El proveedor no té assignat un IBAN vàlid."))
				return 0
		return self.cleaned_data.get('who_manage')

	def clean_status(self):
		status = self.cleaned_data.get('status') 
		if self.cleaned_data.get('status') != 2:
			if self.cleaned_data.get('who_manage') == 1:
				from datetime import date
				if date.today() <= self.cleaned_data.get("date"):
					status = 0
				else:
					status = 1
		return status
	def clean(self):
		cleaned_data = self.cleaned_data
		if self.instance.pk:
			pk = self.instance.pk
		else:
			pk = 0
		cooper = cleaned_data.get('cooper')
		period = cleaned_data.get('period')
		num = cleaned_data.get('num')
		iva = cleaned_data.get('percentExpencedVAT')
		existing = purchases_invoice.objects.filter( cooper=cooper, 
													period=period, 
													num=num).exclude(pk=pk)
		if existing.count() > 0:
			raise forms.ValidationError(_(u"Ja existeix una factura amb aquest número"))
		return cleaned_data

	class Meta:
		localized_fields = ('value', )
'''
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
			qs_Sales = sales_invoice.objects.filter(period=self.instance.period, user=user)
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

			qs_Purchase = purchase_invoice.objects.filter(period=self.instance.period, user=self.instance.user)
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

							
'''