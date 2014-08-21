#encoding=utf-8
from django.contrib import admin

from django import forms
from django.forms.extras import widgets

from django.utils.translation import ugettext as _

from mptt.admin import MPTTModelAdmin
from mptt.fields import TreeForeignKey, TreeManyToManyField
from mptt.forms import MPTTAdminForm, TreeNodeChoiceField

from Welcome.models import *
from General.models import Image

from django.forms.models import BaseInlineFormSet

from django.forms.formsets import formset_factory

class AutoRecordName(admin.ModelAdmin):
  def save_model(self, request, obj, form, change):
    instance = form.save(commit=False)
    #if not hasattr(instance,'name') or instance.name is None or instance.name == '':
    instance.name = instance.__unicode__()
    if hasattr(instance, 'ic_project') and instance.ic_project is None:
      print 'SAVE_MODEL: not ic_project! put CIC to '+instance.name
      instance.ic_project = Project.objects.get(nickname='CIC')
    if not hasattr(instance, 'human') or instance.human is None:
      if hasattr(instance, 'project'):# and instance.project is not None:
        print 'SAVE_MODEL: not human! put project...'
        instance.human = instance.project
      if hasattr(instance, 'person'):# and instance.person is not None:
        print 'SAVE_MODEL: not human! put person...'
        instance.human = instance.person
    #if not hasattr(instance, 'ic_membership') or instance.ic_membership is None or instance.ic_membership == '':
    #  print 'JELOW SAVE_MODEL'
    #  print self.model
      #print obj.selfemployed
      #print instance.selfemployed

      #print request.ic_membership
      #instance.ic_membership = request.ic_membership
    instance.save()
    form.save_m2m()
    return instance
  '''
  def save_formset(self, request, form, formset, change):
    def set_relAddrContract_member(instance):
      if not instance.ic_membership:
        print 'SAVE_FORMSET: put ic_membership > '+str(request.ic_membership)
        #instance.ic_membership = request.ic_membership
      instance.save()
    if formset.model == iC_Address_Contract:
      print 'SAVE_FORMSET: put ic_membership??'
      instances = formset.save(commit=False)
      if formset.model == iC_Address_Contract:
        map(set_relAddrContract_member, instances)

      formset.save_m2m()
      return instances
    else:
      return formset.save()
  '''

class Public_AkinMembershipAdmin(AutoRecordName):
  model = iC_Akin_Membership
  raw_id_fields = ('person', 'ic_membership',)
  readonly_fields = ('_has_id_card', '_person_link',)
  fieldsets = (
    (None, {
      'fields':(('person', '_person_link',),
                ('join_date', 'ic_membership',),
                ('description', '_has_id_card'))
    }),
  )


class AkinMembershipAdmin(Public_AkinMembershipAdmin):
  list_display = ['name', 'person', 'join_date', 'ic_membership', '_has_id_card',]
  #raw_id_fields = ('person', 'ic_membership',)
  readonly_fields = ('record_type', 'name', 'ic_project', '_has_id_card', '_person_link')
  fieldsets = (
    (None, {
      'fields':(('record_type', 'ic_project', '_has_id_card'),
                ('person', '_person_link', 'ic_membership', ),
                ('join_date', 'end_date'),
                ('description', 'name'))
    }),
  )


class Public_MembershipAdmin(AutoRecordName):
  model = iC_Membership
  raw_id_fields = ('human',)
  readonly_fields = ('ic_CESnum', 'join_fee', 'join_date', 'human', '_human_link',)
  fieldsets = (
    (None, {
      'fields':(('human', '_human_link', 'ic_CESnum'),
                ('contribution', 'virtual_market'), #'labor_contract'),
                ('join_fee', 'join_date'), #'end_date'),
                ('expositors', 'description'))
    }),
  )
  def formfield_for_foreignkey(self, db_field, request, **kwargs):
    if db_field.name == 'record_type':
      typ = iC_Record_Type.objects.get(clas='iC_Membership')
      kwargs['queryset'] = iC_Record_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
    if db_field.name == 'contribution':
      typ = Relation.objects.get(clas='contribute')
      kwargs['queryset'] = Relation.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
    return super(MembershipAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)


class MembershipAdmin(Public_MembershipAdmin):
  #model = iC_Membership
  readonly_fields = ('_join_fee_payed', '_human_link', 'ic_project', '_joinfee_link')

  search_fields = ('name', 'ic_CESnum',)
  list_display = ['name', 'record_type', 'human', 'ic_CESnum', 'ic_project', '_join_fee_payed']
  #list_filter = ('record_type',)
  raw_id_fields = ('human', 'expositors',)
  fieldsets = (
    (None, {
      'fields':(
        ('record_type', 'name', 'ic_project'),
        ('human','_human_link', 'ic_CESnum'),
        ('contribution', 'virtual_market'),# 'labor_contract'),
        ('join_fee', '_joinfee_link', 'join_date', 'end_date', '_join_fee_payed'),
        ('expositors', 'description'))
    }),
  )



class PersonMembershipAdmin(AutoRecordName):
  model = iC_Person_Membership
  readonly_fields = ('record_type', 'name', 'ic_project', '_join_fee_payed', '_person_link', '_joinfee_link')

  search_fields = ('name', 'ic_CESnum')
  list_display = ['name', 'person', 'ic_CESnum', 'join_date', '_join_fee_payed']
  raw_id_fields = ('person', 'join_fee',)
  fieldsets = (
    (None, {
      'fields':(
        ('record_type', 'ic_project'),
        ('person', '_person_link', 'ic_CESnum'),
        ('contribution', 'virtual_market', 'labor_contract'),
        ('join_fee', '_joinfee_link', '_join_fee_payed'),
        ('join_date', 'end_date'),
        ('expositors', 'name', 'description'))
    }),
  )
  def formfield_for_foreignkey(self, db_field, request, **kwargs):
    if db_field.name == 'contribution':
      typ = Relation.objects.get(clas='contribute')
      kwargs['queryset'] = Relation.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
    return super(PersonMembershipAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

class ProjectMembershipAdmin(AutoRecordName):
  model = iC_Project_Membership
  readonly_fields = ('record_type', 'name', 'ic_project', '_join_fee_payed', '_project_link', '_joinfee_link')

  search_fields = ('name', 'ic_CESnum')
  list_display = ['name', 'project', 'ic_CESnum', 'join_date', '_join_fee_payed']
  raw_id_fields = ('project', 'join_fee',)
  fieldsets = (
    (None, {
      'fields':(
        ('record_type', 'ic_project'),
        ('project', '_project_link', 'ic_CESnum'),
        ('contribution', 'virtual_market'),
        ('join_fee', '_joinfee_link', '_join_fee_payed'),
        ('join_date', 'end_date',),
        ('expositors', 'name', 'description'))
    }),
  )
  def formfield_for_foreignkey(self, db_field, request, **kwargs):
    if db_field.name == 'contribution':
      typ = Relation.objects.get(clas='contribute')
      kwargs['queryset'] = Relation.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
    return super(ProjectMembershipAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)


class SE_relAddressContractInlineSet(BaseInlineFormSet):

  def __init__(self, *args, **kwargs):
    super(SE_relAddressContractInlineSet, self).__init__(*args, **kwargs)

    #if hasattr(kwargs['instance'], 'ic_membership'):
      #print 'INLINESET: '+str(kwargs['instance'].ic_membership)
      #print kwargs['instance']
    #  self.queryset = iC_Address_Contract.objects.filter(ic_membership=kwargs['instance'].ic_membership)


class SE_relAddressContractInline(admin.StackedInline):
  model = iC_Address_Contract
  #fk_name = 'selfemployed'#'selfemployed'#'ic_self_employed'
  extra = 0
  raw_id_fields = ('address',)
  readonly_fields = ('_address_link',)
  #formset = SE_relAddressContractInlineSet
  #form = SE_relAddressContractInlineForm
  fieldsets = (
    (' ', {
      'classes': ('collapse',),
      'fields': (
              ('company', 'address', '_address_link',),
              ('doc_type', 'price', 'price_unit',),
              ('start_date', 'end_date',))
    }),
  )
  verbose_name = _(u"reg Contracte d'Adreça")
  verbose_name_plural = _(u"reg Contractes d'Adreça")

  def formfield_for_foreignkey(self, db_field, request, **kwargs):
    if db_field.name == 'doc_type':
      typ = iC_Document_Type.objects.get(clas='iC_Address_Contract')
      kwargs['queryset'] = iC_Document_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
    if db_field.name == 'price_unit':
      typs = Unit_Type.objects.filter(clas__icontains='currency')
      kwargs['queryset'] = Unit.objects.filter(unit_type=typs)
    return super(SE_relAddressContractInline, self).formfield_for_foreignkey(db_field, request, **kwargs)



'''
class SelfEmployedForm(forms.BaseModelForm):
  def __init__(self, *args, **kwargs):
    self.request = kwargs.pop('request', None)
    super(SelfEmployedForm, self).__init__(*args, **kwargs)
    print 'FORM: '+str(self)
'''

class Public_SelfEmployedAdmin(AutoRecordName):
  class Media:
    css = {
      'all': ('selfemployed.css',)
    }
    js = ()

  model = iC_Self_Employed
  list_display = ['name', 'ic_membership', 'join_date',]# '_join_fee_payed']
  #formset = SelfEmployedForm
  readonly_fields = ('_member_link', '_has_assisted_welcome', '_rel_id_cards', '_rel_address_contract', '_rel_fees')
  raw_id_fields = ('mentor_membership', 'ic_membership', 'rel_address_contracts')#, 'rel_fees')
  fieldsets = (#MembershipAdmin.fieldsets + (
    (_(u"fase 1: Autoocupat"), {
      #'classes': ('collapse',),
      'fields': (
        ('ic_membership', '_member_link', 'organic',),
        ('rel_fees', '_rel_fees',),
        ('_has_assisted_welcome',)
      )
    }),
    #(_(u"fase 2: Llista de tasques"), {
    #  'classes': ('collapse',),
    #  'fields': (('_rel_id_cards', 'rel_address_contracts', 'rel_insurances', 'rel_licences', 'rel_images'))
    #}),
    (_(u"fase 3: Alta"), {
      'classes': ('collapse',),
      'fields': (
        ('join_date', 'assigned_vat', 'review_vat', 'last_review_date'),
        ('rel_accountBank', 'mentor_membership', 'mentor_comment', 'end_date'))
    }),
    (_(u"fase 2: Llista de tasques"), {
      #'classes': ('collapse',),
      'fields': (
          ('_rel_id_cards',),
          ('rel_address_contracts', '_rel_address_contract'))# 'rel_address_contracts', 'rel_insurances', 'rel_licences', 'rel_images'))
    }),
  )
  #filter_horizontal = ('rel_fees',)# 'rel_address_contracts')
  #inlines = [
    #SE_relAddressContractInline,
  #]
  #def __init__(self, *args, **kwargs):
  #  print 'INIT!'

  '''
  mem = 'none'
  def formfield_for_foreignkey(self, db_field, request, **kwargs):
    if db_field.name == 'ic_membership':
      print 'VALUE: '+str(db_field)
      print 'SET: '+str(kwargs)
      #mem = kwargs['queryset']
      print 'MEM: '+self.mem
    return super(SelfEmployedAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

  def formfield_for_manytomany(self, db_field, request, **kwargs):
    print db_field.name
    print kwargs
    if db_field.name == 'ic_membership':
      self.mem = kwargs['queryset']
    if db_field.name == 'rel_fees':
      #typ = iC_Record_Type.objects.get(clas='Fee')
      print 'JALOW self: '+str(self.model.ic_membership)#+str(hasattr(self, 'model'))
      if hasattr(self.model, 'ic_membership'):
        print 'JALOW mem: '+self.mem
        #print 'MEMBER: '+self.model.ic_membership
        #kwargs['queryset'] = Fee.objects.filter(human=self.ic_membership.human)
    return super(SelfEmployedAdmin, self).formfield_for_manytomany(db_field, request, **kwargs)
  '''

class SelfEmployedAdmin(Public_SelfEmployedAdmin):
  model = iC_Self_Employed
  list_display = ['name', 'ic_membership', 'join_date',]# '_join_fee_payed']
  #formset = SelfEmployedForm
  readonly_fields = ('name', 'record_type', '_rel_id_cards', '_member_link', '_rel_address_contract')
  raw_id_fields = ('rel_address_contracts', 'ic_membership',)# 'rel_fees')
  fieldsets = (#MembershipAdmin.fieldsets + (
    (None, {
      #'classes': ('collapse',),
      'fields': (
        ('name', 'record_type',),
        ('ic_membership', '_member_link', 'organic',),
        ('rel_fees',)
      )
    }),
    (_(u"fase 2: Llista de tasques"), {
      #'classes': ('collapse',),
      'fields': (('_rel_id_cards',),
        ('rel_address_contracts', '_rel_address_contract',),
        ('rel_insurances', 'rel_licences', 'rel_images'))
    }),
    (_(u"fase 3: Alta"), {
      #'classes': ('collapse',),
      'fields': (
        ('join_date', 'assigned_vat', 'review_vat', 'last_review_date'),
        ('rel_accountBank', 'mentor_membership', 'mentor_comment', 'end_date'))
    }),
  )
  filter_horizontal = ('rel_fees',)
  inlines = [
    #SE_relAddressContractInline,
  ]


class FeeAdmin(AutoRecordName):
  model = Fee
  readonly_fields = ('name', 'project', '_ic_membership', '_ic_selfemployed', '_auto_amount')

  search_fields = ('name', 'unit')
  list_display = ['name', 'human', 'amount', 'unit', 'payment_type', 'deadline_date', '_is_payed']
  #list_filter = ('unit',)
  raw_id_fields = ('human', 'rel_account')
  fieldsets = (
    (None, {
      'fields': (
        ('record_type', 'project'),
        ('human', '_ic_membership', '_ic_selfemployed'),
        ('unit', 'amount', '_auto_amount'),
        ('issue_date', 'deadline_date'),
        ('payment_type', 'payment_date'),
        ('rel_account', 'name')
      )
    }),
  )
  def formfield_for_foreignkey(self, db_field, request, **kwargs):
    if db_field.name == 'record_type':
      typ = iC_Record_Type.objects.get(clas='Fee')
      kwargs['queryset'] = iC_Record_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
    if db_field.name == 'unit':
      typs = Unit_Type.objects.filter(clas__icontains='currency')
      kwargs['queryset'] = Unit.objects.filter(unit_type=typs)
    return super(FeeAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

  def get_readonly_fields(self, request, obj=None):
    if obj and obj.record_type.clas.startswith('('):
      return self.readonly_fields + ('amount',)
    return self.readonly_fields

class LearnSessionAdmin(AutoRecordName):
  model = Learn_Session
  readonly_fields = ('name', '_assistants_link',)

  list_display = ['name', 'nonmaterial', 'datetime', 'address', 'facilitator']
  search_fields = ('name', 'address',)
  raw_id_fields = ('assistants',)
  fieldsets = (
    (None, {
      'fields': (
        ('nonmaterial', 'datetime', 'duration'),
        ('address', 'facilitator'),
        ('assistants', '_assistants_link',),
        ('description', 'record_type', 'name')
      )
    }),
  )
  def formfield_for_foreignkey(self, db_field, request, **kwargs):
    if db_field.name == 'record_type':
      typ = iC_Record_Type.objects.get(clas='Learn_Session')
      kwargs['queryset'] = iC_Record_Type.objects.filter(lft__gte=typ.lft, rght__lte=typ.rght, tree_id=typ.tree_id)
    if db_field.name == 'nonmaterial':
      #typ = Nonmaterial_Type.objects.get(clas='ic_learn')
      typs = Nonmaterial_Type.objects.filter(parent__clas='ic_learn')
      kwargs['queryset'] = Nonmaterial.objects.filter(nonmaterial_type=typs)
    return super(LearnSessionAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

class AddressContractAdmin(AutoRecordName):
  model = iC_Address_Contract
  readonly_fields = ('name', '_ic_membership', '_ic_selfemployed', '_address_link')

  list_display = ['name', 'doc_type', 'company', 'address', '_ic_membership']
  search_fields = ('name', 'company', 'doc_type')
  #list_filter = ('doc_type', 'company')
  raw_id_fields = ('address',)
  fieldsets = (
    (None, {
      'fields': (
        ('name', '_ic_membership', '_ic_selfemployed'),
        ('doc_type', 'company'),
        ('address', '_address_link', 'file'),
        ('price', 'price_unit'),
        ('start_date', 'end_date'),# 'ic_membership'),
      )
    }),
  )
  def formfield_for_foreignkey(self, db_field, request, **kwargs):
    if db_field.name == 'doc_type':
      typ = iC_Document_Type.objects.get(clas='iC_Address_Contract')
      kwargs['queryset'] = iC_Document_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght, tree_id=typ.tree_id)
    if db_field.name == 'price_unit':
      typs = Unit_Type.objects.filter(clas__icontains='currency')
      kwargs['queryset'] = Unit.objects.filter(unit_type=typs)
    return super(AddressContractAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)


# Register your models here.

#admin.site.register(iC_Type, MPTTModelAdmin) # can be commented after creating 'Membership', 'Document' and 'Payment' types
#admin.site.register(iC_Record) # can be commented
admin.site.register(iC_Record_Type, MPTTModelAdmin) # can be commented

admin.site.register(iC_Person_Membership, PersonMembershipAdmin)
admin.site.register(iC_Project_Membership, ProjectMembershipAdmin)

#admin.site.register(iC_Akin_Membership, Public_AkinMembershipAdmin)
admin.site.register(iC_Akin_Membership, AkinMembershipAdmin)

#admin.site.register(iC_Membership, Public_MembershipAdmin)
admin.site.register(iC_Membership, MembershipAdmin)

admin.site.register(iC_Self_Employed, Public_SelfEmployedAdmin)
#admin.site.register(iC_Self_Employed, SelfEmployedAdmin)

admin.site.register(iC_Stallholder)

#admin.site.register(iC_Document)
admin.site.register(iC_Document_Type, MPTTModelAdmin)
admin.site.register(iC_Labor_Contract)
admin.site.register(iC_Address_Contract, AddressContractAdmin)
admin.site.register(iC_Insurance)
admin.site.register(iC_Licence)

admin.site.register(Fee, FeeAdmin)
admin.site.register(Learn_Session, LearnSessionAdmin)
admin.site.register(Project_Accompaniment)
admin.site.register(Image)

admin.site.register(Payment_Type, MPTTModelAdmin)
