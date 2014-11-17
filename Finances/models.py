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
from public_form.models import RegistrationProfile
'''
Section 0 >> global const and vars
'''
# MPTT linking
a_strG = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/admin/General/"
a_strW = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/admin/Finances/"
a_strWC = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/cooper/Finances/"
#----a_str2 = "?_popup=1&_changelist_filters=_popup=1&t=human' target='_blank' style='margin-left:-100px'>"
#----a_str2 = "?_popup=1&_changelist_filters=_popup=1' target='_blank' style='margin-left:-100px'>"
a_str2 = "' target='_blank' style='margin-left:-100px'>"
a_str3 = "' target='_blank'>"
# Validators
alphanumeric = RegexValidator(r'^[0-9a-zA-Z]*$', _(u"Nomès números i lletres") )
# Abstract entities 
status_CHOICE_NONE = None
status_CHOICE_PENDING = 0
status_CHOICE_DONE = 1
status_CHOICE_WAITING = 2
#
manage_CHOICE_COOPER = 0
manage_CHOICE_COOP = 1
who_manage_CHOICES=(
	(manage_CHOICE_COOPER, _(u'Gestionat per la socia')),
	(manage_CHOICE_COOP, _(u'Gestionat per la cooperativa')),
	)
#
vat_type_OFICIAL = 0
vat_type_ASSIGNED = 1
vat_TYPES = (
		(vat_type_OFICIAL, _(u'Pagament IVA oficial')),
		(vat_type_ASSIGNED, _(u"Pagament IVA segons l'IVA assignat"))
	)
movement_STATUSES=(
		(status_CHOICE_PENDING, _(u'Pendent')),
		(status_CHOICE_DONE, _(u'Executat')),
	)

'''
Section 1 >> Structural model entities to link GENERAL MPTT Tree
https://wiki.enredaos.net/index.php?title=GestioCI-Codi#MPTT
'''
from General.models import Artwork, Concept
class iCf_Record(Artwork):	# create own ID's
	record_type = TreeForeignKey('iCf_Record_Type', blank=True, null=True, verbose_name=_(u"Tipus de Registre financer de CI"))
	class Meta:
		verbose_name= _(u'Registre financer CI')
		verbose_name_plural= _(u'o- Registres financers CI')
	def __unicode__(self):
		if self.record_type is None or self.record_type == '':
			return self.name
		elif self.name is None or self.name == '':
			return self.record_type.name+': ??'
		else:
			return self.name
	def _selflink(self):
		if self.id:
				return a_strG + "icf_record/" + str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
		else:
				return "Not present"
	_selflink.allow_tags = True
	def __init__(self, *args, **kwargs):
		super(iCf_Record, self).__init__(*args, **kwargs)
class iCf_Type(Concept):	# create own ID's
	clas = models.CharField(blank=True, verbose_name=_(u"Clase"), max_length=200, help_text=_(u"Model de django o classe python associada al Tipus financer de CI"))
	class Meta:
		verbose_name = _(u"c- Tipus financer CI")

	def __unicode__(self):
		if self.clas is None or self.clas == '':
			if self:
				return self.name
			else:
				return "iC_Type vacio"
		else:
			return self.name+' ('+self.clas+')'
class iCf_Record_Type(iCf_Type):
	icf_type = models.OneToOneField('iCf_Type', primary_key=True, parent_link=True)
	class Meta:
		verbose_name= _(u'Tipus de Registre financer CI')
		verbose_name_plural= _(u'c-> Tipus de Registres financers CI')

'''
Section 2 >> Semantic model entities to link GENERAL MPTT Tree
https://wiki.enredaos.net/index.php?title=GestioCI-Codi#
'''
#Humans 
class iCf_Company(Company):
	name=models.CharField(verbose_name=_(u"Nom Fiscal"), help_text=_(u"El nom fiscal del client a qui es factura. Ex. SOM EL QUE SOM SL"), max_length=200)
	CIF=models.CharField(verbose_name=_(u"CIF/NIF/NIE"), blank=True, null=True, help_text=_(u"NIF:12345678A - CIF: A12345678 - NIE: X12345678A del client a qui es factura."), max_length=30)
	otherCIF=models.CharField(verbose_name=_(u"Altres identificadors"), null=True, blank=True, help_text=_(u"Camps no NIF/CIF/NIE del client a qui es factura."), max_length=50)
	def accounts(self):
		return self._my_accounts()
	def __unicode__(self):
		if self.CIF is None or self.CIF == "":
			idcode=self.otherCIF
		else:
			idcode=self.CIF
		return self.name + ' - ' + idcode
class iCf_Client(iCf_Company):
	class Meta:
		#model = Company #TODO: FILTER General.Company to Finances module
		verbose_name=_(u'B - Client')
		verbose_name_plural=_(u'B - Clients')
		proxy = True
class iCf_Provider(iCf_Company):
	def iban(self):
		return self.human._myaccounts()
	class Meta:
		#model = Company #TODO: FILTER General.Company to Finances module
		verbose_name=_(u'C - Proveïdor')
		verbose_name_plural=_(u'C - Proveïdors')
		proxy = True
#
class iCf_Cooper(RegistrationProfile):
	ic_self_employed = models.OneToOneField('Welcome.iC_Self_Employed', primary_key=True, parent_link=True)
	ic_membership = models.OneToOneField('Welcome.iC_Membership', verbose_name=_(u"rel_to_new_system"), blank=True, null=True)
	clients = models.ManyToManyField(iCf_Client, verbose_name=_(u"Clients"))
	providers = models.ManyToManyField(iCf_Provider, verbose_name=_(u"Proveïdors"))

	def user(self):
		return RegistrationProfile.objects.filter(ic_membership=self.ic_membership)
	user.short_description = _(u"Nom")
	def coop(self):
		return self.ic_membership.ic_company
	coop.short_description = _(u"Cooperativa")
	def coop_number(self):
		return self.ic_membership.ic_CESnum
	coop_number.short_description = _(u"nº COOP")
	def advanced_tax(self):
		#https://wiki.enredaos.net/index.php?title=GestioCI-Codi#APP:Welcome
		#/admin/Welcome/ic_type/
		return self.rel_fees.objects.filter(clas__CONTAINS="advanced_fee") #Quota Avançada ((45_eco) advanced_fee)
	advanced_tax.short_description = _(u'Quota avançada (€)')
	advanced_tax.help_text=_(u"Quota que s'aplicarà el primer trimestre")
	def assigned_vat(self):
		return self.ic_self_employed.assigned_vat
	assigned_vat.short_description = _(u"Aquest és el valor % d'IVA assignat fruit de l'avaluació social.")
	def extra_days(self):
		return self.ic_self_employed.assigned_vat
	extra_days.short_description = _(u"Dies extra que pot editar el trimestre en curs.")
	def iCf_Company(self):
		return self.ic_membership.ic_company
	extra_days.short_description = _(u"Dies extra que pot editar el trimestre en curs.")
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
#Taxes & duties & other inmaterial terms ---------------------------
class iCf_Duty(iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	value=models.IntegerField(verbose_name=_(u'IVA'), unique=True, db_index=True, validators=[MinValueValidator(0), MaxValueValidator(100)])

	def __unicode__(self):
		return unicode(self.value)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u'IVA')
		verbose_name_plural= _(u'IVAs')
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	value=models.IntegerField(verbose_name=_(u'IVA'), unique=True, db_index=True, validators=[MinValueValidator(0), MaxValueValidator(100)])

	def __unicode__(self):
		return unicode(self.value)

	def __getitem__(self, value):
		return self.id

	class Meta:
		verbose_name= _(u'IVA')
		verbose_name_plural= _(u'IVAs')
class iCf_Tax(iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	value=models.DecimalField(verbose_name=_(u'Quota Trimestral'), decimal_places=2, max_digits=10, unique=True, db_index=True)
	min_base=models.IntegerField(verbose_name= _(u"Base imposable Mínima"))
	max_base=models.IntegerField(verbose_name= _(u"Base imposable Màxima"))
	def __unicode__(self):
		if self.id:
			return _("Cuota de %s por base entre %s y %s (Eur)") %( str(self.value), str(self.min_base), str(self.max_base))

	class Meta:
		verbose_name=_(u'A - Taula quotes')
		verbose_name_plural=_(u'A - Taula quotes')
class iCf_Period(iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
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
#
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
# XIPU or INTERPROFESSIONALS
class iCf_Coop(Company):
	def __unicode__(self):
		return self.name
	class Meta:
		proxy = True
		#TODO filter XIPU and Interprofessionals
		#https://wiki.enredaos.net/index.php?title=GestioCI-Codi#XIPU_.2F_Interprofessionals:_Class_Company.28Human.29
		#XIPU - http://cicicdev.enredaos.net:8082/admin/General/company/2342/
		#Interprofesionals - http://cicicdev.enredaos.net:8082/admin/General/company/2341/
		verbose_name= _(u'I - Cooperativa')
		verbose_name_plural= _(u'I - Cooperatives')
	name=models.CharField(verbose_name=_(u"Nom"), unique=True, db_index=True, max_length=200)
	def __unicode__(self):
		return self.name
	class Meta:
		verbose_name= _(u'I - Cooperativa')
		verbose_name_plural= _(u'I - Cooperatives')

'''
Section 3 >> Invoicing and currency movements and period closing
https://wiki.enredaos.net/index.php?title=GestioCI-Codi#Facturaci.C3.B3n
'''
#Invoicing
class iCf_Invoice(iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	icf_cooper = models.ForeignKey(iCf_Cooper, verbose_name=_(u"nº COOP"))
	period = models.ForeignKey(iCf_Period, null=True, blank=True, verbose_name=_(u'Trimestre'))
	date= models.DateField(verbose_name=_(u"Data"), help_text=_(u"La data d'emissió de la factura. Exemple dd/mm/aaaa"))
	expiring_date=models.DateField(verbose_name=_(u"Data venciment"), help_text=_(u"La data de venciment. Exemple dd/mm/aaaa"), null=True, blank=True)
	who_manage= models.IntegerField(
		verbose_name=_(u"Forma de pagament"), 
		help_text=_(u"Si selecciona la opció 'desde la cooperativa' haurà d'ampliar informació."), 
		choices=who_manage_CHOICES, 
		default=0
	)
	issue_date = models.DateField(default=datetime.today, blank=True, null=True, verbose_name=_(u"Data d'emisió"))
	deadline_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de venciment"))
	payment_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de pagament"))
	payment_type = TreeForeignKey('Welcome.Payment_Type', blank=True, null=True, verbose_name=_(u"Forma de pagament"))
	rel_account = models.ForeignKey('General.Record', related_name='rel_invoices', blank=True, null=True, verbose_name=_(u"Compte relacionat"))
	transfer_date= models.DateField(
		verbose_name=_(u"Data de liquidació"), 
		help_text=_(u"La data en que es liquida la factura. Exemple dd/mm/aaaa"), 
		blank=True, null=True
	)
	unit = models.ForeignKey('General.Unit', verbose_name=_(u"Unitat"))

	lines = models.ForeignKey('Finances.iCf_Invoice_line', related_name='rel_lines', blank=True, null=True, verbose_name=_(u"Línes"))

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
	def amount(self):
		return self.lines.objects.values("value").annotate(value=Sum("value"))["value"]
	amount.short_description = _(u"Import")
	def __unicode__(self):
		if self.record_type is None:
			#record_type = "<record:type.name>"
			return 'Invoice ??: ['+str(self.amount)+' '+self.unit.code+']'
		else:
			record_type = self.record_type.name
		return record_type +': ['+str(self.amount)+' '+self.unit.code+']'#' > '+self.project.nickname
	class Meta:
		abstract=False
		verbose_name = _(u"Factura")
		verbose_name_plural = _(u"Factures")
#
class iCf_Sale(iCf_Invoice):
	invoice = models.OneToOneField('Finances.iCf_Invoice', primary_key=True, parent_link=True)
	num=models.IntegerField(verbose_name=_(u"Nº Factura"), help_text=_(u"Número Factura: COOPXXXX/any/XXXX. Introduïu només el número final."))
	client=models.ForeignKey(iCf_Client, related_name="sales_invoice_clients", verbose_name=_(u"Client"))

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

class iCf_Purchase(iCf_Invoice):
	invoice = models.OneToOneField('iCf_Invoice', primary_key=True, parent_link=True)
	num=models.IntegerField(verbose_name=_(u"Nº Factura"), help_text=_(u"Número Factura."),  validators=[alphanumeric])
	provider=models.ForeignKey(iCf_Provider, verbose_name=_(u"Proveïdor"))
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
		verbose_name=_(u'02 - Factura Despesa')
		verbose_name_plural=_(u'02 - Factures Despeses')
#
class iCf_Invoice_line(iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	value=models.DecimalField(verbose_name=_(u'Base Imposable (€)'), help_text=_(u"La Base Imposable de la factura. Exemple 1000,30 . Indicar una coma pels decimals."), decimal_places=2, max_digits=10)
class iCf_Sale_line (iCf_Invoice_line):
	line = models.OneToOneField('Finances.iCf_Invoice_line', primary_key=True, parent_link=True)
	percent_invoiced_vat=models.ForeignKey(iCf_Duty, verbose_name=_(u"IVA Facturat (%)"), help_text=_(u"El % d'IVA que s'aplica en la factura. Indicar un valor d'IVA per concepte"))

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
class iCf_Purchase_line (iCf_Invoice_line):
	line = models.OneToOneField('Finances.iCf_Invoice_line', primary_key=True, parent_link=True)
	percent_vat=models.ForeignKey(iCf_Duty, verbose_name=_(u'IVA (%)'), help_text=_(u"El % d'IVA que s'aplica en la factura."))
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
#Transactions
class iCf_Movement (iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	icf_cooper=models.ForeignKey(iCf_Cooper, null=False, blank=False, verbose_name=_(u"nº COOP"))
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
	#https://wiki.enredaos.net/index.php?title=GestioCI-Codi#Unidades_de_medida:_Class_General.Unit.28Artwork.29
	currency=models.ForeignKey(
		'General.Unit', 
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
#
class iCf_Sales_movement( iCf_Movement ):
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
class iCf_Purchase_movement( iCf_Movement ):
	petition_date=models.DateField(verbose_name=_(u"Data previsió"), help_text=_(u"La data de petició. Exemple dd/mm/aaaa"))
	acceptation_date=models.DateField(verbose_name=_(u"Data d'acceptament"), help_text=_(u"La data en que s'accepta. Exemple dd/mm/aaaa"), null=True, blank=True)
	class Meta:
		verbose_name=_(u'M - Reintegrament')
		verbose_name_plural=_(u'M - Reintegraments')
#Period close (tax & vats calculation)

period_close_base_fields = ('period', 'sales_base', 'sales_invoiced_vat', 'sales_assigned_vat', 'sales_total', 
	'purchases_base', 'purchases_vat', 'purchases_irpf', 'purchases_total',
	'oficial_vat_total', 'assigned_vat_total', 'vat_type',
	'savings_with_assigned_vat', 'savings_with_assigned_vat_donation',
	'total_vat', 'total_irpf',
	'period_tax', 'advanced_tax',
	'donation', 
	'total', 'total_to_pay', 'total_balance', 'total_acumulated', 'closed')
class iCf_Period_close(iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	period = models.ForeignKey(iCf_Period, null=True, blank=True, verbose_name=_(u'Trimestre'))
	cooper = models.ForeignKey(iCf_Cooper, null=True, blank=True, verbose_name=_(u"nº COOP"))
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
'''
Section 4 >> Finance filigraning and computations above section 3
undocumented & pending
'''
#Balance & global member finances
class period_payment(models.Model):
	period_close = models.ForeignKey(iCf_Period_close, verbose_name=_(u'Trimestre'))
	value = models.DecimalField(verbose_name=_(u"Import"), decimal_places=2, max_digits=10)
	currency = models.ForeignKey('General.Unit', verbose_name=_(u"Moneda"), help_text=_(u"Selecciona la moneda"))
	def __unicode__(self):
		from Finances.bots import bot_currency
		return bot_currency(self.currency).get_change(self.value)
	class Meta:
		verbose_name= _(u'Pagament')
		verbose_name_plural= _(u'Pagaments')
class cooper_proxy_companies(iCf_Cooper):
	class Meta:
		verbose_name= _(u'B - Els meus clients i proveïdors')
		verbose_name_plural= _(u'B - Els meus clients i proveïdors')
		proxy = True
class cooper_proxy_balance(iCf_Cooper):

	class Meta:
		verbose_name= _(u'L - Balanç projecte')
		verbose_name_plural= _(u'L - Balanç projectes')
		proxy = True
class cooper_proxy_transactions(iCf_Cooper):
	class Meta:
		verbose_name= _(u'K - Transaccions')
		verbose_name_plural= _(u'K - Transaccions')
		proxy=True
