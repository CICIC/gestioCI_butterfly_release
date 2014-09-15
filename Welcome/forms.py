#encoding=utf-8

from django import forms
from Welcome.models import Human, Person, Project, Company
from django.utils.translation import ugettext_lazy as _

class iC_Akin_Membership_form(forms.ModelForm):
	from Welcome.models import iC_Akin_Membership
	model = iC_Akin_Membership
	from General.models import Project
	ic_membership_project = forms.ModelMultipleChoiceField(queryset=Project.objects.filter(), label=_(u"Projecte vinculat "))
	def __init__(self, *args, **kwargs):
		super(iC_Akin_Membership_form, self).__init__(*args, **kwargs)
		if self.instance.id:
			self.fields['join_date'].widget.attrs['readonly'] = True

	class Meta:
		fields = ( "ic_record", "ic_membership_project", "join_date")
		from Welcome.models import iC_Akin_Membership
		model = iC_Akin_Membership

class iC_Person_Membership_form(forms.ModelForm):
	from Welcome.models import Payment_Type
	payment_type = forms.ModelMultipleChoiceField(queryset=Payment_Type.objects.all(), label=_(u"Forma de pagament"))

	def __init__(self, *args, **kwargs):
		super(iC_Person_Membership_form, self).__init__(*args, **kwargs)
		if self.instance:
			self.fields['join_date'].widget.attrs['readonly'] = True
			self.fields['join_fee'].widget.attrs['disabled'] = True
			self.fields['person'].widget.attrs['disabled'] = True
			self.fields['ic_CESnum'].widget.attrs['readonly'] = True
			if self.instance.join_fee:
				if self.instance.join_fee.payment_type:
					self.fields['payment_type'].widget = self.fields['payment_type'].hidden_widget()
	class Meta:
		fields = ( 'person', 'join_fee', 'payment_type', 'ic_CESnum', 'ic_membership', 'join_date' )
		from Welcome.models import iC_Person_Membership
		model = iC_Person_Membership

class iC_Project_Membership_form(forms.ModelForm):
	from Welcome.models import Payment_Type
	payment_type = forms.ModelMultipleChoiceField(queryset=Payment_Type.objects.all(), label=_(u"Forma de pagament "))

	def __init__(self, *args, **kwargs):
		super(iC_Project_Membership_form, self).__init__(*args, **kwargs)
		if self.instance:
			self.fields['join_date'].widget.attrs['readonly'] = True
			self.fields['join_fee'].widget.attrs['disabled'] = True
			self.fields['ic_CESnum'].widget.attrs['readonly'] = True
			if self.instance.join_fee:
				if self.instance.join_fee.payment_type:
					self.fields['payment_type'].widget = self.fields['payment_type'].hidden_widget()
	class Meta:
		fields = ( 'project', 'join_fee', 'payment_type', 'ic_CESnum', 'join_date' )
		from Welcome.models import iC_Project_Membership
		model = iC_Project_Membership
from General.models import rel_Human_Addresses, rel_Human_Persons
from Welcome.models import iC_Membership
class iC_Self_Employed_form(forms.ModelForm):
	from Welcome.models import iC_Self_Employed
	model = iC_Self_Employed
	mentors_choice = forms.ModelMultipleChoiceField(queryset=None, label=_(u"Sòci mentor: "))
	main_address_choice = forms.ModelMultipleChoiceField(queryset=None, label=_(u"Adreça principal: "))
	other_address  = forms.ModelMultipleChoiceField(queryset=None, label=_(u"Altres adreçes"))
	fee_membership  = forms.ModelMultipleChoiceField(queryset=None, label=_(u"Quota Alta"))
	quarter_membership  = forms.ModelMultipleChoiceField(queryset=None, label=_(u"Quota trimestral"))

	def __init__(self, *args, **kwargs):
		super(iC_Self_Employed_form, self).__init__(*args, **kwargs)
		print "sdgdsgds"
		if self.instance.id:
			#Mentor
			if self.instance.id:
				#All related persons
				import pdb; pdb.set_trace() 
				self.fields['mentors_choice'].queryset = iC_Membership.objects.filter(human__in=iC_Membership.human.human_persons.get_related())

			#self.fields['join_date'].widget.attrs['readonly'] = True
			#Main address
			self.fields['main_address_choice'].queryset = self.instance.ic_membership.human.addresses
			self.fields['other_address'].queryset = self.instance.ic_membership.ic_project.addresses
			from Welcome.models import Fee, iC_Record_Type

			self.fields['fee_membership'].queryset = self.instance.rel_fees

			for fe in Fee.objects.all():
				print fe.record_type.clas

			self.fields['quarter_membership'].queryset = self.instance.rel_fees
			try:
				current_main_address = rel_Human_Addresses.objects.get(human=self.instance.person, main_address = True)
				self.initial = { 'main_address_choice' : current_main_address.id }
			except:
				pass
			#self.fields['join_date'].widget.attrs['readonly'] = True
			self.fields['rel_insurances'].queryset = self.instance.rel_insurances
			self.fields['rel_licences'].queryset = self.instance.rel_licences
			self.fields['rel_address_contracts'].queryset = self.instance.rel_address_contracts
			self.fields['rel_address_contracts'].queryset = self.instance.rel_address_contracts
			#Mentor
			rel_Human_Persons
	class Meta:
		#field_step1 = ('rel_fees', '_rel_fees','_rel_id_cards', 'rel_address_contracts', '_rel_address_contract', 'rel_licences', '_rel_licences',	#'rel_insurances', '_rel_insurances','_has_assisted_socialcoin','join_date','assigned_vat', 'review_vat', #'last_review_date','rel_accountBank','mentor_membership', 'mentor_comment')
		from Welcome.models import iC_Self_Employed
		model = iC_Self_Employed
		fields = [ "mentors_choice", "mentor_comment", "main_address_choice", 'other_address', "rel_insurances", "rel_licences", "rel_address_contracts"]

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
