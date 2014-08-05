from django import forms
from Welcome.models import iC_Membership

class public_form(forms.ModelForm):

	class Meta:
		model = iC_Membership
