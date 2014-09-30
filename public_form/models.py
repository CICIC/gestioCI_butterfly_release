#encoding=utf-8

#si es soci afi es deixa en blanc
#mover campo teléfono de la dirección a la person
#Direcció filtrar REGIÓ per comarca (se tiene que crear un clas para poder filtrar)
#Intentar traer los formularios child dentro del parent en lugar del raw_id con la lupa
# Ocultar campos de relación



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

try:
	from django.utils.timezone import now as datetime_now
except ImportError:
	datetime_now = datetime.datetime.now

SHA1_RE = re.compile('^[a-f0-9]{40}$')

class RegistrationManager(models.Manager):

	def activate_user(self, activation_key):
		if SHA1_RE.search(activation_key):
			try:
				profile = self.get(activation_key=activation_key)
			except self.model.DoesNotExist:
				return False
			if not profile.activation_key_expired():
				user = profile.user
				user.is_active = True
				user.save()
				profile.activation_key = self.model.ACTIVATED
				profile.save()
				return user
		return False

	def create_active_user(self, username, email, password,
							 site, person, project, record_type):

		new_user = User.objects.create_user(username, email, password)
		new_user.is_active = False
		new_user.save()
		registration_profile = self.create_profile(new_user, person, project, record_type , True)
		return new_user
	create_active_user = transaction.atomic (create_active_user)

	def create_inactive_user(self, username, email, password,
							 site, person, project, record_type, send_email=True):

		new_user = User.objects.create_user(username, email, password)
		new_user.is_active = False
		new_user.save()
		registration_profile = self.create_profile(new_user, person, project, record_type )

		if send_email:
			registration_profile.send_activation_email(site)

		return new_user
	create_inactive_user = transaction.atomic (create_inactive_user)

	def create_profile(self, user, person, project, record_type, already_activated=False):

		salt = hashlib.sha1(str(random.random())).hexdigest()[:5]
		username = user.username
		if isinstance(username, unicode):
			username = username.encode('utf-8')
		if already_activated:
			activation_key = "ALREADY_ACTIVATED"
		else:
			activation_key = hashlib.sha1(salt+username).hexdigest()

		create_user = self.create(user=user,activation_key=activation_key, person = person, project=project, record_type = record_type )
		if already_activated:
			user.is_active = True
			user.is_staff = True
			user.save()

		from django.contrib.auth.models import Group

		try:
			g = Group.objects.get(name=record_type.clas)
		except:
			g = Group(name=record_type.clas)
			g.save()
		g.user_set.add(user)
		return create_user

	def delete_expired_users(self):
		for profile in self.all():
			try:
				if profile.activation_key_expired():
					user = profile.user
					if not user.is_active:
						user.delete()
						profile.delete()
			except User.DoesNotExist:
				profile.delete()


from django.conf import settings
class RegistrationProfile(models.Model):

	ACTIVATED = u"ALREADY_ACTIVATED"

	user = models.ForeignKey(User, unique=True, verbose_name=_('user'))
	activation_key = models.CharField( verbose_name=_("Clau"), max_length=40)

	from General.models import Person
	person = models.ForeignKey(Person, unique=True, verbose_name=_('Persona'))
	from General.models import Project
	project = models.ForeignKey(Project, blank=True, null=True, verbose_name=_('Project'))

	from Welcome.models import iC_Record_Type
	record_type = models.ForeignKey(iC_Record_Type, unique=False, verbose_name=_('Tipus alta'))

	objects = RegistrationManager()

	class Meta:
		verbose_name = _(u'Alta Membre: procés activació')
		verbose_name_plural = _(u'Alta Membre: procés activació')

	def __unicode__(self):
		return u"Registration information for %s" % self.user

	def activation_key_expired(self):

		from Config.settings import ACCOUNT_ACTIVATION_DAYS
		expiration_date = datetime.timedelta(days=ACCOUNT_ACTIVATION_DAYS)
		return self.activation_key == self.ACTIVATED or \
			(self.user.date_joined + expiration_date <= datetime_now())
	activation_key_expired.boolean = True

	def get_activation_url(self):
		from Config.settings import SITE_URL
		return SITE_URL + reverse( 'public_form:activate_membership', args=( {self.activation_key} ) )

	def get_resume_url(self):
		from Config.settings import SITE_URL
		return SITE_URL + reverse( 'public_form:entry_page_to_gestioci', args=( {self.user.id} ) )

	def send_activation_email(self, record_type_name):

		from Config.settings import ACCOUNT_ACTIVATION_DAYS, SITE_URL
		ctx_dict = {'activation_key': self.activation_key,
					'expiration_days': ACCOUNT_ACTIVATION_DAYS,
					'record_type_name': record_type_name,
					'url': self.get_activation_url(),
					'resume_url': self.get_resume_url(),
					}
		subject = render_to_string('activation_email_subject.html',
								   ctx_dict)
		# Email subject *must not* contain newlines
		subject = ''.join(subject.splitlines())

		message = render_to_string('activation_email.html',
								   ctx_dict)


'''
This is model form human_proxy ModelAdmin
as "Self employed presencial form"
Based on human list, a iC_learn_session object 
will be selected by modelAdmin.filters,
so an iC_Welcome admin can manage the pair
human/session.
'''
from General.models import Human
class human_proxy(Human):
	class Meta:
		verbose_name= _(u"Persona | Projecte")
		verbose_name_plural= _(u'Persones | Projectes')
		proxy = True

from Welcome.models import Learn_Session
class learn_Session_proxy(Learn_Session):
	class Meta:
		verbose_name= _(u'ASSITÈNCIA SESSIÓ ACOLLIDA')
		verbose_name_plural= _(u'ASSITÈNCIA SESSIÓ ACOLLIDA')
		proxy = True
