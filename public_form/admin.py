from django.contrib import admin

from django import forms
from django.forms.extras import widgets

from django.utils.translation import ugettext as _

from mptt.admin import MPTTModelAdmin
from mptt.fields import TreeForeignKey, TreeManyToManyField
from mptt.forms import MPTTAdminForm, TreeNodeChoiceField

from Welcome.models import *
from General.models import Image

#Add any Invoice new Entity for COOPER below:
from Cooper.admin import user_admin_site

from Welcome.models import iC_Akin_Membership
from Welcome.admin import AkinMembershipAdmin
user_admin_site.register(iC_Akin_Membership, AkinMembershipAdmin)