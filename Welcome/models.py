#encoding=utf-8
from django.db import models

from mptt.models import MPTTModel
from mptt.fields import TreeForeignKey, TreeManyToManyField
from datetime import date, timedelta
from datetime import datetime
from django.utils.translation import ugettext_lazy as _
from decimal import Decimal

from General.models import *

#from General.models import Record, Human, Person, Project, Relation

# Create your models here.

class iC_Record(Record):  # create own ID's
  #record_type = TreeForeignKey()
  class Meta:
    verbose_name = _(u"Registre CI")
    verbose_name_plural = _(u"Registres CI")

#class iC_Type(Type):
#  class Meta:
#    verbose_name = _(u"CI Tipus")



class iC_Membership(iC_Record):
  ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
  human = models.ForeignKey('General.Human', verbose_name=_(u"Ens Soci"))
  #membership_type = models.ForeignKey('iC_Membership_Type', blank=True, null=True, verbose_name=_(u"Tipus de Soci"))
  ic_project = TreeForeignKey('General.Project', related_name='memberships', verbose_name=_(u"Cooperativa Integral"))
  contribution = TreeForeignKey('General.Relation', blank=True, null=True, verbose_name=_(u"Tipus de contribució"))
  join_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'Alta"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de Baixa"))
  join_fee = models.ForeignKey('Fee', blank=True, null=True, verbose_name=_(u"Cuota d'alta"))

  ic_CESnum = models.CharField(max_length=8, blank=True, null=True, verbose_name=_(u"Numero al CES/iCES"))
  comment = models.TextField(blank=True, verbose_name=_(u"Comentari"))
  labor_contract = models.OneToOneField('iC_Labor_Contract', blank=True, null=True, verbose_name=_(u"Contracte laboral?"))

  virtual_market = models.BooleanField(default=False, verbose_name=_(u"Mercat Virtual?"))
  expositors = models.ManyToManyField('General.Address', blank=True, null=True, verbose_name=_(u"Expositors (adreçes)"))

  def __unicode__(self):
    return self.ic_project.nickname+' > '+self.human.__unicode__()

  class Meta:
    verbose_name = _(u"Alta de Soci CI")
    verbose_name_plural = _(u"Altes de Socis CI")

  def _join_fee_payed(self):
    return self.join_fee.payed
  _join_fee_payed.boolean = True
  joinfee_payed = property(_join_fee_payed)

#class iC_Membership_Type()

class iC_Self_Employed(iC_Record):
  ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
  membership = models.ForeignKey('iC_Membership', related_name='self_employed', verbose_name=_(u"Soci (registre)"))

  join_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'Alta"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de Baixa"))
  rel_fees = models.ManyToManyField('Fee', blank=True, null=True, verbose_name=_(u"Quotes relacionades"))

  organic = models.BooleanField(verbose_name=_(u"Productes ecològics/organics?"))
  #welcome_session = models.BooleanField(default=False, verbose_name=_(u"Assistencia sessió d'acollida?"))

  req_id_cards = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
  req_address_contract = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix contractes (lloguer, cessió, etc)?"))
  req_insurance = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix assegurances?"))
  req_licence = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix llicències?"))
  req_images = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix fotos?"))

  rel_accountBank = models.ForeignKey('General.AccountBank', blank=True, null=True, verbose_name=_(u"Compte bancari CI associat"))
  #socialcoin_session = models.BooleanField(default=False, verbose_name=_(u"Assistencia sessió moneda social?"))

  assigned_vat = models.DecimalField(max_digits=4, decimal_places=2, default=18, verbose_name=_(u"IVA assignat"))
  review_vat = models.BooleanField(default=False, verbose_name=_(u"IVA en revisió?"))
  last_review_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data última revisió IVA"))

  mentor_membership = models.ForeignKey('iC_Membership', related_name='mentor_of_SE', blank=True, null=True, verbose_name=_(u"Soci Mentor"))
  mentor_comment = models.TextField(blank=True, null=True, verbose_name=_(u"Comentaris soci mentor"))

  def _has_assisted_welcome(self):
    if Learn_Session.objects.filter(
        record_type__clas='welcome_session',
        assistants__human__pk=self.membership.human.pk).count() > 0:
      return True
    else:
      return False
  _has_assisted_welcome.boolean = True
  welcome_session = property(_has_assisted_welcome)

  def _has_assisted_socialcoin(self):
    if Learn_Session.objects.filter(
        record_type__clas='socialcoin_session',
        assistants__human__pk=self.membership.human.pk).count() > 0:
      return True
    else:
      return False
  _has_assisted_socialcoin.boolean = True
  socialcoin_session = property(_has_assisted_socialcoin)

  class Meta:
    verbose_name = _(u"Soci Autoocupat")
    verbose_name_plural = _(u"Altes Socis Autoocupats")


class iC_Stallholder(iC_Self_Employed):  # Firaire
  ic_self_employed = models.OneToOneField('iC_Self_Employed', primary_key=True, parent_link=True)
  #req_photos = models.SmallIntegerField(default=1, verbose_name=_(u"Requereix fotos?"))
  TentType = (
    ('none',_(u"sense")),
    ('wood',_(u"de fusta")),
    ('metal',_(u"metàlica"))
  )
  tent_type = models.CharField(max_length=5, choices=TentType, verbose_name=_(u"Tipus de carpa"))
  class Meta:
    verbose_name = _(u"Soci Firaire")
    verbose_name_plural = _(u"Altes Socis Firaires")



class Learn_Session(iC_Record):
  nonmaterial = models.ForeignKey('General.Nonmaterial', verbose_name=_(u"Formació (obra inmaterial)"))
  assistants = models.ManyToManyField('General.Human', related_name='assist_sessions', blank=True, null=True, verbose_name=_(u"Assistents"))
  facilitator = models.ForeignKey('General.Person', related_name='facilitate_sessions', blank=True, null=True, verbose_name=_(u"Facilitador"))
  datetime = models.DateTimeField(blank=True, null=True, verbose_name=_(u"Dia i Hora"))
  duration = models.TimeField(default='01:00', verbose_name=_(u"Duració"))
  address = models.ForeignKey('General.Address', blank=True, null=True, verbose_name=_(u"Adreça"))
  def __unicode__(self):
    return self.nonmaterial.name+': '+self.datetime+' ('+self.facilitator.name+') '+self.address.name
  class Meta:
    verbose_name = _(u"Sessió formativa")
    verbose_name_plural = _(u"r- Sessions formatives")


class Project_Accompaniment(iC_Record):
  human = models.ForeignKey('General.Human', related_name='accompaniments', verbose_name=_(u"Projecte"))
  situation = models.TextField(blank=True, verbose_name=_(u"Situació actual"))
  needs = models.TextField(blank=True, verbose_name=_(u"Necessitats"))
  petitioner = models.ForeignKey('General.Human', related_name='petitions', blank=True, null=True, verbose_name=_(u"Peticionari"))
  petition = models.TextField(blank=True, verbose_name=_(u"Comentari petició"))
  facilitator = models.ForeignKey('General.Person', related_name='facilitate_projects', blank=True, null=True, verbose_name=_(u"Facilitador"))

  class Meta:
    verbose_name = _(u"Expedient Projecte Productiu")
    verbose_name_plural = _(u"r- Expedients P.Productius")


class Fee(iC_Record):
  ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
  human = models.ForeignKey('General.Human', related_name='out_fees', verbose_name=_(u"Ens pagador"))
  project = TreeForeignKey('General.Project', related_name='in_fees', verbose_name=_(u"Projecte receptor"))
  amount = models.DecimalField(max_digits=6, decimal_places=2, verbose_name=_(u"Import"))
  unit = models.ForeignKey('General.Unit', verbose_name=_(u"Unitat"))
  issue_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'emisió"))
  deadline_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de venciment"))
  payment_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de pagament"))
  membership = models.ForeignKey('iC_Membership', related_name='fees', blank=True, null=True, verbose_name=_(u"Registre de Soci"))
  rel_account = models.ForeignKey('General.Record', related_name='rel_fees', blank=True, null=True, verbose_name=_(u"Compte relacionat"))

  #accountCes = models.ForeignKey('General.AccountCes', blank=True, null=True, verbose_name=_(u"Compte CES relacionat"))
  payment_type = models.ForeignKey('Payment_Mode', blank=True, null=True, verbose_name=_(u"Forma de pagament"))

  def __unicode__(self):
    return self.record_type.name+': '+self.human.__unicode__()+' ['+str(self.amount)+' '+self.unit.code+'] > '+self.entity.nickname

  class Meta:
    verbose_name = _(u"Quota")
    verbose_name_plural = _(u"r- Quotes")

  def _is_payed(self):
    if self.payment_date is None or self.payment_date == '':
      return False
    else:
      return True
  _is_payed.boolean = True
  payed = property(_is_payed)



class Payment_Mode(Relation):
  relation = models.OneToOneField('General.Relation', primary_key=True, parent_link=True)
  class Meta:
    verbose_name = _(u"Forma de pagament")
    verbose_name_plural = _(u"Formes de pagament")




class iC_Document(iC_Record):
  ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
  doc_type = models.ForeignKey('iC_Document_Type', blank=True, null=True, verbose_name=_(u"Tipus de document"))
  comment = models.TextField(blank=True, verbose_name=_(u"Comentari"))
  file = models.FileField(upload_to='docs', blank=True, null=True, verbose_name=_(u"Document escanejat"))

class iC_Document_Type(Record_Type):
  record_type = models.OneToOneField('General.Record_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name = _(u"Tipus de Document CI")



class iC_Labor_Contract(iC_Document):
  ic_document = models.OneToOneField('iC_Document', primary_key=True, parent_link=True)
  person = models.ForeignKey('General.Person', verbose_name=_(u"Persona contractada"))
  company = models.ForeignKey('General.Company', verbose_name=_(u"Empresa contractant"))
  start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici del contracte"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final del contracte"))
  rel_fees = models.ManyToManyField('Fee', blank=True, null=True, verbose_name=_(u"Quotes relacionades"))

  def __unicode__(self):
    return self.company.nickname+': '+self.person.name+' '+self.person.surnames+' ('+self.person.id_card+')'

  class Meta:
    verbose_name = _(u"Contracte Laboral CI")
    verbose_name_plural = _(u"d- Contractes Laborals CI")


class iC_Address_Contract(iC_Document):
  ic_document = models.OneToOneField('iC_Document', primary_key=True, parent_link=True)
  membership = models.ForeignKey('iC_Membership', verbose_name=_(u"Soci (registre)"))
  company = models.ForeignKey('General.Company', verbose_name=_(u"Empresa titular (CI)"))
  address = models.ForeignKey('General.Address', verbose_name=_(u"Adreça contractada"))
  price = models.DecimalField(max_digits=13, decimal_places=2, blank=True, null=True, verbose_name=_(u"Import"))
  price_unit = models.ForeignKey('General.Unit', blank=True, null=True, verbose_name=_(u"Unitat"))
  start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici del contracte"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final del contracte"))

  def __unicode__(self):
    return self.company.nickname+': '+self.membership.human.name+' > '+self.address.__unicode__()

  class Meta:
    verbose_name = _(u"Contracte d'Adreça CI")
    verbose_name_plural = _(u"d- Contractes d'Adreçes CI")


class iC_Insurance(iC_Document):
  ic_document = models.OneToOneField('iC_Document', primary_key=True, parent_link=True)
  membership = models.ForeignKey('iC_Membership', verbose_name=_(u"Soci (registre)"))
  company = models.ForeignKey('General.Company', verbose_name=_(u"Empresa asseguradora"))
  number = models.CharField(max_length=30, blank=True, null=True, verbose_name=_(u"Número de Pòlissa"))
  price = models.DecimalField(max_digits=13, decimal_places=2, blank=True, null=True, verbose_name=_(u"Import"))
  price_unit = models.ForeignKey('General.Unit', blank=True, null=True, verbose_name=_(u"Unitat"))
  start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici de l'assegurança"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final de l'assegurança"))
  rel_address = models.ForeignKey('General.Address', blank=True, null=True, verbose_name=_(u"Adreça assegurada"))
  rel_job = models.ForeignKey('General.Job', blank=True, null=True, verbose_name=_(u"Ofici assegurat"))

  def __unicode__(self):
    return self.company.nickname+': '+self.membership.human.name+' ('+self.membership.ic_CESnum+')'

  class Meta:
    verbose_name = _(u"Assegurança soci CI")
    verbose_name_plural = _(u"d- Assegurances socis CI")


class iC_Licence(iC_Document):
  ic_document = models.OneToOneField('iC_Document', primary_key=True, parent_link=True)
  membership = models.ForeignKey('iC_Membership', verbose_name=_(u"Soci (registre)"))
  number = models.CharField(max_length=30, blank=True, null=True, verbose_name=_(u"Número de Licència"))
  #price = models.DecimalField(max_digits=7, decimal_places=2, blank=True, null=True, verbose_name=_(u"Import (euros)"))
  start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici de la licència"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final de la licència"))
  rel_address = models.ForeignKey('General.Address', blank=True, null=True, verbose_name=_(u"Adreça relacionada"))
  rel_job = models.ForeignKey('General.Job', blank=True, null=True, verbose_name=_(u"Ofici relacionat"))

  def __unicode__(self):
    return self.name+': '+self.membership.human.name+' ('+self.membership.ic_CESnum+')'

  class Meta:
    verbose_name = _(u"Llicència soci CI")
    verbose_name_plural = _(u"d- Llicències socis CI")
