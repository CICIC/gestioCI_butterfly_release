#encoding=utf-8
from django.db.models import Q
from django.core.exceptions import ObjectDoesNotExist
import datetime
import hashlib
import random
import re
from django.core.urlresolvers import reverse
from django.conf import settings
from django.contrib.auth.models import User
from django.db import models
from django.db import transaction
from django.template.loader import render_to_string
from django.utils.translation import ugettext_lazy as _
from django.utils.safestring import mark_safe
from datetime import date, timedelta, datetime
from Welcome.models import iC_Self_Employed
from Finances.models import iCf_Self_Employed



class Self_Employed_auth(object):
	'''
	Self_Employed
	
	'''
	def has_humans(self):
		try:
			current_person = self.ic_se.ic_membership.human.persons.first()
		except:
			current_person = None

		try:
			current_project = self.ic_se.ic_membership.ic_project
		except:
			current_project = None

		return current_person or current_project, current_person, current_project

	def render_member_info(self):
		icf_se_url = "<a href='/admin/Finances/icf_self_employed/%s'>%s</a>" % ( str(self.icf_se.id), _(u"Fitxa de facturació").encode("utf-8") )
		text = _(u"Aquest usuari utilitza la aplicació de facturació: %s ").encode("utf-8")
		output = mark_safe( text % (icf_se_url) )
		return output
	'''
	 ICES
	
	'''
	def ices_API_account_create_call(self):
		#
		# TODO: 
		# Join or follow issue on url:
		# ( https://github.com/CICIC/gestioCI_butterfly_release/issues/18 )
		#
		# Link to API sdk on url:
		# ( https://github.com/aleph1888/icesSDKv0 )
		# Use SDK to create an account and retrieve it to current object self_employed
		#
		# NOTICE (November - 2014): Some changes must be done to consume the API.
		# Mainly pass to oAuth2 from v1.
		#
		# Take a look to consumer client example in PHP:
		# on url:
		# ( https://github.com/aleph1888/integralCES_interop )
		#
		url = "https://github.com/CICIC/gestioCI_butterfly_release/milestones/gestioCI%20v0.8.1%20%28iCES/ces%20interop%29"
		alt = "Pendiente de desarrollo. El administrador introduce manualmente la cuenta."
		caption = _("Fica num. de iCES/ces").encode("utf-8")
		link = "<a href='%s' alt='%s'> %s </a> " % (url, alt, caption)
		return link

	def render_iCES_number_petition(self):
		none_ices_message = _(u"Introdueix Número de iCES/CES o fes una petició automàtica mitjançant aquest enllaç: %s").encode("utf-8")
		return none_ices_message % (self.ices_API_account_create_call())

	def has_iCES_number(self):
		try:
			ices = self.ic_se.ic_membership.ic_CESnum
		except:
			return False, ""
		else:
			return ices, ices

	'''
	 USER > FInances > iCf_Self_Employed(models.Model)
	
	'''
	def has_finances_app(self):
		try:
			self.user = User.objects.get(username=self.ic_CESnum)
		except:
			self.user = None

		try:
			
			self.icf_se = iCf_Self_Employed.objects.get( Q(user=self.user) | Q(ic_self_employed=self.ic_se) )
		except:
			self.icf_se = None

		return (self.user and self.icf_se), self.icf_se
	def get_activation_url(self):
		from Config.settings import SITE_URL
		return SITE_URL + reverse( 'public_form:activate_membership', args=( {self.activation_key} ) )

	def render_activaction_mail(self, send_email=False, slug="iC_Self_Employed"):
		salt = hashlib.sha1(str(random.random())).hexdigest()[:5]
		username = self.user.username
		if isinstance(username, unicode):
			username = username.encode('utf-8')
		self.activation_key = hashlib.sha1(salt+username).hexdigest()
		from Config.settings import ACCOUNT_ACTIVATION_DAYS, SITE_URL

		ctx_dict = {'activation_key': self.activation_key,
					'expiration_days': ACCOUNT_ACTIVATION_DAYS,
					'record_type_name': slug,
					'url': self.get_activation_url(),
					'resume_url': 'pendiente de poner en el objeto.tools_upgrader.objects.py',
					}
		subject = render_to_string('activation_email_subject.html',
								   ctx_dict)
		# Email subject *must not* contain newlines
		subject = ''.join(subject.splitlines())
		message = render_to_string('activation_email.html', ctx_dict)
		if send_email:
			pass
		return subject, message

	def create_user(self, username, email, password, site, person, project, record_type, send_email=True):
		new_user = User.objects.create_user(username, email, password)
		new_user.is_active = False
		new_user.is_staff = False
		new_user.save()
		return new_user
	def join_to_users_auth(self):
		if not self.user:
			self.user = transaction.atomic (self.create_user(
				self.ic_CESnum,
				self.person.name,
				self.person.email,
				"Self_employed",
				self.person,
				self.project,
				self.ic_se.record_type))
		return self.user, self.render_activaction_mail() 
	def join_to_groups_auth(self):
		#
		# Get info on Manual wiki:
		# ( https://wiki.enredaos.net/index.php?title=GestioCI-Codi#Grupos_django.auth.groups )
		#
		# See nice diagram on Manual wiki:
		# ( https://wiki.enredaos.net/index.php?title=File:Gestioci_user_groups.png )
		groups_list = []
		groups_list.append(self.ic_se.ic_membership.record_type.clas)
		groups_list.append(self.ic_se.record_type.clas)

		from django.contrib.auth.models import Group
		for group in groups_list:
			g = Group.objects.get_or_create(name=group)[0]
			g.user_set.add(self.user)
		return self.user.groups
	def join_to_icf_model(self):
		from Finances.models import iCf_Record_Type, _check_icf_record_type
		t = _check_icf_record_type("iCf_Finances", "", "", None, True)
		tt = _check_icf_record_type("iCf_Self_Employed", "Perfil d'un usuari a l'entorn virtual de gestió económica.","Aquests tipus de registre indiquen que el Autoocupat vinculat pot utilitzar l'entorn de facturació i tancament trimestral de l'IVA.", t)
		#
		# Get info on Manual wiki:
		# ( https://wiki.enredaos.net/index.php?title=GestioCI-Codi#ALTA_AUTOOCUPATS )
		self.icf_se = iCf_Self_Employed(
			record_type = tt,
			user = self.user,
			ic_self_employed = self.ic_se,
			ic_membership = self.ic_se.ic_membership
			).save()
		return self.icf_se
	def join_to_finances_app(self):
		if self.join_to_users_auth():
			if self.join_to_groups_auth():
				if self.join_to_icf_model():
					return self.render_activaction_mail()
		return "Error en join_to_finances_app"
	'''
	 init object
	
	'''
	def __init__(self, ic_self_employed):
		#
		# Save current ic_self_employed (call it: ic_se)
		self.ic_se = ic_self_employed

	def _get_user_member_field(self):
		#
		# Which [user_member] field renderization correspons to self.ic_se?
		#
		has_humans, self.person, self.project = self.has_humans() 
		has_ices, self.ic_CESnum = self.has_iCES_number()

		if has_ices:
			# Is it already roled to Finances virtual environtment?
			has_group, self.icf_se = self.has_finances_app()
			if has_group:
				# .. Nothing to do. Render useful user information. End.
				if self.user.is_active:
					output = self.render_member_info()
				else:
					subject, message = self.render_activaction_mail()
					output = subject + message
			else:
				# Create a loggeable user on /cooper admin site for this ice:
				# ... a) create django.auth.models.User
				# ... b) join user to 1 django.auth.models.Group of these:
				# ... ... {iCf_Person_Membership, iCf_Project_Membership} >> ic_self_employed.ic_membership.record_type
				# ... c) join to django.auth.models.Group: {iCf_Self_Employed } >> ic_self_employed.record_type
				# ... d) (optional) join to django.auth.models.Group: {iCf_Stallholder }
				result_message = self.join_to_finances_app()
				output = result_message
		else:
			output = self.render_iCES_number_petition()
		return output
