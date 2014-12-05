#encoding=utf-8
from django.contrib.auth import *
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import admin
from django.contrib.auth.models import *
from django.contrib.admin.sites import AdminSite
from django.contrib import admin
from django.contrib.admin import ModelAdmin
from django.contrib import messages
from django.conf import settings
from django.core.exceptions import ValidationError
from django.core.exceptions import FieldError
from django import forms
from django.forms.util import ErrorList
from django.db import models
from django.db import IntegrityError, transaction
from django.db.models import Sum, Max, Count
from django.db import connection
from django.core.validators import *
from django.utils.translation import ugettext_lazy as _
#
#Generic export/import CSV
import csv
from csvimport.models import CSVImport
#Application
from Invoices.models import *
from datetime import date, timedelta
from decimal import Decimal

from tools_upgrader.action import *
from tools_upgrader.models import *

#For cardid validation
from localflavor.es.forms import *
from django.db.models import F

#for filtering
from django.http import HttpResponseRedirect
from django.contrib.auth import *
# Register your models here.
from tools_upgrader.models import EmailNotification, CSVImport
class EmailNotificationAdmin(ModelAdmin):
	class Media:
			js = (
				'EmailNotification.js',   # app static folder
			)
	fields = ['efrom', 'eto', 'ento', 'sent_to_user', 'subject', 'body', 'period', 'is_active', 'notification_type', 'offset_days', 'pointed_date'  ]
	list_display = ('efrom', 'ento', 'sent_to_user_filter', 'subject', 'period', 'is_active', 'on_time','execution_date', 'notification_type', 'pointed_date_filter' )
	actions = [export_as_csv_action("Exportar CSV", fields=list_display, header=True, force_fields=True),]
#admin.site.register(EmailNotification, EmailNotificationAdmin)

#****************************************************************
# Widget wraper for foreign and m2m fields.
# See manual: https://wiki.enredaos.net/index.php?title=GestioCI-Codi&section=44#.28widget.29_RelatedFieldWidgetWrapper
# Exemple of inovaction:
#
# from tool_upgrade.widgets import ForeignKeyRawIdWidgetWrapperAdmin
# class my_RelatedWidgetWrapperAdmin (ForeignKeyRawIdWidgetWrapperAdmin):
# 	pass
#****************************************************************

'''
Administrators
'''
from django.contrib import admin
class Administrators_admin(admin.ModelAdmin):
	model = Administrators
	def get_queryset(self, request):
		return self.model.objects.filter(is_staff=True)

	def formfield_for_manytomany(self, db_field, request, **kwargs):
		from django.contrib.auth.models import Group
		if db_field.name == 'groups':
			kwargs['queryset'] =  Group.objects.filter(name__in=("iC_Welcome","iCf_Finances"))
		return super(Administrators_admin, self).formfield_for_manytomany(db_field, request, **kwargs)
admin.site.register(Administrators, Administrators_admin) 