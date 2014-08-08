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
    instance.save()
    form.save_m2m()
    return instance


class Public_AkinMembershipAdmin(AutoRecordName):
  raw_id_fields = ('person',)
  fieldsets = (
    (None, {
      'fields':(('person', 'join_date'),
                ('description'))
    }),
  )

class AkinMembershipAdmin(AutoRecordName):
  list_display = ['name', 'person', 'join_date', '_has_id_card']
  raw_id_fields = ('person',)
  fieldsets = (
    (None, {
      'fields':(('record_type', 'ic_project'),
                ('person', 'join_date', 'end_date'),
                ('description', 'name'))
    }),
  )
  def formfield_for_foreignkey(self, db_field, request, **kwargs):
    if db_field.name == 'record_type':
      kwargs['queryset'] = iC_Record_Type.objects.filter(clas='iC_Akin_Membership')
    return super(AkinMembershipAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)


'''
class MembershipForm(forms.ModelForm):
  #record_type = TreeNodeChoiceField(queryset=iC_Record_Type.objects.filter(clas='iC_Membership'))
  model = iC_Membership
  def __init__(self, *args, **kwargs):
    super(MembershipForm, self).__init__(*args, **kwargs)
    typ = iC_Record_Type.objects.get(clas='iC_Membership')
    typs = typ.get_descendants(include_self=True)
    #print typs
    #self.fields['record_type'].queryset = typ
    #self.fields['record_type'].choices = typs
'''

class Public_MembershipAdmin(AutoRecordName):
  raw_id_fields = ('human',)

  fieldsets = (
    (None, {
      'fields':(('human', 'ic_CESnum'),
                ('contribution', 'virtual_market', 'labor_contract'),
                ('join_fee', 'join_date', 'end_date'),
                ('expositors', 'description'))
    }),
  )



class MembershipAdmin(AutoRecordName):
  list_display = ['name', 'human', 'ic_CESnum', 'ic_project', '_join_fee_payed']
  raw_id_fields = ('human', 'expositors')
  fieldsets = (
    (None, {
      'fields':(
        ('record_type', 'name'),
        ('human', 'ic_project', 'ic_CESnum'),
        ('contribution', 'virtual_market', 'labor_contract'),
        ('join_fee', 'join_date', 'end_date'),
        ('expositors', 'description'))
    }),
  )
  def formfield_for_foreignkey(self, db_field, request, **kwargs):
    if db_field.name == 'record_type':
      typ = iC_Record_Type.objects.get(clas='iC_Membership')
      kwargs['queryset'] = iC_Record_Type.objects.filter(lft__gt=typ.lft, rght__lt=typ.rght)
    return super(MembershipAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

  def save_model(self, request, obj, form, change):
    instance = form.save(commit=False)
    if not hasattr(instance,'name') or instance.name is None or instance.name == '':
      instance.name = instance.__unicode__()
    instance.save()
    form.save_m2m()
    return instance



class SelfEmployedAdmin(AutoRecordName):
  #list_display = ['name', 'membership__human', 'ic_CESnum', 'join_date', '_join_fee_payed']

  fieldsets = (#MembershipAdmin.fieldsets + (
    (_(u"fase 1: Autoocupat"), {
      'fields': (
        ('membership', 'join_date', 'end_date'),
        ('rel_fees', 'organic')
      )
    }),
    (_(u"fase 2: Llista de tasques"), {
      'fields': (('req_id_cards', 'req_address_contract', 'req_insurance', 'req_licence', 'req_images'))
    }),
    (_(u"fase 3: Alta"), {
      'fields': (
        ('assigned_vat', 'review_vat', 'last_review_date'),
        ('rel_accountBank', 'mentor_membership','mentor_comment'))
    }),
  )
  #list_display = ['name']

class FeeAdmin(AutoRecordName):
  list_display = ['name', 'human', 'amount', 'unit', 'payment_type', 'deadline_date', '_is_payed']
  raw_id_fields = ('human', 'membership', 'rel_account')
  fieldsets = (
    (None, {
      'fields': (
        ('record_type', 'project'),
        ('human', 'membership'),
        ('amount', 'unit', 'payment_type'),
        ('issue_date', 'deadline_date', 'payment_date'),
        ('rel_account', 'name')
      )
    }),
  )


# Register your models here.

admin.site.register(iC_Type, MPTTModelAdmin) # can be commented after creating 'Membership', 'Document' and 'Payment' types
admin.site.register(iC_Record) # can be commented
admin.site.register(iC_Record_Type, MPTTModelAdmin) # can be commented

admin.site.register(iC_Akin_Membership, AkinMembershipAdmin)
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
