#encoding=utf-8
from django.utils.translation import ugettext_lazy as _
from django.db import models
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.db.models import Sum, Max
from decimal import Decimal
from django.core.validators import MaxValueValidator, MinValueValidator, RegexValidator
from datetime import date, timedelta
from datetime import datetime
from django.utils.translation import ugettext_lazy as _
from csvimport.models import CSVImport
from django.contrib.auth.models import AbstractUser
from Invoices.models import *
# Create your models here.
class Email(models.Model):
	efrom = models.EmailField(verbose_name=_(u"Remitent"), help_text="", max_length=75, default="gee@gestion.org")
	eto = models.CharField(verbose_name=_(u"Destinatari"), help_text="", max_length=75, default="camp reservat pel sistema")
	subject = models.CharField(verbose_name=_(u"Assumpte"), max_length=200)
	body = models.TextField(verbose_name=_(u'Cos'))
	is_active = models.BooleanField (verbose_name=_(u"Activat"), default=1)

	def __unicode__(self):
		return self.subject

#from Finances.models import iCf_Period ==> [Notice 1:>] Will fail if Finances module is not installed. Better work this issue in a generic way. Will mark
from django.contrib.auth.models import User
class EmailNotification(Email):
	#period = models.ForeignKey(iCf_Period) see first ocurrence of [Notice 1:>] in this document.
	notification_sent_tos = (
		(0, _(u'Tots els socis')),
		(1, _(u'Socis que han tancat')),
		(2, _(u'Socis que NO han tancat')),
		(3, _(u'Usuari')),
	)
	period = models.IntegerField(verbose_name=_(u"Id de iCf_Periode"), help_text=_(u"Te que ser un id de Finances.iCf_Period"), choices=notification_sent_tos)

	sent_to_user = models.ForeignKey(User, related_name="Email to", null=True, blank=True, verbose_name=_(u"A Soci"), help_text=_(u"Per la opció -Usuari-"))
	notification_types = (
		(0, _(u'El primer dia del periode')),
		(1, _(u'X dies avanç de tancar')),
		(2, _(u'Dia de tancament')),
		(3, _(u'El dia senyalat'))
	)
	ento = models.IntegerField(verbose_name=_(u"Destinataris"), help_text=_(u"A qui s'envia"), choices=notification_sent_tos)
	notification_type = models.IntegerField(verbose_name=_(u"Tipus"), help_text=_(u"Quan s'executa"), choices=notification_types)

	offset_days = models.IntegerField(verbose_name=_(u"Dies avanç de tancar"), help_text='', max_length=2, default=0)

	def sent_to_user_filter( self ):
		if self.ento == 3:
			return self.sent_to_user
		else:
			return ' -- '
	sent_to_user_filter.short_description = _(u"Destinatari")

	def pointed_date_filter( self ):
		if self.ento == 3:
			return self.pointed_date
		else:
			return " -- "
	pointed_date_filter.short_description = _(u"Dia senyalat")

	def execution_date ( self ):
		notification_functions = (
			(0, self.period.date_open),
			(1, self.period.date_close - timedelta(days=self.offset_days) ),
			(2, self.period.date_close),
			(3, self.pointed_date),
		)	
		return str(notification_functions[int(self.notification_type)][1])
	execution_date.short_description = _(u"Data d'execució")

	def get_all_coopers( self ):
		qs_coopers = Soci.objects.all()
		coopers_mails = set(str(cooper.user.email) for cooper in qs_coopers)
		#existing_coopers = filter(lambda x: x.cooper.user.email not in coopers_mails, existing_coopers)
		return list(coopers_mails)
	def get_all_coopers_closed( self ):
		#All coopers
		qs_coopers = Soci.objects.all()
		#Closed periods
		qs_periods = PeriodClose.objects.filter(period=self.period, closed=True)
		#Fill lists
		closed_mails = set(cooper.user.email for cooper in qs_periods)
		coopers_mails = set(cooper.user.email for cooper in qs_coopers)
		#Filter
		existing_coopers = []
		existing_coopers = filter(lambda x: str(x) in closed_mails, coopers_mails)
		#Return
		return list(existing_coopers)
	def get_all_coopers_opened( self ):
		#All coopers
		qs_coopers = Soci.objects.all()
		#Closed periods
		qs_periods = PeriodClose.objects.filter(period=self.period, closed=True)
		#Fill lists
		closed_mails = set(cooper.user.email for cooper in qs_periods)
		coopers_mails = set(cooper.user.email for cooper in qs_coopers)
		#Filter
		existing_coopers = []
		existing_coopers = filter(lambda x: str(x) not in closed_mails, coopers_mails)
		#Return
		return list(existing_coopers)
	def get_cooper( self ):
		return self.sent_to_user.email
	def get_notification_emails_list ( self ):
		notification__sent_to_functions = (
			(0, 'get_all_coopers'),
			(1, 'get_all_coopers_closed' ),
			(2, 'get_all_coopers_opened'),
			(3, 'get_cooper'),
		)
		return getattr(self, notification__sent_to_functions[int(self.ento)][1])()

	def on_time ( self ):
		return self.is_active and bool ( datetime.now() > datetime.strptime( str( self.execution_date() ), '%Y-%M-%d'))
	on_time.boolean= True
	on_time.short_description = _(u"Pendent d'execució")

	def __getitem__(self, value):
		return self

	class Meta:
		verbose_name = _(u'F - Notificacions correu')
		verbose_name_plural = _(u'F - Notificacions correu')
'''
IMPORT SOCI
'''
from django.db import models
from Config import settings
from copy import deepcopy
from django.core.files.storage import FileSystemStorage
import re

fs = FileSystemStorage(location=settings.MEDIA_ROOT)
CHOICES = (('manual', 'manual'), ('cronjob', 'cronjob'))

# Create your models here.
if not settings.CSVIMPORT_MODELS:
    MODELS = ['%s.%s' % (m._meta.app_label,
       m.__name__) for m in models.loading.get_models()
       if m._meta.app_label != 'contenttypes']
else:
    MODELS = ["SOCI"]

MODELS = tuple([(m, m) for m in MODELS])



class CSVImport(models.Model):
	""" Logging model for importing files """
	model_name = models.CharField(max_length=255, blank=False,
		default='iisharing.Item',
		help_text='Please specify the app_label.model_name',
		choices=MODELS)
	field_list = models.CharField(max_length=255, blank=True,
		        help_text='''Enter list of fields in order only if
		   you dont have a header row with matching field names, eg.
		   "column1=shared_code,column2=org(Organisation|name)"''')
	upload_file = models.FileField(upload_to='csv', storage=fs)
	file_name = models.CharField(max_length=255, blank=True)
	encoding = models.CharField(max_length=32, blank=True)
	upload_method = models.CharField(blank=False, max_length=50,
		   default='manual', choices=CHOICES)
	error_log = models.TextField(help_text=_(u'Cada línea es un error.'))
	import_date = models.DateField(auto_now=True)
	import_user = models.CharField(max_length=255, default='anonymous',
		 help_text=_(u'Usuari id en text'), blank=True)

	def error_log_html(self):
		return self.error_log
	error_log_html.allow_tags = True

	def __unicode__(self):
		return self.upload_file.name

	class Meta:
		verbose_name= _(u'Importar CSV (Socis,...)')
		verbose_name_plural= _(u'Importar CSV (Socis,...)')
