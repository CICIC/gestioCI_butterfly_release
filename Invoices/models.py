#encoding=utf-8

from django.db import models
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User

from django.core.validators import MaxValueValidator, MinValueValidator
from datetime import date, timedelta
from datetime import datetime
from django.utils.translation import ugettext_lazy as _
from csvimport.models import CSVImport
from decimal import Decimal
from django.db.models import Sum

class currencies(models.Model):
	name=models.CharField(verbose_name=_(u"Nom"), max_length=20, help_text=_(u"Nom del tipus de moneda"))

class vats(models.Model):
	value=models.IntegerField(verbose_name=_(u'IVA'), unique=True, db_index=True, validators=[MinValueValidator(0), MaxValueValidator(100)])

	def __unicode__(self):
		return unicode(self.value)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u'G - IVA')
		verbose_name_plural= _(u'G - IVA')

class tax(models.Model):
	taxId=models.IntegerField(verbose_name= _(u"Quota Trimestral"), unique=True, db_index=True)
	min_base=models.IntegerField(verbose_name= _(u"Base imposable Mínima"))
	max_base=models.IntegerField(verbose_name= _(u"Base imposable Màxima"))

	class Meta:
		verbose_name=_(u'A - Taula quotes')
		verbose_name_plural=_(u'A - Taula quotes')
 
class coop(models.Model):
	name=models.CharField(verbose_name=_(u"Nom"), unique=True, db_index=True, max_length=200)

	def __unicode__(self):
		return self.name

	class Meta:
		verbose_name= _(u'B - Cooperativa')
		verbose_name_plural= _(u'B - Cooperatives')
class cooper(models.Model):
	user=models.OneToOneField(User, verbose_name=_(u"Nom"))
	coop=models.ForeignKey(coop, verbose_name=_(u"Cooperativa"))
	coop_number=models.IntegerField(verbose_name=_(u"nº COOP"), unique=True, db_index=True, max_length=4)
	IVA_assignat=models.IntegerField(verbose_name=_(u"IVA Assignat"), help_text=_(u"Aquest és el valor % d'IVA assignat fruit de l'avaluació social."), max_length=2, validators=[MinValueValidator(0), MaxValueValidator(100)], default=0)
	extra_days=models.IntegerField(verbose_name=_(u"Dies extra"), help_text=_(u"Dies extra que pot editar el trimestre en curs."), max_length=2, default=0)
	preTAX=models.DecimalField(verbose_name=_(u'Quota avançada (€)'), help_text=_(u"Quota que s'aplicarà el primer trimestre"), decimal_places=2, max_digits=10, default=0)

	def __unicode__(self):
		return "COOP%s" % ("%04d" % (self.coop_number))

	def __getitem__(self, value):
		return self.id

	def email( self ):
		return self.user.email
	email.short_description=_(u"Email")

	class Meta:
		verbose_name= _(u'E - Soci')
		verbose_name_plural= _(u'E - Socis')

class client(models.Model):
	name=models.CharField(verbose_name=_(u"Nom Fiscal"), help_text=_(u"El nom fiscal del client a qui es factura. Ex. SOM EL QUE SOM SL"), max_length=200)
	CIF=models.CharField(verbose_name=_(u"CIF/NIF/NIE"), blank=True, null=True, help_text=_(u"NIF:12345678A - CIF: A12345678 - NIE: X12345678A del client a qui es factura."), max_length=30)
	otherCIF=models.CharField(verbose_name=_(u"Altres identificadors"), null=True, blank=True, help_text=_(u"Camps no NIF/CIF/NIE del client a qui es factura."), max_length=50)
	def __unicode__(self):
		if self.CIF is None or self.CIF == "":
			idcode=self.otherCIF
		else:
			idcode=self.CIF
		return self.name + ' - ' + idcode

	class Meta:
		verbose_name=_(u'B - Client')
		verbose_name_plural=_(u'B - Clients')
class provider(models.Model):
	name=models.CharField(verbose_name=_(u"Nom Fiscal"), help_text=_(u"El nom fiscal del proveïdor a qui es factura. Ex. SOM EL QUE SOM SL"), max_length=200)
	CIF=models.CharField(verbose_name=_(u"CIF / NIF / NIE"), blank=True, null=True, help_text=_(u"NIF:12345678A - CIF: A12345678 - NIE: X12345678A del proveïdor a qui es factura."), max_length=200)
	otherCIF=models.CharField(verbose_name=_(u"Altres identificadors"), null=True, blank=True, help_text=_(u"Camps no CIF / NIF / NIE del proveïdor a qui es factura."), max_length=50)
	iban=models.CharField(verbose_name=_(u"IBAN"), blank=True, null=True, max_length=20)
	def __unicode__(self):
		if self.CIF is None or self.CIF == "":
			idcode=self.otherCIF
		else:
			idcode=self.CIF
		return self.name + ' - ' + idcode
	class Meta:
		verbose_name=_(u'C - Proveïdor')
		verbose_name_plural=_(u'C - Proveïdors')

class period(models.Model):
	label=models.CharField(verbose_name=_(u"Títol"), max_length=200)
	first_day=models.DateField(verbose_name=_(u"Inici"), help_text=_(u"Primer dia del període"))
	date_open=models.DateField(verbose_name=_(u"Obert"))
	date_close=models.DateField(verbose_name=_(u"Tancat"))
	exported=models.BooleanField (verbose_name=_("Exported"), help_text=_("exported and archived after closing"), default=False)
	def period(self):
		return ('%s %s') % (self.label, self.first_day.year)

	def __unicode__(self):
		return ('%s %s') % (self.first_day.year, self.label)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u'0 - Dates Trimestre')
		verbose_name_plural= _(u'0 - Dates Trimestres')

class invoice (models.Model):
	type_invoice= (
		(0, _(u'Sales')),
		(1, _(u'Purchase')),
	)
	type= models.IntegerField(verbose_name=_(u"Tipus"), help_text=_(u"Tipus de factura, emesa o despesa"), choices=type_invoice, default=0)
	period= models.ForeignKey(period, verbose_name=_(u'Trimestre'), default=1)
	cooper= models.ForeignKey(cooper, null=False, blank=False, verbose_name=_(u"nº COOP"))
	date= models.DateField(verbose_name=_(u"Data"), help_text=_(u"La data d'emissió de la factura. Exemple dd/mm/aaaa"))
	who_manage_choices=(
		(0, _(u'Gestionat per la socia')),
		(1, _(u'Gestionat per la cooperativa')),
	)
	who_manage= models.IntegerField(
		verbose_name=_(u"Forma de pagament"), 
		help_text=_(u"Si selecciona la opció 'desde la cooperativa' haurà d'ampliar informació."), 
		choices=who_manage_choices, 
		default=0
	)
	dateTransfer= models.DateField(verbose_name=_(u"Data de liquidació"), help_text=_(u"La data en que es liquida la factura. Exemple dd/mm/aaaa"), blank=True, null=True)
	class Meta:
		abstract=True
class sales_invoice (invoice):
	num=models.IntegerField(verbose_name=_(u"Nº Factura"), help_text=_(u"Número Factura: COOPXXXX/any/XXXX. Introduïu només el número final."))
	statuses=(
		(0, _(u'Pendent de rebre la transferència')),
		(1, _(u'Transferència rebuda')),
	)
	status=models.IntegerField(
		verbose_name=_("Estat"), 
		help_text=_(u"Indica l'estat de la transferència"), 
		choices=statuses, 
		null=True,
		blank=True
	)
	def number(self):
		return '%s/%s/%s'%( self.cooper, self.date.year, "%03d" % (self.num) )
	number.short_description =_(u"Nº Factura")
	client=models.ForeignKey(client, verbose_name=_(u"Client"))
	
	def __unicode__(self):
			return self.number()
	def __getitem__(self, value):
			return self.pk
	def value(self):
		value=0
		for line in sales_line.objects.filter(sales_invoice=self.pk):
			value += line.value
		return value
	value.short_description=_(u"Base Imposable (€)")
	def invoicedVAT(self):
		value=0
		for line in sales_line.objects.filter(sales_invoice=self.pk):
			value += line.invoicedVAT()
		return value
	invoicedVAT.short_description=_(u"IVA Facturat (€)")
	def assignedVAT(self):
		value=0
		for line in sales_line.objects.filter(sales_invoice=self.pk):
			value += line.assignedVAT()
		return value
	assignedVAT.short_description=_(u"IVA Assignat (€)")
	def total(self):
		value=0
		for line in sales_line.objects.filter(sales_invoice=self.pk):
			value += line.total()
		return value
	total.short_description=_(u'Total Factura  (€)')
	class Meta:
		verbose_name=_(u'1 - Factura Emesa')
		verbose_name_plural=_(u'1 - Factures Emeses')
		unique_together=('cooper', 'period', 'num')
class purchases_invoice (invoice):
	num=models.IntegerField(verbose_name=_(u"Nº Factura"), help_text=_(u"Número Factura."))

	provider=models.ForeignKey(provider, verbose_name=_(u"Proveïdor"))
	statuses=(
		(0, _(u'Esperant data de venciment')),
		(1, _(u'Pendent de rebre la transferència')),
		(2, _(u'Transferència rebuda')),
	)
	status=models.IntegerField(
		verbose_name=_("Estat"), 
		help_text=_(u"Indica l'estat de la transferència"), 
		choices=statuses, 
		null=True,
		blank=True
	)
	def number(self):
		return "%08d" % (self.num,)
	number.short_description =_(u"Nº Factura")
	def value(self):
		value=0
		for line in purchases_line.objects.filter(purchases_invoice=self.pk):
			value += line.value
		return value
	value.short_description=_(u"Base Imposable (€)")
	def expencedVAT(self):
		value=0
		for line in purchases_line.objects.filter(purchases_invoice=self.pk):
			value += line.expencedVAT()
		return value
	expencedVAT.short_description=_(u"IVA Facturat (€)")
	def IRPFRetention(self):
		value=0
		for line in purchases_line.objects.filter(purchases_invoice=self.pk):
			value += line.IRPFRetention()
		return value
	IRPFRetention.short_description=_(u"IRPF (€)")
	def total(self):
		value=0
		for line in purchases_line.objects.filter(purchases_invoice=self.pk):
			value += line.total()
		return value
	def __unicode__(self):
		return  unicode(self.num) 
	class Meta:
		verbose_name=_(u'2 - Factura Despesa')
		verbose_name_plural=_(u'2 - Factures Despeses')

class sales_line (models.Model):
	sales_invoice=models.ForeignKey(sales_invoice)
	percentInvoicedVAT=models.ForeignKey(vats, verbose_name=_(u"IVA Facturat (%)"), help_text=_(u"El % d'IVA que s'aplica en la factura. Indicar un valor d'IVA per concepte"))
	value=models.DecimalField(verbose_name=_(u'Base Imposable (€)'), help_text=_(u"La Base Imposable de la factura. Exemple 1000,30 . Indicar una coma pels decimals."), decimal_places=2, max_digits=10)
	def percentAssignedVAT(self):
		iva_assignat=0
		if self.sales_invoice.cooper:
			iva_assignat=cooper.objects.get(pk=self.sales_invoice.cooper.pk).IVA_assignat
		iva_oficial=self.percentInvoicedVAT.value

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
	percentAssignedVAT.short_description=_(u"IVA Assignat (%)")
	percentAssignedVAT.admin_order_field='user__soci__IVA_assignat'
	def invoicedVAT(self):
		amount=Decimal ( "%.2f" % float((self.percentInvoicedVAT.value*self.value) / 100 ))
		return amount
	invoicedVAT.decimal=True
	invoicedVAT.short_description=_(u'IVA Facturat (€)')
	def assignedVAT(self):
		amount=Decimal ( "%.2f" % float((self.percentAssignedVAT()*self.value) / 100))
		return amount
	assignedVAT.decimal=True
	assignedVAT.short_description=_(u'IVA Assignat (€)')
	def total(self):
		return self.value + self.invoicedVAT()
	total.integer=True
	total.short_description=_(u'Total Factura  (€)')
	def __unicode__(self):
		return ""
	class Meta:
		verbose_name=_(u'Línia de factura')
		verbose_name_plural=_(u'Línies de factura')
class purchases_line (models.Model):
	purchases_invoice=models.ForeignKey(purchases_invoice)
	value=models.DecimalField(verbose_name=_(u'Base Imposable (€)'), help_text=_(u"La Base Imposable de la factura. Exemple 1000,30 . Indicar una coma pels decimals."), decimal_places=2, max_digits=10)
	percentExpencedVAT=models.ForeignKey(vats, verbose_name=_(u'IVA (%)'), help_text=_(u"El % d'IVA que s'aplica en la factura."))
	percentIRPFRetention=models.IntegerField(verbose_name=_(u'IRPF (%)'), help_text=_(u"El % de retenció de IRPF (Només en lloguers i factures de persones físiques)."), default=0, validators=[MinValueValidator(0), MaxValueValidator(100)])
	def expencedVAT(self):
		amount=Decimal ( "%.2f" % ((self.percentExpencedVAT.value*self.value) / 100))
		return amount
	expencedVAT.decimal=True
	expencedVAT.short_description=_(u'IVA (€)')
	def IRPFRetention(self):
		amount=Decimal ( "%.2f" % ((self.percentIRPFRetention*self.value) / 100))
		return amount
	IRPFRetention.decimal=True
	IRPFRetention.short_description=_(u'IRPF (€)')
	def total(self):
		return self.value + self.expencedVAT() - self.IRPFRetention()
	total.decimal=True
	total.short_description=_(u'Total Factura (€)')
	def __unicode__(self):
		return ""
class movement (models.Model):
	cooper=models.ForeignKey(cooper, null=False, blank=False, verbose_name=_(u"nº COOP"))
	movement_types=(
		(0, _(u'Sales')),
		(1, _(u'Purchase')),
	)
	type= models.IntegerField(
		verbose_name=_(u"Tipus"), 
		help_text=_(u"Tipus de moviment"), 
		choices=movement_types
	)
	movement_status=(
		(0, _(u'Pendent')),
		(1, _(u'Efectuat')),
	)
	status=models.IntegerField(
		verbose_name=_("Estat"), 
		help_text=_(u"Indica l'estat del moviment"), 
		choices=movement_status
	)
	date=models.DateField(
		verbose_name=_(u"Data"), 
		help_text=_(u"La data de petició. Exemple dd/mm/aaaa")
	)
	value=models.DecimalField(
		verbose_name=_(u'Import u.m.'), 
		help_text=_(u"Import en unitats monetàries"), 
		decimal_places=2, 
		max_digits=10
	)
	currency=models.ForeignKey(
		currencies, 
		null=True, 
		blank=True, 
		verbose_name=_("Moneda"), 
		help_text=_(u"Indica el tipus de moneda del moviment")
	)
	class Meta:
		abstract=True
class sales_movement( movement ):
	planned_date=models.DateField(verbose_name=_(u"Data previsió"), help_text=_(u"La data prevista. Exemple dd/mm/aaaa"))
	execution_date=models.DateField(verbose_name=_(u"Data de realització"), null=True, blank=True, help_text=_(u"La data en que es realitza. Exemple dd/mm/aaaa"))
class purchases_movement( movement ):
	petition_date=models.DateField(verbose_name=_(u"Data previsió"), help_text=_(u"La data de petició. Exemple dd/mm/aaaa"))
	acceptation_date=models.DateField(verbose_name=_(u"Data de realització"), help_text=_(u"La data en que s'accepta. Exemple dd/mm/aaaa"))
	execution_date=models.DateField(verbose_name=_(u"Data de realització"), help_text=_(u"La data en que es realitza. Exemple dd/mm/aaaa"))

''' 
EMAIL NOTIFICATION SYSTEM
'''
class Email(models.Model):
	efrom=models.EmailField(verbose_name=_(u"Remitent"), help_text="", max_length=75, default="gee@gestion.org")
	eto=models.CharField(verbose_name=_(u"Destinatari"), help_text="", max_length=75, default="camp reservat pel sistema")
	subject=models.CharField(verbose_name=_(u"Assumpte"), max_length=200)
	body=models.TextField(verbose_name=_(u'Cos'))
	is_active=models.BooleanField (verbose_name=_(u"Activat"), default=1)

	def __unicode__(self):
		return self.subject
class EmailNotification(Email):
	period=models.ForeignKey(period)

	notification_sent_tos=(
		(0, _(u'Tots els socis')),
		(1, _(u'Socis que han tancat')),
		(2, _(u'Socis que NO han tancat')),
		(3, _(u'Usuari')),
	)
	sent_to_user=models.ForeignKey(User, null=True, blank=True, verbose_name=_(u"A Soci"), help_text=_(u"Per la opció -Usuari-"))
	notification_types=(
		(0, _(u'El primer dia del periode')),
		(1, _(u'X dies avanç de tancar')),
		(2, _(u'Dia de tancament')),
		(3, _(u'El dia senyalat'))
	)
	ento=models.IntegerField(verbose_name=_(u"Destinataris"), help_text=_(u"A qui s'envia"), choices=notification_sent_tos)
	notification_type=models.IntegerField(verbose_name=_(u"Tipus"), help_text=_(u"Quan s'executa"), choices=notification_types)
	pointed_date=models.DateField(verbose_name=_(u"Senyalar dia"), help_text=_(u"Per l'opció -El dia senyalat-"), default=datetime.now())
	offset_days=models.IntegerField(verbose_name=_(u"Dies avanç de tancar"), help_text='', max_length=2, default=0)

	def sent_to_user_filter( self ):
		if self.ento == 3:
			return self.sent_to_user
		else:
			return ' -- '
	sent_to_user_filter.short_description=_(u"Destinatari")

	def pointed_date_filter( self ):
		if self.ento == 3:
			return self.pointed_date
		else:
			return " -- "
	pointed_date_filter.short_description=_(u"Dia senyalat")

	def execution_date ( self ):
		notification_functions=(
			(0, self.period.date_open),
			(1, self.period.date_close - timedelta(days=self.offset_days) ),
			(2, self.period.date_close),
			(3, self.pointed_date),
		)	
		return str(notification_functions[int(self.notification_type)][1])
	execution_date.short_description=_(u"Data d'execució")

	def get_all_coopers( self ):
		qs_coopers=cooper.objects.all()
		coopers_mails=set(str(cooper.user.email) for cooper in qs_coopers)
		#existing_coopers=filter(lambda x: x.cooper.user.email not in coopers_mails, existing_coopers)
		return list(coopers_mails)
	def get_all_coopers_closed( self ):
		#All coopers
		qs_coopers=cooper.objects.all()
		#Closed periods
		qs_periods=PeriodClose.objects.filter(period=self.period, closed=True)
		#Fill lists
		closed_mails=set(cooper.user.email for cooper in qs_periods)
		coopers_mails=set(cooper.user.email for cooper in qs_coopers)
		#Filter
		existing_coopers=[]
		existing_coopers=filter(lambda x: str(x) in closed_mails, coopers_mails)
		#Return
		return list(existing_coopers)
	def get_all_coopers_opened( self ):
		#All coopers
		qs_coopers=cooper.objects.all()
		#Closed periods
		qs_periods=PeriodClose.objects.filter(period=self.period, closed=True)
		#Fill lists
		closed_mails=set(cooper.user.email for cooper in qs_periods)
		coopers_mails=set(cooper.user.email for cooper in qs_coopers)
		#Filter
		existing_coopers=[]
		existing_coopers=filter(lambda x: str(x) not in closed_mails, coopers_mails)
		#Return
		return list(existing_coopers)
	def get_cooper( self ):
		return self.sent_to_user.email
	def get_notification_emails_list ( self ):
		notification__sent_to_functions=(
			(0, 'get_all_coopers'),
			(1, 'get_all_coopers_closed' ),
			(2, 'get_all_coopers_opened'),
			(3, 'get_cooper'),
		)
		return getattr(self, notification__sent_to_functions[int(self.ento)][1])()

	def on_time ( self ):
		return self.is_active and bool ( datetime.now() > datetime.strptime( str( self.execution_date() ), '%Y-%M-%d'))
	on_time.boolean= True
	on_time.short_description=_(u"Pendent d'execució")

	def __getitem__(self, value):
		return self

	class Meta:
		verbose_name=_(u'F - Notificacions correu')
		verbose_name_plural=_(u'F - Notificacions correu')

'''
IMPORT SOCI
'''
from django.db import models
from csvimport.conf import settings
from copy import deepcopy
from django.core.files.storage import FileSystemStorage
import re

fs=FileSystemStorage(location=settings.MEDIA_ROOT)
CHOICES=(('manual', 'manual'), ('cronjob', 'cronjob'))

# Create your models here.
if not settings.CSVIMPORT_MODELS:
    MODELS=['%s.%s' % (m._meta.app_label,
       m.__name__) for m in models.loading.get_models()
       if m._meta.app_label != 'contenttypes']
else:
    MODELS=["cooper"]

MODELS=tuple([(m, m) for m in MODELS])

class CSVImport(models.Model):
	""" Logging model for importing files """
	model_name=models.CharField(max_length=255, blank=False,
		default='iisharing.Item',
		help_text='Please specify the app_label.model_name',
		choices=MODELS)
	field_list=models.CharField(max_length=255, blank=True,
		        help_text='''Enter list of fields in order only if
		   you dont have a header row with matching field names, eg.
		   "column1=shared_code,column2=org(Organisation|name)"''')
	upload_file=models.FileField(upload_to='csv', storage=fs)
	file_name=models.CharField(max_length=255, blank=True)
	encoding=models.CharField(max_length=32, blank=True)
	upload_method=models.CharField(blank=False, max_length=50,
		   default='manual', choices=CHOICES)
	error_log=models.TextField(help_text=_(u'Cada línea es un error.'))
	import_date=models.DateField(auto_now=True)
	import_user=models.CharField(max_length=255, default='anonymous',
		 help_text=_(u'Usuari id en text'), blank=True)

	def error_log_html(self):
		return self.error_log
		error_log_html.allow_tags=True

	def __unicode__(self):
		return self.upload_file.name

	class Meta:
		verbose_name= _(u'Importar CSV (Socis,...)')
		verbose_name_plural= _(u'Importar CSV (Socis,...)')
