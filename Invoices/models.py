#encoding=utf-8

from django.db import models
from django.contrib.auth.models import User
from datetime import date, timedelta, datetime
from django.utils.translation import ugettext_lazy as _
from csvimport.models import CSVImport
from decimal import Decimal
from django.core.validators import MaxValueValidator, MinValueValidator

from General.models import Concept
from Welcome.models import iC_Membership


class vats(models.Model):
	value=models.IntegerField(verbose_name=_(u'IVA'), unique=True, db_index=True, validators=[MinValueValidator(0), MaxValueValidator(100)])

	def __unicode__(self):
		return unicode(self.value)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u'F - IVA')
		verbose_name_plural= _(u'F - IVAs')


class coop(models.Model):
	name=models.CharField(verbose_name=_(u"Nom"), unique=True, db_index=True, max_length=200)

	def __unicode__(self):
		return self.name

	class Meta:
		verbose_name= _(u'I - Cooperativa')
		verbose_name_plural= _(u'I - Cooperatives')

class cooper(models.Model):
	user=models.OneToOneField(User, verbose_name=_(u"Nom"))
	coop=models.ForeignKey(coop, verbose_name=_(u"Cooperativa"))
	coop_number=models.IntegerField(verbose_name=_(u"nº COOP"), unique=True, db_index=True, max_length=4)
	assigned_vat=models.IntegerField(verbose_name=_(u"IVA Assignat"), help_text=_(u"Aquest és el valor % d'IVA assignat fruit de l'avaluació social."), max_length=2, validators=[MinValueValidator(0), MaxValueValidator(100)], default=0)
	extra_days=models.IntegerField(verbose_name=_(u"Dies extra"), help_text=_(u"Dies extra que pot editar el trimestre en curs."), max_length=2, default=0)
	advanced_tax=models.DecimalField(verbose_name=_(u'Quota avançada (€)'), help_text=_(u"Quota que s'aplicarà el primer trimestre"), decimal_places=2, max_digits=10, default=0)
	membership = models.ForeignKey(iC_Membership, verbose_name=_(u"rel_to_new_system"), blank=True, null=True)
	def email( self ):
		return self.user.email
	email.short_description=_(u"Email")

	def __unicode__(self):
		return "COOP%s" % ("%04d" % (self.coop_number))

	def __getitem__(self, value):
		return self.id
	class Meta:
		verbose_name= _(u'D - Socia')
		verbose_name_plural= _(u'D -  Socies')

from General.models import Unit

class movement (models.Model):
	ic_membership = models.ForeignKey(iC_Membership, null=False, blank=False, verbose_name=_(u"nº COOP"))
	concept=models.CharField(verbose_name=_(u"Concept"), max_length=200, null=False, 
		blank=False,)
	execution_date=models.DateField(verbose_name=_(u"Data de realització"), null=True, blank=True, help_text=_(u"La data en que es realitza. Exemple dd/mm/aaaa"))
	value=models.DecimalField(
		verbose_name=_(u'Import u.m.'), 
		help_text=_(u"Import en unitats monetàries"), 
		decimal_places=2, 
		max_digits=10,
		null=False, 
		blank=False,
	)
	currency=models.IntegerField(blank=False, null=True, verbose_name=_("Moneda"), help_text=_(u"Indica el tipus de moneda del moviment"))
	def status(self):
		if self.execution_date is None:
			return status_CHOICE_PENDING
		else:
			return status_CHOICE_DONE
	status.short_description = _(u"Estat")

	def __unicode__(self):
		from Invoices.bots import bot_currency
		return bot_currency(self.currency).get_change(self.value)
	class Meta:
		abstract=True

status_CHOICE_NONE = None
status_CHOICE_PENDING = 0
status_CHOICE_DONE = 1
status_CHOICE_WAITING = 2
manage_CHOICE_COOPER = 0
manage_CHOICE_COOP = 1
who_manage_CHOICES=(
(manage_CHOICE_COOPER, _(u'Gestionat per la socia')),
(manage_CHOICE_COOP, _(u'Gestionat per la cooperativa')),
)
vat_type_OFICIAL = 0
vat_type_ASSIGNED = 1
movement_STATUSES=(
(status_CHOICE_PENDING, _(u'Pendent')),
(status_CHOICE_DONE, _(u'Executat')),
)

class sales_movement( movement ):
	planned_date=models.DateField(verbose_name=_(u"Data previsió"), help_text=_(u"La data prevista. Exemple dd/mm/aaaa"))
	who_manage= models.IntegerField(
		verbose_name=_(u"Forma de pagament"), 
		help_text=_(u"Si selecciona la opció 'desde la cooperativa' haurà d'ampliar informació."), 
		choices=who_manage_CHOICES, 
		default=manage_CHOICE_COOPER
	)
	class Meta:
		verbose_name=_(u'L - Abonament')
		verbose_name_plural=_(u'L - Abonaments')
