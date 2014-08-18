from django.contrib import admin

from django import forms
from django.forms.extras import widgets

from django.utils.translation import ugettext as _

from mptt.admin import MPTTModelAdmin
from mptt.fields import TreeForeignKey, TreeManyToManyField
from mptt.forms import MPTTAdminForm, TreeNodeChoiceField

from Welcome.models import *
from General.models import Image


class AutoRecordName(admin.ModelAdmin):
  def save_model(self, request, obj, form, change):
    instance = form.save(commit=False)
    #if not hasattr(instance,'name') or instance.name is None or instance.name == '':
    instance.name = instance.__unicode__()
    if not hasattr(instance, 'ic_project') or instance.ic_project is None:
      instance.ic_project = Project.objects.get(nickname='CIC')
    if not hasattr(instance, 'human') or instance.human is None:
      if hasattr(instance, 'project') and instance.project is not None:
        instance.human = instance.project
      if hasattr(instance, 'person') and instance.person is not None:
        instance.human = instance.person
    instance.save()
    form.save_m2m()
    return instance


class Public_AkinMembershipAdmin(AutoRecordName):
  raw_id_fields = ('person',)
  readonly_fields = ('_has_id_card', '_person_link',)
  fieldsets = (
    (None, {
      'fields':(('person', '_person_link', 'join_date'),
                ('description', '_has_id_card'))
    }),
  )
  model = iC_Akin_Membership


class AkinMembershipAdmin(Public_AkinMembershipAdmin):
  list_display = ['name', 'person', 'join_date', '_has_id_card',]
  raw_id_fields = ('person',)
  readonly_fields = ('record_type', 'name', 'ic_project', '_has_id_card', '_person_link')
  fieldsets = (
    (None, {
      'fields':(('record_type', 'ic_project', '_has_id_card'),
                ('person', '_person_link', 'join_date', 'end_date'),
                ('description', 'name'))
    }),
  )
  model = iC_Akin_Membership


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
  list_display = ['name', 'human', 'ic_CESnum', 'ic_project', '_join_fee_payed']
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




class SelfEmployedAdmin(AutoRecordName):
  model = iC_Self_Employed
  list_display = ['name', 'ic_membership', 'join_date',]# '_join_fee_payed']

  readonly_fields = ('_rel_id_cards',)
  fieldsets = (#MembershipAdmin.fieldsets + (
    (_(u"fase 1: Autoocupat"), {
      'fields': (
        ('ic_membership', 'join_date', 'end_date'),
        ('rel_fees', 'organic')
      )
    }),
    (_(u"fase 2: Llista de tasques"), {
      'fields': (('_rel_id_cards', 'rel_address_contracts', 'rel_insurances', 'rel_licences', 'rel_images'))
    }),
    (_(u"fase 3: Alta"), {
      'fields': (
        ('assigned_vat', 'review_vat', 'last_review_date'),
        ('rel_accountBank', 'mentor_membership','mentor_comment'))
    }),
  )
  #list_display = ['name']

class FeeAdmin(AutoRecordName):
  model = Fee
  readonly_fields = ('project',)

  search_fields = ('name', 'unit')
  list_display = ['name', 'human', 'amount', 'unit', 'payment_type', 'deadline_date', '_is_payed']
  list_filter = ('unit',)
  raw_id_fields = ('human', 'membership', 'rel_account')
  fieldsets = (
    (None, {
      'fields': (
        ('record_type', 'project'),
        ('human', 'membership'),
        ('amount', 'unit'),
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
admin.site.register(iC_Self_Employed, SelfEmployedAdmin)
admin.site.register(iC_Stallholder)

#admin.site.register(iC_Document)
admin.site.register(iC_Document_Type, MPTTModelAdmin)
admin.site.register(iC_Labor_Contract)
admin.site.register(iC_Address_Contract)
admin.site.register(iC_Insurance)
admin.site.register(iC_Licence)

admin.site.register(Fee, FeeAdmin)
admin.site.register(Learn_Session)
admin.site.register(Project_Accompaniment)
admin.site.register(Image)

admin.site.register(Payment_Type, MPTTModelAdmin)
