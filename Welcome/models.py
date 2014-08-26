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

a_strG = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/admin/General/"
a_strW = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/admin/Welcome/"
#a_str2 = "?_popup=1&_changelist_filters=_popup=1&t=human' target='_blank' style='margin-left:-100px'>"
#a_str2 = "?_popup=1&_changelist_filters=_popup=1' target='_blank' style='margin-left:-100px'>"
a_str2 = "' target='_blank' style='margin-left:-100px'>"
a_str3 = "' target='_blank'>"
add_pers = 'add Persona'#_(u"Nova Persona")
add_proj = 'add Project'#_(u"Nou Projecte")
a_edit = '<b>Editar</b>'

str_remove = 'treu'
ul_tag = '<ul>'
ul_tag1 = '<ul style="margin-left:-10em;">'

ico_no = '<img src="/static/admin/img/icon-no.gif" alt="False">'
ico_yes = '<img src="/static/admin/img/icon-yes.gif" alt="True">'


'''
@app.route('/update_fnk', method=["POST"])
def update_fnk(self, **data):
    print 'JEELOW'
    print str(self)
    print str(data)
    ret_val = 'JOOL'

    return jsonify({"update_fnk", ret_val})
'''

def erase_id_link(field, id):
  out = '<a class="erase_id_on_box" name="'+str(field)+','+str(id)+'" href="javascript:;">'+str_remove+'</a>'
  return out

# Create your models here.

class iC_Record(Artwork):  # create own ID's
  record_type = TreeForeignKey('iC_Record_Type', blank=True, null=True, verbose_name=_(u"Tipus de Registre CI"))
  class Meta:
    verbose_name= _(u'Registre CI')
    verbose_name_plural= _(u'o- Registres CI')
  def __unicode__(self):
    if self.record_type is None or self.record_type == '':
      return self.name
    elif self.name is None or self.name == '':
      return self.record_type.name+': ??'
    else:
      return self.name
  def _selflink(self):
    if self.id:
        return a_strG + "ic_record/" + str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
    else:
        return "Not present"
  _selflink.allow_tags = True

  def __init__(self, *args, **kwargs):
    super(iC_Record, self).__init__(*args, **kwargs)

    #if not 'rel_tit' in globals():
    #  rel_tit = Relation.objects.get(clas='holder')


class iC_Type(Concept):  # create own ID's
  clas = models.CharField(blank=True, verbose_name=_(u"Clase"), max_length=200,
                          help_text=_(u"Model de django o classe python associada al Tipus CI"))
  class Meta:
    verbose_name = _(u"c- Tipus CI")

  def __unicode__(self):
    if self.clas is None or self.clas == '':
      return self.name
    else:
      return self.name+' ('+self.clas+')'


class iC_Record_Type(iC_Type):
  ic_type = models.OneToOneField('iC_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name= _(u'Tipus de Registre CI')
    verbose_name_plural= _(u'c-> Tipus de Registres CI')


#---------  A L T E S   S O C I S

class iC_Akin_Membership(iC_Record):
  ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
  person = models.OneToOneField('General.Person', verbose_name=_(u"Persona, membre afí"))
  ic_project = TreeForeignKey('General.Project', related_name='akin_memberships', verbose_name=_(u"Cooperativa Integral"))
  ic_company = models.ForeignKey('General.Company', blank=True, null=True, related_name='akin_memberships', verbose_name=_(u"entitat legal"))

  ic_membership = models.ForeignKey('iC_Membership', blank=True, null=True, related_name='akin_memberships', verbose_name=_(u"vinculada al Projecte Soci"))
  join_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'Alta"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de Baixa"))

  def _has_id_card(self):
    if self.person.id_card is None or self.person.id_card == '':
      return False
    else:
      return True
  _has_id_card.boolean = True
  _has_id_card.short_description = _(u"Dni/Nie?")
  has_id_card = property(_has_id_card)

  def __unicode__(self):
    if self.record_type is None or self.record_type == '':
      return self.ic_project.nickname+' > '+self.person.__unicode__()
    else:
      return self.record_type.name+': '+self.person.__unicode__()
  def __init__(self, *args, **kwargs):
    super(iC_Akin_Membership, self).__init__(*args, **kwargs)
    self.record_type = iC_Record_Type.objects.get(clas='iC_Akin_Membership')  # there's only one ic_record_type for this kind of member
    if not hasattr(self, 'ic_project') or self.ic_project is None:
      self.ic_project = Project.objects.get(nickname='CIC')

  class Meta:
    verbose_name = _(u"Alta de Soci Afí CI")
    verbose_name_plural = _(u"- Altes de Socis Afins CI")

  def _person_link(self):
    if hasattr(self, 'person'):
      return self.person._selflink()
    else:
      return str_none
      lnk1 = a_strG + "person/add/" + a_str2 + add_pers + "</a>"
      return lnk1
  _person_link.allow_tags = True
  _person_link.short_description = ''


class iC_Membership(iC_Record):
  ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
  human = models.ForeignKey('General.Human', verbose_name=_(u"Ens Soci"))
  ic_project = TreeForeignKey('General.Project', related_name='memberships', verbose_name=_(u"Cooperativa Integral"))
  ic_company = models.ForeignKey('General.Company', blank=True, null=True, related_name='memberships', verbose_name=_(u"entitat legal"))

  contribution = TreeForeignKey('General.Relation', blank=True, null=True, verbose_name=_(u"Tipus de contribució"))
  join_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'Alta"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de Baixa"))
  join_fee = models.ForeignKey('Fee', blank=True, null=True, related_name="membership", verbose_name=_(u"Cuota d'alta"))

  ic_CESnum = models.CharField(max_length=8, blank=True, null=True, verbose_name=_(u"Numero al CES/iCES"))

  virtual_market = models.BooleanField(default=False, verbose_name=_(u"Mercat Virtual?"))
  expositors = models.ManyToManyField('General.Address', blank=True, null=True, verbose_name=_(u"Expositors (adreçes)"))

  def __unicode__(self):
    if self.record_type is None or self.record_type == '':
      if self.ic_CESnum is None or self.ic_CESnum == '':
        return self.ic_project.nickname+' (!record_type) > '+self.human.__unicode__()
      return self.ic_CESnum+' ('+self.human.nickname+') !record_type'
    else:
      if self.human:
        if self.ic_CESnum is None or self.ic_CESnum == '':
          return self.record_type.name+': '+self.human.__unicode__()
        return self.ic_CESnum+' ('+self.human.nickname+')'
      else:
        return self.record_type+': ??'

  class Meta:
    verbose_name = _(u"Alta de Soci CI")
    verbose_name_plural = _(u"r-> Altes de Socis CI (tots menys afins)")

  def _join_fee_payed(self):
    if self.join_fee:
      return self.join_fee.payed
    return None
  _join_fee_payed.boolean = True
  _join_fee_payed.short_description = _(u"Quota d'Alta Pagada?")
  joinfee_payed = property(_join_fee_payed)

  def _human_link(self):
    if hasattr(self, 'human'):
      return self.human._selflink()
    else:
      return str_none
      lnk1 = a_strG + "person/add/" + a_str2 + add_pers + "</a>"
      lnk2 = a_strG + "project/add/" + a_str3 + add_proj + "</a>"
      return lnk1+' / '+lnk2
  _human_link.allow_tags = True
  _human_link.short_description = ''

  def _joinfee_link(self):
    if hasattr(self, 'join_fee'):
      return self.join_fee._selflink()
    else:
      return str_none
      lnk = a_strW + "fee/add/" + a_str2 + "add Fee</a>"
      return lnk
  _joinfee_link.allow_tags = True
  _joinfee_link.short_description = ''

  def _ic_selfemployed_list(self):
    if hasattr(self, 'selfemployed_recs'):
      out = ul_tag
      for rec in self.selfemployed_recs.all():
        out += '<li>'+ a_strW + 'ic_self_employed/'+str(rec.id) + a_str3 + '<b>'+str(rec.name) + '</b></a></li>'
      if out == ul_tag:
        return str_none
      return out+'</ul>'
    return str_none
  _ic_selfemployed_list.allow_tags = True
  _ic_selfemployed_list.short_description = _(u"reg. alta Autoocupat")

  def _expositors_list(self):
    out = ul_tag
    for add in self.expositors.all():
      out += '<li>'+ add.name +' - '+erase_id_link('expositors', add.id)+'</li>'
    if out == ul_tag:
      return str_none
    return out+'</ul>'
  _expositors_list.allow_tags = True
  _expositors_list.short_description = ''

  def _selflink(self):
    if self.id:
      return a_strW + "ic_membership/" + str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
    else:
      return "Not present"
  _selflink.allow_tags = True
  _selflink.short_description = ''

  def __init__(self, *args, **kwargs):
    super(iC_Membership, self).__init__(*args, **kwargs)
    if not hasattr(self, 'ic_project') or self.ic_project is None:
      self.ic_project = Project.objects.get(nickname='CIC')


class iC_Person_Membership(iC_Membership):
  ic_membership = models.OneToOneField('iC_Membership', primary_key=True, parent_link=True)
  person = models.ForeignKey('General.Person', verbose_name=_(u"Persona Sòcia"))
  labor_contract = models.OneToOneField('iC_Labor_Contract', blank=True, null=True, verbose_name=_(u"Contracte laboral?"))

  class Meta:
    verbose_name = _(u"Alta de Soci Cooperatiu individual CI")
    verbose_name_plural = _(u"- Altes Socis Cooperatius Individuals CI")

  def __init__(self, *args, **kwargs):
    super(iC_Person_Membership, self).__init__(*args, **kwargs)
    self.record_type = iC_Record_Type.objects.get(clas='iC_Person_Membership')  # there's only one ic_record_type for this kind of member

  def _person_link(self):
    if hasattr(self, 'person'):
      return self.person._selflink()
    else:
      return str_none
      lnk1 = a_strG + "person/add/" + a_str2 + add_pers + "</a>"
      return lnk1
  _person_link.allow_tags = True
  _person_link.short_description = ''

  def _selflink(self):
    if self.id:
      return a_strW + "ic_person_membership/"+str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
    else:
      return "Not present"
  _selflink.allow_tags = True
  _selflink.short_description = ''


class iC_Project_Membership(iC_Membership):
  ic_membership = models.OneToOneField('iC_Membership', primary_key=True, parent_link=True)
  project = models.ForeignKey('General.Project', verbose_name=_(u"Projecte Sòci"))
  #person = models.OneToOneField('General.Person', verbose_name=_(u"Persona referencia"))
  class Meta:
    verbose_name = _(u"Alta de Projecte Col·lectiu CI")
    verbose_name_plural = _(u"- Altes Socis Projectes Col·lectius CI")

  #def __unicode__(self):
  #  if self.record_type is None or self.record_type == '':
  #    return self.ic_project.nickname+' > '+self.project.__unicode__()
  #  else:
  #    return self.record_type.name+': '+self.project.__unicode__()
  def __init__(self, *args, **kwargs):
    super(iC_Project_Membership, self).__init__(*args, **kwargs)
    if self.record_type is None or self.record_type == '':
      self.record_type = iC_Record_Type.objects.get(clas='iC_Project_Membership')  # if empty, put generic ic_record_type for project membership

  def _project_link(self):
    if hasattr(self, 'project'):
      return self.project._selflink()
    else:
      return str_none
      lnk1 = a_strG + "project/add/" + a_str2 + add_proj + "</a>"
      return lnk1
  _project_link.allow_tags = True
  _project_link.short_description = ''

  def _selflink(self):
    if self.id:
      return a_strW + "ic_project_membership/" + str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
    else:
      return "Not present"
  _selflink.allow_tags = True
  _selflink.short_description = ''


'''
class iC_Membership_Type(iC_Record_Type):
  record_type = models.OneToOneField('iC_Record_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name = _(u"Tipus de Soci")
    verbose_name_plural = _(u"c-> Tipus de Socis")
'''


class iC_Self_Employed(iC_Record):
  ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
  ic_membership = models.ForeignKey('iC_Membership', related_name='selfemployed_recs', verbose_name=_(u"Registre de Soci"))

  join_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'Alta autoocupat"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de Baixa autoocupat"))

  rel_fees = models.ManyToManyField('Fee', related_name='selfemployed', blank=True, null=True,
                                    verbose_name=_(u"Quotes trimestrals"),
                                    )#limit_choices_to={'record_type__parent__clas': 'quarterly_fee'})#human':ic_membership.human.pk})#.self_employed})

  organic = models.BooleanField(verbose_name=_(u"Productes ecològics/organics?"))
  #welcome_session = models.BooleanField(default=False, verbose_name=_(u"Assistencia sessió d'acollida?"))

  '''
  req_address_contract = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix contractes (lloguer, cessió, etc)?"))
  req_insurance = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix assegurances?"))
  req_licence = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix llicències?"))
  req_images = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix fotos?"))
  '''
  rel_address_contracts = models.ManyToManyField('iC_Address_Contract', related_name="selfemployed", blank=True, null=True, verbose_name=_(u"Contractes d'Adreça vinculats"))
  rel_insurances = models.ManyToManyField('iC_Insurance', related_name="selfemployed", blank=True, null=True, verbose_name=_(u"Assegurances vinculades"))
  rel_licences = models.ManyToManyField('iC_Licence', related_name="selfemployed", blank=True, null=True, verbose_name=_(u"Llicències vinculades"))
  rel_images = models.ManyToManyField('General.Image', related_name="selfemployed", blank=True, null=True, verbose_name=_(u"Imatges requerides"))


  rel_accountBank = models.ForeignKey('General.AccountBank', blank=True, null=True, verbose_name=_(u"Compte bancari CI associat"))
  #socialcoin_session = models.BooleanField(default=False, verbose_name=_(u"Assistencia sessió moneda social?"))

  assigned_vat = models.DecimalField(max_digits=4, decimal_places=2, default=18, blank=True, null=True, verbose_name=_(u"IVA assignat"))
  review_vat = models.BooleanField(default=False, verbose_name=_(u"IVA en revisió?"))
  last_review_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data última revisió IVA"))

  mentor_membership = models.ForeignKey('iC_Membership', related_name='mentor_of_SE', blank=True, null=True, verbose_name=_(u"Soci Mentor"))
  mentor_comment = models.TextField(blank=True, null=True, verbose_name=_(u"Comentaris soci mentor"))

  def _has_assisted_welcome(self):
    sess = self.ic_membership.human.assist_sessions.filter(record_type__clas='welcome_session')
    if sess.count() > 0:
      return ico_yes+' &nbsp;'+str(sess.first().datetime.date())+' ('+str(sess.first().address.name)+')'
    else:
      return ico_no
  _has_assisted_welcome.allow_tags = True
  _has_assisted_welcome.short_description = _(u"Assistencia a l'Acollida?")
  welcome_session = property(_has_assisted_welcome)

  def _has_assisted_socialcoin(self):
    if self.ic_membership.human.assist_sessions.filter(record_type__clas='socialcoin_session').count() > 0:
      return True
    else:
      return False
  _has_assisted_socialcoin.boolean = True
  _has_assisted_socialcoin.short_description = _(u"Assistencia a Moneda Social?")
  socialcoin_session = property(_has_assisted_socialcoin)

  def __unicode__(self):
    if self.record_type is None or self.record_type == '':
      return self.ic_membership.ic_project.nickname+' > '+self.ic_membership.__unicode__()
    else:
      return self.record_type.name+': '+self.ic_membership.__unicode__()

  class Meta:
    verbose_name = _(u"Alta Proj.Autoocupat")
    verbose_name_plural = _(u"- Altes Proj. Autoocupats")

  def __init__(self, *args, **kwargs):
    super(iC_Self_Employed, self).__init__(*args, **kwargs)
    self.record_type = iC_Record_Type.objects.get(clas='iC_Self_Employed')

  def _member_link(self):
    if self.id:
      #print 'ID: '+str(self.id)
      slug = 'ic_membership'
      if hasattr(self.ic_membership.human, 'project'):
        #print 'PROJECT! '+str(self.ic_membership.human.project)
        slug = 'ic_project_membership'
      elif hasattr(self.ic_membership.human, 'person'):
        #print 'PERSON! '+str(self.ic_membership.human.person)
        slug = 'ic_person_membership'
      else:
        return slug+'!!'
      #print str(self.ic_membership.human.project)
      return a_strW + slug +"/" + str(self.ic_membership.id) + a_str2 + a_edit + "</a>"# % str(self.id)
    else:
      return "Not present"
  _member_link.allow_tags = True
  _member_link.short_description = ''

  def _rel_fees(self): #= models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
    fees = self.rel_fees.all()
    out = ul_tag
    if fees.count() > 0:
      for fee in fees:
        ico = ico_no
        if fee.payed:
          ico = ico_yes
        out += '<li>'+a_strW +'fee/'+str(fee.id)+a_str3 + '<b>'+fee.__unicode__() +'</b></a>: &nbsp; '+ ico +' </li>'
      return out + '</ul>'
    return False
  _rel_fees.allow_tags = True
  _rel_fees.short_description = ''#_(u"contractes?")

  def _rel_id_cards(self): #= models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
    rels = rel_Human_Persons.objects.filter(human=self.ic_membership.human)
    out = ''
    if rels.count() > 0:
      for rel in rels:
        if hasattr(rel, 'person'):
          out += a_strG +'person/'+str(rel.person.id)+a_str3 + '<b>'+str(rel.person) + '</b></a>: '+str(rel.person.id_card) +' / '
        else:
          print '_REL_ID_CARDS: rel has not Person! '+str(rel)
      return out
    else:
      out = a_strG +'person/'+str(self.ic_membership.human.id)+a_str3+ str(self.ic_membership.human)+'</a>: '+str(self.ic_membership.human.person.id_card)
      return out
  _rel_id_cards.allow_tags = True
  _rel_id_cards.short_description = _(u"dni membres?")

  def _rel_address_contract(self): #= models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
    addrs = self.rel_address_contracts.all()
    out = ul_tag
    if addrs.count() > 0:
      for adr in addrs:
        if adr._is_valid():
          ico = ico_yes
        else:
          ico = ico_no
        out += '<li>'+a_strW +'ic_address_contract/'+str(adr.id)+a_str3 + '<b>'+adr.__unicode__() +'</b></a>: '+adr.doc_type.name+' &nbsp; '+ico+'</li>'
      return out + '</ul>'
    return str_none
  _rel_address_contract.allow_tags = True
  _rel_address_contract.short_description = ''#_(u"contractes?")

  def _rel_licences(self): #= models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
    lics = self.rel_licences.all()
    out = ul_tag
    job = adr = ''
    if lics.count() > 0:
      for lic in lics:
        if lic.rel_job:
          job = lic.rel_job.name
        if lic.rel_address:
          adr = lic.rel_address.name
        if lic._is_valid():
          ico = ico_yes
        else:
          ico = ico_no
        out += '<li>'+a_strW +'ic_licence/'+str(lic.id)+a_str3 + '<b>'+lic.__unicode__() +'</b></a>: '+job+' '+adr+' &nbsp; '+ico+'</li>'
      return out + '</ul>'
    return str_none
  _rel_licences.allow_tags = True
  _rel_licences.short_description = ''

  def _rel_insurances(self): #= models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
    insus = self.rel_insurances.all()
    out = ul_tag
    job = adr = ''
    if insus.count() > 0:
      for ins in insus:
        if ins.rel_job:
          job = ins.rel_job.name
        if ins.rel_address:
          adr = ins.rel_address.name
        if ins._is_valid():
          ico = ico_yes
        else:
          ico = ico_no
        out += '<li>'+a_strW +'ic_insurance/'+str(ins.id)+a_str3 + '<b>'+ins.__unicode__() +'</b></a>: '+job+' '+adr+' &nbsp; '+ico+'</li>'
      return out + '</ul>'
    return str_none
  _rel_insurances.allow_tags = True
  _rel_insurances.short_description = ''



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
    verbose_name = _(u"Alta Proj.Autoocupat Firaire")
    verbose_name_plural = _(u"- Altes Proj. Autoocupats Firaires")




#------- O T H E R   R E C O R D S

class Learn_Session(iC_Record):
  nonmaterial = models.ForeignKey('General.Nonmaterial', verbose_name=_(u"Formació (obra inmaterial)"))
  assistants = models.ManyToManyField('General.Human', related_name='assist_sessions', blank=True, null=True,
            verbose_name=_(u"Assistents"), help_text=_(u"buscar"))
  facilitator = models.ForeignKey('General.Human', related_name='facilitate_sessions', blank=True, null=True, verbose_name=_(u"Facilitador"))
  datetime = models.DateTimeField(blank=True, null=True, verbose_name=_(u"Dia i Hora"))
  duration = models.TimeField(default='01:00', verbose_name=_(u"Duració"))
  address = models.ForeignKey('General.Address', blank=True, null=True, verbose_name=_(u"Adreça"))
  def __unicode__(self):
    return self.nonmaterial.name+': '+str(self.datetime.date())+' ('+self.facilitator.name+') '+self.address.name
  class Meta:
    verbose_name = _(u"Sessió formativa")
    verbose_name_plural = _(u"r- Sessions formatives")

  def _assistants_link(self):
    assis = self.assistants.all()
    if assis.count() > 0:
      out = ul_tag
      for ass in assis:
        slug = 'person'
        if hasattr(ass, 'project'):
          slug = 'project'
        out += '<li>'+a_strG+ slug+'/'+str(ass.id)+ a_str3+ '<b>'+ass.__unicode__()+'</b></a> - '+erase_id_link('assistants', ass.id)
      return out+'</ul>'
    return str_none
  _assistants_link.allow_tags = True
  _assistants_link.short_description = ''

  def _num_assistants(self):
    return self.assistants.count()
  _num_assistants.short_description = _(u"Num")

class Project_Accompaniment(iC_Record):
  human = models.ForeignKey('General.Human', related_name='accompaniments', verbose_name=_(u"Projecte"))
  situation = models.TextField(blank=True, verbose_name=_(u"Situació actual"))
  needs = models.TextField(blank=True, verbose_name=_(u"Necessitats"))
  petitioner = models.ForeignKey('General.Human', related_name='petitions', blank=True, null=True, verbose_name=_(u"Peticionari"))
  petition = models.TextField(blank=True, verbose_name=_(u"Comentari petició"))
  facilitator = models.ForeignKey('General.Human', related_name='facilitate_projects', blank=True, null=True, verbose_name=_(u"Facilitador"))

  class Meta:
    verbose_name = _(u"Expedient Projecte Productiu")
    verbose_name_plural = _(u"r- Expedients P.Productius")



class Fee(iC_Record):
  ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
  human = models.ForeignKey('General.Human', related_name='out_fees', verbose_name=_(u"Ens pagador"))
  project = TreeForeignKey('General.Project', related_name='in_fees', verbose_name=_(u"Projecte receptor"))
  amount = models.DecimalField(default=0, max_digits=6, decimal_places=2, verbose_name=_(u"Import"))
  unit = models.ForeignKey('General.Unit', verbose_name=_(u"Unitat"))
  #ic_membership = models.ForeignKey('iC_Membership', related_name='fees', blank=True, null=True, verbose_name=_(u"Registre de Soci"))
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

  issue_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'emisió"))
  deadline_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de venciment"))
  payment_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de pagament"))
  payment_type = TreeForeignKey('Payment_Type', blank=True, null=True, verbose_name=_(u"Forma de pagament"))

  rel_account = models.ForeignKey('General.Record', related_name='rel_fees', blank=True, null=True, verbose_name=_(u"Compte relacionat"))

  def __unicode__(self):
		if self.record_type is None:
			record_type = "<record:type.name>"
		else:
			record_type = self.record_type.name
		return record_type +': '+self.human.__unicode__()+' ['+str(self.amount)+' '+self.unit.code+']'#' > '+self.project.nickname

  class Meta:
    verbose_name = _(u"Quota")
    verbose_name_plural = _(u"r- Quotes")

  def _is_payed(self):
    if self.payment_date is None or self.payment_date == '':
      return False
    else:
      return True
  _is_payed.boolean = True
  _is_payed.short_description = _(u"Pagada?")
  payed = property(_is_payed)

  def __init__(self, *args, **kwargs):
    super(Fee, self).__init__(*args, **kwargs)
    if not hasattr(self, 'project') or self.project is None or self.project == '':
      self.project = Project.objects.get(nickname='CIC')  # if empty, put generic ic_record_type for project membership
    #if hasattr(self, 'selfemployed') and self.selfemployed.count():
    #  if self.membership.count() == 0:
    #    mem = self.selfemployed.first().ic_membership
    #    print 'FEE: TE SELFEMPLOYED ('+str(mem)+') i no te MEMBERSHIP ('+str(self.membership)+')'
    #    self.membership.add(mem)# = self.selfemployed.first().ic_membership
  def _auto_amount(self):
    if self.record_type.clas.startswith('(') and self.unit is not None:

      arr = self.record_type.clas.split(' ')[0].strip('()').split('_')
      if arr[0].isdigit():
        uni = Unit.objects.filter(code=arr[1])
        if uni.count() == 1:
          eqi = UnitRatio.objects.filter(in_unit=uni.first(), out_unit=self.unit)
          rate = 1
          if eqi.count() == 0:
            #print uni.first()
            #print self.unit
            if uni.first() == self.unit:
              #print '_AUTO_AMOUNT: equal!'
              pass
            else:
              print '_AUTO_AMOUNT: not equal'
              eqi2 = UnitRatio.objects.filter(in_unit=self.unit)
              #print '_AUTO_AMOUNT: eqi2: '+str(eqi2)
              #print '_AUTO_AMOUNT: eqi2.first '+str(eqi2.first().out_unit.name)
              eqi3 = UnitRatio.objects.filter(in_unit=uni.first(), out_unit=eqi2.first().out_unit)
              #print '_AUTO_AMOUNT: eqi3: '+str(eqi3)
              rate2 = eqi3.first().rate
              print '_AUTO_AMOUNT: rate2: '+str(rate2)
              rate = (1/eqi2.first().rate)*rate2
          elif eqi.count() == 1:
            rate = eqi.first().rate
          else:
            print '_AUTO_AMOUNT: eqi ??: '+str(eqi)
          val = float(arr[0])/float(rate)
          setattr(self, 'amount', val)
          #print '_AUTO_AMOUNT: tudo bem, val='+str(val)+' rate='+str(rate)
          return True
        else:
          print '_AUTO_AMOUNT: uni.count != 1 !!? '+str(uni)
          return False
      print '_AUTO_AMOUNT: arr[0] not digit! '+str(arr[0])
      return False
    return None
  _auto_amount.boolean = True
  _auto_amount.short_description = _(u"Auto import!")

  def save(self):
    self._auto_amount()
    super(Fee,self).save()

  def _erase_account(self):
    if hasattr(self, 'rel_account'):
      return erase_id_link('rel_account', self.rel_account.id)
    return False
  _erase_account.allow_tags = True
  _erase_account.short_description = ''


  def _selflink(self):
    if self.id:
      return a_strW + "fee/" + str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
    else:
      return "Not present"
  _selflink.allow_tags = True
  _selflink.short_description = ''

class Payment_Type(iC_Type):
  ic_type = models.OneToOneField('iC_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name = _(u"Forma de pagament")
    verbose_name_plural = _(u"c-> Formes de pagament")



class iC_Document(iC_Record):
  ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
  doc_type = TreeForeignKey('iC_Document_Type', blank=True, null=True, verbose_name=_(u"Tipus de document"))
  #description = models.TextField(blank=True, verbose_name=_(u"Comentari"))
  file = models.FileField(upload_to='ic/docs', blank=True, null=True, verbose_name=_(u"Document escanejat"))

  def _ic_membership(self):
    if hasattr(self, 'membership') and self.membership:
      print 'ADDRESS_CONTRACT te MEMBERSHIP ??!! '
      return self.membership.first()
    elif hasattr(self, 'selfemployed') and hasattr(self.selfemployed.first(), 'ic_membership'):
      return self.selfemployed.first().ic_membership
    return False
  _ic_membership.allow_tags = True
  _ic_membership.short_description = _(u"alta Soci")

  def _ic_selfemployed(self):
    if hasattr(self, 'selfemployed'):
      return self.selfemployed.first()
    return False
  _ic_selfemployed.allow_tags = True
  _ic_selfemployed.short_description = _(u"Autoocupat")


class iC_Document_Type(iC_Record_Type):
  record_type = models.OneToOneField('iC_Record_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name = _(u"Tipus de Document CI")
    verbose_name_plural = _(u"c-> Tipus de Documents CI")



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
  #ic_membership = models.ForeignKey('iC_Membership', blank=True, null=True, verbose_name=_(u"Soci (registre)"))
  company = models.ForeignKey('General.Company', blank=True, null=True, verbose_name=_(u"Empresa titular (CI)"))
  address = models.ForeignKey('General.Address', verbose_name=_(u"Adreça contractada"))
  price = models.DecimalField(max_digits=13, decimal_places=2, blank=True, null=True, verbose_name=_(u"Import"))
  price_unit = models.ForeignKey('General.Unit', blank=True, null=True, verbose_name=_(u"Unitat"))
  start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici del contracte"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final del contracte"))

  def __unicode__(self):
    if hasattr(self, 'selfemployed') and self.selfemployed.count():
      #print 'SELFEMPLOYED! '+str(self.selfemployed.first().ic_membership.human)
      return self.selfemployed.first().ic_membership.human.__unicode__()+': '+self.address.name
    elif self.company:
      return self.company.nickname+': ?? > '+self.address.name
    #elif self.address:
    #  return '??: ?? > '+self.address.__unicode__()
    else:
      return self.name

  class Meta:
    verbose_name = _(u"Contracte d'Adreça CI")
    verbose_name_plural = _(u"d- Contractes d'Adreçes CI")

  def _address_link(self):
    if hasattr(self, 'address'):
      return self.address._selflink()
    return False
  _address_link.allow_tags = True
  _address_link.short_description = ''

  def _is_valid(self):
    if hasattr(self, 'address') and self.address and hasattr(self, 'company') and self.company:
      if hasattr(self, 'price') and hasattr(self, 'price_unit'):
        if hasattr(self, 'start_date') and self.start_date:
          return True
    return False
  _is_valid.boolean = True
  _is_valid.short_description = _(u"Valid?")



class iC_Insurance(iC_Document):
  ic_document = models.OneToOneField('iC_Document', primary_key=True, parent_link=True)
  #membership = models.ForeignKey('iC_Membership', verbose_name=_(u"Soci (registre)"))
  company = models.ForeignKey('General.Company', verbose_name=_(u"Empresa asseguradora"))
  number = models.CharField(max_length=30, blank=True, null=True, verbose_name=_(u"Número de Pòlissa"))
  price = models.DecimalField(max_digits=13, decimal_places=2, blank=True, null=True, verbose_name=_(u"Import"))
  price_unit = models.ForeignKey('General.Unit', blank=True, null=True, verbose_name=_(u"Unitat"))
  start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici de l'assegurança"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final de l'assegurança"))
  rel_address = models.ForeignKey('General.Address', blank=True, null=True, verbose_name=_(u"Adreça assegurada"))
  rel_job = models.ForeignKey('General.Job', blank=True, null=True, verbose_name=_(u"Ofici assegurat"))

  def __unicode__(self):
    if hasattr(self, 'selfemployed') and self.selfemployed.count():
      return self.company.nickname+': '+self.selfemployed.first().ic_membership.__unicode__()
    else:
      return self.doc_type.name+': ?? '+self.number

  class Meta:
    verbose_name = _(u"Assegurança soci CI")
    verbose_name_plural = _(u"d- Assegurances socis CI")

  def _erase_address(self):
    if hasattr(self, 'rel_address'):
      return erase_id_link('rel_address', self.rel_address.id)
    return False
  _erase_address.allow_tags = True
  _erase_address.short_description = ''

  def _erase_job(self):
    if hasattr(self, 'rel_job'):
      return erase_id_link('rel_job', self.rel_job.id)
    return False
  _erase_job.allow_tags = True
  _erase_job.short_description = ''

  def _is_valid(self):
    if hasattr(self, 'number') and not self.number == '':
      if hasattr(self, 'company') and not self.company == '':
        if hasattr(self, 'start_date') and self.start_date:
          if hasattr(self, 'price') and hasattr(self, 'price_unit'):
            return True
    return False
  _is_valid.boolean = True
  _is_valid.short_description = _(u"Valid?")



class iC_Licence(iC_Document):
  ic_document = models.OneToOneField('iC_Document', primary_key=True, parent_link=True)
  #membership = models.ForeignKey('iC_Membership', verbose_name=_(u"Soci (registre)"))
  number = models.CharField(max_length=30, blank=True, null=True, verbose_name=_(u"Número de Licència"))
  #price = models.DecimalField(max_digits=7, decimal_places=2, blank=True, null=True, verbose_name=_(u"Import (euros)"))
  start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici de la licència"))
  end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final de la licència"))
  rel_address = models.ForeignKey('General.Address', blank=True, null=True, verbose_name=_(u"Adreça relacionada"))
  rel_job = models.ForeignKey('General.Job', blank=True, null=True, verbose_name=_(u"Ofici relacionat"))

  def __unicode__(self):
    if hasattr(self, 'selfemployed') and self.selfemployed.count():
      return self.doc_type.name+': '+self.selfemployed.first().ic_membership.__unicode__()
    else:
      return self.doc_type.name+': ?? '+self.number

  class Meta:
    verbose_name = _(u"Llicència soci CI")
    verbose_name_plural = _(u"d- Llicències socis CI")

  def _erase_address(self):
    if hasattr(self, 'rel_address'):
      return erase_id_link('rel_address', self.rel_address.id)
    return False
  _erase_address.allow_tags = True
  _erase_address.short_description = ''

  def _erase_job(self):
    if hasattr(self, 'rel_job'):
      return erase_id_link('rel_job', self.rel_job.id)
    return False
  _erase_job.allow_tags = True
  _erase_job.short_description = ''

  def _is_valid(self):
    if hasattr(self, 'number') and not self.number == '':
      if hasattr(self, 'start_date') and self.start_date:
        return True
    return False
  _is_valid.boolean = True
  _is_valid.short_description = _(u"Valid?")
