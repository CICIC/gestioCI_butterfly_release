#encoding=utf-8

from django import forms
from Welcome.models import Human, Person, Project, Company
from django.utils.translation import ugettext_lazy as _

class iC_Akin_Membership_form(forms.ModelForm):
	from General.widgets import ForeignKeyRawIdWidget
	from General.models import Project
	from Cooper.admin import user_admin_site

	class Meta:
		fields = ( "ic_record", "ic_membership", "join_date")
		from Welcome.models import iC_Akin_Membership
		model = iC_Akin_Membership

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
