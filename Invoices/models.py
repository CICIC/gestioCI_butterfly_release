#encoding=utf-8

from django.db import models
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.db.models import Sum, Max
from decimal import Decimal
from django.core.validators import MaxValueValidator, MinValueValidator, RegexValidator
from datetime import date, timedelta
from datetime import datetime
from django.utils.translation import ugettext_lazy as _
from csvimport.models import CSVImport
from django.contrib.auth.models import AbstractUser

class v7_auth_user(models.Model):
	username = models.CharField(_('username'), max_length=30)
	last_login = models.DateTimeField(_('date joined'))
	password = models.CharField(_('first name'), max_length=309, blank=True)
	first_name = models.CharField(_('first name'), max_length=30, blank=True)
	last_name = models.CharField(_('last name'), max_length=30, blank=True)
	email = models.EmailField(_('email address'), blank=True)
	is_staff = models.BooleanField(_('staff status'), default=False,
	help_text=_('Designates whether the user can log into this admin '
					'site.'))
	is_superuser = models.BooleanField(_('staff status'), default=False,
	help_text=_('Designates whether the user can log into this admin '
					'site.'))
	is_active = models.BooleanField(_('active'), default=True,
	help_text=_('Designates whether this user should be treated as '
					'active. Unselect this instead of deleting accounts.'))
	date_joined = models.DateTimeField(_('date joined'))



	USERNAME_FIELD = 'username'
	REQUIRED_FIELDS = ['email']

	class Meta:
		verbose_name = _('user')
		verbose_name_plural = _('users')


	def get_full_name(self):
		"""
		Returns the first_name plus the last_name, with a space in between.
		"""
		full_name = '%s %s' % (self.first_name, self.last_name)
		return full_name.strip()

	def get_short_name(self):
		"Returns the short name for the user."
		return self.first_name

	def email_user(self, subject, message, from_email=None, **kwargs):
		"""
		Sends an email to this User.
		"""
		send_mail(subject, message, from_email, [self.email], **kwargs)

''' 
	Only Admin.
'''
class VATS(models.Model):
	value = models.IntegerField(verbose_name=_(u'IVA'), unique=True, db_index=True, validators = [MinValueValidator(0), MaxValueValidator(100)])

	def __unicode__(self):
		return unicode(self.value)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u'G - IVA')
		verbose_name_plural= _(u'G - IVA')


class periodTaxes(models.Model):
	taxId = models.IntegerField(verbose_name= _(u"Quota Trimestral"), unique=True, db_index=True)
	min_base = models.IntegerField(verbose_name= _(u"Base imposable Mínima"))
	max_base = models.IntegerField(verbose_name= _(u"Base imposable Màxima"))

	def __unicode__(self):
		return self.taxId

	def __getitem__(self, value):
		return value

	class Meta:
		verbose_name = _(u'A - Taula quotes')
		verbose_name_plural = _(u'A - Taula quotes')

 
class Coop(models.Model):
	name = models.CharField(verbose_name=_(u"Nom"), unique=True, db_index=True, max_length=200)

	def __unicode__(self):
		return self.name

	class Meta:
		verbose_name= _(u'B - Cooperativa')
		verbose_name_plural= _(u'B - Cooperatives')


class Soci(models.Model):
	user = models.OneToOneField(User, verbose_name=_(u"Nom"))
	coop = models.ForeignKey(Coop, verbose_name=_(u"Cooperativa"))
	coop_number = models.IntegerField(verbose_name=_(u"nº COOP"), unique=True, db_index=True, max_length=4)
	IVA_assignat = models.IntegerField(verbose_name=_(u"IVA Assignat"), help_text=_(u"Aquest és el valor % d'IVA assignat fruit de l'avaluació social."), max_length=2, validators = [MinValueValidator(0), MaxValueValidator(100)], default=0)
	extra_days = models.IntegerField(verbose_name=_(u"Dies extra"), help_text=_(u"Dies extra que pot editar el trimestre en curs."), max_length=2, default=0)
	preTAX = models.DecimalField(verbose_name=_(u'Quota avançada (€)'), help_text=_(u"Quota que s'aplicarà el primer trimestre"), decimal_places=2, max_digits=10, default=0)

	def __unicode__(self):
		return "COOP%s" % ("%04d" % (self.coop_number))

	def __getitem__(self, value):
		return self.id

	def email( self ):
		return self.user.email
	email.short_description = _(u"Email")
	class Meta:
		verbose_name= _(u'E - Soci')
		verbose_name_plural= _(u'E - Socis')

alphanumeric_spaces = RegexValidator(r'^[0-9a-zA-Z\s]*$', _(u"Nomès números i lletres") )
alphanumeric = RegexValidator(r'^[0-9a-zA-Z]*$', _(u"Nomès números i lletres") )
class Client(models.Model):
	name = models.CharField(verbose_name=_(u"Nom Fiscal"), help_text=_(u"El nom fiscal del client a qui es factura. Ex. SOM EL QUE SOM SL"), max_length=200, validators=[alphanumeric_spaces])
	CIF = models.CharField(verbose_name=_(u"CIF/NIF/NIE"), blank=True, null=True, help_text=_(u"NIF:12345678A - CIF: A12345678 - NIE: X12345678A del client a qui es factura."), max_length=30)
	otherCIF = models.CharField(verbose_name=_(u"Altres identificadors"), null=True, blank=True, help_text=_(u"Camps no NIF/CIF/NIE del client a qui es factura."), max_length=50)
	user = models.ForeignKey(User, verbose_name=_(u"nº COOP"), null=True, blank=True)

	def __unicode__(self):
		if self.CIF is None or self.CIF == "":
			idcode = self.otherCIF
		else:
			idcode = self.CIF
		return self.name + ' - ' + idcode

	class Meta:
		verbose_name = _(u'B - Client')
		verbose_name_plural = _(u'B - Clients')


class Provider(models.Model):
	name = models.CharField(verbose_name=_(u"Nom Fiscal"), help_text=_(u"El nom fiscal del proveïdor a qui es factura. Ex. SOM EL QUE SOM SL"), max_length=200, validators=[alphanumeric_spaces])
	CIF = models.CharField(verbose_name=_(u"CIF / NIF / NIE"), blank=True, null=True, help_text=_(u"NIF:12345678A - CIF: A12345678 - NIE: X12345678A del proveïdor a qui es factura."), max_length=200)
	otherCIF = models.CharField(verbose_name=_(u"Altres identificadors"), null=True, blank=True, help_text=_(u"Camps no CIF / NIF / NIE del proveïdor a qui es factura."), max_length=50)
	user = models.ForeignKey(User, verbose_name=_(u"nº COOP"), null=True, blank=True)

	def __unicode__(self):
		if self.CIF is None or self.CIF == "":
			idcode = self.otherCIF
		else:
			idcode = self.CIF
		return self.name + ' - ' + idcode

	class Meta:
		verbose_name = _(u'C - Proveïdor')
		verbose_name_plural = _(u'C - Proveïdors')


class refundEntities(models.Model):
	entity = models.CharField(verbose_name=_(u"Entitat"), max_length=200)
	concept = models.CharField(verbose_name=_(u"Concepte"), max_length=200)
	number = models.CharField(verbose_name=_(u"Número Compte"), max_length=200)
	#importcsvfield =  csvimport
	def refund_entity(self):
		return self.entity + " / " + self.concept + " / " + self.number

	def __unicode__(self):
		return self.entity + " / " + self.concept + " / " + self.number

	class Meta:
		verbose_name = _(u'D - Cobraments')
		verbose_name_plural = _(u'D - Cobraments')


class paymentEntities(models.Model):
	entity = models.CharField(verbose_name=_("Entitat"), max_length=200)
	concept = models.CharField(verbose_name=_("Concepte"), max_length=200)
	number = models.CharField(verbose_name=_(u"Número Compte"), max_length=200)

	def payment_entity(self):
		return self.entity + " / " + self.concept + " / " + self.number

	def __unicode__(self):
		return self.entity + " ( " + self.concept + " ) "# + self.number

	class Meta:
		verbose_name = _('E - Pagament')
		verbose_name_plural = _('E - Pagaments')


class period(models.Model):
	label = models.CharField(verbose_name=_(u"Títol"), unique=True, max_length=200)
	first_day = models.DateField(verbose_name=_(u"Inici"), help_text=_(u"Primer dia del període"))
	date_open = models.DateField(verbose_name=_(u"Obert"))
	date_close = models.DateField(verbose_name=_(u"Tancat"))

	def period(self):
		return ('%s %s') % (self.label, self.first_day.year)

	def __unicode__(self):
		return ('%s %s') % (self.first_day.year, self.label)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u'0 - Dates Trimestre')
		verbose_name_plural= _(u'0 - Dates Trimestres')


class SalesInvoice(models.Model):
	period = models.ForeignKey(period, verbose_name=_(u'Trimestre'), default=1)
	user = models.ForeignKey(User, null=True, blank=True, verbose_name=_(u"nº COOP"))
	num = models.IntegerField(verbose_name=_(u"Nº Factura"), help_text=_(u"Número Factura: COOPXXXX/any/XXXX. Introduïu només el número final."))
	date = models.DateField(verbose_name=_(u"Data"), help_text=_(u"La data d'emissió de la factura. Exemple dd/mm/aaaa"))
	value = models.DecimalField(verbose_name=_(u'Base Imposable (€)'), help_text=_(u"La Base Imposable de la factura. Exemple 1000,30 . Indicar una coma pels decimals."), decimal_places=2, max_digits=10)

	def number(self):
		return '%s/%s/%s'%( Soci.objects.get(user=self.user), self.date.year, "%03d" % (self.num) )
	number.short_description =_(u"Nº Factura")
	number.admin_order_field = 'num'

	client = models.ForeignKey(Client, verbose_name=_(u"Client"))

	percentInvoicedVAT = models.ForeignKey(VATS, verbose_name=_(u"IVA Facturat (%)"), help_text=_(u"El % d'IVA que s'aplica en la factura. Indicar un valor d'IVA per concepte"))

	def percentAssignedVAT(self):
		iva_assignat = Soci.objects.get(user=self.user).IVA_assignat
		iva_oficial = self.percentInvoicedVAT.value

		if iva_oficial == 0:
			return 0
		elif iva_assignat >= 8:
			if iva_oficial == 21:
				return iva_assignat
			elif iva_oficial == 10:
				return 8
			elif iva_oficial == 4:
				return 4
		elif iva_assignat >= 4:
			if iva_oficial == 21:
				return iva_assignat
			elif iva_oficial == 10:
				return iva_assignat
			elif iva_oficial == 4:
				return 4
		else:
			return iva_assignat

	percentAssignedVAT.short_description = _(u"IVA Assignat (%)")
	percentAssignedVAT.admin_order_field = 'user__soci__IVA_assignat'

	def invoicedVAT(self):
		amount = Decimal ( "%.2f" % float((self.percentInvoicedVAT.value*self.value) / 100 ))
		return amount
	invoicedVAT.decimal = True
	invoicedVAT.short_description = _(u'IVA Facturat (€)')

	def assignedVAT(self):
		amount = Decimal ( "%.2f" % float((self.percentAssignedVAT()*self.value) / 100))
		return amount
	assignedVAT.decimal = True
	assignedVAT.short_description = _(u'IVA Assignat (€)')

	def total(self):
		return self.value + self.invoicedVAT()
	total.integer = True
	total.short_description = _(u'Total Factura  (€)')

	def __unicode__(self):
			return self.number()

	def __getitem__(self, value):
			return self.pk

	class Meta:
		verbose_name = _(u'1 - Factura Emesa')
		verbose_name_plural = _(u'1 - Factures Emeses')
		unique_together = ('user', 'period', 'num', 'percentInvoicedVAT')


class PurchaseInvoice(models.Model): 
	period = models.ForeignKey(period, verbose_name=_(u'Trimestre'), default=1) #period.objects.all().aggregate(max_id=Max('id')).get('max_id'))
	user = models.ForeignKey(User, null=True, blank=True, verbose_name=_(u"nº COOP"))
	num = models.CharField(verbose_name=_(u"Nº Factura"), max_length=20, help_text=_(u"Número Factura proveïdor."), validators=[alphanumeric])
	date = models.DateField(verbose_name=_(u"Data"), help_text=_(u"La data d'emissió de la factura. Exemple dd/mm/aaaa"))
	value = models.DecimalField(verbose_name=_(u'Base Imposable (€)'), help_text=_(u"La Base Imposable de la factura. Exemple 1000,30 . Indicar una coma pels decimals."), decimal_places=2, max_digits=65)
	provider = models.ForeignKey(Provider, verbose_name=_(u"Proveïdor"))
	percentExpencedVAT = models.ForeignKey(VATS, verbose_name=_(u'IVA (%)'), help_text=_(u"El % d'IVA que s'aplica en la factura."))
	percentIRPFRetention = models.IntegerField(verbose_name=_(u'IRPF (%)'), help_text=_(u"El % de retenció de IRPF (Només en lloguers i factures de persones físiques)."), default=0, validators = [MinValueValidator(0), MaxValueValidator(100)])

	def number(self):
		return self.num
	number.short_description =_(u"Nº Factura")
	number.admin_order_field = 'num'

	def expencedVAT(self):
		amount = Decimal ( "%.2f" % ((self.percentExpencedVAT.value*self.value) / 100))
		return amount
	expencedVAT.decimal = True
	expencedVAT.short_description = _(u'IVA (€)')

	def IRPFRetention(self):
		amount = Decimal ( "%.2f" % ((self.percentIRPFRetention*self.value) / 100))
		return amount
	IRPFRetention.decimal = True
	IRPFRetention.short_description = _(u'IRPF (€)')
	
	def total(self):
		return self.value + self.expencedVAT() - self.IRPFRetention()
	total.decimal = True
	total.short_description = _(u'Total Factura (€)')
	
	def __unicode__(self):
			return  self.num 

	def __getitem__(self, value):
			return self.pk

	class Meta:
		verbose_name = _(u'2 - Factura Despesa')
		verbose_name_plural = _(u'2 - Factures Despeses')
		unique_together = ('user', 'period', 'num', 'percentExpencedVAT')


class PeriodClose(models.Model):
	period = models.ForeignKey(period, verbose_name=_(u'Trimestre'), blank=True)
	user = models.ForeignKey(User, null=True, blank=True, verbose_name=_(u"nº COOP"))
	closed = models.BooleanField (verbose_name=_("closed"), help_text=_("closed_help_text"), default=False)

	#SALES
	Sales_total = models.DecimalField(verbose_name=_(u"Base Imposable Emeses (€)"), decimal_places=2, max_digits=10, blank=True)
	Sales_invoicedVAT = models.DecimalField(verbose_name=_(u"IVA Facturat (€)"), decimal_places=2, max_digits=10, blank=True)
	Sales_assignedVAT = models.DecimalField(verbose_name=_(u"IVA Assignat (€)"), decimal_places=2, max_digits=10, blank=True)
	Sales_totalVAT = models.DecimalField(verbose_name=_(u"Total Emeses (€)"), decimal_places=2, max_digits=10, blank=True)

	Purchases_total = models.DecimalField(verbose_name=_(u"Base Imposable Despeses (€)"), decimal_places=2, max_digits=10, blank=True)
	Purchases_expencedVAT = models.DecimalField(verbose_name=_(u"IVA Despeses (€)"), decimal_places=2, max_digits=10, blank=True)
	Purchases_IRPFRetention = models.DecimalField(verbose_name=_(u"Retenció IRPF (€)"), decimal_places=2, max_digits=10, blank=True)
	Purchases_totalVAT = models.DecimalField(verbose_name=_(u"Total Despeses (€)"), decimal_places=2, max_digits=10, blank=True)

	#VAT
	VAT_close = (
			(1, _(u'Pagament IVA oficial')),
			(2, _(u"Pagament IVA segons l'IVA assignat"))
	)
	VAT_type = models.IntegerField(verbose_name=_(u"Tipus d'IVA"), choices=VAT_close, default=1)

	#SAVINGS
	def Savings(self):
		return (self.Sales_invoicedVAT - self.Sales_assignedVAT) if self.VAT_type== 2 else 0
	Savings.short_description = _(u'IVA Facturat - Assignat (€)')
	Savings_donation = models.DecimalField(verbose_name=_(u'Aportació (€)'), help_text=_(u"D'aquest import d'estalvi, vols aportar alguna quantitat a la CIC? En cas afirmatiu, indica l'import."), decimal_places=2, max_digits=10, default=0)

	#TOTAL
	def TotalVAT(self):
		VATamount = self.Sales_invoicedVAT- self.Purchases_expencedVAT if self.VAT_type == 1 else self.Sales_assignedVAT - self.Purchases_expencedVAT
		#Request non negative VAT
		if VATamount < 0:
			VATamount = 0;
		return VATamount
	TotalVAT.short_description = _(u'Total IVA (€)')

	def TotalIRPF(self):
		return self.Purchases_IRPFRetention
	TotalIRPF.short_description = _(u'Total IRPF (€)')

	#PERIOD_TAX
	periodTAX = models.DecimalField(verbose_name=_(u"Quota"), decimal_places=2, help_text=_(u'Càlcul Quota Trimestral (segons taula quotes).'), max_digits=10, blank=True)
	preTAX = models.DecimalField(verbose_name=_(u"Quota avançada"), decimal_places=2, max_digits=10, default=0, blank=True)

	periodTAXeuro = models.DecimalField(verbose_name=_(u'Quota en €'), help_text = _(u" Cal indicar el valor de la quota que es pagarà en Euros."), default=0, max_digits=10, decimal_places=2)
	periodTAXeco = models.DecimalField(verbose_name=_(u'Quota en ECOS'), help_text = _(u" Cal indicar el valor de la quota que es pagarà en Ecos."), default=0, max_digits=10, decimal_places=2)

	#DONATION
	donation_euro = models.DecimalField(verbose_name=_(u'Aportació (€)'), help_text=_(u" Com que els resultats econòmics reflectits en aquest fitxer no sempre es corresponen amb l'activitat real del projecte, us volem donar aquesta opció per aportar el que considereu oportú. Si voleu, podeu indicar un import d´aportació al finançament d'activitats de la CIC en € i Ecos"),  decimal_places=2, max_digits=7, default=0)
	donation_eco = models.DecimalField(verbose_name= _(u'Aportació (Ecos)'), decimal_places=2, max_digits=7, default=0)

	#TOTAL_TAX
	def subTotalEuro(self):
		donations = self.Savings_donation if self.VAT_type == 2 else 0
		return float(self.periodTAXeuro) + float(self.donation_euro) + float(donations)
	subTotalEuro.short_description = _(u'Total Quota i Aportació (€)')
	def subTotalEco(self):
		return float(self.periodTAXeco) + float(self.donation_eco)
	subTotalEco.short_description = _(u'Total Quota i Aportació ECOS')
	def TotalEuro(self):
		#WARNING: /16/10/2014, IRPF suma y no resta.
		#return float(self.subTotalEuro()) - float(self.TotalIRPF()) + float(self.TotalVAT())
		return float(self.subTotalEuro()) + float(self.TotalIRPF()) + float(self.TotalVAT())
	TotalEuro.short_description = _(u'TOTAL A ABONAR (€)')
	def TotalEco(self):
		return self.subTotalEco()
	TotalEco.short_description = _(u'TOTAL A ABONAR ECOS')
	CESnumber = models.CharField(verbose_name='CES', null = True, blank=True, help_text = _(u"Indica el teu número de compte del CES"), max_length=250)

	payment_entity = models.ManyToManyField(paymentEntities, related_name='payment', verbose_name=_(u"Pagaments"), help_text=_(u"Ingrès IVA i Quotes (pagaments)"))
	refund_entity = models.ForeignKey(refundEntities, verbose_name=_(u"Cobraments"), null=True, blank=True, help_text=_(u"Ingrés Fac. Emeses (cobraments). El número de compte que cal lliurar als vostres clients que us obliguin a cobrar per transferència és el indicat. Recordeu que sempre cal sol·licitar el cobrament en metàl·lic."))

	def __getitem__(self, value):
		return self.pk
	
	def __unicode__(self):
		return self.period.label

	class Meta:
		verbose_name= _(u'3 - Resultats')
		verbose_name_plural= _(u'3 - Resultats')
		unique_together = ('user', 'period')

