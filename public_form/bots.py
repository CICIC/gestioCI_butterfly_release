import datetime
import hashlib
import random

from django.contrib.auth.models import User
from django.contrib.sites.models import RequestSite
import re
SHA1_RE = re.compile('^[a-f0-9]{40}$')

class user_registration_bot(object):

	def register(self, request, person, record_type_id, **kwargs):

		username, email, password = kwargs['username'], kwargs['email'], kwargs['password1']

		site = RequestSite(request)
		from Welcome.models import iC_Record_Type
		record_type = iC_Record_Type.objects.get(id=record_type_id)

		from public_form.models import RegistrationProfile
		new_user = RegistrationProfile.objects.create_inactive_user(
						username, email, password, site, person, record_type
					)

		from public_form import signals
		signals.user_registered.send(sender=self.__class__,
									 user=new_user,
									 request=request)
		
		return new_user
 
 
	def activate(self, request, activation_key):
		from public_form.models import RegistrationProfile
		try:
			current_registration = RegistrationProfile.objects.get(activation_key = activation_key)
		except:
			return False

		activated = RegistrationProfile.objects.activate_user(activation_key)
		return current_registration
		if activated:
			from public_form import signals
			signals.user_activated.send(sender=self.__class__,
										user=activated,
										request=request)
			return current_registration
		else:
			return False

