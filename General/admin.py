#encoding=utf-8
from django import forms
from django.contrib import admin
from django.forms.extras import widgets

from django.utils.translation import ugettext as _

from mptt.admin import MPTTModelAdmin
from mptt.fields import TreeForeignKey, TreeManyToManyField
#from mptt.forms import MPTTAdminForm, TreeNodeChoiceField

from General.models import *  # Tree, Human, Adress, Region, Concept, Type, Being_Type

#class CustomMPTTModelAdmin(MPTTModelAdmin):
    # speficfy pixel amount for this ModelAdmin only:
    #fields = ['name']
#    mptt_level_indent = 20
#    mptt_indent_field = "name"


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

class M_addressInline(admin.TabularInline):
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



class H_addressInline(admin.StackedInline):
    model = rel_Human_Addresses
    extra = 0
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

class H_accountCesInline(admin.StackedInline):
  model = AccountCes
  extra = 0
  fk_name = 'human'
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (
        ('record_type', 'entity', 'unit', 'code', 'number'),
      )
    }),
  )
  def save_model(self, request, obj, form, change):
    print 'JELOW' #obj.__unicode__
    obj.name = obj.__unicode__()
    obj.save()

class H_accountBankInline(admin.StackedInline):
  model = AccountBank
  extra = 0
  fk_name = 'human'
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (
        ('record_type', 'company', 'unit', 'code', 'number'),
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
        ('record_type', 'unit', 'number'),
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
  inlines = [
    M_addressInline,
  ]



class ProjectAdmin(MPTTModelAdmin): # admin.ModelAdmin):
  #class Media:
  #  js = ('mselect-to-mcheckbox.js', 'jquery-ui-1.10.2.custom.js',)
  #  css = {
  #    'all': ('css/mselect-to-mcheckbox.css',)
  #  }
  #list_select_related = True
  #select_related = ['accountsCes']
  #project_type = Being_Type.objects.all()

  list_display = ['name', 'nickname', 'project_type', '_is_collective']#, 'ref_persons']
  list_filter = ('project_type',)
  search_fields = ('name', 'nickname', 'project_type')

  def ref_persons(self, obj):
    return obj.project._get_ref_persons
  ref_persons.admin_order_field = 'project___get_ref_persons'
  #ref_persons.list = []
  #ref_persons.allow_tags = True

  fieldsets = (
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
    H_recordInline,
  ]



class PersonAdmin(admin.ModelAdmin):
  #class Media:
  #  js = ('mselect-to-mcheckbox.js', 'jquery-ui-1.10.2.custom.js',)
  #  css = {
  #    'all': ('css/mselect-to-mcheckbox.css',)
  #  }

  list_display = ['name', 'nickname', 'email']
  search_fields = ('name', 'nickname', 'email')

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
    })
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
    H_recordInline,
  ]


class CompanyAdmin(admin.ModelAdmin): # admin.ModelAdmin):
  #class Media:
  #  js = ('mselect-to-mcheckbox.js', 'jquery-ui-1.10.2.custom.js',)
  #  css = {
  #    'all': ('css/mselect-to-mcheckbox.css',)
  #  }

  list_display = ['name', 'nickname', 'email', 'company_type']
  list_filter = ('company_type',)
  search_fields = ('name', 'nickname', 'email', 'company_type')

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
  inlines = [
    H_addressInline,
    H_jobInline,
    H_personInline,

    H_accountCesInline,
    H_accountBankInline,
    H_accountCryptoInline,

    #H_projectInline,
    #H_companyInline,

    H_materialInline,
    H_nonmaterialInline,
    H_regionInline,
    H_recordInline,
  ]

'''
class HumanAdmin(admin.ModelAdmin):
  list_display = ['name', 'nickname', 'email']
  search_fields = ('name','nickname','email',)
'''


class accountForm(forms.ModelForm):
  model = AccountCes
  def clean_name(self):
    print 'HOLA'
    #return self.unicode
  def clean(self):
    if self.instance.name == '' or self.instance.name is None:
      #self.instance.name = self.instance.__unicode__()
      self.cleaned_data['name'] = self.instance.__unicode__()
      print 'Jola '+self.instance.name


class AccountCesAdmin(admin.ModelAdmin):
  list_display = ['name', 'entity', 'code', 'number', 'unit']

  #form = accountForm
  def save_model(self, request, obj, form, change):
    print obj.__unicode__
    obj.name = obj.__unicode__()
    obj.save()


# Register your models here.

#admin.site.register(Tree)

#admin.site.register(Being)
admin.site.register(Being_Type, MPTTModelAdmin) # Comment this line after creating 'Human', then 'Person', 'Project' and 'Company' under Human, inside Being_Types.
#admin.site.register(Human, HumanAdmin)
admin.site.register(Person, PersonAdmin)

admin.site.register(Project, ProjectAdmin)
admin.site.register(Project_Type, MPTTModelAdmin)

admin.site.register(Company, CompanyAdmin)
admin.site.register(Company_Type, MPTTModelAdmin)

#admin.site.register(rel_Human_Humans)

admin.site.register(Art, MPTTModelAdmin) # Comment this line after creating 'Relation' and 'Job' inside Arts.
admin.site.register(Relation, MPTTModelAdmin)
admin.site.register(Job, MPTTModelAdmin)


#admin.site.register(Artwork)
admin.site.register(Artwork_Type, MPTTModelAdmin) # Comment this line after creating 'Unit', 'Record', 'Material' and 'Nonmaterial' inside Artwork_Types
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
admin.site.register(AccountBank)
admin.site.register(AccountCrypto)


#admin.site.register(Space)
admin.site.register(Space_Type, MPTTModelAdmin) # Comment this line after creating 'Address' and 'Region' inside Space_Types
admin.site.register(Address)
admin.site.register(Address_Type, MPTTModelAdmin)

admin.site.register(Region, MPTTModelAdmin)
admin.site.register(Region_Type, MPTTModelAdmin)

admin.site.register(Concept, MPTTModelAdmin)
admin.site.register(Type, MPTTModelAdmin) # Comment this line whenever you don't need to edit the main whole Types tree
