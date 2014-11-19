#encoding=utf-8

from django.utils.translation import ugettext_lazy as _
from django import forms
from datetime import *
from django.http import HttpResponseRedirect
from decimal import Decimal
from localflavor.es.forms import *
from django.db.models import F

class CardIDValidator():
	def validate(self, CIF, oID):
		if CIF == "" and oID == "":
			text = _(u"Has d'introduir o CIF/NIF/NIE o Altres identificadors. Un dels dos.")
			raise forms.ValidationError(text)
		if CIF != "" and oID != "":
			raise forms.ValidationError(_(u"Has d'introduir o CIF/NIF/NIE o Altres identificadors. No tots dos."))
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