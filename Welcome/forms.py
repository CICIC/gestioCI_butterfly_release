#encoding=utf-8

from django import forms
from Welcome.models import Human, Person, Project, Company
from django.utils.translation import ugettext_lazy as _

class public_form(forms.ModelForm):
 	CHOICES = (
		('1', 'Projecte Col·lectiu',),
		('2', 'Soci Cooperatiu Individual',),
		('3', 'Soci Afí Individual',),
	)
	type = forms.ChoiceField(widget=forms.RadioSelect, choices=CHOICES, label=_(u"Tipus de soci"), localize=True, required=True)
	from django.contrib.admin import VERTICAL
	radio_fields = {"type": VERTICAL}
	class Meta:
		fields = ("type",)
		model = Person


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
