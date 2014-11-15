#encoding=utf-8
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
from django import template
from datetime import date, timedelta, datetime
from django.utils.translation import ugettext_lazy as _
from django.contrib import messages
register = template.Library()
from django.utils.safestring import mark_safe
from django.core import urlresolvers
from django.db.models.loading import get_model
from Welcome.models import ico_yes, ico_no
from Welcome.models import ico_yes, ico_no
from Welcome.models import *
from General.models import Human
from Invoices.models import Soci
from Invoices.models import v7_auth_user
from django.db.models import Count

_prompt = " ⊙:> ".decode("utf-8")
def _prompt_ico(ico=None):
	output = _prompt
	if ico:
		output = "[%s] %s " % (ico, _prompt)
	return output
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

class upgrader_tool(object):
	def check_periods(self):
		#Main entity type
		#... loop to process each entity
		try:
			period_type = iC_Record_Type.objects.get(clas="iC_Period")
		except:
			#Create if initializationg
			period_type = iC_Record_Type(clas="iC_Period", 
					name="Trimestre", 
					description=_(u'Periode de facturació'))
			if _get_GET("commit", self.request):
				period_type.save()

		#Entities of this type
		from Finances.models import iC_Period
		from Invoices.models import period
		checked = False
		for period in period.objects.all():
			#... is this entity migrated?
			checked = iC_Period.objects.filter(first_day=period.first_day).count()>0
			#... if need migration, migrate
			if not checked:
				#... create new object
				p = iC_Period()
				#... map fields
				for field in period._meta.get_all_field_names():
					try:
						value = getattr(period,field)
						setattr(p, field, value) 
					except:
						pass
				#...save object
				p.record_type = period_type
				if _get_GET("commit", self.request):
					p.save()
			#...refresh existence flag
			checked = checked or iC_Period.objects.filter(label=period.label).count()>0
		#...
		return ico_yes if checked else ico_no
	def check_taxes(self):
		#Main entity type
		try:
			tax_type = iC_Record_Type.objects.get(clas="iC_Taxes")
		except:
			#Create if initializationg
			tax_type = iC_Record_Type(clas="iC_Taxes", 
					name="Tasa", 
					description=_(u'Càlcul Quota Trimestral, taula de quotes de ponderación segons facturació.).')
				)
			if _get_GET("commit", self.request):
				tax_type.save()

		#Entities of this type
		from Finances.models import iC_Tax
		from Invoices.models import periodTaxes
		#... loop to process each entity
		checked = False
		for tax in periodTaxes.objects.all():
			#... is this entity migrated?
			checked = iC_Tax.objects.filter(min_base=tax.min_base, max_base=tax.max_base).count()>0
			#... if need migration, migrate
			if not checked:

				#... create new object
				p = iC_Tax()
				#... map fields
				for field in tax._meta.get_all_field_names():
					try:
						value = getattr(tax,field)
						if field=="taxId":
							field="value"
						setattr(p, field, value) 
					except:
						pass
				#...save object
				p.record_type = tax_type
				if _get_GET("commit", self.request):
					p.save()
			#...refresh existence flag
			checked = checked or iC_Tax.objects.filter(min_base=tax.min_base, max_base=tax.min_base).count()>0
		#...
		return ico_yes if checked else ico_no
	def check_duties(self):
		#Main entity type
		try:
			duty_type = iC_Record_Type.objects.get(clas="iC_Duty")
		except:
			#Create if initializationg
			duty_type = iC_Record_Type(clas="iC_Duty", 
					name="Impuesto oficial del Estado", 
					description=_(u'Impuestos oficiales como el I.V.A. o el I.A.E.')
				)
			if _get_GET("commit", self.request):
				duty_type.save()

		#Entities of this type
		from Finances.models import iC_Duty
		from Invoices.models import VATS
		#... loop to process each entity
		checked = False
		for duty in VATS.objects.all():
			#... is this entity migrated?
			checked = iC_Duty.objects.filter(value=duty.value).count()>0
			#... if need migration, migrate
			if not checked:
				#... create new object
				p = iC_Duty()
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
			checked = checked or iC_Duty.objects.filter(value=duty.value).count()>0
		#...
		return ico_yes if checked else ico_no

	def __init__(self, request):
		self.request = request
		self.counters = {}

		self.menus = []
		self.menus_add()

	def menus_add(self, menu=None):
		if menu:
			self.menus.append( menu )
		else:
			self.menus.append( _link( "/admin/?statics=1&execution=1&counters=1&list=1", _prompt + "statics") + ": [boolean] => Shows full system upgrade statics info. One column for Invoices(gestio.cooperatica.cat); One column for Finances and one for Welcome(both butterfly APP's)")
			self.menus.append( _link( "/admin/?statics=1&execution=1", _prompt + "execution") + ": [boolean] => Will execute the process. Filter query if it lasts too much.")
			self.menus.append( _link( "/admin/?statics=1&execution=1&counters=1", _prompt + "counters") + ": [boolean] => Will show or not counters section,")
			self.menus.append( _link( "/admin/?statics=1&execution=1&list=1", _prompt + "list" ) + ": [boolean] => Will show or not list displays." )
	 		self.menus.append( _link( "/admin/?statics=1&execution=1&counters=1&list=1&query_count=10", _prompt + "query_count") + ": [integer] => This is to limit_loop_query: [objects.all()[query_offset:query_count]]")
	 		self.menus.append( _link( "/admin/?statics=1&execution=1&counters=1&list=1&query_count=10&query_offset=10", _prompt + "query_count") + ": [integer] => This is to limit_loop_query: [objects.all()[query_offset:query_count]]")
			self.menus.append( _link( "/admin/?commit", _prompt + "commit") + ": [boolean] => Will execute the process also against BBDD. This flag is before every CRUD action is going to be performed.")

	def counter_plus(self, counter_name):
		if counter_name in self.counters:
			self.counters[counter_name] += 1
		else:
			self.counters[counter_name] = 1
	def counter_render(self):
		list = []
		for k,v in self.counters.iteritems():
			try:
				caption = _prompt + str(k)
			except:
				caption  = k
			list.append(_folder( caption,v))
		return _folder("Counters", mark_safe(_links_list_to_ul(list)))

	def sync_soci_cooper(self, soci):
		self.counter_plus("processed")
		recs_list = []
		try:
			v8 = iC_Membership.objects.get(ic_CESnum=soci.__unicode__())
			self.counter_plus("iC_Membership.ic_CESnum || Invoices.soci.__unicode__")
			if v8._is_selfemployed():
				recs = v8.selfemployed_recs.all()
				for rec in recs:
					recs_list.append( _link( rec._get_next(), rec.__unicode__()) )
					avatar = rec.record_type.clas.lower()
					self.counter_plus(rec.record_type.clas.lower())
			else:
				avatar = v8.record_type.clas.lower()
				self.counter_plus(v8.record_type.clas.lower())

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
		records = self.request.GET.get("query_count", Soci.objects.all().count())
		offset = self.request.GET.get("query_offset", 0)
		loop_query = Soci.objects.all().order_by("coop_number")[offset:records]

		for soci in loop_query:
			try:
				result_list.append(self.sync_soci_cooper(soci))
			except Exception as e:
				return "Error al procesar" #e.message
		g = self.request.GET
		caption = "%s: (registros desde %s a %s)" % ("List", g.get("query_offset", "primero"), g.get("query_count", "último") )

		return _folder( caption, _links_list_to_ul(result_list))

	def process(self):
		execution = self.execute() if _get_GET("execution", self.request) else ""
		counters = self.counter_render() if _get_GET("counters", self.request) else ""
		list = execution if _get_GET("list", self.request) else ""
		return mark_safe(counters+list)

class statics_object(object):
	def __init__(self, request, user):
		self.user = user
		self.request = request

	def invoices_lines_links(self, links):
		links.append( _folder(_section("Detalls factures"), _links_list_to_ul(links_lines + links_vats)))

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
		links_companies.append(_folder(_prompt +"Invoices_Client.count()", str(Client.objects.all().count())))
		links_companies.append(_folder(_prompt +"Invoices_Provider.count()", str(Provider.objects.all().count())))

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
		links_invoices = []
		from Invoices.models import SalesInvoice, PurchaseInvoice
		links_invoices.append(_folder(_prompt +"Invoices_SalesInvoice.count()", str(SalesInvoice.objects.all().count())))
		links_invoices.append(_folder(_prompt +"-", _links_list_to_ul(SalesInvoice.objects.values("period__label", "period__first_day","period__date_close").annotate(count=Count("period__label"))) ))

		links_invoices.append(_folder(_prompt +"Invoices_PurchaseInvoice.count()", str(PurchaseInvoice.objects.all().count())))
		links_invoices.append(_folder(_prompt +"-", _links_list_to_ul(PurchaseInvoice.objects.values("period__label", "period__first_day","period__date_close").annotate(count=Count("period__label"))) ))

		#Section 4
		links_coop = []
		links_coop.append(_section("Cooperativas madre") )
		from Invoices.models import Coop
		for coop in Coop.objects.all():
			links_coop.append(_folder(_prompt +coop.name + " id: " + str(coop.id), "Invoices.models,coop") )

		#Section 5
		links_balances = []
		from Invoices.models import PeriodClose
		links_balances.append(_folder(_prompt +"Invoices_PeriodClose.count()", str(PeriodClose.objects.all().count())))
		periods = PeriodClose.objects.values("period__label", "period__first_day","period__date_close").annotate(count=Count("period__label"))
		links_balances.append(_folder(_prompt + "-", _links_list_to_ul(periods) ))

		#Render
		links.append( _folder(_section("Coopers"), _links_list_to_ul(links_members)))
		links.append( _folder(_section("Companies"), _links_list_to_ul(links_companies)))
		links.append( _folder(_section("Invoices"), _links_list_to_ul(links_periods + links_taxes + links_duties + links_invoices + links_balances )) )
		links.append( _folder(_section("Mother Coops"), _links_list_to_ul(links_coop)))

		return links
	def group_finances(self):
		links = []

		#Section 1
		from Finances.models import cooper
		links_members = []
		links_members.append(_folder(_prompt +
			"Total membres",
			"Finances_cooper.count(): " + str(cooper.objects.all().count() ) 
			) )
		#1.1
		coops_per_member = cooper.objects.values("coop__name").annotate(count=Count("coop"))
		links_coops = []
		for coop in coops_per_member:
			links_coops.append( str(coop.get("count")) + ": " + coop.get("coop__name") )
		links_members.append(_folder(_prompt +"Socios por cooperativa madre", _links_list_to_ul(links_coops)))

		#Section 2
		links_companies = []
		from Finances.models import company
		links_companies.append(_folder(_prompt +"Finances_company.count()", str(company.objects.all().count())))
		#Section 3
		links_section3 = []
		#3.-1
		from Welcome.templatetags import cooper_folder_tag
		links_section3.append(cooper_folder_tag._invoicing_periods_folder(self))
		#3.0
		from Finances.models import iC_Tax
		links_taxes = []
		total_str = "Tax: (total %s)" % (iC_Tax.objects.all().count())
		links_section3.append(_folder(_prompt + total_str, _links_list_to_ul(iC_Tax.objects.all())))
		#3.1
		from Finances.models import iC_Duty
		links_vats = []
		links_vats.append(_folder(_prompt +"Invoices_VATS", _links_list_to_ul(iC_Duty.objects.all().values("value"))))
		#3.2
		links_invoices = []
		from Finances.models import purchases_invoice, sales_invoice
		links_invoices.append(_folder(_prompt +"Finances_sales_invoice.count()", str(sales_invoice.objects.all().count())))
		links_invoices.append(_folder(_prompt +"Finances_purchases_invoice.count()", str(purchases_invoice.objects.all().count())))
		from Finances.models import purchases_line, sales_line
		links_invoices.append(_folder(_prompt +"Finances_sales_line.count()", str(sales_line.objects.all().count())))
		links_invoices.append(_folder(_prompt +"Finances_purchases_line.count()", str(purchases_line.objects.all().count())))

		#Section 5
		links_balances = []
		from Finances.models import period_close
		periods = period_close.objects.values("period").annotate(count=Count('period'))
		links_balances.append(_folder(_prompt + "Periodes", _links_list_to_ul(periods) ))

		links.append(_folder(_section("Coopers"), _links_list_to_ul(links_members)))
		links.append(_folder(_section("Companies"), _links_list_to_ul(links_companies)))
		links.append(_folder(_section("Invoices"), _links_list_to_ul(links_section3 + links_vats + links_invoices + links_balances)))

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
		from Welcome.models import iC_Record_Type, iC_Record
		for type in iC_Record_Type.objects.all():
			links_types.append( type.name + " | " + type.clas + "| #" + str( iC_Record.objects.filter(record_type = type).count()))
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
		raise template.TemplateSyntaxError, "%r tag requires exactly one argument" % token.contents.split()[0]
	return tool_upgrader_tag_node(obj)
