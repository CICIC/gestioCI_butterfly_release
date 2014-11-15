#encoding=utf-8

from django.db import models
from django.contrib import messages
from mptt.models import MPTTModel
from mptt.fields import TreeForeignKey, TreeManyToManyField
from django.utils.translation import ugettext_lazy as _
from django.utils.translation import gettext as __
from decimal import Decimal
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from datetime import date, timedelta, datetime
from csvimport.models import CSVImport
from django.core.validators import MaxValueValidator, MinValueValidator, RegexValidator
from General.models import Concept, Company

from Welcome.models import iC_Record, iC_Membership

alphanumeric = RegexValidator(r'^[0-9a-zA-Z]*$', _(u"Nomès números i lletres") )
class type(Concept):	# create own ID's
	clas = models.CharField(blank=True, verbose_name=_(u"Clase"), max_length=200,
													help_text=_(u"Model de django o classe python associada al Tipus CI"))
	class Meta:
		verbose_name = _(u"c- Tipus ")

	def __unicode__(self):
		if self.clas is None or self.clas == '':
			if self:
				return self.name
			else:
				return "iC_Type vacio"
		else:
			return self.name+' ('+self.clas+')'


class currencies(models.Model):
	name=models.CharField(verbose_name=_(u"Nom"), max_length=20, help_text=_(u"Nom del tipus de moneda"))
	def __unicode__(self):
		return unicode(self.name)

	class Meta:
		verbose_name= _(u'H - Moneda')
		verbose_name_plural= _(u'H - Monedes')


class iC_Duty(iC_Record):
	ic_record = models.OneToOneField('Welcome.iC_Record', primary_key=True, parent_link=True)
	value=models.IntegerField(verbose_name=_(u'IVA'), unique=True, db_index=True, validators=[MinValueValidator(0), MaxValueValidator(100)])

	def __unicode__(self):
		return unicode(self.value)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u'IVA')
		verbose_name_plural= _(u'IVAs')


class vats(iC_Record):
	ic_record = models.OneToOneField('Welcome.iC_Record', primary_key=True, parent_link=True)
	value=models.IntegerField(verbose_name=_(u'IVA'), unique=True, db_index=True, validators=[MinValueValidator(0), MaxValueValidator(100)])

	def __unicode__(self):
		return unicode(self.value)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u'IVA')
		verbose_name_plural= _(u'IVAs')


class iC_Tax(iC_Record):
	ic_record = models.OneToOneField('Welcome.iC_Record', primary_key=True, parent_link=True)
	value=models.DecimalField(verbose_name=_(u'Quota Trimestral'), decimal_places=2, max_digits=10, unique=True, db_index=True)
	min_base=models.IntegerField(verbose_name= _(u"Base imposable Mínima"))
	max_base=models.IntegerField(verbose_name= _(u"Base imposable Màxima"))
	def __unicode__(self):
		if self.id:
			return _("Cuota de %s por base entre %s y %s (Eur)") %( str(self.value), str(self.min_base), str(self.max_base))

	class Meta:
		verbose_name=_(u'A - Taula quotes')
		verbose_name_plural=_(u'A - Taula quotes')
 

class coop(models.Model):
	name=models.CharField(verbose_name=_(u"Nom"), unique=True, db_index=True, max_length=200)

	def __unicode__(self):
		return self.name

	class Meta:
		verbose_name= _(u'I - Cooperativa')
		verbose_name_plural= _(u'I - Cooperatives')


class company(Company):
	name=models.CharField(verbose_name=_(u"Nom Fiscal"), help_text=_(u"El nom fiscal del client a qui es factura. Ex. SOM EL QUE SOM SL"), max_length=200)
	CIF=models.CharField(verbose_name=_(u"CIF/NIF/NIE"), blank=True, null=True, help_text=_(u"NIF:12345678A - CIF: A12345678 - NIE: X12345678A del client a qui es factura."), max_length=30)
	otherCIF=models.CharField(verbose_name=_(u"Altres identificadors"), null=True, blank=True, help_text=_(u"Camps no NIF/CIF/NIE del client a qui es factura."), max_length=50)

	def __unicode__(self):
		if self.CIF is None or self.CIF == "":
			idcode=self.otherCIF
		else:
			idcode=self.CIF
		return self.name + ' - ' + idcode


class client(company):
	class Meta:
		verbose_name=_(u'B - Client')
		verbose_name_plural=_(u'B - Clients')


class provider(company):
	iban=models.CharField(verbose_name=_(u"IBAN"), blank=True, null=True, max_length=20)

	class Meta:
		verbose_name=_(u'C - Proveïdor')
		verbose_name_plural=_(u'C - Proveïdors')


class cooper(models.Model):
	user=models.OneToOneField(User, verbose_name=_(u"Nom"))
	coop=models.ForeignKey(coop, verbose_name=_(u"Cooperativa"))
	coop_number=models.IntegerField(verbose_name=_(u"nº COOP"), unique=True, db_index=True, max_length=4)
	assigned_vat=models.IntegerField(verbose_name=_(u"IVA Assignat"), help_text=_(u"Aquest és el valor % d'IVA assignat fruit de l'avaluació social."), max_length=2, validators=[MinValueValidator(0), MaxValueValidator(100)], default=0)
	extra_days=models.IntegerField(verbose_name=_(u"Dies extra"), help_text=_(u"Dies extra que pot editar el trimestre en curs."), max_length=2, default=0)
	advanced_tax=models.DecimalField(verbose_name=_(u'Quota avançada (€)'), help_text=_(u"Quota que s'aplicarà el primer trimestre"), decimal_places=2, max_digits=10, default=0)
	clients = models.ManyToManyField(client, verbose_name=_(u"Clients"))
	providers = models.ManyToManyField(provider, verbose_name=_(u"Proveïdors"))
	membership = models.ForeignKey('Welcome.iC_Membership', verbose_name=_(u"rel_to_new_system"), blank=True, null=True)
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

class cooper_proxy_companies(cooper):
	class Meta:
		verbose_name= _(u'B - Els meus clients i proveïdors')
		verbose_name_plural= _(u'B - Els meus clients i proveïdors')
		proxy = True

class cooper_proxy_balance(cooper):

	class Meta:
		verbose_name= _(u'L - Balanç projecte')
		verbose_name_plural= _(u'L - Balanç projectes')
		proxy = True

class iC_Period(iC_Record):
	ic_record = models.OneToOneField('Welcome.iC_Record', primary_key=True, parent_link=True)
	label=models.CharField(verbose_name=_(u"Títol"), max_length=200)
	first_day=models.DateField(verbose_name=_(u"Inici"), help_text=_(u"Primer dia del període"))
	date_open=models.DateField(verbose_name=_(u"Obert"))
	date_close=models.DateField(verbose_name=_(u"Tancat"))
	exported=models.BooleanField (verbose_name=_("Archivat"), help_text=_(u"Administració ha exportat els registres CSV del període."), default=False)

	def __unicode__(self):
		return ('%s %s') % (self.first_day.year, self.label)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u"G - Trimestres")
		verbose_name_plural= _(u"G - Trimestres")

class period(models.Model):
	label=models.CharField(verbose_name=_(u"Títol"), max_length=200)
	first_day=models.DateField(verbose_name=_(u"Inici"), help_text=_(u"Primer dia del període"))
	date_open=models.DateField(verbose_name=_(u"Obert"))
	date_close=models.DateField(verbose_name=_(u"Tancat"))
	exported=models.BooleanField (verbose_name=_("Archivat"), help_text=_(u"Administració ha exportat els registres CSV del període."), default=False)

	def __unicode__(self):
		return ('%s %s') % (self.first_day.year, self.label)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u"G - Trimestres")
		verbose_name_plural= _(u"G - Trimestres")

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


class invoice(iC_Record):
	ic_record = models.OneToOneField('Welcome.iC_Record', primary_key=True, parent_link=True)
	human = models.ForeignKey('General.Human', related_name='out_invoices', verbose_name=_(u"Ens pagador"))
	project = TreeForeignKey('General.Project', related_name='in_invoices', verbose_name=_(u"Projecte receptor"))
	ic_membership = models.ForeignKey('Welcome.iC_Membership', related_name='invoices_membership', blank=True, null=True, verbose_name=_(u"Registre de Soci"))

	amount = models.DecimalField(default=0, max_digits=6, decimal_places=2, verbose_name=_(u"Import"))
	unit = models.ForeignKey('General.Unit', verbose_name=_(u"Unitat"))

	lines = models.ForeignKey('Finances.invoice_line', related_name='rel_lines', blank=True, null=True, verbose_name=_(u"Línes"))
	def _ic_membership(self):
		#print 'ic_MEMBERSHIP'
		#print self.membership.all()
		if hasattr(self, 'membership') and self.membership:
			return self.membership.first()
		else:
			return 'none'
	_ic_membership.allow_tags = True
	_ic_membership.short_description = _(u"Registre de Soci")
	def _ic_selfemployed(self):
		#print 'ic_SELFEMPLOYED'
		if hasattr(self, 'selfemployed'):
			#print self.selfemployed.all()
			return self.selfemployed.first()
		else:
			return 'none'
	_ic_selfemployed.allow_tags = True
	_ic_selfemployed.short_description = _(u"Registre d'Autoocupat")

	issue_date = models.DateField(default=datetime.today, blank=True, null=True, verbose_name=_(u"Data d'emisió"))
	deadline_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de venciment"))
	payment_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de pagament"))
	payment_type = TreeForeignKey('Welcome.Payment_Type', blank=True, null=True, verbose_name=_(u"Forma de pagament"))

	rel_account = models.ForeignKey('General.Record', related_name='rel_invoices', blank=True, null=True, verbose_name=_(u"Compte relacionat"))

	def __unicode__(self):
		if self.record_type is None:
			#record_type = "<record:type.name>"
			return 'Invoice ??: ['+str(self.amount)+' '+self.unit.code+']'
		else:
			record_type = self.record_type.name
		return record_type +': ['+str(self.amount)+' '+self.unit.code+']'#' > '+self.project.nickname

	period= models.ForeignKey(period, verbose_name=_(u'Trimestre'))
	cooper= models.ForeignKey(cooper, verbose_name=_(u"nº COOP"))
	date= models.DateField(verbose_name=_(u"Data"), help_text=_(u"La data d'emissió de la factura. Exemple dd/mm/aaaa"))
	expiring_date=models.DateField(verbose_name=_(u"Data venciment"), help_text=_(u"La data de venciment. Exemple dd/mm/aaaa"), null=True, blank=True)
	who_manage= models.IntegerField(
		verbose_name=_(u"Forma de pagament"), 
		help_text=_(u"Si selecciona la opció 'desde la cooperativa' haurà d'ampliar informació."), 
		choices=who_manage_CHOICES, 
		default=0
	)

	transfer_date= models.DateField(
		verbose_name=_(u"Data de liquidació"), 
		help_text=_(u"La data en que es liquida la factura. Exemple dd/mm/aaaa"), 
		blank=True, null=True
	)

	def status(self):
		if self.who_manage == manage_CHOICE_COOPER:
			return status_CHOICE_NONE
		if self.date is None:
			return None
		status = None
		if self.transfer_date is None:
			if self.expiring_date:
				if date.today() < self.expiring_date:
					status = status_CHOICE_WAITING
				else:
					status = status_CHOICE_PENDING
			else:
				status = status_CHOICE_PENDING
		else:
			status = status_CHOICE_DONE  
		return status
	status.short_description = _(u"Estat")

	class Meta:
		abstract=False
		verbose_name = _(u"Factura")
		verbose_name_plural = _(u"Factures")


class sales_invoice(invoice):
	invoice = models.OneToOneField('Finances.invoice', primary_key=True, parent_link=True)
	num=models.IntegerField(verbose_name=_(u"Nº Factura"), help_text=_(u"Número Factura: COOPXXXX/any/XXXX. Introduïu només el número final."))
	client=models.ForeignKey(client, related_name="sales_invoice_clients", verbose_name=_(u"Client"))

	def number(self):
		return '%s/%s/%s'%( self.cooper, self.date.year, "%03d" % (self.num) )
	number.short_description =_(u"Nº Factura")

	def value(self):
		value=0
		for line in sales_line.objects.filter(sales_invoice=self.pk):
			value += line.value
		return value
	value.short_description=_(u"Base Imposable (€)")

	def invoiced_vat(self):
		value=0
		for line in sales_line.objects.filter(sales_invoice=self.pk):
			value += line.invoiced_vat()
		return value
	invoiced_vat.short_description=_(u"IVA Facturat (€)")

	def assigned_vat(self):
		value=0
		for line in sales_line.objects.filter(sales_invoice=self.pk):
			value += line.assigned_vat()
		return value
	assigned_vat.short_description=_(u"IVA Assignat (€)")

	def total(self):
		value = Decimal("0.00")
		for line in sales_line.objects.filter(sales_invoice=self.pk):
			value += line.total() 
		return value
	total.short_description=_(u'Total Factura (€)')

	def __unicode__(self):
		return self.number()

	def __getitem__(self, value):
		return self.pk

	class Meta:
		verbose_name=_(u'01 - Factura Emesa')
		verbose_name_plural=_(u'01 - Factures Emeses')
		unique_together=('cooper', 'period', 'num')


class purchases_invoice(invoice):
	invoice = models.OneToOneField('invoice', primary_key=True, parent_link=True)
	num=models.IntegerField(verbose_name=_(u"Nº Factura"), help_text=_(u"Número Factura."),  validators=[alphanumeric])
	provider=models.ForeignKey(provider, verbose_name=_(u"Proveïdor"))

	def number(self):
		return "%08d" % (self.num,)
	number.short_description =_(u"Nº Factura")

	def value(self):
		value=0
		for line in purchases_line.objects.filter(purchases_invoice=self.pk):
			value += line.value
		return value
	value.short_description=_(u"Base Imposable (€)")

	def vat(self):
		value=0
		for line in purchases_line.objects.filter(purchases_invoice=self.pk):
			value += line.vat()
		return value

	vat.short_description=_(u"IVA Facturat (€)")

	def irpf(self):
		value=0
		for line in purchases_line.objects.filter(purchases_invoice=self.pk):
			value += line.irpf()
		return value
	irpf.short_description=_(u"IRPF (€)")

	def total(self):
		value = Decimal("0.00")
		for line in purchases_line.objects.filter(purchases_invoice=self.pk):
			value += line.total()
		return value
	total.short_description=_(u'Total Factura (€)')

	def __unicode__(self):
		return  unicode(self.num) 

	class Meta:
		verbose_name=_(u'02 - Factura Despesa')
		verbose_name_plural=_(u'02 - Factures Despeses')


class invoice_line(iC_Record):
	ic_record = models.OneToOneField('Welcome.iC_Record', primary_key=True, parent_link=True)
	value=models.DecimalField(verbose_name=_(u'Base Imposable (€)'), help_text=_(u"La Base Imposable de la factura. Exemple 1000,30 . Indicar una coma pels decimals."), decimal_places=2, max_digits=10)

class sales_line (invoice_line):
	line = models.OneToOneField('Finances.invoice_line', primary_key=True, parent_link=True)
	percent_invoiced_vat=models.ForeignKey(iC_Duty, verbose_name=_(u"IVA Facturat (%)"), help_text=_(u"El % d'IVA que s'aplica en la factura. Indicar un valor d'IVA per concepte"))

	def percent_assigned_vat(self):
		from Finances.bots import bot_assigned_vat
		return bot_assigned_vat (self.sales_invoice.cooper, self.percent_invoiced_vat).assigned_vat
	percent_assigned_vat.short_description=_(u"IVA Assignat (%)")
	percent_assigned_vat.admin_order_field='user__soci__assigned_vat'

	def invoiced_vat(self):
		amount=Decimal ( "%.2f" % float((self.percent_invoiced_vat.value*self.value) / 100 ))
		return amount
	invoiced_vat.decimal=True
	invoiced_vat.short_description=_(u'IVA Facturat (€)')

	def assigned_vat(self):
		amount=Decimal ( "%.2f" % float((self.percent_assigned_vat()*self.value) / 100))
		return amount
	assigned_vat.decimal=True
	assigned_vat.short_description=_(u'IVA Assignat (€)')

	def total(self):
		return self.value + self.invoiced_vat()
	total.integer=True
	total.short_description=_(u'Total Factura (€)')

	def __unicode__(self):
		return ""

	class Meta:
		verbose_name=_(u'Línia de factura emesa')
		verbose_name_plural=_(u'Línies de factura emesa')

class purchases_line (invoice_line):
	line = models.OneToOneField('Finances.invoice_line', primary_key=True, parent_link=True)
	percent_vat=models.ForeignKey(iC_Duty, verbose_name=_(u'IVA (%)'), help_text=_(u"El % d'IVA que s'aplica en la factura."))
	percent_irpf=models.IntegerField(verbose_name=_(u'IRPF (%)'), help_text=_(u"El % de retenció de IRPF (Només en lloguers i factures de persones físiques)."), default=0, validators=[MinValueValidator(0), MaxValueValidator(100)])

	def vat(self):
		amount=Decimal ( "%.2f" % ((self.percent_vat.value*self.value) / 100))
		return amount
	vat.decimal=True
	vat.short_description=_(u'IVA (€)')

	def irpf(self):
		amount=Decimal ( "%.2f" % ((self.percent_irpf*self.value) / 100))
		return amount
	irpf.decimal=True
	irpf.short_description=_(u'IRPF (€)')

	def total(self):
		return self.value + self.vat() + self.irpf()
	total.decimal=True
	total.short_description=_(u'Total Factura (€)')

	def __unicode__(self):
		return ""

	class Meta:
		verbose_name=_(u'Línia de factura despesa')
		verbose_name_plural=_(u'Línies de factura despesa')


class movement (iC_Record):
	cooper=models.ForeignKey(cooper, null=False, blank=False, verbose_name=_(u"nº COOP"))
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
	currency=models.ForeignKey(
		currencies, 
		null=False, 
		blank=False, 
		verbose_name=_("Moneda"), 
		help_text=_(u"Indica el tipus de moneda del moviment")
	)
	def status(self):
		if self.execution_date is None:
			return status_CHOICE_PENDING
		else:
			return status_CHOICE_DONE
	status.short_description = _(u"Estat")

	def __unicode__(self):
		from Finances.bots import bot_currency
		return bot_currency(self.currency).get_change(self.value)
	class Meta:
		abstract=True

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
class purchases_movement( movement ):
	petition_date=models.DateField(verbose_name=_(u"Data previsió"), help_text=_(u"La data de petició. Exemple dd/mm/aaaa"))
	acceptation_date=models.DateField(verbose_name=_(u"Data d'acceptament"), help_text=_(u"La data en que s'accepta. Exemple dd/mm/aaaa"), null=True, blank=True)
	class Meta:
		verbose_name=_(u'M - Reintegrament')
		verbose_name_plural=_(u'M - Reintegraments')

period_close_base_fields = ('period', 'sales_base', 'sales_invoiced_vat', 'sales_assigned_vat', 'sales_total', 
	'purchases_base', 'purchases_vat', 'purchases_irpf', 'purchases_total',
	'oficial_vat_total', 'assigned_vat_total', 'vat_type',
	'savings_with_assigned_vat', 'savings_with_assigned_vat_donation',
	'total_vat', 'total_irpf',
	'period_tax', 'advanced_tax',
	'donation', 
	'total', 'total_to_pay', 'total_balance', 'total_acumulated', 'closed')
vat_TYPES = (
		(vat_type_OFICIAL, _(u'Pagament IVA oficial')),
		(vat_type_ASSIGNED, _(u"Pagament IVA segons l'IVA assignat"))
	)
class period_close(iC_Record):
	ic_record = models.OneToOneField('Welcome.iC_Record', primary_key=True, parent_link=True)
	human = models.ForeignKey('General.Human', related_name='out_periodclose', verbose_name=_(u"Humà balance"))
	project = TreeForeignKey('General.Project', related_name='in_periodclose', verbose_name=_(u"Projecte balance"))
	ic_membership = models.ForeignKey('Welcome.iC_Membership', related_name='periodclose_membership', blank=True, null=True, verbose_name=_(u"Registre de Soci"))

	period = models.ForeignKey(period, null=True, blank=True, verbose_name=_(u'Trimestre'))
	cooper = models.ForeignKey(cooper, null=True, blank=True, verbose_name=_(u"nº COOP"))

	closed = models.BooleanField (verbose_name=_("closed"), help_text=_("closed_help_text"), default=False)
	system_closed = models.BooleanField (verbose_name=_("admin closed"), help_text=_("closed by bot after expiring time"), default=False)
	#sales
	sales_base = models.DecimalField(verbose_name=_(u"Base Imposable Emeses (€)"), decimal_places=2, max_digits=10, blank=True)
	sales_invoiced_vat = models.DecimalField(verbose_name=_(u"IVA Facturat (€)"), decimal_places=2, max_digits=10, blank=True)
	sales_assigned_vat = models.DecimalField(verbose_name=_(u"IVA Assignat (€)"), decimal_places=2, max_digits=10, blank=True)
	sales_total = models.DecimalField(verbose_name=_(u"Total Emeses (€)"), decimal_places=2, max_digits=10, blank=True)
	#purchases
	purchases_base = models.DecimalField(verbose_name=_(u"Base Imposable Despeses (€)"), decimal_places=2, max_digits=10, blank=True)
	purchases_vat = models.DecimalField(verbose_name=_(u"IVA Despeses (€)"), decimal_places=2, max_digits=10, blank=True)
	purchases_irpf = models.DecimalField(verbose_name=_(u"Retenció IRPF (€)"), decimal_places=2, max_digits=10, blank=True)
	purchases_total = models.DecimalField(verbose_name=_(u"Total Despeses (€)"), decimal_places=2, max_digits=10, blank=True)
	#vat

	vat_type = models.IntegerField(verbose_name=_(u"Tipus d'IVA"), choices=vat_TYPES, default=1)

	#savings_with_assigned_vat
	def savings_with_assigned_vat(self):
		saving = self.sales_invoiced_vat - self.sales_assigned_vat
		saving = saving if saving > 0 else 0
		return saving if self.vat_type== vat_type_ASSIGNED else 0
		
	savings_with_assigned_vat.short_description = _(u'IVA Facturat - Assignat (€)')
	savings_with_assigned_vat_donation = models.DecimalField(verbose_name=_(u'Aportació (€)'), help_text=_(u"D'aquest import d'estalvi, vols aportar alguna quantitat a la CIC? En cas afirmatiu, indica l'import."), decimal_places=2, max_digits=10, default=0)

	def oficial_vat_total(self):
		vat = self.sales_invoiced_vat - self.purchases_vat
		return 0 if vat < 0 else vat
	oficial_vat_total.decimal = True
	oficial_vat_total.short_description = _(u'IVA Facturat - Despeses (€)')

	def assigned_vat_total(self):
		vat = self.sales_assigned_vat - self.purchases_vat
		return 0 if vat < 0 else vat
	assigned_vat_total.decimal = True
	assigned_vat_total.short_description = _(u'IVA Assignat - Despeses (€)')
	#tax
	period_tax = models.DecimalField(verbose_name=_(u"Quota"), decimal_places=2, help_text=_(u'Càlcul Quota Trimestral (segons taula quotes)'), max_digits=10, blank=True)
	#rel_fees = models.ManyToManyField('Welcome.Fee', related_name='periodclose_selfemployed', blank=True, null=True,verbose_name=_(u"Quotes trimestrals") )
	advanced_tax = models.DecimalField(verbose_name=_(u"Quota avançada"), decimal_places=2, max_digits=10, default=0, blank=True)
	def total_tax(self):
		return self.period_tax - self.advanced_tax
	total_tax.decimal = True
	#donation
	donation = models.DecimalField(verbose_name=_(u'Aportació (€)'), help_text=_(u" Com que els resultats econòmics reflectits en aquest fitxer no sempre es corresponen amb l'activitat real del projecte, us volem donar aquesta opció per aportar el que considereu oportú. Si voleu, podeu indicar un import d´aportació al finançament d'activitats de la CIC en € i Ecos"),  decimal_places=2, max_digits=7, default=0)
	#total
	def total_vat(self):
		VATamount = self.sales_invoiced_vat- self.purchases_vat if self.vat_type == vat_type_OFICIAL else self.sales_assigned_vat - self.purchases_vat
		return 0 if VATamount < 0 else VATamount
	total_vat.decimal = True

	def total_irpf(self):
		return self.purchases_irpf
	total_irpf.decimal = True

	def total(self):
		return self.total_tax() + self.donation + self.savings_with_assigned_vat_donation
	total.decimal = True

	def total_to_pay(self):
		return self.total_vat() + self.total_irpf() + self.total()
	total_to_pay.decimal = True
	total_to_pay.short_description = (u"TOTAL A ABONAR (€)")

	def total_balance(self):
		total_previous = 0
		if self.period is not None:
			from Finances.bots import bot_balance
			total_previous = bot_balance( self.period, self.cooper ).total_previous()
		return total_previous
	total_balance.decimal = True
	total_balance.short_description = (u"TOTAL SALDO (€)")

	def total_acumulated(self):
		return self.total_to_pay() - self.total_balance()
	total_acumulated.decimal = True
	total_acumulated.short_description = (u"TOTAL A ABONAR - SALDO (€)")
  
	def __getitem__(self, value):
		return self.pk
	
	def __unicode__(self):
		return self.period

	class Meta:
		verbose_name= _(u'03 - Resultats')
		verbose_name_plural= _(u'03 - Resultats')
		unique_together = ('cooper', 'period')

class cooper_proxy_transactions(cooper):
	class Meta:
		verbose_name= _(u'K - Transaccions')
		verbose_name_plural= _(u'K - Transaccions')
		proxy=True


class period_payment(models.Model):
	period_close = models.ForeignKey(period_close, verbose_name=_(u'Trimestre'))
	value = models.DecimalField(verbose_name=_(u"Import"), decimal_places=2, max_digits=10)
	currency = models.ForeignKey(currencies, verbose_name=_(u"Moneda"), help_text=_(u"Selecciona la moneda"))
	def __unicode__(self):
		from Finances.bots import bot_currency
		return bot_currency(self.currency).get_change(self.value)
	class Meta:
		verbose_name= _(u'Pagament')
		verbose_name_plural= _(u'Pagaments')



'''
IMPORT COOPER
'''
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
		verbose_name= _(u'E - Importar CSV (socies)')
		verbose_name_plural= _(u'E - Importar CSV (socies)')



''' 
EMAIL NOTIFICATION SYSTEM
'''
class Email(models.Model):
	efrom=models.EmailField(verbose_name=_(u"Remitent"), help_text="", max_length=75, default="gestioci@cooperativa.cat")
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
		verbose_name=_(u"J - Notificacions programades")
		verbose_name_plural=_(u"J - Notificacions programades")


