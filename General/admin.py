#encoding=utf-8
from django import forms
from django.contrib import admin
from django.forms.extras import widgets

from django.utils.translation import ugettext as _

from django.forms.models import BaseInlineFormSet
from django.forms.formsets import formset_factory

from mptt.admin import MPTTModelAdmin
from mptt.fields import TreeForeignKey, TreeManyToManyField
#from mptt.forms import MPTTAdminForm, TreeNodeChoiceField

from django_mptt_admin.admin import DjangoMpttAdmin

from General.models import *  # Tree, Human, Adress, Region, Concept, Type, Being_Type

#class CustomMPTTModelAdmin(MPTTModelAdmin):
    # speficfy pixel amount for this ModelAdmin only:
    #fields = ['name']
#    mptt_level_indent = 20
#    mptt_indent_field = "name"

from django.core.urlresolvers import reverse

class InlineEditLinkMixin(object):
    readonly_fields = ['edit_details']
    edit_label = "Edit"
    def edit_details(self, obj):
        if obj.id:
            opts = self.model._meta
            return "<a href='%s' target='_blank'>%s</a>" % (reverse(
                'admin:%s_%s_change' % (opts.app_label, opts.object_name.lower()),
                args=[obj.id]
            ), self.edit_label)
        else:
            return "(save to edit details)"
    edit_details.allow_tags = True


from itertools import chain
from django import forms
from django.conf import settings
from django.contrib.admin import widgets
from django.utils.encoding import smart_unicode, force_unicode
from django.utils.safestring import mark_safe
from django.utils.html import escape, conditional_escape


class M_nonmaterialInline(admin.StackedInline):
  model = rel_Material_Nonmaterials
  extra = 0
  fk_name = 'material'
  raw_id_fields = ('nonmaterial',)
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (('nonmaterial', 'relation'),)
    }),
  )

class M_recordInline(admin.StackedInline):
  model = rel_Material_Records
  extra = 0
  fk_name = 'material'
  raw_id_fields = ('record',)
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (('record', 'relation'),)
    }),
  )

class M_addressInline(admin.StackedInline):
  model = rel_Material_Addresses
  extra = 0
  fk_name = 'material'
  raw_id_fields = ('address',)
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (('address', 'relation'),)
    }),
  )


'''
class accountForm(forms.ModelForm):
  model = AccountCes

  def clean_human(self):
    if self.cleaned_data['human'] is None or self.cleaned_data['human'] == '':
      print '>>> human is NONE'
    else:
      #self.initial['human'] = self.cleaned_data['human']
      print '<<< human: '+self.cleaned_data['human'].__unicode__()
      #print '<<< name: '+self.cleaned_data['name']
      #self.clean_name()
      return self.cleaned_data['human']

  def clean_name(self):
    out = self.cleaned_data['unit'].code+': '+self.cleaned_data['human'].__unicode__()+' '+self.cleaned_data['code']+self.cleaned_data['number']
    if self.cleaned_data['name'] == '' or self.cleaned_data['name'] is None:
      print '---- name is NONE, out:'+out
      self.cleaned_data['name'] = out
      return out
    else:
      print '---- name:'+self.cleaned_data['name']
      return self.cleaned_data['name']


  def __init__(self, *args, **kwargs):

    super(accountForm, self).__init__(*args, **kwargs)

    if hasattr(self.instance, 'human'):
      self.initial['human'] = self.instance.human
      print ':::: jelow: '+str(self.instance.human)
      print ':::: name: '+str(self.instance.name)
    else:
      #self.initial['human'] = self.instance
      #print ':::: sin human: '+str(self.initial['human'])
      #self.clean_name()
      print ':::: sin human: '
      print ':::: name: '+str(self.instance.name)
      #print ':::: cleaned:'+self.cleaned_data
      #print ':::: '+str(self.instance)#.__unicode__()

      #print ':::: jelow: '+self.instance.human
'''


class AccountCesAdmin(admin.ModelAdmin):
  list_display = ['name', 'human', 'entity', 'code', 'number', 'unit']
  fieldsets = (
    (' ', {
      'fields':
        ('human', 'record_type', 'entity', 'unit', 'code', 'number', 'name'),

    }),
  )
  def save_model(self, request, obj, form, change):
    print 'CES: '+obj.__unicode__()
    obj.name = obj.__unicode__()
    obj.save()

class AccountBankAdmin(admin.ModelAdmin):
  list_display = ['name', 'human', 'company', 'code', 'number', 'unit']
  fieldsets = (
    (' ', {
      'fields':
        ('human', 'record_type', 'company', 'unit', 'code', 'number', 'name'),

    }),
  )
  def save_model(self, request, obj, form, change):
    print 'BANK: '+obj.__unicode__()
    obj.name = obj.__unicode__()
    obj.save()

class AccountCryptoAdmin(admin.ModelAdmin):
  list_display = ['name', 'human', 'number', 'unit']
  fieldsets = (
    (' ', {
      'fields': #('accountCes', 'relation')
        ('human', 'record_type', 'unit', 'number', 'name'),

    }),
  )
  def save_model(self, request, obj, form, change):
    print 'CRYPTO: '+obj.__unicode__()
    obj.name = obj.__unicode__()
    obj.save()



class H_addressInline(InlineEditLinkMixin, admin.StackedInline):
    model = rel_Human_Addresses
    extra = 0
    raw_id_fields = ('address',)
    fieldsets = (
      (' ', {
        'classes': ('collapse',),
        'fields': (('address','relation'),)
      }),
    )

class H_jobInline(admin.StackedInline):
    model = rel_Human_Jobs
    extra = 0
    fieldsets = (
      (' ', {
        'classes': ('collapse',),
        'fields': (('job','relation'),)
      }),
    )

class H_recordInline(admin.StackedInline):
    model = rel_Human_Records
    extra = 0
    fieldsets = (
      (' ', {
        'classes': ('collapse',),
        'fields': (('record','relation'),)
      }),
    )

class H_regionInline(admin.StackedInline):
    model = rel_Human_Regions
    extra = 0
    fieldsets = (
      (' ', {
        'classes': ('collapse',),
        'fields': (('region','relation'),)
      }),
    )

class H_materialInline(admin.StackedInline):
    model = rel_Human_Materials
    extra = 0
    fieldsets = (
      (' ', {
        'classes': ('collapse',),
        'fields': (('material','relation'),)
      }),
    )

class H_nonmaterialInline(admin.StackedInline):
    model = rel_Human_Nonmaterials
    extra = 0
    fieldsets = (
      (' ', {
        'classes': ('collapse',),
        'fields': (('nonmaterial','relation'),)
      }),
    )

class H_personInline(admin.StackedInline):
    model = rel_Human_Persons
    fk_name = 'human'
    extra = 0
    raw_id_fields = ('person',)
    fieldsets = (
      (' ', {
        'classes': ('collapse',),
        'fields': (('person','relation'),)
      }),
    )

class H_projectInline(admin.StackedInline):
    model = rel_Human_Projects
    fk_name = 'human'
    extra = 0
    raw_id_fields = ('project',)
    fieldsets = (
      (' ', {
        'classes': ('collapse',),
        'fields': (('project','relation'),)
      }),
    )

class H_companyInline(admin.StackedInline):
    model = rel_Human_Companies
    fk_name = 'human'
    extra = 0
    raw_id_fields = ('company',)
    fieldsets = (
      (' ', {
        'classes': ('collapse',),
        'fields': (('company','relation'),)
      }),
    )


'''
class accountCesForm(forms.ModelForm):
  model = AccountCes
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (#('accountCes', 'relation')
        ('record_type', 'entity'), ('unit', 'code', 'number'),# 'name'),# 'human'),
      )
    }),
  )

class accountCesInlineFormSet(BaseInlineFormSet):
  def __init__(self, *args, **kwargs):
    kwargs['initial'] = [
      {'record_type': Record_Type.objects.get(clas='AccountCes')},
    ]
    super(accountCesInlineFormSet, self).__init__(*args, **kwargs)
    #self.initial = [
    #    {'record_type': Record_Type.objects.get(clas='AccountCes')}, #{'name': 'en-US'}, {'name': 'es-ES'}
    #]
    print self.initial
'''

class H_accountCesInline(admin.StackedInline):
  model = AccountCes
  extra = 0
  fk_name = 'human'
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (#('accountCes', 'relation')
        ('entity', 'unit'), ('code', 'number'),# 'name'),# 'human'),
      )
    }),
  )
  #formset = accountCesInlineFormSet
  #readonly_fields = ['record_type',]
  #form = accountForm

class H_accountBankInline(admin.StackedInline):
  model = AccountBank
  extra = 0
  fk_name = 'human'
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (
        ('company', 'unit'), ('code', 'number'),
      )
    }),
  )

class H_accountCryptoInline(admin.StackedInline):
  model = AccountCrypto
  extra = 0
  fk_name = 'human'
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (
        ('unit', 'number'),
      )
    }),
  )

class H_assetInline(admin.StackedInline):
  model = Asset
  extra = 0
  fk_name = 'human'
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (
        ('name', 'material_type', 'description', 'reciprocity'),
      )
    }),
  )
  #inlines = [  # TODO inlines into inlines didn't appear
  #  M_addressInline,
  #]



class HumanAdmin(admin.ModelAdmin):
  list_display = ['name', 'nickname', 'email']
  search_fields = ('name','nickname','email',)
  def save_formset(self, request, form, formset, change):
    def set_human_name(instance):
      if not instance.human:
        instance.human = request.human
      if not instance.name:
        instance.name = instance.__unicode__()
      instance.save()

    def set_accountCes_recordtype(instance):
      if not instance.record_type:
        instance.record_type = Record_Type.objects.get(clas='AccountCes')
      instance.save()
    def set_accountBank_recordtype(instance):
      if not instance.record_type:
        instance.record_type = Record_Type.objects.get(clas='AccountBank')
      instance.save()
    def set_accountCrypto_recordtype(instance):
      if not instance.record_type:
        instance.record_type = Record_Type.objects.get(clas='AccountCrypto')
      instance.save()

    if formset.model == AccountCes or formset.model == AccountBank or formset.model == AccountCrypto:
      instances = formset.save(commit=False)
      map(set_human_name, instances)

      if formset.model == AccountCes:
        map(set_accountCes_recordtype, instances)
      if formset.model == AccountBank:
        map(set_accountBank_recordtype, instances)
      if formset.model == AccountCrypto:
        map(set_accountCrypto_recordtype, instances)

      formset.save_m2m()
      return instances
    else:
      return formset.save()


class Public_ProjectAdmin(MPTTModelAdmin, HumanAdmin):
  fieldsets = (
    (None, {
      'fields':(('name', 'nickname'),
                ('website', 'socialweb'),
                ('project_type', 'parent', 'ecommerce'),
                ('email', 'email2', 'telephone'),)
    }),
    (_(u"Dates inici/fi"), {
      'classes': ('collapse',),
      'fields': (('birth_date', 'death_date'),)
    }),
    (_(u"Descripció"), {
      'classes': ('collapse',),
      'fields': (('description'),)
    }),
  )
  inlines = [
    H_addressInline,
    H_jobInline,

    H_accountCesInline,
    H_accountBankInline,
    H_accountCryptoInline,

    H_personInline,
    H_projectInline,
    H_companyInline,

    H_assetInline,
    #H_regionInline,
    H_materialInline,
    H_nonmaterialInline,
    #H_recordInline,
  ]


class ProjectAdmin(Public_ProjectAdmin): # admin.ModelAdmin):

  list_display = ['name', 'nickname', 'project_type', '_is_collective']#, 'ref_persons']
  list_filter = ('project_type',)
  search_fields = ('name', 'nickname', 'project_type', 'email')

  def ref_persons(self, obj):
    return obj.project._get_ref_persons
  ref_persons.admin_order_field = 'project___get_ref_persons'
  #ref_persons.list = []
  #ref_persons.allow_tags = True

  '''
  fieldsets = Public_ProjectAdmin.fieldsets + (
    (None, {
      'fields':(('name', 'nickname'),
                ('website', 'socialweb'),
                ('project_type', 'parent'),
                ('email', 'email2', 'telephone'),
                ('ecommerce'))#, 'accounts'))
    }),
    #(_(u"Comptes"), {
    #  'classes': ('collapse',),
    #  'fields': ('accountsCes',)
    #}),
    #(_(u"Membres de referencia"), {
    #  'classes': ('collapse',),
    #  'fields':('ref_persons',),
    #}),
    #(_(u"Actius"), {
    #  'classes': ('collapse',),
    #  'fields':('assets',),
    #}),
    (_(u"Dates inici/fi"), {
      'classes': ('collapse',),
      'fields': (('birth_date', 'death_date'),)
    })
  )
  #filter_horizontal = ('ref_members',) # 'arts',) # 'addresses',)
  #filter_horizontal = ('accounts',) # 'arts',) # 'addresses',)
  '''

  inlines = Public_ProjectAdmin.inlines + [
    H_recordInline,
  ]



class Public_PersonAdmin(HumanAdmin):
  fieldsets = (
    (None, {
      'fields':(('name', 'surnames', 'id_card'),
                ('nickname', 'nickname2'),
                ('email', 'email2'),
                ('website', 'telephone'))
    }),
    (_(u"Dates naixement/mort"), {
      'classes': ('collapse',),
      'fields': (('birth_date', 'death_date'),)
    }),
    (_(u"Descripció"), {
      'classes': ('collapse',),
      'fields': (('description'),)
    }),
  )
  #filter_horizontal = ('arts',)# 'projects',) # 'addresses',)
  inlines = [
    H_addressInline,
    H_jobInline,

    H_accountCesInline,
    H_accountBankInline,
    H_accountCryptoInline,

    #H_personInline,
    H_projectInline,
    H_companyInline,

    H_regionInline,
    H_materialInline,
    H_nonmaterialInline,
    #H_recordInline,
  ]



class PersonAdmin(Public_PersonAdmin):

  list_display = ['name', 'surnames', 'nickname', 'email']
  search_fields = ('name', 'surenames', 'nickname', 'email')

  '''
  fieldsets = (
    (None, {
      'fields':(('name', 'surnames', 'id_card'),
                ('nickname', 'nickname2'),
                ('email', 'email2'),
                ('website', 'telephone'))
    }),
    (_(u"Dates naixement/mort"), {
      'classes': ('collapse',),
      'fields': (('birth_date', 'death_date'),)
    }),
    (_(u"Descripció"), {
      'classes': ('collapse',),
      'fields': (('description'),)
    }),
  )
  #filter_horizontal = ('arts',)# 'projects',) # 'addresses',)
  '''
  inlines = Public_PersonAdmin.inlines + [
    H_recordInline,
  ]



class Public_CompanyAdmin(HumanAdmin):
  fieldsets = (
    (None, {
      'fields':(('name', 'nickname', 'company_type'),
                ('legal_name', 'vat_number'),
                ('email', 'telephone', 'website'))
    }),
    (_(u"Dates inici/fi"), {
      'classes': ('collapse',),
      'fields': (('birth_date', 'death_date'),)
    })
  )
  #filter_horizontal = ('ref_members',) # 'jobs',) # 'addresses')
  inlines = [
    H_addressInline,
    H_jobInline,
    H_personInline,

    H_accountCesInline,
    H_accountBankInline,
    H_accountCryptoInline,

    H_materialInline,
    H_nonmaterialInline,
    H_regionInline,
    #H_recordInline,
  ]


class CompanyAdmin(Public_CompanyAdmin): # admin.ModelAdmin):
  #class Media:
  #  js = ('mselect-to-mcheckbox.js', 'jquery-ui-1.10.2.custom.js',)
  #  css = {
  #    'all': ('css/mselect-to-mcheckbox.css',)
  #  }

  list_display = ['name', 'nickname', 'email', 'company_type']
  list_filter = ('company_type',)
  search_fields = ('name', 'nickname', 'email', 'company_type')

  '''
  fieldsets = (
    (None, {
      'fields':(('name', 'nickname', 'company_type'),
                ('legal_name', 'vat_number'),
                ('email', 'telephone', 'website'))
    }),
    #(_(u"Membres de referencia"), {
    #  'classes': ('collapse',),
    #  'fields':('ref_persons',),
    #}),
    (_(u"Dates inici/fi"), {
      'classes': ('collapse',),
      'fields': (('birth_date', 'death_date'),)
    })
  )
  #filter_horizontal = ('ref_members',) # 'jobs',) # 'addresses')
  '''
  inlines = Public_CompanyAdmin.inlines + [
    H_recordInline,
  ]


'''
class HumanAdmin(admin.ModelAdmin):
  list_display = ['name', 'nickname', 'email']
  search_fields = ('name','nickname','email',)
'''



# Register your models here.

#admin.site.register(Tree)

#admin.site.register(Being)
#admin.site.register(Being_Type, MPTTModelAdmin) # Comment this line after creating 'Human', then 'Person', 'Project' and 'Company' under Human, inside Being_Types.
admin.site.register(Human, HumanAdmin)
admin.site.register(Person, PersonAdmin)
#admin.site.register(Person, Public_PersonAdmin)  # public comentable

admin.site.register(Project, ProjectAdmin)
#admin.site.register(Project, Public_ProjectAdmin)  # public comentable
admin.site.register(Project_Type, MPTTModelAdmin)

admin.site.register(Company, CompanyAdmin)
#admin.site.register(Company, Public_CompanyAdmin)   # public comentable
admin.site.register(Company_Type, MPTTModelAdmin)

#admin.site.register(rel_Human_Humans)

###admin.site.register(Art, MPTTModelAdmin) # Comment this line after creating 'Relation' and 'Job' inside Arts.
admin.site.register(Relation, DjangoMpttAdmin)
admin.site.register(Job, MPTTModelAdmin)


#admin.site.register(Artwork)
#admin.site.register(Artwork_Type, MPTTModelAdmin) # Comment this line after creating 'Unit', 'Record', 'Material' and 'Nonmaterial' inside Artwork_Types
admin.site.register(Unit)
admin.site.register(Unit_Type, MPTTModelAdmin)
admin.site.register(UnitRatio)

admin.site.register(Nonmaterial)
admin.site.register(Nonmaterial_Type, MPTTModelAdmin)

admin.site.register(Material)
admin.site.register(Material_Type, MPTTModelAdmin)
admin.site.register(Asset)

admin.site.register(Record)
admin.site.register(Record_Type, MPTTModelAdmin)
admin.site.register(AccountCes, AccountCesAdmin)
admin.site.register(AccountBank, AccountBankAdmin)
admin.site.register(AccountCrypto, AccountCryptoAdmin)


#admin.site.register(Space)
#admin.site.register(Space_Type, MPTTModelAdmin) # Comment this line after creating 'Address' and 'Region' inside Space_Types
admin.site.register(Address)
admin.site.register(Address_Type, MPTTModelAdmin)

admin.site.register(Region, MPTTModelAdmin)
admin.site.register(Region_Type, MPTTModelAdmin)

#admin.site.register(Concept, MPTTModelAdmin)
#admin.site.register(Type, DjangoMpttAdmin) # Comment this line whenever you don't need to edit the main whole Types tree
