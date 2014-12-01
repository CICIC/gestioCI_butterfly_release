#encoding=utf-8
'''
  See model map on [GestioCI][Manual][Base de Datos][Facturación]
  https://wiki.enredaos.net/index.php?title=GestioCI-Base_de_datos#Facturaci.C3.B3n
'''
# 
'''
Section 0 >> global const and vars
'''
from django.utils.safestring import mark_safe
from django.core.exceptions import ObjectDoesNotExist
from django.db import models
from django.contrib import messages
from mptt.models import MPTTModel
from mptt.fields import TreeForeignKey, TreeManyToManyField
from django.utils.translation import ugettext_lazy as _
from django.utils.translation import gettext as __
from decimal import Decimal
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.contrib.auth.models import  User
from datetime import date, timedelta, datetime
from csvimport.models import CSVImport
from django.core.validators import MaxValueValidator, MinValueValidator, RegexValidator
from General.models import Concept, Company, Type
from public_form.models import RegistrationProfile
from django.db.models import Q, Sum

# end IMPORTS ********************************************

# begin TOOLS and VARS and CONSTs ************************
#
#  MPTT linking
a_strG = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/admin/General/"
a_strW = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/admin/Finances/"
a_strWC = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/icf_self_employed/Finances/"
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

def _check_icf_record_type( clas, name, description, tt, check_type=False, check_type2=False):
	#
	# MPTT - record_type set up.
	# See basic explanation about MPTT types on Manual - [GestioCI-Base_de_datos][Breve visita acompañada por el bosque MPTT]
	# on url:
	# (https://wiki.enredaos.net/index.php?title=GestioCI-Base_de_datos#Breve_visita_acompa.C3.B1ada_por_el_bosque_MPTT)
	#
	# This is to set icf_Record_Type clas on icf_Record, by calling this function, will also check for existing parent type and creating it if needed.
	# Basic_Data.sql file in Dabase directory of aplication, must load types for you, so this may be just in case bad Basic_Data.sql
	# You can upgrade this function once every thing goes fine by harcoded icf_Record_Type indexings over clas map, so you get a bit performance.
	#
	#Main entity type
	#... loop to process each entity
	if not name:
		import pdb;pdb.set_trace()
		pass
		
	try:
		if check_type2:
			t = Type.objects.get( clas=clas )
		elif check_type:
			t = iCf_Type.objects.get( clas=clas )
		else:
			t = iCf_Record_Type.objects.get(clas=clas) 
		return t
	except ObjectDoesNotExist:
		if check_type2:
			t = Type(clas=clas, 
				name=name, 
				description=_(description))
			try:
				t.save()
			except:
				try:
					t = Type.objects.get( Q(clas=clas))
				except:
					pass
			return t
		if check_type:
			t = iCf_Type(clas=clas, 
				name=name, 
				description=_(description))
			try:
				t.save()
			except:
				try:
					t = iCf_Type.objects.get( Q(clas=clas))
				except:
					pass
			return t
		else:
			dd = iCf_Record_Type()
			dd.parent=tt
			dd.clas=clas
			dd.name=name, 
			dd.description=_(description)
			try:
				dd.save()
				t = dd
			except:
				try:
					t = iCf_Record_Type.objects.get(clas=clas )
				except Exception as e:
					t = None
					print (e)
					pass
			return t
	except Exception as e:
		print ("Finances.models.py | _check_icf_record_type | a new type found: %s, error:" % (clas))
		t = None
		print (e)
		pass
	return t

'''
Section 1 >> Abstract model entities to link GENERAL MPTT Tree
https://wiki.enredaos.net/index.php?title=GestioCI-Codi#MPTT
'''
from General.models import Artwork, Concept
class iCf_Record(Artwork):	# create own ID's
	record_type = TreeForeignKey('iCf_Record_Type', blank=True, null=True, verbose_name=_(u"Tipus de Registre financer de CI"))
	class Meta:
		verbose_name= _(u'sys_artwork_record')
		verbose_name_plural= _(u'sys_artworks_record')
	def __unicode__(self):
		if self.record_type is None or self.record_type == '':
			return self.name
		elif self.name is None or self.name == '':
			return self.record_type.name+': ??'
		else:
			return self.name
	def _selflink(self):
		if self.id:
			return a_strG + "icf_record/" + str(self.id) + a_str2 + "</a>"# % str(self.id)
		else:
				return "Not present"
	_selflink.allow_tags = True
class iCf_Type(Concept):	# create own ID's
	clas = models.CharField(blank=True, verbose_name=_(u"Clase"), max_length=200, help_text=_(u"Model de django o classe python associada al Tipus financer de CI"))
	class Meta:
		verbose_name = _(u"sys_concept_type")
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
		verbose_name= _(u'sys_record_type')

'''
Section 2 >> Semantic models
'''
# ************************************************
# Taxes & duties & other inmaterial terms ---------------------------
class iCf_Duty(iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	value=models.IntegerField(verbose_name=_(u'IVA'), unique=True, db_index=True, validators=[MinValueValidator(0), MaxValueValidator(100)])
	def __init__(self, *args, **kwargs):
		super(iCf_Duty, self).__init__(*args, **kwargs)
		#t = _check_icf_record_type("iCf_Duties", u"Impost oficial del Estat", u'Impuestos oficiales como el I.V.A. o el I.A.E.', None, True)
		#self.record_type = _check_icf_record_type("iCf_Duty", u"IVA", u'Impuesto oficial I.V.A.', t )
		try:
			self.record_type = iCf_Record_Type.objects.get(clas="iCf_Duty")
		except ObjectDoesNotExist:
			print ("iCf_Duties.__init__():" + " missing type")
			pass
	def __unicode__(self):
		return str(self.value)
	class Meta:
		verbose_name= _(u'B - IVA')
		verbose_name_plural= _(u'B - IVAs')
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	value=models.IntegerField(verbose_name=_(u'IVA'), unique=True, db_index=True, validators=[MinValueValidator(0), MaxValueValidator(100)])
class iCf_Tax(iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	value=models.DecimalField(verbose_name=_(u'Quota Trimestral'), decimal_places=2, max_digits=10, unique=True, db_index=True)
	min_base=models.IntegerField(verbose_name= _(u"Base imposable Mínima"))
	max_base=models.IntegerField(verbose_name= _(u"Base imposable Màxima"))
	def __init__(self, *args, **kwargs):
		super(iCf_Tax, self).__init__(*args, **kwargs)
		try:
			self.record_type = iCf_Record_Type.objects.get(clas="iCf_Tax")
		except ObjectDoesNotExist:
			print ("iCf_Tax.__init__():" + " missing type")
			pass
	def __unicode__(self):
		if self.id:
			return _("Cuota de %s por base entre %s y %s (Eur)") %( str(self.value), str(self.min_base), str(self.max_base))
	class Meta:
		verbose_name=_(u'A - Taula quotes')
		verbose_name_plural=_(u'A - Taula quotes')
class iCf_Period(iCf_Record_Type):
	icf_record_type = models.OneToOneField('Finances.iCf_Record_type', primary_key=True, parent_link=True)
	label = models.CharField(verbose_name=_(u"Títol"), max_length=200)
	first_day = models.DateField(verbose_name=_(u"Inici"), help_text=_(u"Primer dia del període"))
	date_open = models.DateField(verbose_name=_(u"Obert"))
	date_close = models.DateField(verbose_name=_(u"Tancat"))
	exported = models.BooleanField (verbose_name=_("Archivat"), help_text=_(u"Administració ha exportat els registres CSV del període."), default=False)
	def _exported(self):
		if not self:
			return ico_no
		if hasattr(self, "exported"):
			return "Sí" if self.exported else ico_no
		else:
			return ico_no
	def __init__(self, *args, **kwargs):
		super(iCf_Period, self).__init__(*args, **kwargs)
		#self.icf_type = iCf_Type.objects.get(clas="iCf_Periods")
	def __unicode__(self):
		if not self:
			return ""
		if hasattr(self, "id"):
			if self.exported:
				status = _(u" tancat i archivat.")
			elif self.first_day > date.today():
				status = _(u" no és en vigor.")
			elif self.date_close > date.today():
				close = " %s del %s" % ( self.date_close.day, self.date_close.month )
				status = _(u" obert fins: %s") % (self.date_close)
			elif self.date_open > date.today():
				open = " %s - %s" % ( self.date_open.day, self.date_open.month )
				status = _(u" facturable fins: %s") % (open)
			else:
				status = _(u"Aquest periode es pot exportar.")
			return "%s > %s" % (self.name, status)
		else:
			return _("periode buit").encode("utf-8")
	class Meta:
		verbose_name= _(u"C - Trimestres")
		verbose_name_plural= _(u"C - Trimestres")

	def get_period_closed(self, icf_se):
		try:
			pc = icf_se.icf_periods_closed.get(record_type=self)
		except:
			pc = iCf_Period_close()
			pc.record_type = self
			pc.period_tax = iCf_Tax.objects.get(min_base = 0).value
			try:
				pc.save()
			except Exception as e:
				print e
				pass
			else:
				icf_se.icf_periods_closed.add(pc)
				try:
					icf_se.save()
				except Exception as e:
					print e
					pass
		return pc
'''
Section 3 >> Invoicing and currency movements and period closing
'''
# ************************************************
# Transactions
class iCf_Movement (iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	concept = models.CharField(verbose_name=_(u"Concept"), max_length=200, null=False, 
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
	def __init__(self, *args, **kwargs):
		super(iCf_Movement, self).__init__(*args, **kwargs)
		#t = _check_icf_record_type("iCf_Movements", _(u"Moviments"), u'Files de transaccions i moviments de moneda.', None, True)
		#self.record_type = _check_icf_record_type("iCf_Movement", u'Moviment', u'Transacció o abonament.', t)
		self.record_type = iCf_Record_Type.objects.get(clas="iCf_Movement")
	def _icf_self_employed(self):
		if hasattr(self, 'icf_self_employed') and self.membership:
			return self.icf_self_employed
		else:
			return 'none'
	_icf_self_employed.allow_tags = True
	_icf_self_employed.short_description = _(u"Registre de Soci")
	def status(self):
		if self.execution_date is None:
			return status_CHOICE_PENDING
		else:
			return status_CHOICE_DONE
	status.short_description = _(u"Estat")

	def __unicode__(self):
		from Finances.bots import bot_currency
		return bot_currency(self.currency).get_change(self.value)
#
class iCf_Sale_movement( iCf_Movement ):
	icf_movement = models.OneToOneField('Finances.iCf_Movement', primary_key=True, parent_link=True)
	def icf_self_employed(self):
		try:
			se = self.icf_self_employed_sale_movements.icf_self_employed_periods_closed
		except:
			return None
	def __init__(self, *args, **kwargs):
		super(iCf_Sale_movement, self).__init__(*args, **kwargs)
		#t = _check_icf_record_type("iCf_Movements", _(u"Moviments"), u'Files de transaccions i moviments de moneda.', None, True)
		#self.record_type = _check_icf_record_type("iCf_Sale_movement", u'Abonament', u'Moviment per abonar un import.', t)
		self.record_type = iCf_Record_Type.objects.get(clas="iCf_Sale_movement")
	def execution_date(self):
		pass
	planned_date=models.DateField(verbose_name=_(u"Data previsió"), help_text=_(u"La data prevista. Exemple dd/mm/aaaa"))
	who_manage= models.IntegerField(
		verbose_name=_(u"Forma de pagament"), 
		help_text=_(u"Si selecciona la opció 'desde la icf_self_employedativa' haurà d'ampliar informació."), 
		choices=who_manage_CHOICES, 
		default=manage_CHOICE_COOPER
	)
	class Meta:
		verbose_name=_(u'L - Abonament')
		verbose_name_plural=_(u'L - Abonaments')
class iCf_Purchase_movement( iCf_Movement ):
	icf_movement = models.OneToOneField('Finances.iCf_Movement', primary_key=True, parent_link=True)
	petition_date=models.DateField(verbose_name=_(u"Data previsió"), help_text=_(u"La data de petició. Exemple dd/mm/aaaa"))
	acceptation_date=models.DateField(verbose_name=_(u"Data d'acceptament"), help_text=_(u"La data en que s'accepta. Exemple dd/mm/aaaa"), null=True, blank=True)
	def __init__(self, *args, **kwargs):
		super(iCf_Sale_movement, self).__init__(*args, **kwargs)
		#t = _check_icf_record_type("iCf_Movements", _(u"Moviments"), u'Files de transaccions i moviments de moneda.', None, True)
		#self.record_type = _check_icf_record_type("iCf_Purchase_movement", _(u'Reintegrament'), _(u'Moviment per reintegrar un import.'), t)

		self.record_type = iCf_Record_Type.objects.get(clas="iCf_Purchase_movement")
	def icf_self_employed(self):
		try:
			se = self.icf_self_employed_purchase_movements.icf_self_employed_periods_closed
		except:
			return None
	class Meta:
		verbose_name=_(u'M - Reintegrament')
		verbose_name_plural=_(u'M - Reintegraments')

# ************************************************
# Invoicing
class iCf_Invoice(iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	period = models.ForeignKey('Finances.iCf_Period_close', null=True, blank=True, verbose_name=_(u'Trimestre'))
	date= models.DateField(verbose_name=_(u"Data"), help_text=_(u"La data d'emissió de la factura. Exemple dd/mm/aaaa"))
	expiring_date=models.DateField(verbose_name=_(u"Data venciment"), help_text=_(u"La data de venciment. Exemple dd/mm/aaaa"), null=True, blank=True)
	who_manage= models.IntegerField(
		verbose_name=_(u"Forma de pagament"), 
		help_text=_(u"Si selecciona la opció 'desde la icf_self_employedativa' haurà d'ampliar informació."), 
		choices=who_manage_CHOICES, 
		default=0
	)
	issue_date = models.DateField(default=datetime.today, blank=True, null=True, verbose_name=_(u"Data d'emisió"))
	deadline_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de venciment"))
	payment_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de pagament"))
	payment_type = TreeForeignKey('Welcome.Payment_Type', blank=True, null=True, verbose_name=_(u"Forma de pagament"))
	rel_account = models.ForeignKey('General.Record', related_name='rel_invoice_account', blank=True, null=True, verbose_name=_(u"Compte relacionat"))
	transfer_date= models.DateField(
		verbose_name=_(u"Data de liquidació"), 
		help_text=_(u"La data en que es liquida la factura. Exemple dd/mm/aaaa"), 
		blank=True, null=True
	)
	unit = models.ForeignKey('General.Unit', verbose_name=_(u"Unitat"))
	movements=models.ManyToManyField('Finances.iCf_Movement', related_name="rn_invoice_movements", verbose_name=_(u"Moviments"),blank=True, null=True)

	def __init__(self, *args, **kwargs):
		super(iCf_Invoice, self).__init__(*args, **kwargs)
		#t = _check_icf_record_type("iCf_Invoices", u"Elements de factures", u'Tipus de factures y subelements.', None, True)
		#self.record_type = _check_icf_record_type("iCf_Invoice", u"Factura", u'', t )
		self.record_type = iCf_Record_Type.objects.get(clas="iCf_Invoice")
	def __getitem__(self, value):
		if hasattr(self,"id"):
			return self.id
		else:
			return ""
	def value(self):
		try:
			total_query = self.lines.values("value").annotate(value_=Sum("value"))
			return total_query[0]("value_") if total_query.count() > 1 else 0
		except:
			return 0
	def cooper(self):
		return self._icf_self_employed()
	def _icf_self_employed(self):
		if hasattr(self, 'icf_self_employed'):
			return self.icf_self_employed
		else:
			return 'none'
	_icf_self_employed.allow_tags = True
	_icf_self_employed.short_description = _(u"Autoocupat que factura")
	icf_self_employed = property(_icf_self_employed)
	def _ic_self_employed(self):
		if hasattr(self, 'ic_self_employed'):
			return self.ic_self_employed
		else:
			return 'none'
	_ic_self_employed.allow_tags = True
	_ic_self_employed.short_description = _(u"Registre d'Autoocupat")
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
	class Meta:
		abstract=False
		verbose_name = _(u"Factura")
		verbose_name_plural = _(u"Factures")
#
class iCf_Sale_li(models.Model):
	icf_sale = models.ForeignKey('Finances.iCf_Sale')
	icf_sale_line = models.ForeignKey('Finances.iCf_Sale_line', related_name="fk_sale_li", verbose_name=_("Linia de factura"))
	value=models.DecimalField(verbose_name=_(u'Base imposable'), decimal_places=2, max_digits=10)
	percent_invoiced_vat=models.ForeignKey(iCf_Duty, verbose_name=_(u"IVA Facturat (%)"), help_text=_(u"El % d'IVA que s'aplica en la factura. Indicar un valor d'IVA per concepte"))
	def percent_assigned_vat(self):
		from Finances.bots import bot_assigned_vat
		return bot_assigned_vat (self.rn_Sale_line.all().first().icf_self_employed, self.percent_invoiced_vat).assigned_vat
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
	def save(self, *args, **kwargs):
		if not getattr(self, 'icf_sale_line', False):
			self.icf_sale_line = iCf_Sale_line()
			self.icf_sale_line.save()
			self.icf_sale_line_id = self.icf_sale_line.id
		super(iCf_Sale_li, self).save(*args, **kwargs)
	class Meta:
		verbose_name=_(u'Línia de factura emesa')
		verbose_name_plural=_(u'Línies de factura emesa')
#
class iCf_Purchase_li(models.Model):
	icf_purchase = models.ForeignKey('Finances.iCf_Purchase')
	icf_purchase_line = models.ForeignKey('Finances.iCf_Purchase_line', related_name="fk_purchase_li", verbose_name=_("Linia de factura"))
	value=models.DecimalField(verbose_name=_(u'Base imposable'), decimal_places=2, max_digits=10)
	percent_vat=models.ForeignKey(iCf_Duty, verbose_name=_(u'IVA (%)'), help_text=_(u"El % d'IVA que s'aplica en la línia."))
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
	def save(self, *args, **kwargs):
		if not getattr(self, 'icf_purchase_line', False):
			self.icf_purchase_line = iCf_Purchase_line()
			self.icf_purchase_line.save()
			self.icf_purchase_line_id = self.icf_purchase_line.id
		super(iCf_Purchase_li, self).save(*args, **kwargs)
	class Meta:
		verbose_name=_(u'Línia de factura despesa')
		verbose_name_plural=_(u'Línies de factura despesa')
#
class iCf_Sale(iCf_Invoice):
	invoice = models.OneToOneField('Finances.iCf_Invoice', primary_key=True, parent_link=True)
	num = models.IntegerField(verbose_name=_(u"Nº Factura"), help_text=_(u"Número Factura: COOPXXXX/any/XXXX. Introduïu només el número final."))
	client = models.ForeignKey("General.Company", related_name="sale_invoices_clients", verbose_name=_(u"Client"))
	lines=models.ManyToManyField('Finances.iCf_Sale_line', through="iCf_Sale_li", related_name="rn_Sale_line", verbose_name=_(u"Línies"),blank=True, null=True)
	def icf_self_employed(self):
		try:
			se = self.period.rel_icfse_icf_period_close
		except:
			return None
	def __getitem__(self, value):
		if hasattr(self,"id"):
			return self.id
		else:
			return ""
	def __init__(self, *args, **kwargs):
		super(iCf_Sale, self).__init__(*args, **kwargs)
		#t = _check_icf_record_type("iCf_Invoices", u"Elements de factures", u'Tipus de factures y subelements.', None, True)
		#self.record_type = _check_icf_record_type("iCf_Sale", u"Factura emesa", u'', t )
		self.record_type = iCf_Record_Type.objects.get(clas="iCf_Sale")
	def save(self, *args, **kwargs):
		self.name = self.number()
		super(iCf_Sale, self).save(*args, **kwargs)

	def number(self):
		se = self.period.rel_icfse_icf_period_close
		if se.first():
			cesnum = se.first().coop_number()
		else:
			cesnum = "0000"
		return '%s/%s/%s'%( cesnum, self.date.year, "%03d" % (self.num) )
	number.short_description =_(u"Nº Factura")
	def value(self):
		value=0
		for line in self.lines.all():
			value += line.fk_sale_li.all().first().value
		return value
	value.short_description=_(u"Base Imposable (€)")
	def invoiced_vat(self):
		value=0
		for line in self.lines.all():
			value += line.invoiced_vat()
		return value
	invoiced_vat.short_description=_(u"IVA Facturat (€)")
	def assigned_vat(self):
		value=0
		for line in self.lines.all():
			value += line.assigned_vat()
		return value
	assigned_vat.short_description=_(u"IVA Assignat (€)")
	def total(self):
		value = Decimal("0.00")
		for line in self.lines.all():
			value += line.total() 
		return value
	total.short_description=_(u'Total Factura (€)')
	class Meta:
		verbose_name=_(u'01 - Factura Emesa')
		verbose_name_plural=_(u'01 - Factures Emeses')
#
class iCf_Purchase(iCf_Invoice):
	invoice = models.OneToOneField('iCf_Invoice', primary_key=True, parent_link=True)
	num = models.CharField(verbose_name=_(u"Nº Factura"), max_length=20, help_text=_(u"Número Factura proveïdor."), validators=[alphanumeric])
	provider=models.ForeignKey("General.Company", related_name="purchase_invoices_providers", verbose_name=_(u"Proveïdor"))
	lines=models.ManyToManyField('Finances.iCf_Purchase_line', through="iCf_Purchase_li", related_name="rn_Purchase_line", verbose_name=_(u"Línies"),blank=True, null=True)
	def __getitem__(self, value):
		if hasattr(self,"id"):
			return self.id
		else:
			return ""
	def icf_self_employed(self):
		try:
			se = self.period.rel_icfse_icf_period_close
		except:
			return None
	def __init__(self, *args, **kwargs):
		super(iCf_Purchase, self).__init__(*args, **kwargs)
		#t = _check_icf_record_type("iCf_Invoices", u"Elements de factures", u'Tipus de factures y subelements.', None, True)
		#self.record_type = _check_icf_record_type("iCf_Purchase", u"Factura despesa", u'', t )
		self.record_type = iCf_Record_Type.objects.get(clas="iCf_Purchase")
	def number(self):
		se = self.period.rel_icfse_icf_period_close
		if se.first():
			cesnum = se.first().coop_number()
		else:
			cesnum = "0000"
		return '%s/%s/%s'%( cesnum, self.date.year, self.num )

	number.short_description =_(u"Nº Factura")
	def vat(self):
		value=0
		for line in self.lines.all():
			value += line.fk_purchase_li.all().first().percent_vat.value
		return value
	vat.decimal = True
	vat.short_description = _(u'IVA (€)')
	def irpf(self):
		value=0
		for line in self.lines.all():
			value += line.fk_purchase_li.all().first().percent_irpf
		return value
	irpf.decimal = True
	irpf.short_description = _(u'IRPF (€)')
	def total(self):
		return self.value() + self.vat() - self.irpf()
	total.decimal = True
	total.short_description = _(u'Total Factura (€)')
	class Meta:
		#unique_together = ('icf_self_employed', 'period', 'num')
		verbose_name = _(u'02 - Factura Despesa')
		verbose_name_plural = _(u'02 - Factures Despeses')
#
class iCf_Sale_line (iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	def __init__(self, *args, **kwargs):
		super(iCf_Sale_line, self).__init__(*args, **kwargs)
		t = _check_icf_record_type("iCf_Invoices", u"Elements de factures", u'Tipus de factures y subelements.', None, True)
		self.record_type = _check_icf_record_type("iCf_Sale_line", u"Línia de factura emesa", u'', t )#iCf_Record_Type.objects.get(clas="iCf_Sale_line")
	def percent_assigned_vat(self):
		from Finances.bots import bot_assigned_vat
		return bot_assigned_vat(self.rn_Sale_line.all().first().icf_self_employed, self.fk_sale_li.all().first().percent_invoiced_vat).assigned_vat
	percent_assigned_vat.short_description=_(u"IVA Assignat (%)")
	percent_assigned_vat.admin_order_field='user__soci__assigned_vat'
	def invoiced_vat(self):
		amount=Decimal ( "%.2f" % float((self.fk_sale_li.all().first().percent_invoiced_vat.value*self.fk_sale_li.all().first().value) / 100 ))
		return amount
	invoiced_vat.decimal=True
	invoiced_vat.short_description=_(u'IVA Facturat (€)')
	def assigned_vat(self):
		amount=Decimal ( "%.2f" % float((self.percent_assigned_vat()*self.fk_sale_li.all().first().value) / 100))
		return amount
	assigned_vat.decimal=True
	assigned_vat.short_description=_(u'IVA Assignat (€)')
	def total(self):
		return self.fk_sale_li.all().first().value + self.invoiced_vat()
	total.integer=True
	total.short_description=_(u'Total Factura (€)')
#
class iCf_Purchase_line (iCf_Record):
	icf_record = models.OneToOneField('Finances.iCf_Record', primary_key=True, parent_link=True)
	def __init__(self, *args, **kwargs):
		super(iCf_Purchase_line, self).__init__(*args, **kwargs)
		t = _check_icf_record_type("iCf_Invoices", u"Elements de factures", u'Tipus de factures y subelements.', None, True)
		self.record_type = _check_icf_record_type("iCf_Purchase_line", u"Línia de factura despesa", u'', t )
		#self.record_type = iCf_Record_Type.objects.get(clas="iCf_Purchase_line")
	def vat(self):
		amount=Decimal ( "%.2f" % ((self.fk_purchase_li.all().first().percent_vat.value*self.fk_purchase_li.all().first().value) / 100))
		return amount
	vat.decimal=True
	vat.short_description=_(u'IVA (€)')
	def irpf(self):
		amount=Decimal ( "%.2f" % ((self.fk_purchase_li.all().first().percent_irpf*self.fk_purchase_li.all().first().value) / 100))
		return amount
	irpf.decimal=True
	irpf.short_description=_(u'IRPF (€)')
	def total(self):
		return self.fk_purchase_li.all().first().value + self.vat() + self.irpf()
	total.decimal=True
	total.short_description=_(u'Total Factura (€)')
	def __unicode__(self):
		try:
			return self.total()
		except:
			try:
				return str(self.icf_record)
			except:
				return "icf_purchase_line_unicode"
	class Meta:
		verbose_name=_(u'Línia de factura despesa')
		verbose_name_plural=_(u'Línies de factura despesa')
#
# ************************************************
# Period close (tax & vats calculation)
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
	closed = models.BooleanField (verbose_name=_("closed"), help_text=_("closed_help_text"), default=False)
	system_closed = models.BooleanField (verbose_name=_("admin closed"), help_text=_("closed by bot after expiring time"), default=False)
	icf_sales  = models.ManyToManyField(iCf_Sale, related_name="rel_icfe_sales", verbose_name=_(u"Factures Emeses"))
	icf_purchases = models.ManyToManyField(iCf_Purchase, related_name="rel_icfe_purchases", verbose_name=_(u"Factures Despeses"))
	icf_sale_movements  = models.ManyToManyField(iCf_Sale_movement, related_name="icf_self_employed_sale_movements", verbose_name=_(u"Factures Emeses"))
	icf_purchase_movements = models.ManyToManyField(iCf_Purchase_movement, related_name="icf_self_employed_purchase_movements", verbose_name=_(u"Factures Despeses"))

	def cooper(self):
		return self._icf_self_employed()
	def period(self):
		if self:
			return iCf_Period.objects.get(id=self.record_type.id)
		else:
			return ""
	def __init__(self, *args, **kwargs):

		super(iCf_Period_close, self).__init__(*args, **kwargs)
		#t = _check_icf_record_type("iCf_Period", "","", None, True)
		#self.record_type = _check_icf_record_type("iCf_Period_close", u'Sumatori i totals del periode de facturació.', u'Durant el trismestre els autoocupats asignen factures a un registre de Sumatori i totals. Un cop arribada la data de tancament, un procés automátic ha de tancar els registres no tancats pels usuaris.', t)
		#self.record_type = iCf_Record_Type.objects.get(clas="iCf_Period_close")

	def _icf_self_employed(self):
		if hasattr(self, 'icf_self_employed'):
			return self.icf_self_employed
		else:
			return 'none'
	_icf_self_employed.allow_tags = True
	_icf_self_employed.short_description = _(u"Autoocupat que factura")
	icf_self_employed = property(_icf_self_employed)
	def _ic_self_employed(self):
		if hasattr(self, 'ic_self_employed'):
			return self.ic_self_employed
		else:
			return 'none'
	_ic_self_employed.allow_tags = True
	_ic_self_employed.short_description = _(u"Registre d'Autoocupat")

	#sales
	sales_base = models.DecimalField(verbose_name=_(u"Base Imposable Emeses (€)"), decimal_places=2, max_digits=10, blank=True, null=True)
	sales_invoiced_vat = models.DecimalField(verbose_name=_(u"IVA Facturat (€)"), decimal_places=2, max_digits=10, blank=True, null=True)
	sales_assigned_vat = models.DecimalField(verbose_name=_(u"IVA Assignat (€)"), decimal_places=2, max_digits=10, blank=True, null=True)
	sales_total = models.DecimalField(verbose_name=_(u"Total Emeses (€)"), decimal_places=2, max_digits=10, blank=True, null=True)
	#purchases
	purchases_base = models.DecimalField(verbose_name=_(u"Base Imposable Despeses (€)"), decimal_places=2, max_digits=10, blank=True, null=True)
	purchases_vat = models.DecimalField(verbose_name=_(u"IVA Despeses (€)"), decimal_places=2, max_digits=10, blank=True, null=True)
	purchases_irpf = models.DecimalField(verbose_name=_(u"Retenció IRPF (€)"), decimal_places=2, max_digits=10, blank=True, null=True)
	purchases_total = models.DecimalField(verbose_name=_(u"Total Despeses (€)"), decimal_places=2, max_digits=10, blank=True, null=True)
	#vat
	vat_type = models.IntegerField(verbose_name=_(u"Tipus d'IVA"), choices=vat_TYPES, default=1)
	#savings_with_assigned_vat
	def savings_with_assigned_vat(self):
		try:
			saving = self.sales_invoiced_vat - self.sales_assigned_vat
			saving = saving if saving > 0 else 0
		except:
			saving = 0
		return saving if self.vat_type== vat_type_ASSIGNED else 0
	savings_with_assigned_vat.short_description = _(u'IVA Facturat - Assignat (€)')
	savings_with_assigned_vat_donation = models.DecimalField(verbose_name=_(u'Aportació (€)'), help_text=_(u"D'aquest import d'estalvi, vols aportar alguna quantitat a la CIC? En cas afirmatiu, indica l'import."), decimal_places=2, max_digits=10, default=0)
	def oficial_vat_total(self):
		try:
			vat = self.sales_invoiced_vat - self.purchases_vat
		except:
			vat = 0
		return 0 if vat < 0 else vat
	oficial_vat_total.decimal = True
	oficial_vat_total.short_description = _(u'IVA Facturat - Despeses (€)')
	def assigned_vat_total(self):
		try:
			vat = self.sales_assigned_vat - self.purchases_vat
		except:
			vat = 0
		return 0 if vat < 0 else vat
	assigned_vat_total.decimal = True
	assigned_vat_total.short_description = _(u'IVA Assignat - Despeses (€)')
	#tax
	period_tax = models.DecimalField(verbose_name=_(u"Quota"), decimal_places=2, help_text=_(u'Càlcul Quota Trimestral (segons taula quotes)'), max_digits=10, blank=True)
	#rel_fees = models.ManyToManyField('Welcome.Fee', related_name='periodclose_selfemployed', blank=True, null=True,verbose_name=_(u"Quotes trimestrals") )
	advanced_tax = models.DecimalField(verbose_name=_(u"Quota avançada"), decimal_places=2, max_digits=10, default=0, blank=True)
	def total_tax(self):
		try:
			return self.period_tax - self.advanced_tax().first().amount
		except:
			try:
				return self.period_tax
			except:
				return 0
	total_tax.decimal = True
	#donation
	donation = models.DecimalField(verbose_name=_(u'Aportació (€)'), help_text=_(u" Com que els resultats econòmics reflectits en aquest fitxer no sempre es corresponen amb l'activitat real del projecte, us volem donar aquesta opció per aportar el que considereu oportú. Si voleu, podeu indicar un import d´aportació al finançament d'activitats de la CIC en € i Ecos"),  decimal_places=2, max_digits=7, default=0)
	#total
	def total_vat(self):
		try:
			VATamount = self.sales_invoiced_vat- self.purchases_vat if self.vat_type == vat_type_OFICIAL else self.sales_assigned_vat - self.purchases_vat
		except:
			VATamount = 0
		return 0 if VATamount < 0 else VATamount
	total_vat.decimal = True
	def total_irpf(self):
		return self.purchases_irpf
	total_irpf.decimal = True
	def total(self):
		return self.total_tax() + self.donation + self.savings_with_assigned_vat_donation
	total.decimal = True
	def total_to_pay(self):
		try:
			return self.total_vat() + self.total_irpf() + self.total()
		except:
			return 0
	total_to_pay.decimal = True
	total_to_pay.short_description = (u"TOTAL A ABONAR (€)")
	def total_balance(self):
		total_previous = 0
		if self.period is not None:
			from Finances.bots import bot_balance
			total_previous = bot_balance( self.period, self.icf_self_employed ).total_previous()
		return total_previous
	total_balance.decimal = True
	total_balance.short_description = (u"TOTAL SALDO (€)")
	def total_acumulated(self):
		return self.total_to_pay() - self.total_balance()
	total_acumulated.decimal = True
	total_acumulated.short_description = (u"TOTAL A ABONAR - SALDO (€)")
	def __unicode__(self):
		return "hacked"
	class Meta:
		#unique_together = ('icf_self_employed', 'period')
		verbose_name= _(u'03 - Resultats')
		verbose_name_plural= _(u'03 - Resultats')
#*************************************************************
# See Manual, reference [GestioCI-Base_de_datos] Section: Entidades > Registres de soci (Afi, Individual, Col·lectiva, Autoocupat, firaire)
# on url: 
# (https://wiki.enredaos.net/index.php?title=GestioCI-Base_de_datos#Registres_de_soci_.28Afi.2C_Individual.2C_Col.C2.B7lectiva.2C_Autoocupat.2C_firaire.29)
#
# So,
# the fact that iCf_Self_Employed is inheriting iC_Self_Employed, excludes iC_Memberships to use Finances app as iCf_Self_Employed is foreignkey in invoices records.
# follow whateve on url:
# http://projects.cooperativa.cat/issues/109#change-115
#
# TODO:
# a) Remove v7 fields after migration proces is over.
from Welcome.models import iC_Self_Employed
class iCf_Self_Employed(iC_Self_Employed):
	ic_self_employed = models.OneToOneField('Welcome.iC_Self_Employed', primary_key=True, parent_link=True)
	user = models.ForeignKey(User, verbose_name=_(u"nº COOP"), related_name="fk_icf_self_employed")
	clients = models.ManyToManyField("General.Company", verbose_name=_(u"Clients"), related_name="fk_icse_client")
	providers = models.ManyToManyField("General.Company", verbose_name=_(u"Proveïdors"), related_name="fk_icse_provider")
	icf_periods_closed = models.ManyToManyField(iCf_Period_close, related_name="rel_icfse_icf_period_close", verbose_name=_(u"Periodes de facturacio"))
	def person(self):
		try:
			current_person = self.ic_se.ic_membership.human.persons.first()
		except:
			current_person = None
		return current_person
	def project(self):
		try:
			current_project = self.ic_se.ic_membership.ic_project
		except:
			current_project = None
		return current_project
	def coop(self):
		return self.ic_membership.ic_company
	coop.short_description = _(u"Cooperativa")
	def coop_number(self):
		return self.ic_membership.ic_CESnum
	coop_number.short_description = _(u"nº COOP")
	def advanced_tax(self):
		#https://wiki.enredaos.net/index.php?title=GestioCI-Codi#APP:Welcome
		#/admin/Welcome/ic_type/
		try:
			return self.rel_fees.filter(record_type__clas__contains="advanced_fee").first().amount #Quota Avançada ((45_eco) advanced_fee)
		except:
			return 0
	advanced_tax.short_description = _(u'Quota avançada (€)')
	advanced_tax.help_text=_(u"Quota que s'aplicarà el primer trimestre")
	def assigned_vat(self):
		return self.ic_self_employed.assigned_vat
	assigned_vat.short_description = _(u"Aquest és el valor % d'IVA assignat fruit de l'avaluació social.")
	def extra_days(self):
		return self.ic_self_employed.assigned_vat
	extra_days.short_description = _(u"Dies extra que pot editar el trimestre en curs.")
	def Company(self):
		return self.ic_membership.ic_company
	Company.short_description = _(u"Cooperativa a la que pertany.")
	def email( self ):
		return self.user.email
	email.short_description=_(u"Email")
	class Meta:
		verbose_name= _(u'D - Socia')
		verbose_name_plural= _(u'D -  Socies')
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

# PROXIES ***************************************************************
class icf_self_employed_proxy_companies(iCf_Self_Employed):
	class Meta:
		verbose_name= _(u'B - Els meus clients i proveïdors')
		verbose_name_plural= _(u'B - Els meus clients i proveïdors')
		proxy = True
class icf_self_employed_proxy_balance(iCf_Self_Employed):
	class Meta:
		verbose_name= _(u'L - Balanç projecte')
		verbose_name_plural= _(u'L - Balanç projectes')
		proxy = True
class icf_self_employed_proxy_transactions(iCf_Self_Employed):
	class Meta:
		verbose_name= _(u'K - Transaccions')
		verbose_name_plural= _(u'K - Transaccions')
		proxy = True
# *************************************************************************
																	
																	