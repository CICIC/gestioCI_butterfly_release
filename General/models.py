#encoding=utf-8

from django.db import models

from mptt.models import MPTTModel
from mptt.fields import TreeForeignKey, TreeManyToManyField
from datetime import date, timedelta
from datetime import datetime
from django.utils.translation import ugettext_lazy as _
from decimal import Decimal

from itertools import chain

# Create your models here.
'''
class Tree(models.Model):
  name = models.CharField(verbose_name=_(u"Nom"), max_length=30, help_text=_(u"El nom del Arbre"))
  clas = models.CharField(blank=True, verbose_name=_(u"Clase"), max_length=30,
                          help_text=_(u"Model de django per fer l'arbre (cal que tingui 'left' i 'right')"))
  TYPES = (
    ('A','Art'),
    ('B','Being'),
    ('W','Artwork'),
    ('S','Space'),
    ('C','Concept')
  )
  clas_type = models.CharField( choices = TYPES, blank=True, verbose_name=_(u"Tipus bàsic"),
                                max_length=1, help_text=_(u"El tipus bàsic de dada dels models que ordenem en l'arbre"))
  def __unicode__(self):
    return self.name
'''



# C O N C E P T S - (Conceptes...)

class Concept(MPTTModel):  # Create own ID's (TREE)
  name = models.CharField(unique=True, verbose_name=_(u"Nom"), max_length=150, help_text=_(u"El nom del Concepte"), default="")
  description = models.TextField(blank=True)
  parent = TreeForeignKey('self', null=True, blank=True, related_name='children')

  def __unicode__(self):
    return self.name

  class Meta:
    verbose_name = _(u"Concepte")
    verbose_name_plural = _(u"c- Conceptes")


class Type(Concept):
  concept = models.OneToOneField('Concept', primary_key=True, parent_link=True)
  clas = models.CharField(blank=True, verbose_name=_(u"Clase"), max_length=50,
                          help_text=_(u"Model de django o classe python associada al Tipus"))
  class Meta:
    verbose_name = _(u"c- Tipus")

  def __unicode__(self):
    if self.clas is None or self.clas == '':
      return self.name
    else:
      return self.name+' ('+self.clas+')'



# B E I N G S - (Éssers, Entitats, Projectes...)

class Being(models.Model):  # Abstract
  name = models.CharField(verbose_name=_(u"Nom"), max_length=100, help_text=_(u"El nom de la Entitat"))
  #being_type = TreeForeignKey('Being_Type', blank=True, null=True, verbose_name=_(u"Tipus d'entitat"))
  birth_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de naixement"), help_text=_(u"El dia que va començar a existir"))
  death_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'acabament"), help_text=_(u"El dia que va deixar d'existir"))

  class Meta:
    abstract = True

  def __unicode__(self):
    return self.name

class Being_Type(Type):
  typ = models.OneToOneField('Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name= _(u"Tipus d'entitat")
    verbose_name_plural = _(u"e- Tipus d'entitats")


class Human(Being):  # Create own ID's
  nickname = models.CharField(max_length=50, blank=True, verbose_name=_(u"Sobrenom"), help_text=_(u"El sobrenom (nickname) de l'entitat Humana"))
  email = models.EmailField(max_length=100, blank=True, verbose_name=_(u"Email"), help_text=_(u"L'adreça d'email principal de l'entitat humana"))
  telephone = models.CharField(max_length=20, blank=True, verbose_name=_(u"Telèfon"), help_text=_(u"El telèfon principal de l'entitat Humana"))
  website = models.CharField(max_length=100, blank=True, verbose_name=_(u"Web"), help_text=_(u"L'adreça web principal de l'entitat humana"))
  jobs = TreeManyToManyField('Job', through='rel_Human_Jobs', verbose_name=_(u"Activitats, Oficis"), blank=True, null=True)
  addresses = models.ManyToManyField('Address', through='rel_Human_Addresses', verbose_name=_(u"Adreçes"), blank=True, null=True)

  regions = models.ManyToManyField('Region', through='rel_Human_Regions', verbose_name=_(u"Regions"), blank=True, null=True)
  records = models.ManyToManyField('Record', through='rel_Human_Records', verbose_name=_(u"Registres"), blank=True, null=True)
  materials = models.ManyToManyField('Material', through='rel_Human_Materials', verbose_name=_(u"obres Materials"), blank=True, null=True)
  nonmaterials = models.ManyToManyField('Nonmaterial', through='rel_Human_Nonmaterials', verbose_name=_(u"obres Inmaterials"), blank=True, null=True)
  persons = models.ManyToManyField('Person', through='rel_Human_Persons', related_name='hum_persons', verbose_name=_(u"Persones"), blank=True, null=True)
  projects = models.ManyToManyField('Project', through='rel_Human_Projects', related_name='hum_projects', verbose_name=_(u"Projectes"), blank=True, null=True)
  companies = models.ManyToManyField('Company', through='rel_Human_Companies', related_name='hum_companies', verbose_name=_(u"Empreses"), blank=True, null=True)

  #accountsCes = models.ManyToManyField('AccountCes', related_name='human', verbose_name=_(u"Comptes M.S."), blank=True, null=True, help_text=_(u"Comptes de Moneda Social de l'entitat (ICES/CES)"))

  class Meta:
    verbose_name = _(u"Humà")
    verbose_name_plural = _(u"e- Humans")

  def __unicode__(self):
    if self.nickname is None or self.nickname == '':
      return self.name
    else:
      return self.name+' ('+self.nickname+')'

  def my_accounts(self):
    return list(chain(self.accountsCes, self.accountsCrypto, self.accountsBank))
  #my_accounts.list = []
  accounts = property(my_accounts)



class Person(Human):
  human = models.OneToOneField('Human', primary_key=True, parent_link=True)
  surnames = models.CharField(max_length=100, blank=True, verbose_name=_(u"Cognoms"), help_text=_(u"Els cognoms de la Persona"))
  #projects = TreeManyToManyField('Project', through='rel_Person_Projects', blank=True, null=True, related_name='persons', verbose_name=_(u"Projectes"), help_text=_(u"Persona vinculada als projectes o col·lectius seleccionats"))
  id_card = models.CharField(max_length=9, blank=True, verbose_name=_(u"DNI/NIE"))
  email2 = models.EmailField(blank=True, verbose_name=_(u"Email alternatiu"))
  nickname2 = models.CharField(max_length=20, blank=True, verbose_name=_(u"Sobrenom a la Xarxa Social"))

  class Meta:
    verbose_name= _(u'Persona')
    verbose_name_plural= _(u'e- Persones')

  def __unicode__(self):
    if self.nickname is None or self.nickname == '':
      if self.surnames is None or self.surnames == '':
        return self.name+' '+self.nickname2
      else:
        return self.name+' '+self.surnames
    else:
      if self.surnames is None or self.surnames == '':
        return self.name+' ('+self.nickname+')'
      else:
        return self.name+' '+self.surnames+' ('+self.nickname+')'



class Project(MPTTModel, Human):
  human = models.OneToOneField('Human', primary_key=True, parent_link=True)
  project_type = TreeForeignKey('Project_Type', blank=True, null=True, verbose_name=_(u"Tipus de projecte"))
  #members = models.ManyToManyField('Person', related_name='projects', blank=True, null=True, verbose_name=_(u"Persones/Membres"))
  #ref_persons = models.ManyToManyField('Person', related_name='ref_projects', blank=True, null=True, verbose_name=_(u"Persones de referencia"))
  parent = TreeForeignKey('self', null=True, blank=True, related_name='subprojects', verbose_name=_(u"Projecte Marc"))
  socialweb = models.CharField(max_length=100, blank=True, verbose_name=_(u"Web Social"))
  email2 = models.EmailField(blank=True, verbose_name=_(u"Email alternatiu"))

  images = models.ManyToManyField('General.Image', blank=True, null=True, verbose_name=_(u"Imatges"))

  #assets = models.ManyToManyField('Asset', through='rel_Human_Materials', null=True, verbose_name=_(u"Actius del projecte"))
  #def _has_assets(self):
  #  return self.materials.objects.select_related('asset').all()
  #assets = property(_has_assets)

  def _is_collective(self):
    if self.persons.count() < 2 and self.projects.count() < 2:
      return False
    else:
      return True
  _is_collective.boolean = True
  _is_collective.short_description = _(u"és col·lectiu?")
  collective = property(_is_collective)

  ecommerce = models.BooleanField(default=False, verbose_name=_(u"Comerç electrònic?"))
  def _get_ref_persons(self):
    return rel_Human_Persons.filter(
      person__pk = self.human.pk,
      relation__clas = 'referent'
    )
  _get_ref_persons.list = True
  ref_persons = property(_get_ref_persons)

  #def _is_larder(self):

  class Meta:
    verbose_name= _(u'Projecte')
    verbose_name_plural= _(u'e- Projectes')


class Project_Type(Being_Type):
  being_type = models.OneToOneField('Being_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name = _(u"Tipus de Projecte")
    verbose_name_plural = _(u"e- Tipus de Projectes")



class Company(Human):
  human = models.OneToOneField('Human', primary_key=True, parent_link=True)
  company_type = TreeForeignKey('Company_Type', null=True, blank=True, verbose_name=_(u"Tipus d'empresa"))
  legal_name = models.CharField(max_length=100, blank=True, null=True, verbose_name=_(u"Nom Fiscal"))
  vat_number = models.CharField(max_length=20, blank=True, null=True, verbose_name=_(u"CIF"))
  #ref_persons = models.ManyToManyField('Person', related_name='ref_companies', blank=True, null=True, verbose_name=_(u"Persones de contacte"))
  #accountsBank
  class Meta:
    verbose_name = _(u"Empresa")
    verbose_name_plural = _(u"e- Empreses")

class Company_Type(Being_Type):
  being_type = models.OneToOneField('Being_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name = _(u"Tipus d'Empresa")
    verbose_name_plural = _(u"e- Tipus d'Empreses")



class rel_Human_Jobs(models.Model):
  human = models.ForeignKey('Human')
  job = TreeForeignKey('Job', verbose_name=_(u"Ofici"))
  relation = TreeForeignKey('Relation', related_name='hu_job+', blank=True, null=True, verbose_name=_(u"relació"))
  class Meta:
    verbose_name = _(u"ofi")
    verbose_name_plural = _(u"Oficis de l'entitat")
  def __unicode__(self):
    return self.relation.gerund+' > '+self.job.name

class rel_Human_Addresses(models.Model):
  human = models.ForeignKey('Human')
  address = models.ForeignKey('Address', verbose_name=_(u"Adreça"))
  relation = TreeForeignKey('Relation', related_name='hu_adr+', blank=True, null=True, verbose_name=_(u"relació"))
  class Meta:
    verbose_name = _(u"adr")
    verbose_name_plural = _(u"Adreçes de l'entitat")
  def __unicode__(self):
    return self.relation.gerund+' > '+self.address.name

class rel_Human_Regions(models.Model):
  human = models.ForeignKey('Human')
  region = models.ForeignKey('Region', verbose_name=_(u"Regió"))
  relation = TreeForeignKey('Relation', related_name='hu_reg+', blank=True, null=True, verbose_name=_(u"relació"))
  class Meta:
    verbose_name = _(u"reg")
    verbose_name_plural = _(u"Regions vinculades")
  def __unicode__(self):
    return self.relation.gerund+' > '+self.region.name


class rel_Human_Records(models.Model):
  human = models.ForeignKey('Human')
  record = models.ForeignKey('Record', verbose_name=_(u"Registre"))
  relation = TreeForeignKey('Relation', related_name='hu_rec+', blank=True, null=True, verbose_name=_(u"relació"))
  class Meta:
    verbose_name = _(u"rec")
    verbose_name_plural = _(u"Registres vinculats")
  def __unicode__(self):
    return self.record.record_type+': '+self.relation.gerund+' > '+self.record.name

class rel_Human_Materials(models.Model):
  human = models.ForeignKey('Human')
  material = models.ForeignKey('Material', verbose_name=_(u"obra Material"))
  relation = TreeForeignKey('Relation', related_name='hu_mat+', blank=True, null=True, verbose_name=_(u"relació"))
  class Meta:
    verbose_name = _(u"mat")
    verbose_name_plural = _(u"Obres materials")
  def __unicode__(self):
    return self.relation.gerund+' > '+self.material.name

class rel_Human_Nonmaterials(models.Model):
  human = models.ForeignKey('Human')
  nonmaterial = models.ForeignKey('Nonmaterial', verbose_name=_(u"obra Inmaterial"))
  relation = TreeForeignKey('Relation', related_name='hu_non+', blank=True, null=True, verbose_name=_(u"relació"))
  class Meta:
    verbose_name = _(u"inm")
    verbose_name_plural = _(u"Obres inmaterials")
  def __unicode__(self):
    return self.relation.gerund+' > '+self.nonmaterial.name


class rel_Human_Persons(models.Model):
  human = models.ForeignKey('Human', related_name='human_persons')
  person = models.ForeignKey('Person', related_name='rel_humans', verbose_name=_(u"Persona vinculada"))
  relation = TreeForeignKey('Relation', related_name='hu_hum+', blank=True, null=True, verbose_name=_(u"relació"))
  class Meta:
    verbose_name = _(u"per")
    verbose_name_plural = _(u"Persones vinculades")
  def __unicode__(self):
    return self.relation.gerund+' > '+self.person.__unicode__()

class rel_Human_Projects(models.Model):
  human = models.ForeignKey('Human', related_name='human_projects')
  project = TreeForeignKey('Project', related_name='rel_humans', verbose_name=_(u"Projecte vinculat"))
  relation = TreeForeignKey('Relation', related_name='hu_hum+', blank=True, null=True, verbose_name=_(u"relació"))
  class Meta:
    verbose_name = _(u"pro")
    verbose_name_plural = _(u"Projectes vinculats")
  def __unicode__(self):
    if self.project.project_type is None or self.project.project_type == '':
      return self.relation.gerund+' > '+self.project.name
    return '('+self.project.project_type.being_type.name+') '+self.relation.gerund+' > '+self.project.name

class rel_Human_Companies(models.Model):
  human= models.ForeignKey('Human', related_name='human_companies')
  company = models.ForeignKey('Company', verbose_name=_(u"Empresa vinculada"))
  relation = TreeForeignKey('Relation', related_name='hu_hum+', blank=True, null=True, verbose_name=_(u"relació"))
  class Meta:
    verbose_name = _(u"emp")
    verbose_name_plural = _(u"Empreses vinculades")
  def __unicode__(self):
    return '('+self.company.company_type.being_type.name+') '+self.relation.gerund+' > '+self.company.name


class rel_Material_Nonmaterials(models.Model):
  material = models.ForeignKey('Material')
  nonmaterial = models.ForeignKey('Nonmaterial', verbose_name=_(u"Inmaterial vinculat"))
  relation = TreeForeignKey('Relation', related_name='ma_non+', blank=True, null=True)
  class Meta:
    verbose_name = _(u"inm")
    verbose_name_plural = _(u"Inmaterials vinculats")
  def __unicode__(self):
    return '('+self.nonmaterial.nonmaterial_type.name+') '+self.relation.gerund+' > '+self.nonmaterial.name

class rel_Material_Records(models.Model):
  material = models.ForeignKey('Material')
  record = models.ForeignKey('Record', verbose_name=_(u"Registre vinculat"))
  relation = TreeForeignKey('Relation', related_name='ma_reg+', blank=True, null=True)
  class Meta:
    verbose_name = _(u"rec")
    verbose_name_plural = _(u"Registres vinculats")
  def __unicode__(self):
    return '('+self.record.record_type.name+') '+self.relation.gerund+' > '+self.record.name

class rel_Material_Addresses(models.Model):
  material = models.ForeignKey('Material')
  address = models.ForeignKey('Address', verbose_name=_(u"Adreça vinculada"))
  relation = TreeForeignKey('Relation', related_name='ma_adr+', blank=True, null=True)
  class Meta:
    verbose_name = _(u"adr")
    verbose_name_plural = _(u"Adreçes vinculades")
  def __unicode__(self):
    return '('+self.address.address_type.name+') '+self.relation.gerund+' > '+self.address.name




# A R T S - (Verbs, Relacions, Arts, Oficis, Sectors...)

class Art(MPTTModel):  # Create own ID's (TREE)
  name = models.CharField(unique=True, max_length=100, verbose_name=_(u"Nom"), help_text=_(u"El nom de l'Art"))
  verb = models.CharField(max_length=50, blank=True, verbose_name=_(u"Verb"), help_text=_(u"El verb de la acció, infinitiu"))
  gerund = models.CharField(max_length=50, blank=True, verbose_name=_(u"Gerundi"), help_text=_(u"El verb en gerundi, present"))
  description = models.TextField(blank=True)

  parent = TreeForeignKey('self', null=True, blank=True, related_name='children')

  def __unicode__(self):
    return self.name+', '+self.verb
  class Meta:
    verbose_name = _(u"Art")
    verbose_name_plural = _(u"a- Arts")


class Relation(Art):
  art = models.OneToOneField('Art', primary_key=True, parent_link=True)
  clas = models.CharField(blank=True, verbose_name=_(u"Clase"), max_length=50,
                          help_text=_(u"Model de django o classe python associada a la Relació"))
  class Meta:
    verbose_name= _(u'Relació')
    verbose_name_plural= _(u'a- Relacions')
  def __unicode__(self):
    if self.clas is None or self.clas == '':
      return self.name+', '+self.verb
    else:
      return self.name+', '+self.verb+' ('+self.clas+')'


class Job(Art):
  art = models.OneToOneField('Art', primary_key=True, parent_link=True)
  clas = models.CharField(blank=True, verbose_name=_(u"Clase"), max_length=50,
                          help_text=_(u"Model de django o classe python associada a l'Ofici'"))

  class Meta:
    verbose_name= _(u'Ofici')
    verbose_name_plural= _(u'a- Oficis')
  def __unicode__(self):
    if self.clas is None or self.clas == '':
      return self.name+', '+self.verb
    else:
      return self.name+', '+self.verb+' ('+self.clas+')'




# S P A C E S - (Regions, Espais, Adreçes...)

class Space(models.Model):  # Abstact
  name = models.CharField(verbose_name=_(u"Nom"), max_length=100, help_text=_(u"El nom de l'Espai"))
  #space_type = TreeForeignKey('Space_Type', blank=True, null=True, verbose_name=_(u"Tipus d'espai"))
  #m2 = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
  comment = models.TextField(blank=True, null=True, verbose_name=_(u"Comentari"), help_text=_(u"Localització exacta, indicacions per arribar o comentaris"))

  def __unicode__(self):
    return self.name

  class Meta:
    abstract = True;

class Space_Type(Type):
  typ = models.OneToOneField('Type', primary_key=True, parent_link=True)
  #concept = models.OneToOneField(Concept, parent_link=True)
  #tree = models.ForeignKey(Tree, limit_choices_to={'clas': 'Space_Type'})
  class Meta:
    verbose_name= _(u"Tipus d'Espai")
    verbose_name_plural= _(u"s- Tipus d'Espais")



class Address(Space):  # Create own ID's
  #space = models.OneToOneField('Space', primary_key=True, parent_link=True)
  address_type = TreeForeignKey('Address_Type', blank=True, null=True, verbose_name=_(u"Tipus d'adreça"))
  p_address = models.CharField(max_length=100, verbose_name=_(u"Direcció"), help_text=_(u"Adreça postal vàlida per a enviaments"))
  town = models.CharField(max_length=100, verbose_name=_(u"Població"), help_text=_(u"Poble, ciutat o municipi"))
  postalcode = models.CharField(max_length=5, blank=True, null=True, verbose_name=_(u"Codi postal"))
  region = TreeForeignKey('Region', blank=True, null=True, related_name='rel_addresses', verbose_name=_(u"Regió"))

  telephone = models.CharField(max_length=20, blank=True, verbose_name=_(u"Telefon fix"))
  ic_larder = models.BooleanField(default=False, verbose_name=_(u"És Rebost?"))
  main_address = models.BooleanField(default=False, verbose_name=_(u"Adreça principal?"))
  size = models.DecimalField(max_digits=20, decimal_places=2, blank=True, null=True, verbose_name=_(u'Tamany'), help_text=_(u"Quantitat d'unitats (accepta 2 decimals)"))
  size_unit = models.ForeignKey('Unit', blank=True, null=True, verbose_name=_(u"Unitat de mesura"))
  longitude = models.IntegerField(blank=True, null=True, verbose_name=_(u"Longitud (geo)"))
  latitude = models.IntegerField(blank=True, null=True, verbose_name=_(u"Latitud (geo)"))

  def _has_contracts(self):
    pass
  def _has_licences(self):
    pass

  class Meta:
    verbose_name= _(u'Adreça')
    verbose_name_plural= _(u's- Adreçes')
  def __unicode__(self):
    return self.name+' ('+self.p_address+' - '+self.town+')'

class Address_Type(Space_Type):
  space_type = models.OneToOneField('Space_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name = _(u"Tipus d'Adreça")
    verbose_name_plural = _(u"s- Tipus d'Adreçes")



class Region(MPTTModel, Space):  # Create own ID's (TREE)
  #space = models.OneToOneField('Space', primary_key=True, parent_link=True)
  region_type = TreeForeignKey('Region_Type', blank=True, null=True, verbose_name=_(u"Tipus de regió"))
  parent = TreeForeignKey('self', null=True, blank=True, related_name='subregions')

  class Meta:
    verbose_name= _(u'Regió')
    verbose_name_plural= _(u's- Regions')

class Region_Type(Space_Type):
  space_type = models.OneToOneField('Space_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name = _(u"Tipus de Regió")
    verbose_name_plural = _(u"s- Tipus de Regions")



# A R T W O R K S - (Obres, Coses, Registres, Documents...)

class Artwork(models.Model):  # Abstract
  name = models.CharField(verbose_name=_(u"Nom"), max_length=200, blank=True, null=True, help_text=_(u"El nom de la obra (Registre, Unitat, Cosa)"))
  #artwork_type = TreeForeignKey('Artwork_Type', blank=True, verbose_name=_(u"Tipus d'Obra"))

  def __unicode__(self):
    return self.name

  class Meta:
    abstract = True

class Artwork_Type(Type):
  typ = models.OneToOneField('Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name = _(u"Tipus d'Obra")
    verbose_name_plural = _(u"o- Tipus d'Obres")



class Nonmaterial(Artwork):  # Create own ID's
  nonmaterial_type = TreeForeignKey('Nonmaterial_Type', blank=True, null=True, verbose_name=_(u"Tipus d'obra inmaterial"))
  class Meta:
    verbose_name = _(u"Obra Inmaterial")
    verbose_name_plural = _(u"o- Obres Inmaterials")

class Nonmaterial_Type(Artwork_Type):
  artwork_type = models.OneToOneField('Artwork_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name= _(u"Tipus d'obra Inmaterial")
    verbose_name_plural= _(u"o- Tipus d'obres Inmaterials")

class Image(Nonmaterial):
  nonmaterial = models.OneToOneField('Nonmaterial', primary_key=True, parent_link=True)
  file = models.ImageField(upload_to='images', verbose_name=_(u"Imatge (jpg/png)"))
  description = models.TextField(blank=True, null=True, verbose_name=_(u"Descripció, peu de foto"))
  class Meta:
    verbose_name = _(u"Imatge")
    verbose_name_plural = _(u"o- Imatges")

class Material(Artwork): # Create own ID's
  material_type = TreeForeignKey('Material_Type', blank=True, null=True, verbose_name=_(u"Tipus d'obra física"))

  nonmaterials = models.ManyToManyField('Nonmaterial', through='rel_Material_Nonmaterials', blank=True, null=True, verbose_name=_(u"Inmaterials relacionats"))
  records = models.ManyToManyField('Record', through='rel_Material_Records', blank=True, null=True, verbose_name=_(u"Registres relacionats"))
  addresses = models.ManyToManyField('Address', through='rel_Material_Addresses', blank=True, null=True, verbose_name=_(u"Adreçes relacionades"))

  class Meta:
    verbose_name = _(u"Obra Material")
    verbose_name_plural = _(u"o- Obres Materials")

class Material_Type(Artwork_Type):
  artwork_type = models.OneToOneField('Artwork_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name= _(u"Tipus d'obra Material")
    verbose_name_plural= _(u"o- Tipus d'obres Materials")

class Asset(Material):
  material = models.OneToOneField('Material', primary_key=True, parent_link=True)
  human = models.ForeignKey('Human', verbose_name=_(u"Entitat"))
  description = models.TextField(blank=True, verbose_name=_(u"Descripció"))
  reciprocity = models.TextField(blank=True, verbose_name=_(u"Reciprocitat"))
  #address = models.ForeignKey('Address', blank=True, null=True, verbose_name=_(u"Adreça"))
  class Meta:
    verbose_name = _(u"Actiu")
    verbose_name_plural = _(u"o- Actius")
  def __unicode__(self):
    return '('+self.material_type.name+') '+self.material.name


class Record(Artwork):  # Create own ID's
  record_type = TreeForeignKey('Record_Type', blank=True, null=True, verbose_name=_(u"Tipus de Registre"))
  class Meta:
    verbose_name= _(u'Registre')
    verbose_name_plural= _(u'o- Registres')
  def __unicode__(self):
    if self.record_type is None or self.record_type == '':
      return self.name
    else:
      return self.record_type.name+': '+self.name

class Record_Type(Artwork_Type):
  artwork_type = models.OneToOneField('Artwork_Type', primary_key=True, parent_link=True)
  class Meta:
    verbose_name= _(u'Tipus de Registre')
    verbose_name_plural= _(u'o- Tipus de Registres')



class Unit(Artwork):  # Create own ID's
  unit_type = TreeForeignKey('Unit_Type', blank=True, null=True, verbose_name=_(u"Tipus d'Unitat"))
  code = models.CharField(max_length=4, verbose_name=_(u"Codi o Símbol"))

  region = TreeForeignKey('Region', blank=True, null=True, verbose_name=_(u"Regió d'us asociada"))
  human = models.ForeignKey('Human', blank=True, null=True, verbose_name=_(u"Entitat relacionada"))

  class Meta:
    verbose_name= _(u'Unitat')
    verbose_name_plural= _(u'o- Unitats')

  def __unicode__(self):
    return self.unit_type.name+': '+self.name

class Unit_Type(Artwork_Type):
  artwork_type = models.OneToOneField('Artwork_Type', primary_key=True, parent_link=True)

  class Meta:
    verbose_name = _(u"Tipus d'Unitat")
    verbose_name_plural = _(u"o- Tipus d'Unitats")



class UnitRatio(Record):
  record = models.OneToOneField('Record', primary_key=True, parent_link=True)
  #record_type = TreeForeignKey('Record_Type', blank=True, null=True)
  in_unit = models.ForeignKey('Unit', related_name='ratio_in', verbose_name=_(u"Unitat entrant"))
  rate = models.DecimalField(max_digits=6, decimal_places=3, verbose_name=_(u"Ratio multiplicador"))
  out_unit = models.ForeignKey('Unit', related_name='ratio_out', verbose_name=_(u"Unitat sortint"))
  class Meta:
    verbose_name = _(u"Equivalencia entre Unitats")
    verbose_name_plural = _(u"o- Equivalencies entre Unitats")
  def __unicode__(self):
    return self.name+' ('+self.in_unit.code+' * '+str(self.rate)+' = '+self.out_unit.code+')'



class AccountCes(Record):
  record = models.OneToOneField('Record', primary_key=True, parent_link=True)

  human = models.ForeignKey('Human', related_name='accountsCes', verbose_name=_(u"Entitat humana persuaria"))
  entity = models.ForeignKey('Project', verbose_name=_(u"Xarxa del compte"))
  unit = models.ForeignKey('Unit', verbose_name=_(u"Unitat (moneda)"))
  code = models.CharField(max_length=10, blank=True, null=True, verbose_name=_(u"Codi ecoxarxa"))
  number = models.CharField(max_length=4, blank=True, null=True, verbose_name=_(u"Número compte"))

  class Meta:
    verbose_name= _(u'Compte CES')
    verbose_name_plural= _(u'o- Comptes CES')

  def __unicode__(self):
    return self.unit.name+': '+self.human.__unicode__()+' '+self.code+self.number+' '+self.name


class AccountBank(Record):
  record = models.OneToOneField('Record', primary_key=True, parent_link=True)

  human = models.ForeignKey('Human', related_name='accountsBank', verbose_name=_(u"Entitat humana titular"))
  company = models.ForeignKey('Company', blank=True, null=True, verbose_name=_(u"Entitat Bancaria"))
  unit = models.ForeignKey('Unit', blank=True, null=True, verbose_name=_(u"Unitat (moneda)"))
  code = models.CharField(max_length=11, blank=True, null=True, verbose_name=_(u"Codi SWIFT/BIC"))
  number = models.CharField(max_length=34, blank=True, null=True, verbose_name=_(u"Número de Compte IBAN"))
  bankcard = models.BooleanField(default=False, verbose_name=_(u"Amb Tarjeta?"))

  class Meta:
    verbose_name= _(u'Compte Bancari')
    verbose_name_plural= _(u'o- Comptes Bancaris')

  def __unicode__(self):
    return '('+self.unit.name+') '+self.human.__unicode__()+' '+self.number+' ('+self.company.nickname+')'


class AccountCrypto(Record):
  record = models.OneToOneField('Record', primary_key=True, parent_link=True)
  human = models.ForeignKey('Human', related_name='accountsCrypto', verbose_name=_(u"Entitat humana titular"))
  unit = models.ForeignKey('Unit', verbose_name=_(u"Unitat (moneda)"))
  number = models.CharField(max_length=34, blank=True, verbose_name=_(u"Adreça de la bitlletera"))
  class Meta:
    verbose_name = _(u"Compte Criptomoneda")
    verbose_name_plural = _(u"o- Comptes Criptomonedes")
  def __unicode__(self):
    return self.unit.name+': '+self.human.__unicode__()+' '+self.number # +' '+self.name
