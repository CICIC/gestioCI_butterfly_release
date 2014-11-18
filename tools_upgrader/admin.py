#encoding=utf-8
#encoding=utf-8

from django.contrib.auth import *
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import admin
from django.contrib.auth.models import *
#from django.contrib.auth.models import User
from django.contrib.admin.sites import AdminSite
from django.contrib import admin
from django.contrib.admin import ModelAdmin
from django.contrib import messages

#To read settings.MEDIA_URL
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


#Generic import
import csv
from csvimport.models import CSVImport
#Soci special import
from Invoices.models import CSVImport

#Application
from Invoices.models import *

from datetime import date, timedelta
from decimal import Decimal

from action import *

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


