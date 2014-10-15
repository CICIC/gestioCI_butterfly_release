#encoding=utf-8
from django.utils.translation import ugettext as _
from django import forms
from localflavor.es.forms import *
from Welcome.models import iC_Record_Type
from General.models import Person

class human_proxy_form(forms.ModelForm):

	attrs_dict = {'class': 'required'}

	name = forms.CharField( max_length=200, widget=forms.TextInput(),label=_("Nom projecte"),required=True)
	email = forms.EmailField(widget=forms.TextInput(attrs=dict(attrs_dict, max_length=100)), label=_("Correu-e projecte"))
	telephone_cell = ESPhoneNumberField( label=_(u"Telèfon mòbil projecte") )
	telephone_land = ESPhoneNumberField( label=_(u"Telèfon fix projecte"), required=False )
	website = forms.URLField(widget=forms.TextInput(attrs=dict(attrs_dict, max_length=100)), required=False, label=_("Web"))

	class Meta:
		from public_form.models import human_proxy
		model = human_proxy
		fields = ( "name", "email", "telephone_land", "telephone_cell", "website" )

class learn_session_proxy_form(forms.ModelForm):
	datetime = forms.DateTimeField(label=_(u"Data sessió "))

	def __init__(self, *args, **kwargs):
		super(learn_session_proxy_form, self).__init__(*args, **kwargs)
		if self.instance.id:
			self.fields['datetime'].widget.attrs['readonly'] = True

	class Meta:
		from public_form.models import Learn_Session
		model = Learn_Session
		fields = ( "datetime", )
from Welcome.models import TentType_list
class public_form_self_admin(forms.ModelForm):
	description = forms.CharField( widget=forms.Textarea, label=_(u"Descripció projecte"), required=True )

	CHOICES = (
		('31', _(u'Autoocupat'),),
		('32', _(u'Autoocupat Firaire'),),
		('33', _(u'PAIC amb facturació'),),
	)
	CHOICES_sub = (
		('1', _(u'Individual'),),
		('2', _(u'Col·lectiu'),),
	)
	project_type = forms.ChoiceField(widget=forms.RadioSelect(), choices=CHOICES, label=_(u"Tipus de soci"), required=True)
	project_subtype = forms.ChoiceField(widget=forms.RadioSelect(), choices=CHOICES_sub, label=_(u"Tipus de projecte"), required=True)
	organic = forms.BooleanField(label=_(u"Productes ecològics") )

	tent_type = forms.ChoiceField(widget=forms.RadioSelect(), choices=TentType_list, label=_(u"Tipus parada firaire"))

	#Agregar create_membership_form > fields{ name + surname + telephone_cell}
	def __init__(self, *args, **kwargs):
		super(public_form_self_admin, self).__init__(*args, **kwargs)
		self.fields['tent_type'].initial = 'none'
	class Meta:
		from Welcome.models import iC_Membership
		model = iC_Membership
		fields = ( "description", "project_type",)

'''
	
	

	expositors = forms.ChoiceField(widget=forms.RadioSelect(), choices=(), label=_(u"Expositors"))

	mentor_of_SE = forms.ChoiceField(widget=forms.RadioSelect(), choices=(), label=_(u"SOCI DE REFERÈNCIA"))
'''

from Welcome.models import Person
from django.utils.translation import ugettext_lazy as _
attrs_dict = {'class': 'required'}

from Welcome.models import Project
class project_form(forms.ModelForm):
	class Meta:
		model = Project
		exclude = ()
class create_membership_form(forms.ModelForm):
	'''
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
	'''

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
	choice_one = iC_Record_Type.objects.get(clas="iC_Akin_Membership")
	choice_two = iC_Record_Type.objects.get(clas="iC_Person_Membership")
	choice_three = iC_Record_Type.objects.get(clas="iC_Project_Membership")
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
								max_length=100)),
							  label=_("E-mail"))

	password1 = forms.CharField(widget=forms.PasswordInput(attrs=attrs_dict, render_value=False),
								label=_("Password"))

	password2 = forms.CharField(widget=forms.PasswordInput(attrs=attrs_dict, render_value=False),
								label=_("Password (again)"))

	name = forms.RegexField(regex=r'^[ \w.@+-]+$',
								max_length=50,
								widget=forms.TextInput(),
								label=_("Nom real"),
								required=False,
								error_messages={'invalid': _("This value may contain only letters, numbers and @/./+/-/_ characters.")})

	project_name = forms.RegexField(regex=r'^[\w.@+-]+$',
								max_length=100,
								widget=forms.TextInput(),
								label=_("Nom del projecte"),
								required=False,
								error_messages={'invalid': _("This value may contain only letters, numbers and @/./+/-/_ characters.")})

	project_website = forms.RegexField(regex=r'^[\w.@+-]+$',
								label=_("Web del projecte"),
								max_length=100,
								widget=forms.TextInput(),
								required=False,
								error_messages={'invalid': _("This value may contain only letters, numbers and @/./+/-/_ characters.")})

	from django.contrib.admin import VERTICAL
	radio_fields = {"type": VERTICAL}

	def clean_nickname(self):
		print "#Clean nickname---------------------------------------------------------------"
		if self.cleaned_data.get("nickname") is None:
			return self.cleaned_data.get("username")
		return self.cleaned_data.get("nickname")

	def clean_name(self):
		#print 'NAME: '+str(self.cleaned_data['name'])
		if self.cleaned_data.get("name") is None or self.cleaned_data.get("name") == '':
			print 'Clean_Person_Name: A N O N Y M O U S ? '+str(self.cleaned_data)
			return "anonymous"
		else:
			#self.cleaned_data['name'] = self.cleaned_data.get("person_name")
			#print 'Clean_Person_Name: '+str(self.cleaned_data.get("person_name"))
			return self.cleaned_data.get("name")
	'''
	def clean_project_name(self):
		print "#Clean project_name---------------------------------------------------------------"
		if self.cleaned_data.get("project_name") is None or self.cleaned_data.get("project_name") == '':
			print 'Clean_Project_Name: A N O N Y M O U S'
			return "anonymous"
		return self.cleaned_data.get("project_name")
	'''
	def clean_username(self):
		from django.contrib.auth.models import User
		existing = User.objects.filter(username__iexact=self.cleaned_data['username'])
		if existing.exists():
			raise forms.ValidationError(_("A user with that username already exists."))
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
		fields = ("type", "username", "email", "id_card", "name", "surnames", "nickname", "telephone_land", "telephone_cell") #Do not remove!!, aleph (29/08/2014)
