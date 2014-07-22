#encoding=utf-8

from django_cron import CronJobBase, Schedule

from django.core import mail
from decimal import Decimal
from datetime import datetime
from Invoices.models import Email, EmailNotification
from Invoices.models import Email, EmailNotification, period, PeriodClose, paymentEntities, Soci, SalesInvoice, PurchaseInvoice, periodTaxes


class testBot(CronJobBase):
	RUN_EVERY_MINS = 0 # every 1 min

	schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
	code = 'TestEmailsCron' # a unique code

	def do(self):
		from Invoices.bots import bot_period_manager
		bot = bot_period_manager()
		bot.render()

"""
  Not tested code, runcrons to exect it.
"""
class testEmail(CronJobBase):
	RUN_EVERY_MINS = 0 # every 1 min

	schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
	code = 'TestEmailsCron' # a unique code

	def do(self):

		print "Going to execute cron: TestEmailsCron..."
		print "https://github.com/CICIC/gestioCI/blob/master/cron.py#L11"

              	yNotifications = Email()
                yNotifications.subject = "Test GestioCI"
                yNotifications.body = "Testing Django GestioCI Email server"
                yNotifications.efrom = "gestioci@cooperativa.cat"
                yNotifications.to_list = ["ox@enredaos.net", "aleph@riseup.net"]

		print "Method 1"
#		from django.core.mail import send_mail
#		print send_mail(yNotifications.subject, yNotifications.body, yNotifications.efrom, yNotifications.to_list)

		print "Method 2"
	 	connection = mail.get_connection()
		print "conection getted"
		print "HOST: " + connection.host
		print "PORT: " + str( connection.port )
		print "USER: " + connection.username
		print "PASS: " + connection.password
		print "TLS: " + str ( connection.use_tls )

		print connection.open()
		print "connaction opened"
		
		print "Sending"
		oneemail = mail.EmailMessage(yNotifications.subject, 
			yNotifications.body, 
			yNotifications.efrom, 
			yNotifications.to_list(), 
			connection=connection
		)
		print oneemail.send()

		print "Closing connection"
		connection.close()

		

class EmailsNotifierCron(CronJobBase):
	RUN_EVERY_MINS = 0 # every 1 min

	schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
	code = 'EmailsNotifierCron' # a unique code

	def do(self):
		print "EmailsNotifierCron Cron is disabled by code"
		return
	
		output =  "Send mail start"
		#Get all active notificators
		EmailsToSend = EmailNotification.objects.filter(is_active=True)

		#For each notificator...
		#output = ""
		connection = mail.get_connection()
		connection.open()
		for yNotifications in EmailsToSend.all():
			#If execution date matches present date
			print yNotifications.execution_date()
			if yNotifications.execution_date() is datetime.now() and "ww" == "ee":
				#Open email contection
				#Create mail
#				oneemail = mail.EmailMessage(yNotifications.subject, yNotifications.body, yNotifications.efrom, ["gestioci@cooperativa.cat",], [yNotifications.get_notification_emails_list(),], connection=connection)
				try:
					print "a"
		
					#oneemail = mail.EmailMessage("XXXXXXprueba sin u", yNotifications.body, yNotifications.efrom, ["gestioci@cooperativa.cat",], ["gestioci@cooperativa.cat", "jaimesanchezm@gmail.com","gallardonegro@correo.nu"], connection=connection)
					
					oneemail = mail.EmailMessage("En pruebas: Consulta administracion " + yNotifications.subject, yNotifications.body, yNotifications.efrom, ["gestioci@cooperativa.cat",], ["ox@enredaos.net", "gestioci@cooperativa.cat", "aleph@riseup.net", "jaimesanchezm@gmail.com","gallardonegro@correo.nu"], connection=connection)
					print "b"
					oneemail.send()
				except:
		
					print "caso"
					#oneemail = mail.EmailMessage("XXXXXXprueba con  u", yNotifications.body, yNotifications.efrom, [u"jaimesanchezm@gmail.com",], [u"aleph@riseup.net",u"jaimesanchezm@gmail.com",u"gallardonegro@correo.nu"], connection=connection)
				
				#Send
				#oneemail.send()
				print "paso"
				#Close conection
				output += "Email notificator. Subject: " +  yNotifications.subject + " Sent to: " + str(yNotifications.get_notification_emails_list())
		connection.close()

		print output
		return output


class PeriodCloseAutomaticClose( CronJobBase ):
	RUN_EVERY_MINS = 0 # every 1 min

	schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
	code = 'PeriodCloseAutomaticClose' # a unique code
	
	def do(self):
		print "PeriodCloseAutomaticClose Cron is disabled by code"
		return

		#All periods already closed
		qs_periods = period.objects.filter( date_close__lt=datetime.now() )
		print "Periods already closed"
		print qs_periods

		for ob_period in qs_periods:
			print "process "
			print ob_period
			
			#For each cooper
			a = 0
			for ob_cooper in Soci.objects.filter(user__is_superuser=False):

				if not PeriodClose.objects.filter(period=ob_period, user=ob_cooper.user):
					a = a + 1
					print "cooper: "  
					print ob_cooper
					print " needs automatic close! Procceding..."
					ob_PeriodClose = PeriodClose(period=ob_period, user=ob_cooper.user)
					qs_Sales = SalesInvoice.objects.filter(period=ob_period, user=ob_cooper.user)
					sales_total = sales_invoicedVAT = sales_assignedVAT = sales_totalVAT = Decimal('0.00')
					for item in qs_Sales.all():
						sales_total += item.value
						sales_invoicedVAT += item.invoicedVAT()
						sales_assignedVAT += item.assignedVAT()
						sales_totalVAT += item.total()
				
					ob_PeriodClose.Sales_total = Decimal ( "%.2f" % sales_total )
					ob_PeriodClose.Sales_invoicedVAT = Decimal ( "%.2f" % sales_invoicedVAT )
					ob_PeriodClose.Sales_assignedVAT = Decimal ( "%.2f" % sales_assignedVAT )
					ob_PeriodClose.Sales_totalVAT = Decimal ( "%.2f" % sales_totalVAT )

					qs_Purchase = PurchaseInvoice.objects.filter(period=ob_period, user=ob_cooper.user)
					purchases_total = purchases_expencedVAT = purchases_IRPFRetention = purchases_totalVAT = Decimal('0.00')
					for item in qs_Purchase.all():
						purchases_total += item.value
						purchases_expencedVAT += item.expencedVAT()
						purchases_IRPFRetention += item.IRPFRetention()
						purchases_totalVAT += item.total()

					ob_PeriodClose.Purchases_total = Decimal ( "%.2f" % purchases_total )
					ob_PeriodClose.Purchases_expencedVAT = Decimal ( "%.2f" % purchases_expencedVAT )
					ob_PeriodClose.Purchases_IRPFRetention = Decimal ( "%.2f" % purchases_IRPFRetention )
					ob_PeriodClose.Purchases_totalVAT = Decimal ( "%.2f" % purchases_totalVAT )

					#VATS
					totalVAT1 = Decimal ( "%.2f" % (sales_invoicedVAT - purchases_expencedVAT) )
					if totalVAT1 < 0:
						totalVAT1 = 0
					totalVAT2 = Decimal ( "%.2f" % (sales_assignedVAT - purchases_expencedVAT) )
					if totalVAT2 < 0:
						totalVAT2 = 0
					ob_PeriodClose.VAT_1 =  totalVAT1
					ob_PeriodClose.VAT_2 =  totalVAT2

					#QUOTA
					qs_Tax = periodTaxes.objects.filter(min_base__lte=sales_total, max_base__gte=sales_total)
					value = Decimal('0.00')
					if qs_Tax.count() == 1:
						value = Decimal ( "%.2f" % qs_Tax[0].taxId ) 
					else:
						value = -1
					ob_PeriodClose.periodTAX = value
					ob_PeriodClose.preTAX = ob_cooper.preTAX
					if value > -1:
						print value
						print ob_cooper.preTAX
						value = value - ob_cooper.preTAX
						if value > -1:
							ob_PeriodClose.periodTAXeuro = value
						else:
							ob_PeriodClose.periodTAXeuro = 0
					else:
						ob_PeriodClose.periodTAXeuro = 0
					#ob_PeriodClose.payment_entity.add(paymentEntities.objects.all())
					print " Going to save..."
					ob_PeriodClose.save()
					print " saved!"

#execute and see log --> python manage.py runcrons 
#see register created in http://localhost:8080/admin/django_cron/cronjoblog/     Code = EmailsNotifierCron

