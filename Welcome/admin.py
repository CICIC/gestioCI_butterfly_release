from django.contrib import admin

from django.forms.extras import widgets

from django.utils.translation import ugettext as _

from mptt.admin import MPTTModelAdmin
from mptt.fields import TreeForeignKey, TreeManyToManyField
#from mptt.forms import MPTTAdminForm, TreeNodeChoiceField

from Welcome.models import *
from General.models import Image

class MembershipAdmin(admin.ModelAdmin):
  list_display = ['name', 'human', 'ic_CESnum', 'ic_project', '_join_fee_payed']

  fieldsets = (
    (None, {
      'fields':(('human', 'ic_project', 'name', 'ic_CESnum'),
                ('contribution', 'virtual_market', 'labor_contract'),
                ('join_fee', 'join_date', 'end_date'),
                ('expositors', 'comment'))
    }),
    #(_(u"Dates naixement/mort"), {
    #  'classes': ('collapse',),
    #  'fields': (('birth_date', 'death_date'),)
    #})
  )

class SelfEmployedAdmin(admin.ModelAdmin):
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


# Register your models here.

admin.site.register(iC_Record) # es pot comentar
admin.site.register(iC_Membership, MembershipAdmin)
admin.site.register(iC_Self_Employed, SelfEmployedAdmin)
admin.site.register(iC_Stallholder)

#admin.site.register(iC_Document)
admin.site.register(iC_Document_Type)
admin.site.register(iC_Labor_Contract)
admin.site.register(iC_Address_Contract)
admin.site.register(iC_Insurance)
admin.site.register(iC_Licence)

admin.site.register(Fee)
admin.site.register(Learn_Session)
admin.site.register(Project_Accompaniment)
admin.site.register(Image)

admin.site.register(Payment_Mode, MPTTModelAdmin)
