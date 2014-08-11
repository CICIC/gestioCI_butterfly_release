#encoding=utf-8

from django import forms
from Welcome.models import Person
from django.utils.translation import ugettext_lazy as _
attrs_dict = {'class': 'required'}

from General.models import Project
class project_form(forms.ModelForm):
	class Meta:
		model = Project

class create_membership_form(forms.ModelForm):

	CHOICES_PERSON = (
		("anonymous", _(u'Anònim (No omplirè dades persona)')), 
		("public", _(u'Persona (Omplirè dades de persona)')), 
	)
	# Create field with loaded choices-------------------------------------------------
	type_person = forms.ChoiceField(
		widget=forms.RadioSelect, 
		choices=CHOICES_PERSON, 
		label=_(u"Tipus de persona"), 
		localize=True, required=True)

		
	#Menú choices-----------------------------------------------------------------------
	'''
	typ = iC_Record_Type.objects.get(clas='iC_Membership')
	types = iC_Record_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght)
	CHOICES = ()
	for type in types:
		print type.id
		CHOICES = CHOICES + ( ( type.id, type.name) ,)  
	'''
	from Welcome.models import iC_Record_Type
	from Welcome.models import iC_Type
	choice_one = iC_Type.objects.get(clas="iC_Akin_Membership")
	choice_two = iC_Type.objects.get(clas="iC_Person_Membership")
	choice_three = iC_Type.objects.get(clas="iC_Project_Membership")
	CHOICES = (
		(choice_one.id, choice_one.name), 
		(choice_two.id, choice_two.name), 
		(choice_three.id, choice_three.name), 
	)

	# Create field with loaded choices-------------------------------------------------
	type = forms.ChoiceField(
		widget=forms.RadioSelect, 
		choices=CHOICES, 
		label=_(u"Tipus d'Alta"), 
		localize=True, required=True)

	username = forms.RegexField(regex=r'^[\w.@+-]+$',
								max_length=30,
								widget=forms.TextInput(attrs=attrs_dict),
								label=_("Username"),
								error_messages={'invalid': _("This value may contain only letters, numbers and @/./+/-/_ characters.")})
	email = forms.EmailField(widget=forms.TextInput(attrs=dict(attrs_dict,
															   maxlength=75)),
							 label=_("E-mail"))
	password1 = forms.CharField(widget=forms.PasswordInput(attrs=attrs_dict, render_value=False),
								label=_("Password"))
	password2 = forms.CharField(widget=forms.PasswordInput(attrs=attrs_dict, render_value=False),
								label=_("Password (again)"))

	project_name = forms.RegexField(regex=r'^[\w.@+-]+$',
								max_length=30,
								widget=forms.TextInput(attrs=attrs_dict),
								label=_("Nom"),
								required=False,
								error_messages={'invalid': _("This value may contain only letters, numbers and @/./+/-/_ characters.")})
	project_website = forms.RegexField(regex=r'^[\w.@+-]+$',
								label=_("Web"),
								max_length=100,
								widget=forms.TextInput(attrs=attrs_dict),
								required=False,
								error_messages={'invalid': _("This value may contain only letters, numbers and @/./+/-/_ characters.")})
	from django.contrib.admin import VERTICAL
	radio_fields = {"type": VERTICAL}

	def clean_nickname(self):
		print "#Clean nickname---------------------------------------------------------------"
		if self.cleaned_data.get("nickname") is None:
			return self.cleaned_data.get("username")
		else:
			return self.cleaned_data.get("nickname")
	def clean_name(self):
		print "#Clean name---------------------------------------------------------------"
		if self.cleaned_data.get("name") is None:
			return "anonymous"
		else:
			return self.cleaned_data.get("name")

	def clean_username(self):
		from django.contrib.auth.models import User
		existing = User.objects.filter(username__iexact=self.cleaned_data['username'])
		if existing.exists():
			raise forms.ValidationError(_("A user with that username already exists."))
		else:
			return self.cleaned_data['username']

	def clean(self):
		if 'password1' in self.cleaned_data and 'password2' in self.cleaned_data:
			if self.cleaned_data['password1'] != self.cleaned_data['password2']:
				raise forms.ValidationError(_("The two password fields didn't match."))
		return self.cleaned_data
	class Media:
		js = ( 
			"admin/js/core.js",
			"admin/js/jquery.js",
			"admin/js/jquery.init.js",
			'create_membership.js', )
	class Meta:
		model = Person
		fields = ("type_person", "type", "username", "email", "id_card", "surnames", "nickname", "telephone")
