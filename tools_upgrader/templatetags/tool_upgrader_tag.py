#encoding=utf-8

# Uses:
# App: {General, Welcome, Finances, tools_upgrader}
# Templates = {/templates/admin/invoices_super.html}

# - imports

from django.utils.translation import ugettext_lazy as _
from django.utils.translation import gettext as __
change_class = " class='changelink' "
change_caption = __("Editar").encode("utf-8")
add_class = " class='addlink' "
add_caption = __("Afegeix").encode("utf-8")
delete_class = " class='deletelink' "
delete_caption = __("Treu").encode("utf-8")
general_href = "<a href='/admin/General/"
welcome_href = "<a href='/admin/Welcome/"
from Invoices.models import *
from django import template
from datetime import date, timedelta, datetime
from django.utils.translation import ugettext_lazy as _
from django.contrib import messages
register = template.Library()
from django.utils.safestring import mark_safe
from django.core import urlresolvers
from django.db.models.loading import get_model
from Welcome.models import ico_yes, ico_no
from Welcome.models import *
from General.models import *
#from Invoices.models import Soci
#from Invoices.models import v7_auth_user
from django.db.models import Count
from Finances.models import *
from public_form.models import *
from django.core.exceptions import ObjectDoesNotExist
from django.db.models import Q
# - vars and shortcuts
_prompt = " ⊙:> "
def _prompt_ico(ico=None):
	output = _prompt
	if ico:
		output = "[%s] %s " % (ico, _prompt)
	return output
def _get_default_no_mail():
	return "registro@vacio.vocho"
def _error(str):
	try:
		return "<font style='color:red'>%s</font>" % (__(str).encode("utf-8"))
	except:
		return "<font style='color:red'>%s</font>" % (str)
def _links_list_to_ul(links):
	output = "<ul>"
	for link in links:
		output += "<li>%s</li>" % (link)
	return "%s</ul>" % (output)
def _safe_render(output, image, links):
	width = "'100%'"
	try:
		output = output.replace("\t","") % ( width, image, links)
	except:
		return output
def _section(caption):
	return "<h3>%s</h3>"  % (  caption ) 
def _link(url, caption):
	return "<a href='%s'>%s</a>"  % ( url, caption ) 
def _get_label_error( caption, field, required = True):
	str_out = ""
	if field:
		str_out = field
	else:
		if required:
			str_out = "<font alt='person_missing_data' style='color:red'>" + caption.encode("utf-8") + "</font>"
		else:
			str_out = ""
	return str_out
def _render_person(rel, admin_path="/cooper/"):
	out = ""
	if hasattr(rel, 'person'):
		person = rel.person
	else:
		person = rel
	c = _get_label_error(__(" [Falta DNI/NIF] "),person.id_card, False)
	m = _get_label_error(__(" [Falta email] "),person.email, False)
	tc =_get_label_error(__(u" [Falta el telèfon mòbil] "),str(person.telephone_cell), False)
	tl =_get_label_error("",str(person.telephone_land), False)
	try:
		fields = "%s - %s  - %s  %s" % ( c, m, tc, tl)
	except:
		fields = "%s - %s - %s  %s" % ( c, m, tc.decode("utf-8"), tl)
	out_str ="<a %s href='%sGeneral/person/%s%s'><b>%s</b></a> %s<br>"
	try:
		out = out_str % (change_class, admin_path, str(person.id), "", person.__unicode__(), fields.decode("utf-8") )
	except:
		out = out_str % (change_class, admin_path, str(person.id), "", person.__unicode__(), fields )
	return out
def _folder(caption, value):
	output = ""
	try:
		output = "<h5>%s</h5> %s" % ( caption, str(value) ) 
	except:
		try:
			output = "<h5>%s</h5> %s" % ( caption, value.decode("utf-8") ) 
		except:
			try:
				output = "<h5>%s</h5> %s" % ( caption, value ) 
			except:
				output = "<h5>%s</h5> %s" % ( caption, value ) 
	return output  
def _avatar(width="15", clas="Anon"):
	return mark_safe("<img src='/static/%s_user.png' width='%spx'>" % (clas,width))
def _get_GET(key, request):
	if key in request.GET:
		return request.GET.get(key)
	else:
		return False
def _break(break_= True):
	if not break_:
		#import s;pdb.set_trace()
		pass
def _counter_plus(counters, key):
	if key in counters:
		counters[key] += 1
	else:
		counters[key] = 1
# - Invoice to Finances parser
def _get_company(v7, icf_se, type="doesnotmatter", icf_person = None, icf_project = None, commit=False):

	# ***********************************
	# so, get v7 as [Invoices.{sales/purchase}Invoice] model then
	# search it on v8 Finances. If not found
	# insert v7 company in v8 bbdd.
	#
	# So...
	try:
		#
		# ... Read labeled question issue: " Company primary key #3 " 
		# ... on url:
		# ... (https://github.com/CICIC/gestioCI_butterfly_release/issues/3)
		#
		icf_company = Company.objects.get(id_card_es=v7.CIF)
		return icf_company
	except ObjectDoesNotExist as e:
		# ... Read previous note.
		try:
			icf_company = Company.objects.get(id_card_non_es=v7.otherCIF)
			return icf_company
		except ObjectDoesNotExist as e:
			# ... start Company object saving process...
			#

			c = Company()
			
			from Finances.models import _check_icf_record_type
			
			c.telephone_cell = 66666666
			c.nickname = v7.name
			c.email = _get_default_no_mail()
			#
			if icf_person:
				c.persons.add(icf_person)
				c.human = icf_person
			if icf_project:
				c.projects.add(icf_project)
				c.human =icf_project
			#
			c.legal_name =  v7.name
			c.id_card_es =  v7.name
			c.id_card_non_es = v7.otherCIF
			if icf_se and type == "Client":
				c.company_type = _check_icf_record_type("Client","Clients","Perfil de companyies que són clients a l'entorn de facturació",None,True)
			else:
				c.company_type = _check_icf_record_type("Proveidor","Proveidor","Perfil de companyies que són proveidors a l'entorn de facturació",None, False, True)
			#
			# ... ready to fly away insrt query
			try:
				if commit:
					c = c.save()
					if icf_se and type == "Client":
						icf_se.clients.add(c)
					elif icf_se and type == "Provider":
						icf_se.providers.add(c)
			except Exception as e:
				c = None
				print ("[tool_upgrader (templatetag)][_get_company()] Saving error:")
				print (e)
	return c
def _v7_xipu_inter(v7):
	return Company.objects.get(name=v7.name)

class tool_invoice_upgrader(object):
	def initialice(self, invoices, icf_invoices, invoice, commit, counters):
		self.invoice = invoice
		self.commit = commit
		self.counters = counters
		self.invoice_set = invoices
		self.icf_invoice_set = icf_invoices
		self.human = self.pers = self.proj = None
		self.v7_cooper = None
		self.v8_coop = None
		self.v8_cooper = None
		self.v8_user = None
		self.num_ces = None
		self.v8_se = None
		self.v8_period = None
		self.v8_period_close = None
		self.v8_invoice = None
	def set_v7(self):
		from Invoices.models import Soci
		try:
			self.v7_cooper = Soci.objects.get(user=self.invoice.user)
		except ObjectDoesNotExist as e:
			_counter_plus(self.counters, "invoices_missing_cooper_v7")
			self.v7_cooper = None
		else:
			self.num_ces = self.v7_cooper.__unicode__()
	def set_v8_se(self):
		from Welcome.models import iC_Membership
		try:
			self.v8_se = iC_Self_Employed.objects.get(ic_membership__ic_CESnum=self.num_ces)
		except ObjectDoesNotExist as e:
			print ("Missing num_ces: %s" % (self.num_ces))
			print (e)
			_counter_plus(self.counters, "invoices_missing_cooper_v8")
			self.v8_se = None
	def set_or_create_v8(self):

		# ... load self.v8_user field
		if self.v8_se:
			try:
				self.v8_user = RegistrationProfile.objects.get(Q(person=self.v8_se.ic_membership.human) | Q(project=self.v8_se.ic_membership.human)).user
			except ObjectDoesNotExist as e:
				print ("set_or_create_v8() error:")
				print (e)
				pass
			except Exception as e:
				print ("set_or_create_v8() error:")
				pass
		# ... load self.v8_cooper field.
		if self.v8_se and self.v8_user:
			self.v8_coop = self.v8_se.ic_membership.ic_company
			try:
				self.v8_cooper = iCf_Self_Employed.objects.get(user=self.v8_user, ic_self_employed=self.v8_se)
			except ObjectDoesNotExist as e:
				print ("set_or_create_v8() need to create")

				v8 = iCf_Self_Employed()
				v8.user=self.v8_user
				v8.ic_self_employed=self.v8_se
				from Welcome.models import iC_Type
				v8.record_type = iC_Type.objects.get(clas="iCf_Self_Employed")
				v8.ic_membership = self.v8_se.ic_membership
				self.v8_cooper = v8.save()
				pass
			except Exception as e:
				print ("set_or_create_v8() error:")
				print (e)
				pass
		else:
			print ("set_or_create_v8() error:")
			_counter_plus(self.counters, "faltan_v8")

	def __init__(self, invoices, icf_invoices, invoice, commit, counters):
		self.initialice(invoices, icf_invoices, invoice, commit, counters)
		self.set_v7()
		self.set_v8_se()
		self.set_or_create_v8()
		try:
			self.icf_period = iCf_Period.objects.get(label=invoice.period.label, first_day=invoice.period.first_day)
		except:
			t_type = iCf_Type.objects.get(clas="iCf_Periods")
			period = invoice.period
			p = iCf_Period()
			#... map fields
			for field in ['date_close', 'date_open', 'first_day','label'] :
				try:
					value = getattr(period,field)
					setattr(p, field, value) 
				except:
					pass
			value = getattr(period,"label")
			setattr(p, "name", value) 
			#...save object
			if commit:
				try:
					p.icf_type = t_type
					p.save()
				except Exception as e:
					print ("error en init tool_invoice_upgrader")
					print (e)
			print (invoice.period.label)

	def has_lines(self):
		try:
			rows = self.invoice_set.objects.filter(
								period=self.invoice.period, 
								user=self.invoice.user, 
								num=self.invoice.num) 
			rows = rows.values("num").annotate(count=Count("num"))
			return rows.count() > 1
		except Exception as e:
			print ("tool_invoice_upgrader - error - on has_lines")
			print (e)
			return False
	def save_lines(self):
		return False
	def migrate(self, ui):
		#
		try:
			ui.period = self.icf_period
			ui.num = self.invoice.num
			#Warning: Duplicate fields
			ui.date= self.invoice.date
			ui.issue_date = self.invoice.date
			ui.expiring_date=self.icf_period.date_close
			ui.deadline_date = self.icf_period.date_close
			#who_manage= ???
			ui.payment_date = self.icf_period.date_close
			# See Manual title=GestioCI-Base_de_datos#Formas_de_pago:_Class_payment_type.28iC_Type.29
			ui.payment_type = Payment_Type.objects.get(id=24)
			ui.transfer_date = self.icf_period.date_close
			#rel_account = None
			#
			# See Manual itle=GestioCI-Base_de_datos#Unidades_de_medida:_Class_General.Unit.28Artwork.29
			ui.unit = Unit.objects.get(name="Euro")
			#
		except Exception as e:

			print ("tool_invoice_upgrader - error - on: migrate()")
			print (e)
			return ui
		return ui

class tool_sales_upgrader(tool_invoice_upgrader):
	def __init__(self, invoice, commit, counters):
		from Finances.models import iCf_Sale
		from Invoices.models import SalesInvoice
		# Call super to load common invoice fields
		super(tool_sales_upgrader, self).__init__(SalesInvoice, iCf_Sale, invoice, commit, counters)
		#
		if hasattr(self, "v8_coop"):
			# ... load specific sales data fields
			# ... ... Companies
			try:
				self.icf_company =_get_company(self.invoice.client, self.v8_coop, "Client", self.pers, self.proj, self.commit)
			except Exception as e:
				print(e)
				pass

	def need_to_migrate(self ):
		if not self.v8_cooper and self.v8_se and self.v8_user:
			print ("caso extranísssssssssssssssssssssssssimo")
			return True
		try:
			a =  self.v8_cooper.icf_periods_closed.filter(icf_sale__period__name = self.invoice.period.label, icf_sale__num = self.invoice.num)
			return a.count() < 1
		except Exception as e:
			print ("tool_invoice_upgrader - error - need_to_migrate")
			print (e)
			return True
	def has_lines(self):
		return super(tool_sales_upgrader, self).has_lines()
	def save_lines(self):
		super(tool_sales_upgrader, self).save_lines()
		rows = self.invoice_set.objects.filter(
				period=self.invoice.period, 
				user=self.invoice.user, 
				num=self.invoice.num
		) 
		from Finances.models import iCf_Sale_line
		for line in rows:
			li = iCf_Sale_line()
			li.value = line.value
			li.percent_invoiced_vat = line.percent_invoiced_vat
			return li.save()
			self.v8_invoice.lines.add(li)
		return True

	def migrate(self):
		sale = super(tool_sales_upgrader, self).migrate(iCf_Sale())
		if hasattr(self, "icf_company"):
			sale.client = self.icf_company
		sale.save()
		try:
			print ("tool_sales_upgrader - tries to save - on: migrate()") 
			_counter_plus(self.counters,"tries_to_save_sales_invoice")
			self.v8_invoice = sale
			sale.name = sale.number()
			self.v8_invoice.save()
		except Exception as e:
			print ("tool_sales_upgrader - error - on: migrate()")
			print (e)
			pass
		else:
			_counter_plus(self.counters,"sucessfully_saved_sales_invoice")

class tool_purchases_upgrader(tool_invoice_upgrader):
	def __init__(self, invoice, commit, counters):
		from Finances.models import iCf_Purchase
		from Invoices.models import PurchaseInvoice
		# Call super to load common invoice fields
		super(tool_purchases_upgrader, self).__init__(PurchaseInvoice, iCf_Purchase, invoice, commit, counters)
		#
		# ... load specific sales data fields
		# ... ... Companies
		self.icf_company = _get_company(self.invoice.provider, self.v8_coop, "Provider", self.pers, self.proj, self.commit)
	def need_to_migrate(self ):
		if not self.v8_cooper and self.v8_se and self.v8_user:
			print ("caso extranísssssssssssssssssssssssssimo")
			return True
		try:
			a = self.v8_cooper.icf_periods_closed.filter(icf_purchase_period__name=self.invoice.period.label, icf_sale_num = self.invoice.num)
			return a.count() < 1
		except Exception as e:
			print ("tool_invoice_upgrader - error - need_to_migrate")
			print (e)
			return True
	def has_lines(self):
		return super(tool_purchases_upgrader, self).has_lines()

	def save_lines(self):
		super(tool_purchases_upgrader, self).save_lines()
		rows = self.invoice_set.objects.filter(
				period=self.invoice.period, 
				user=self.invoice.user, 
				num=self.invoice.num
		) 
		for row in rows:
			li = iCf_Purchase_line()
			li.value = row.value
			li.percent_vat = row.percent_vat
			li.percent_irpf = row.percent_irpf
			return li.save()
			self.v8_invoice.lines.add(li)
		return True
	def migrate(self):
		purchase = super(tool_purchases_upgrader, self).migrate(iCf_Purchase())
		purchase.provider = self.icf_company
		purchase.save()
		try:
			print ("tool_purchase_upgrader - tries to save - on: migrate()") 
			self.counters.counter_plus("tries_to_save_sales_invoice")
			purchase.save()
		except Exception as e:
			print ("tool_purchase_upgrader - error - on: migrate()")
			print (e)
			pass
		else:
			_counter_plus(self.counters, "sucessfully_saved_purchases_invoice")
# - Main Tool
class upgrader_tool(object):
	def _print(self, text):
		if _get_GET("prints", self.request):
			print ("[upgrader_tool_ %s]" % (text))
	def _break(self,break_=True):
		_break(_get_GET("breaks", self.request) and break_)
	def __init__(self, request):
		self.request = request
		self.counters = {}

		self.menus = []
		self.menus_add()

	def menus_add(self, menu=None):
		if menu:
			self.menus.append( menu )
		else:
			self.menus.append( _link("http://169.254.226.5:8082/admin/?statics=1&counters=1&query_count=10&breaks=1&prints=1&query_offset=5", "Best to run checks"))
			self.menus.append( _link( "/admin/?statics=1&execution=1&counters=1&list=1", _prompt + "statics") + ": [boolean] => Shows full system upgrade statics info. One column for Invoices(gestio.cooperatica.cat); One column for Finances and one for Welcome(both butterfly APP's)")
			self.menus.append( _link( "/admin/?statics=1&execution=1", _prompt + "execution") + ": [boolean] => Will execute the process. Filter query if it lasts too much.")
			self.menus.append( _link( "/admin/?statics=1&execution=1&counters=1", _prompt + "counters") + ": [boolean] => Will show or not counters section,")
			self.menus.append( _link( "/admin/?statics=1&execution=1&list=1", _prompt + "list" ) + ": [boolean] => Will show or not list displays." )
			self.menus.append( _link( "/admin/?statics=1&execution=1&counters=1&list=1&query_count=10", _prompt + "query_count") + ": [integer] => This is to limit_loop_query: [objects.all()[query_offset:query_count]]")
			self.menus.append( _link( "/admin/?statics=1&execution=1&counters=1&list=1&query_count=10&query_offset=10", _prompt + "query_count") + ": [integer] => This is to limit_loop_query: [objects.all()[query_offset:query_count]]")
			self.menus.append( _link( "/admin/?commit", _prompt + "commit") + ": [boolean] => Will execute the process also against BBDD. This flag is before every CRUD action is going to be performed.")
			#breaks = bool
			#prints = bool

	def counters_plus(self, counter_name):
		self._break()
		_counter_plus(self.counters, counter_name)
	def counters_render(self):
		list = []
		for k,v in self.counters.items():
			try:
				caption = _prompt + str(k)
			except:
				caption  = k
			list.append(_folder( caption,v))
		self._break()
		return _folder("Counters", mark_safe(_links_list_to_ul(list)))

	def commit(self):
		return _get_GET("commit", self.request)
	def check_periods(self):
		#
		from Finances.models import iCf_Period
		#
		#Main entity type
		#... loop to process each entity
		try:
			t_type = iCf_Type.objects.get(clas="iCf_Period")
		except:
			t_type = iCf_Period() # will inove model, __init__() with save method in it
			try:
				t_type = iCf_Type.objects.get(clas="iCf_Period")
			except:
				print ("re run process")
				return ico_no
		#Entities of this type
		from Finances.models import iCf_Period
		from Invoices.models import period
		checked = False
		for period in period.objects.all():
			#... is this entity migrated?
			checked = iCf_Period.objects.filter(first_day=period.first_day).count()>0
			#... if need migration, migrate
			if not checked:
				#... create new object
				p = iCf_Period()
				#... map fields
				for field in ['date_close', 'date_open', 'first_day','label'] :
					try:
						value = getattr(period,field)
						setattr(p, field, value) 
					except:
						value = getattr(period,"label")
						setattr(p, "name", value) 
				#...save object
				if _get_GET("commit", self.request):
					try:
						p.parent = t_type
						p.save()
					except Exception as e:
						print ("error")
						print (e)
						return ico_no
			#...refresh existence flag
			checked = checked or iCf_Period.objects.filter(label=period.label).count()>0
		#...
		return ico_yes if checked else ico_no
	def check_taxes(self):
		# Basic Type

		from Finances.models import _check_icf_record_type
		t = _check_icf_record_type("iCf_Patterns", u"Taules", u'Taules i patrons de dades', None, True)
		r = _check_icf_record_type("iCf_Tax", u"Tasa", u'Càlcul Quota Trimestral, taula de quotes de ponderación segons facturació.', t)
		if not (t and r):
			return ico_no

		#Entities of this type
		from Invoices.models import periodTaxes
		#... loop to process each entity
		checked = False
		for tax in periodTaxes.objects.all():
			#... is this entity migrated?
			checked = iCf_Tax.objects.filter(min_base=tax.min_base, max_base=tax.max_base).count()>0
			#... if need migration, migrate
			if not checked:
				#... create new object
				p = iCf_Tax()
				#... map fields
				for field in tax._meta.get_all_field_names():
					try:
						value = getattr(tax,field)
						if field=="taxId":
							field="value"
						setattr(p, field, value) 
					except Exception as e:
						print ("mapping taxes")
						print (e)
						return ico_no

				#...save object
				if _get_GET("commit", self.request):
					p.record_type = r
					p.save()
			#...refresh existence flag
			checked = checked or iCf_Tax.objects.filter(min_base=tax.min_base, max_base=tax.min_base).count()>0
		#...
		return ico_yes if checked else ico_no
	def check_duties(self):
		#
		from Finances.models import iCf_Duty
		#
		#Main entity type
		#... loop to process each entity
		try:
			t_type = iCf_Record_Type.objects.get(clas="iCf_Duty")
		except:
			t_type = iCf_Duty()
			try:
				t_type = iCf_Record_Type.objects.get(clas="iCf_Duty")
			except:
				print ("re run process")
				return ico_no
		#Main entity type

		from Invoices.models import VATS
		#... loop to process each entity
		checked = False
		for duty in VATS.objects.all():
			#... is this entity migrated?
			checked = iCf_Duty.objects.filter(value=duty.value).count()>0
			#... if need migration, migrate
			if not checked:
				#... create new object
				p = iCf_Duty()
				#... map fields
				for field in duty._meta.get_all_field_names():
					try:
						value = getattr(duty,field)
						setattr(p, field, value) 
					except:
						pass
				#...save object
				if _get_GET("commit", self.request):
					p.record_type = t_type
					p.save()
			#...refresh existence flag
			checked = checked or iCf_Duty.objects.filter(value=duty.value).count()>0
		#...
		return ico_yes if checked else ico_no
	def check_and_create_company(self, slug="Company"):
		return ico_no
	def check_companies(self):
		#Check for basic types
		ok_clients = self.check_and_create_company("Client")
		ok_providers = self.check_and_create_company("Provider")
		#Check for ocurrencies
		#TODO
		return ico_yes if ok_clients and ok_providers else ico_no
	def check_invoice_loop(self, label, invoices):
		all_invoices_are_ok = False
		_v8_missing_list = []
		for invoice in invoices:
			self._print("[%s: loop invoices for: %s]" % (label, str(invoice.number())) )
			try:
				if label == "check_sales":
					tsu = tool_sales_upgrader(invoice, self.commit(), self.counters)
				else:
					tsu = tool_purchases_upgrader(invoice, self.commit(), self.counters)
					self._print("[%s: have tsu" % (label))
			except Exception as e:
				self._print("[%s: error creating tsu" % (label))
				print (e)
				result = False
				return False, ""

			if not tsu.v8_cooper:
				caption = "Soci: %s Fact: %s" % (tsu.v7_cooper.__unicode__(), str(invoice.num) )
				self._print("[%s: don't have v8_cooper >> %s]" % (label, caption) )
				_v8_missing_list.append(caption)
			else:
				self._print("[%s: search for existing migrated..." % (label))
				if tsu.need_to_migrate():
					self._print("[%s: needs to migrate!" % (label))
					all_invoices_are_ok = False
					self.counters_plus("%s_need_to_migrate" % (label))
					if self.commit():
						self._print("[%s: migrating process >> attempt to save invoice" % (label))
						result = tsu.migrate()
						self._print("[%s: save invoice: migrating process >> saved with result %s" % (label, result) )
					else:
						self._print("[%s: migrating process >> Commit not activated" % (label) )
					self._print("[%s: migrating process >> search for lines" % (label))
					if tsu.has_lines():
						self._print("[%s: migrating process >> has lines!")
						self.counters_plus("%s_has_lines" % (label))
						if self.commit():
							self._print("[%s: migrating process >> attempt to save lines" % (label))
							all_lines_are_ok = tsu.save_lines()
							self._print("[%s: migrating process >> saved with result %s" % (all_lines_are_ok) )
						else:
							self._print("[%s: save lines >> Commit not activated" % (label) )
					else:
						self._print("[%s: migrating process >> has no lines!" % (label))
						self.counters_plus("%s_NO_has_lines" % (label))
				else:
					self._print("[%s: migrating process >> no need to migrate!" % (label))
					self.counters_plus("%s_matching" % (label))
					all_invoices_are_ok = True
		c = _prompt_ico(ico_yes if all_invoices_are_ok else ico_no) + ("%s (total " % (label)) + str(invoices.all().count()) + ")"
		cc = _links_list_to_ul(_v8_missing_list)
		folder = _folder(c, cc)
		return all_invoices_are_ok, folder
	def check_invoices(self):
		from Invoices.models import SalesInvoice, PurchaseInvoice
		offset = self.request.GET.get("query_offset", 0)

		records = self.request.GET.get("query_count", SalesInvoice.objects.all().count()-1)
		objs = SalesInvoice.objects.all()
		result_sales, sales_folder = self.check_invoice_loop("check_sales", objs.order_by("user", "num"))

		records = self.request.GET.get("query_count", PurchaseInvoice.objects.all().count()-1)
		c = PurchaseInvoice.objects.all()
		result_purchases, purchases_folder = self.check_invoice_loop("check_purchases", c.order_by("user", "num")[offset:records])

		return result_sales, result_purchases, sales_folder, purchases_folder
	def check_balance(self):
		return ico_no
		#Main entity type
		try:
			duty_type = iC_Record_Type.objects.get(clas="iC_Duty")
		except:
			pass
		#Entities of this type
		from Finances.models import iCf_Duty
		from Invoices.models import VATS
		#... loop to process each entity
		checked = False
		for duty in VATS.objects.all():
			#... is this entity migrated?
			checked = iCf_Duty.objects.filter(value=duty.value).count()>0
			#... if need migration, migrate
			if not checked:
				#... create new object
				p = iCf_Duty()
				#... map fields
				for field in duty._meta.get_all_field_names():
					try:
						value = getattr(duty,field)
						setattr(p, field, value) 
					except:
						pass
				#...save object
				p.record_type = duty_type
				if _get_GET("commit", self.request):
					p.save()
			#...refresh existence flag
			checked = checked or iCf_Duty.objects.filter(value=duty.value).count()>0
		#...
		return ico_yes if checked else ico_no

	def sync_soci_cooper(self, soci):
		self._break()
		self.counter_plus("processed")
		recs_list = []
		try:
			v8 = iC_Membership.objects.get(ic_CESnum=soci.__unicode__())
			self.counters_plus("iC_Membership.ic_CESnum || Invoices.soci.__unicode__")
			if v8._is_selfemployed():
				recs = v8.selfemployed_recs.all()
				for rec in recs:
					recs_list.append( _link( rec._get_next(), rec.__unicode__()) )
					avatar = rec.record_type.clas.lower()
					self.counters_plus(rec.record_type.clas.lower())
			else:
				avatar = v8.record_type.clas.lower()
				self.counters_plus(v8.record_type.clas.lower())

			recs_list.append(_render_person(v8.human))
			folder_title = _avatar("20", avatar) + v8._self_link()
		except:
			v8 = folder_title = None
		try:
			for user in v7_auth_user.objects.raw("SELECT * FROM v7_auth_user WHERE id=%s", [soci.user_id]):
				v7 = user
		except:
			v7 = None

		if not v8:
			self.counter_plus("[Missing]")

		user_title = v7.username if v7 else "[user not in v7_auth_user]"

		folder_content = " INVOICES: %s <b>USER: -- %s</b> WELCOME: -- %s " % (soci.__unicode__(), user_title,  _links_list_to_ul(recs_list) )
		return _folder( folder_title, folder_content ) 

	def execute(self):
		result_list = []
		records = self.request.GET.get("query_count", Soci.objects.all().count()-1)
		offset = self.request.GET.get("query_offset", 0)
		loop_query = Soci.objects.all().order_by("coop_number")[offset:records]
		self._break()
		for soci in loop_query:
			result_list.append("processing " + soci.__unicode__() )
			try:
				result_list.append(self.sync_soci_cooper(soci))
			except Exception as e:
				return "Error al procesar: >s " + e.message
		g = self.request.GET
		caption = "%s: (registros desde %s a %s)" % ("List", g.get("query_offset", "primero"), g.get("query_count", "último") )

		return _folder( caption, _links_list_to_ul(result_list))

	def process(self):
		execution = self.execute() if _get_GET("execution", self.request) else ""
		counters = self.counters_render() if _get_GET("counters", self.request) else ""
		list = execution if _get_GET("list", self.request) else ""
		return mark_safe(counters+list)
# - Statics Tool
class statics_object(object):
	def __init__(self, request, user):
		self.user = user
		self.request = request

	def invoices_lines_links(self, links):
		
		links_lines = []
		links_lines.append(_folder(_prompt +u"Factures amb més d'una linea", str( SalesInvoice.objects.values("user", "period", "num").annotate(count=Count('num')).filter(count__gt=1).count())))

		links_vats = []
		from Invoices.models import SalesInvoice, PurchaseInvoice
		invoices_per_vat_list = SalesInvoice.objects.values("user", "period", "num").annotate(count=Count('num')).filter(count__gt=1)

		for invoice in invoices_per_vat_list:
			list = SalesInvoice.objects.filter(
					user=invoice.get("user"),
					num=invoice.get("num"),
					period=invoice.get("period")
					).values("percentInvoicedVAT").annotate(
						count=Count('percentInvoicedVAT')
					)
			#for vat in list:
			#	from Invoices.models import VATS
			#	links_vats.append(_folder(VATS.objects.get(id=int(vat.get("percentInvoicedVAT"))).value,vat.get("count")  ))
			
		links_lines = []
		links_lines.append(_folder(_prompt +u"Factures amb més d'una linea", str( PurchaseInvoice.objects.values("user", "period", "num").annotate(count=Count('num')).filter(count__gt=1).count())))
		links.append( _folder(_section("Detalls factures"), _links_list_to_ul(links_lines + links_vats)))

		links_vats = []
		invoices_per_vat_list = PurchaseInvoice.objects.values("user", "period", "num").annotate(count=Count('num')).filter(count__gt=1)

		for invoice in invoices_per_vat_list:
			list = PurchaseInvoice.objects.filter(
					user=invoice.get("user"),
					num=invoice.get("num"),
					period=invoice.get("period")
					).values("percentExpencedVAT").annotate(
						count=Count('percentExpencedVAT')
					)
			#links_vats.append(_folder(VATS.objects.get(id=int(vat.get("percentExpencedVAT"))).value, list))
		return links
	def group_invoices(self):
		links = []

		#Section 3
		#3.-1
		links_periods =[]
		from Invoices.models import period
		caption = _prompt_ico(upgrader_tool(self.request).check_periods())
		caption += " periods: " + str(period.objects.all().count())
		content = _links_list_to_ul(period.objects.all())
		links_periods.append(_folder(caption, content))
		#3.0
		links_taxes =[]
		from Invoices.models import periodTaxes
		caption = _prompt_ico(upgrader_tool(self.request).check_taxes())
		caption += " taxes: " + str(periodTaxes.objects.all().count())
		l = {}
		L = []
		for tax in periodTaxes.objects.all():
			l["Valor_" +str(tax.taxId)]= tax
		content = _links_list_to_ul(l)
		links_taxes.append(_folder(caption, content))
		#3.1
		links_duties =[]
		from Invoices.models import VATS
		caption = _prompt_ico(upgrader_tool(self.request).check_duties())
		caption += " Duties: " + str(VATS.objects.all().count())
		content = _links_list_to_ul(VATS.objects.all())
		links_duties.append(_folder(caption, content))
		#3.2
		from Invoices.models import SalesInvoice, PurchaseInvoice
		links_invoices =[]
		ut = upgrader_tool(self.request)
		sales_ok, purchase_ok, sales_folder, purchase_folder = ut.check_invoices()

		caption = _prompt_ico(ico_yes if sales_ok and purchase_ok else ico_no)
		caption += " Invoices"
		content = _links_list_to_ul((sales_folder,purchase_folder))
		links_invoices.append(_folder(caption, content + ut.counters_render()))

		#Section 1
		from Invoices.models import Soci
		links_members = []
		links_members.append(_folder(_prompt +
			"Total membres",
			"Invoices_Soci.count(): " + str(Soci.objects.all().count() )
			) )
		#1.1
		coops_per_member = Soci.objects.values("coop__name").annotate(count=Count("coop"))
		links_coops = []
		for coop in coops_per_member:
			links_coops.append( str(coop.get("count")) + ": " + coop.get("coop__name") )
		links_members.append(_folder(_prompt +"Socios por cooperativa madre", _links_list_to_ul(links_coops)))

		#Section 2
		links_companies = []
		from Invoices.models import Client, Provider
		caption = _prompt_ico(upgrader_tool(self.request).check_companies())
		caption += " Companies: " + str(Client.objects.all().count()+Provider.objects.all().count())
		content =  _folder("Clients: (total %s)" % (Client.objects.all().count()), _links_list_to_ul(Client.objects.all()[:10]))
		content += _folder("Providers: (total %s)" % (Provider.objects.all().count()), _links_list_to_ul(Provider.objects.all()[:10]))
		links_companies.append(_folder(caption, content))

		#section 3.3
		links_balances =[]
		from Invoices.models import PeriodClose
		caption = _prompt_ico(upgrader_tool(self.request).check_balance())
		caption += " Periods Trimestres: " 
		content = " { Tancats > exportats: " + str(PeriodClose.objects.all().filter(closed=False).count())
		content += " }, {Tancats > sense exportar: " + "???" + "}"
		content += " }, {Oberts: " + str(PeriodClose.objects.all().filter(closed=False).count()) + "}"
		content = _folder(  "-", content)
		content += _folder("Periods",_links_list_to_ul(PeriodClose.objects.all()[:5]))
		links_invoices.append(_folder(caption, content))

		#Section 4
		links_coop = []
		links_coop.append(_section("Cooperativas madre") )
		from Invoices.models import Coop
		for coop in Coop.objects.all():
			links_coop.append(_folder(_prompt +coop.name + " id: " + str(coop.id), "Invoices.models,coop") )

		#Section 5
		links_balances = []

		links_balances.append(_folder(_prompt +"Invoices_PeriodClose.count()", str(PeriodClose.objects.all().count())))
		periods = PeriodClose.objects.values("period__label", "period__first_day","period__date_close").annotate(count=Count("period__label"))
		links_balances.append(_folder(_prompt + "-", _links_list_to_ul(periods) ))

		#Render
		links.append( _folder(_section("Invoices"), _links_list_to_ul(links_invoices + links_periods + links_taxes + links_duties +  links_balances )) )
		links.append( _folder(_section("Coopers"), _links_list_to_ul(links_members)))
		links.append( _folder(_section("Companies"), _links_list_to_ul(links_companies)))
		links.append( _folder(_section("Mother Coops"), _links_list_to_ul(links_coop)))

		return links
	def group_finances(self):
		links = []
		#Section 1
		from Finances.models import iCf_Self_Employed
		links_members = []
		links_members.append(_folder(_prompt +
			"Total membres",
			"Finances_iCf_Self_Employed.count(): " + str(iCf_Self_Employed.objects.all().count() ) 
			) )
		#1.1
		coops_per_member = iCf_Self_Employed.objects.values("ic_membership__ic_company__name").annotate(count=Count("ic_membership__ic_company__name"))
		links_coops = []
		for coop in coops_per_member:
			try:
				links_coops.append( str(coop.get("count")) + ": " + coop.get("coop__name") )
			except:
				links_coops.append( "statics_object.group_finances() Error" )
		links_members.append(_folder(_prompt +"Socios por cooperativa madre", _links_list_to_ul(links_coops)))

		#Section 2
		links_companies = []
		from Finances.models import Company
		links_companies.append(_folder(_prompt +"Finances_company.count()", str(Company.objects.all().count())))
		#Section 3
		links_section3 = []
		#3.-1
		from Welcome.templatetags import cooper_folder_tag
		links_section3.append(cooper_folder_tag._invoicing_periods_folder(self))
		#3.0
		from Finances.models import iCf_Tax
		links_taxes = []
		total_str = "Tax: (total %s)" % (iCf_Tax.objects.all().count())
		links_section3.append(_folder(_prompt + total_str, _links_list_to_ul(iCf_Tax.objects.all())))
		#3.1
		from Finances.models import iCf_Duty
		links_vats = []
		links_vats.append(_folder(_prompt +"Invoices_VATS", _links_list_to_ul(iCf_Duty.objects.all().values("value"))))
		#3.2

		links_invoices = []
		from Finances.models import iCf_Purchase, iCf_Invoice
		links_invoices.append(_folder(_prompt +"Finances_iCf_Invoice.count()", str(iCf_Invoice.objects.all().count())))
		from Finances.models import iCf_Purchase, iCf_Sale
		links_invoices.append(_folder(_prompt +"Finances_iCf_Sale.count()", str(iCf_Sale.objects.all().count())))
		links_invoices.append(_folder(_prompt +"Finances_iCf_Purchase.count()", str(iCf_Purchase.objects.all().count())))
		from Finances.models import iCf_Purchase_line, iCf_Sale_line
		links_invoices.append(_folder(_prompt +"Finances_iCf_Sale_line.count()", str(iCf_Sale_line.objects.all().count())))
		links_invoices.append(_folder(_prompt +"Finances_iCf_Purchase_line.count()", str(iCf_Purchase_line.objects.all().count())))

		#Section 5
		links_balances = []
		from Finances.models import iCf_Period_close
		periods = iCf_Period_close.objects.values("record_type").annotate(count=Count('record_type'))
		links_balances.append(_folder(_prompt + "Periodes", _links_list_to_ul(periods) ))
		links.append(_folder(_section("Invoices"), _links_list_to_ul(links_invoices + links_section3 + links_vats +  links_balances)))
		links.append(_folder(_section("Coopers"), _links_list_to_ul(links_members)))
		links.append(_folder(_section("Companies"), _links_list_to_ul(links_companies)))


		return links
	def group_welcome(self):
		links = []

		#Section 1
		from Welcome.models import iC_Self_Employed
		links_members = []
		links_members.append(_folder(
					"Total membres", 
					"Welcome_ic_self_employed.count(): " + str(iC_Self_Employed.objects.all().count() ) 
				) )
		#1.1
		links_coops = []
		for coop in iC_Self_Employed.objects.values("ic_membership__ic_company", "ic_membership__ic_company__name").annotate(count=Count('ic_membership__ic_company')):
			links_coops.append( str(coop.get("count")) + ": " + str(coop.get("ic_membership__ic_company__legal_name")) )
		links_members.append(_folder("Socios por cooperativa madre", _links_list_to_ul(links_coops)))

		#Section 2
		links_companies = []
		from General.models import Company
		links_companies.append(_folder("General_company.count()", str(Company.objects.all().count())))

		#Section 3

		#Section 4
		links_coop = []
		links_coop.append(_section("Cooperativas madre") )
		from General.models import Company
		for coop in Company.objects.filter(name__in=["XIPU", "Interprofessionals"]):
			links_coop.append(_folder(coop.name + " id: " + str(coop.id), "General.models,Company") )

		#Section 5
		links_types = []
		from Welcome.models import Fee
		links_types.append( _folder(_prompt + "Welcome.Fee", 
							_links_list_to_ul( Fee.objects.values("record_type__name").annotate(count=Count("record_type__name") ) )
							)
						)

		#Section 6
		from Finances.models import iCf_Record_Type, iCf_Record
		for tt in iCf_Record_Type.objects.all():
			links_types.append( type.name + " | " + tt.clas + "| #" + str( iCf_Record.objects.filter(record_type = tt).count()))
		links.append( _folder(_section("Coopers"), _links_list_to_ul(links_members)))
		links.append( _folder(_section("Companies"), _links_list_to_ul(links_companies)))
		links.append( _folder(_section("Mother Coops"), _links_list_to_ul(links_coop)))
		links.append( _folder(_section("Welcome.Types"), _links_list_to_ul(links_types)))

		return links

	def render_group(self,group):
		image = "<h2>%s</h2>" % (group)

		if group == "Invoices":
			links = self.group_invoices()
		elif  group == "Finances":
			links= self.group_finances()
		elif  group == "Welcome":
			links = self.group_welcome()

		for link in links:
			class render_object(object):
				pass
			obj = render_object()
			obj.image = mark_safe(image)
			obj.links = mark_safe(_links_list_to_ul(links))
			return obj
		return None

	def avatar(self ):
		return _avatar(width="15", clas="Anon") 
	def groups_list(self):
		if not _get_GET("statics", self.request):
			return ""
		output_list = []
		groups_list = ["Invoices", "Finances", "Welcome"]

		for group in groups_list:
			output_list.append( self.render_group(group) )
		return output_list
# - TemplateTag
class tool_upgrader_tag_node(template.Node):
	def __init__(self, obj):
			# saves the passed obj parameter for later use
			# this is a template.Variable, because that way it can be resolved
			# against the current context in the render method
			self.object = template.Variable(obj)

	def render(self, context):
			# resolve allows the obj to be a variable name, otherwise everything
			# is a string
			obj = self.object.resolve(context)
			# obj now is the object you passed the tag

			menu_list = []
			context['importer'] = upgrader_tool(obj)
			menu_list.append(_folder("/admin/?", _links_list_to_ul(upgrader_tool(obj).menus)))

			statics = statics_object(obj, obj.user)

			context['menu'] = mark_safe( _folder( "[tool_upgrader] Menu", _links_list_to_ul(menu_list))) 
			context['statics'] = statics
			return ''
@register.tag
def upgrader_tag(parser, token):
	# token is the string extracted from the template, e.g. "box_user_loader my_object"
	# it will be splitted, and the second argument will be passed to a new
	# constructed FooNode
	try:
		tag_name, obj = token.split_contents()
	except ValueError:
		raise template.TemplateSyntaxError( "%r tag requires exactly one argument" % token.contents.split()[0])
	return tool_upgrader_tag_node(obj)
