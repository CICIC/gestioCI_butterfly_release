#encoding=utf-8

from django import forms
from Welcome.models import Human, Person, Project, Company
from django.utils.translation import ugettext_lazy as _

class iC_Akin_Membership_form(forms.ModelForm):
	from Welcome.models import iC_Akin_Membership
	model = iC_Akin_Membership
	def __init__(self, *args, **kwargs):
		super(iC_Akin_Membership_form, self).__init__(*args, **kwargs)
		if self.instance.id:
			self.fields['join_date'].widget.attrs['readonly'] = True
	class Meta:
		fields = ( "ic_record", "ic_membership", "join_date")
		from Welcome.models import iC_Akin_Membership
		model = iC_Akin_Membership

class iC_Person_Membership_form(forms.ModelForm):
	from Welcome.models import Payment_Type
	payment_type = forms.ModelMultipleChoiceField(queryset=Payment_Type.objects.all(), label=_(u"Forma de pagament: "))

	def __init__(self, *args, **kwargs):
		super(iC_Person_Membership_form, self).__init__(*args, **kwargs)
		if self.instance.ic_record.id:
			self.fields['join_date'].widget.attrs['readonly'] = True
			self.fields['join_fee'].widget.attrs['disabled'] = True
			self.fields['person'].widget.attrs['disabled'] = True
			self.fields['ic_CESnum'].widget.attrs['readonly'] = True
		if self.instance.join_fee.payment_type:
			self.fields['payment_type'].widget = self.fields['payment_type'].hidden_widget()
	class Meta:
		fields = ( 'person', 'join_fee', 'payment_type', 'ic_CESnum', 'ic_membership', 'join_date' )
		from Welcome.models import iC_Person_Membership
		model = iC_Person_Membership

class iC_Project_Membership_form(forms.ModelForm):
	from Welcome.models import Payment_Type
	payment_type = forms.ModelMultipleChoiceField(queryset=Payment_Type.objects.all())

	class Meta:
		fields = ( 'project', 'join_fee', 'payment_type', 'ic_CESnum', 'join_date' )
		from Welcome.models import iC_Project_Membership
		model = iC_Project_Membership

class public_form(forms.ModelForm):
	CHOICES_admin = (
		('1', 'Projecte Col·lectiu',),
		('2', 'Projecte Públic',),
		('3', 'Soci Cooperatiu Individual',),
		('4', 'Soci Afí Individual',),
	)
 	CHOICES_public = (
		('1', 'Projecte Col·lectiu',),
		('2', 'Soci Cooperatiu Individual',),
		('3', 'Soci Afí Individual',),
	)
	type_admin = forms.ChoiceField(widget=forms.RadioSelect, choices=CHOICES_admin, label=_(u"Usuari = admin"), localize=True, required=True)
	type_public = forms.ChoiceField(widget=forms.RadioSelect, choices=CHOICES_public, label=_(u"Usuari = públic"), localize=True, required=True)
	from django.contrib.admin import VERTICAL, HORIZONTAL
	radio_fields = {"type_admin": VERTICAL, "type_admin": HORIZONTAL}
	class Meta:
		fields = ("type_admin", "type_public")
		from Welcome.models import iC_Membership
		model = iC_Membership



		
class public_form_person(forms.ModelForm):
	class Meta:
		model = Person
		#telefono fijo >>  in addresses find wich has boolean field main_address and get telephone
		fields = ("id_card", "name", "surnames", "nickname", "nickname2", "email", "telephone_cell", 'telephone_land') #comment

class public_form_project(forms.ModelForm):
	class Meta:
		model = Project
		#telefono fijo >>  in addresses find wich has boolean field main_address and get telephone
		fields = ("name", "email", "telephone_cell", 'telephone_land', "project_type") #comment

class public_form_company(forms.ModelForm):
	class Meta:
		model = Company
		#telefono fijo >>  in addresses find wich has boolean field main_address and get telephone
		fields = ("name", "nickname", "email", "telephone_cell", 'telephone_land') #comment
