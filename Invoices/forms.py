#encoding=utf-8

from django.utils.translation import ugettext_lazy as _
from django import forms
from datetime import *
from django.http import HttpResponseRedirect
from decimal import Decimal
from localflavor.es.forms import *
from django.db.models import F

from Invoices.bots import *
from models import cooper, sales_invoice, purchases_invoice, client, provider, period, tax
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

class company_form(forms.ModelForm):
	def clean_name(self):
		return self.cleaned_data.get('name').upper().replace("-", "").replace(".","").replace("/","").replace("-","").replace(",","")
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
		if self.model.objects.filter( name=cleaned_data.get('name')).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix una companyia amb aquest Nom Fiscal"))
		if CIF and self.model.objects.filter( CIF=CIF).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix una companyia amb aquest identificador"))
		if oID and self.model.objects.filter( otherCIF=oID).exclude(pk=pk).count() > 0:
			raise forms.ValidationError(_(u"Ja existeix una companyia amb aquest identificador"))
		return cleaned_data

class client_form(company_form):
	model = client

class provider_form(company_form):
	model = provider

from Invoices.models import manage_CHOICE_COOPER, manage_CHOICE_COOP, status_CHOICE_NONE, status_CHOICE_PENDING, status_CHOICE_DONE, status_CHOICE_WAITING
from Invoices.models import invoice
class invoice_form(forms.ModelForm):
	model = invoice
	statuses=(
		(status_CHOICE_NONE, _(u'---------------------')),
		(status_CHOICE_WAITING, _(u'Esperant data de venciment')),
		(status_CHOICE_PENDING, _(u'Pendent de rebre la transferència')),
		(status_CHOICE_DONE, _(u'Transferència rebuda')),
	)
	status = forms.CharField(label=_(u"Estat"), max_length=30,
			widget=forms.Select(choices=statuses), required=False)

	def __init__(self, *args, **kwargs):
		super(invoice_form, self).__init__(*args, **kwargs)
		if not hasattr(self,"request"):
			return
		current_period = bot_period(self.request.user).period( True, self.request )
		if current_period and not hasattr(self.instance, 'period'):
			self.initial['period'] = current_period

		if hasattr(self.instance, 'status'):
			self.initial['status'] = self.instance.status
		else:
			self.initial['status'] = None

		current_cooper = bot_cooper(self.request.user).cooper(self.request)
		if current_cooper and not hasattr(self.instance, 'cooper'):
			self.instance.cooper  = current_cooper 

	def clean_num(self):
		pk=0
		if self.instance.pk:
			pk =self.instance.pk

		num = self.cleaned_data.get('num')

		cooper = self.cleaned_data.get('cooper')
		if cooper is None:
			if hasattr(self.instance, 'cooper'):
				cooper = self.instance.cooper 

		period = self.cleaned_data.get('period')
		if period is None:
			if hasattr(self.instance, 'period'):
				period = self.instance.period 
		query = self.model.objects.filter(cooper=cooper, 
										period=period, 
										num=num)
		if self.model == "provider":
			provider = self.cleaned_data("provider")
			query = query.filter(provider, provider)

		query = query.exclude(pk=pk)
		exists_another_inovice_with_same_num = query.count() > 0
		if exists_another_inovice_with_same_num:
			raise forms.ValidationError(_(u"Ja existeix una factura amb aquest número"))
		return num

	def clean_date(self):
		cleaned_data = self.cleaned_data
		date = cleaned_data.get('date')
		period = cleaned_data.get('period')
		if period is None:
			if hasattr(self, "period"):
				period = self.period
		if period is not None:
			if date > period.date_close:
				raise forms.ValidationError(_(u"La data ha de ser menor que el dia final del periode"))
		return date

	def clean_transfer_date(self):
		if self.cleaned_data.get('who_manage') == manage_CHOICE_COOPER:
			return None
		return self.cleaned_data.get("transfer_date")

class sales_invoice_form(invoice_form):
	model = sales_invoice
	class Meta:
		localized_fields = ('value', 'invoiced_vat', 'assigned_vat', 'total')

class purchases_invoice_form(invoice_form):
	model = purchases_invoice
	def clean_who_manage(self):
		if self.cleaned_data.get('who_manage') == manage_CHOICE_COOP:
			if not self.cleaned_data.get('provider').iban:
				raise forms.ValidationError(_(u"El proveedor no té assignat un IBAN vàlid."))
		return self.cleaned_data.get('who_manage')
	def clean_expiring_date(self):
		print "cleanin"
		if self.cleaned_data.get('who_manage') == manage_CHOICE_COOPER:
			return None
		print self.cleaned_data.get('expiring_date')
		if  self.cleaned_data.get('expiring_date') is None:
				raise forms.ValidationError(_(u"Has d'introduïr una data de venciment"))
		return self.cleaned_data.get('expiring_date')
	class Meta:
		localized_fields = ('value', 'vat', 'irpf', 'total')

class invoice_form_balance(purchases_invoice_form):
	total = forms.DecimalField(label=_(u'Total Factura (€)'), localize=True, required=False)
	def __init__(self, *args, **kwargs):
		super(purchases_invoice_form, self).__init__(*args, **kwargs)
		if hasattr(self.instance, 'total'):
			self.initial['total'] = self.instance.total
		else:
			self.initial['total'] = 0

		if hasattr(self.instance, 'status'):
			self.initial['status'] = self.instance.status
		else:
			self.initial['status'] = None
		self.base_fields['status'].widget.attrs['disabled'] = True

from Invoices.models import movement_STATUSES
class movement_form_balance(forms.ModelForm):
	status = forms.CharField(label=_(u"Estat"), max_length=30,
			widget=forms.Select(choices=movement_STATUSES), required=False)
	def __init__(self, *args, **kwargs):
		super(movement_form_balance, self).__init__(*args, **kwargs)
		if hasattr(self.instance, 'status'):
			self.initial['status'] = self.instance.status
		else:
			self.initial['status'] = None
		self.base_fields['status'].widget.attrs['disabled'] = True
	class Meta:
		exclude = ['status',]
		localized_fields = ["value",]

from Invoices.models import period_close
class period_close_form(forms.ModelForm):

	oficial_vat_total = forms.DecimalField(label=_(u"IVA Facturat - Despeses (€)"), localize=True, required=False)
	assigned_vat_total = forms.DecimalField(label=_(u"IVA Assignat - Despeses (€)"), localize=True, required=False)

	savings_with_assigned_vat= forms.DecimalField(label=_(u"IVA Facturat - Assignat (€)"), localize=True, required=False)

	total_vat= forms.DecimalField(label=_(u"Total IVA (€)"), localize=True, required=False)
	total_irpf= forms.DecimalField(label=_(u"Total IRPF (€)"), localize=True, required=False)

	total = forms.DecimalField(label=_(u"Total Quota i Aportacions (€)"), localize=True, required=False)
	total_to_pay = forms.DecimalField(label=_(u"TOTAL A ABONAR (€)"),  localize=True, required=False)

	def __init__(self, *args, **kwargs):
		super(period_close_form, self).__init__(*args, **kwargs)
		self.current_fields = self.current_fields + ('cooper', 'total_to_pay' )
		if self.is_new:
				current_cooper = bot_cooper(self.request.user).cooper(self.request)
				current_period = bot_period(self.request.user).period( True, self.request )

				if current_cooper and current_period:
					bot = bot_period_close( current_period, current_cooper, self.instance, True)
					bot.load_period_close_form(self,self.current_fields  )
				else:
					pass
		else:
			if self.base_fields["period"].initial is None: #protect against multiple call, if we are loaded don't load again
				bot = bot_period_close( self.obj.period, self.obj.cooper, self.obj)
				bot.load_period_close_form(self, self.current_fields, False)

	def get_period_display(self):
		return self.obj.period.__unicode__()
	def get_cooper_display(self):
		return self.obj.cooper.__unicode__()
	def get_vat_type_display(self):
		from Invoices.models import vat_TYPES
		return vat_TYPES[self.base_fields["vat_type"].initial][1]


	class Meta:
		model = period_close
		from Invoices.models import period_close_base_fields
		localized_fields = period_close_base_fields

from Invoices.models import period_payment
class period_payment_inline_form(forms.ModelForm):
	model = period_payment
	def clean_currency(self):
		pk = self.instance.pk if self.instance.pk else 0
		if self.model.objects.filter( period_close = self.cleaned_data.get('period_close'), currency = self.cleaned_data.get("currency")).exclude(pk=pk).count()>0:
			raise forms.ValidationError(_(u"La mateixa moneda només ha d'apareixer una vegada.") )
		return self.cleaned_data.get("currency")

	def clean_value(self):
		pk = self.instance.pk if self.instance.pk else 0
		total_to_pay = self.cleaned_data.get('period_close').total_to_pay()
		from django.db.models import Sum
		total_other = self.model.objects.filter( 
									period_close = self.cleaned_data.get('period_close')
										).exclude(
									pk=pk
										).aggregate(
									Sum('value')
												)
		if total_other['value__sum']:
			total_other = total_other['value__sum'] - self.cleaned_data.get("value")
		else:
			total_other = 0

		if ( total_other +  self.cleaned_data.get('value') ) > total_to_pay:
			raise forms.ValidationError(
				("%s %s / %s") % ( 
					(u"La quantitat sumada a la de les altres monedes execedeix el total a abonar."), 
					str( total_other +  self.cleaned_data.get('value') ),
					str(total_to_pay) 
				)
			)
		return self.cleaned_data.get('value')

