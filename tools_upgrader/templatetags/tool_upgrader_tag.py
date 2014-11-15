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
from Welcome.models import iC_Record_Type, iC_Self_Employed, iC_Stallholder, iC_Project_Membership, iC_Person_Membership, iC_Akin_Membership
from General.models import Human
from django.db.models import Count

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
		output = "<h5>%s</h5> %s" % ( caption, value ) 
	except:
		output = "<h5>%s</h5> %s" % ( caption, value.decode("utf-8") ) 
	return output  


class upgrader_tool(object):

	def __init__(self, request):
		self.request = request
		self.counters = {}

	def counter_plus(self, counter_name):
		if counter_name in self.counters:
			self.counters[counter_name] += 1
		else:
			self.counters[counter_name] = 1

	def counter_render(self):
		list = []
		for k,v in self.counters.iteritems():
			list.append(_folder(k,v))
		return mark_safe(_links_list_to_ul(list))

	def import_soci(self, soci):

		self.counter_plus("processed")
		v7_num_coop = soci.__unicode__()
		from Invoices.models import v7_auth_user
		for user in v7_auth_user.objects.raw("SELECT * FROM v7_auth_user WHERE id=%s", [soci.user_id]):
			v7_user = user

		from Welcome.models import iC_Membership
		try:
			v8_num_coop = iC_Membership.objects.get(ic_CESnum=v7_num_coop)
			self.counter_plus("correlateds")
		except:
			v8_num_coop = "[missing in welcome]"

		return _folder(v7_num_coop, " %s -- %s -- %s " % (v7_num_coop, v7_user.username, v8_num_coop) ) 

	def process(self):
		from Invoices.models import Soci
		result_list = []

		for soci in Soci.objects.all():
			try:
				result_list.append( self.import_soci(soci, ) )
			except Exception as e:
				return e
		return mark_safe( self.counter_render() )
		return mark_safe( _links_list_to_ul(result_list) ) + self.counter_render()
class statics_object(object):
	def __init__(self, request, user):
		self.user = user
		self.request = request

	def invoices_lines_links(self, links):
		links.append( _folder(_section("Detalls factures"), _links_list_to_ul(links_lines + links_vats)))

		links_lines = []
		links_lines.append(_folder(u"Factures amb més d'una linea", str( SalesInvoice.objects.values("user", "period", "num").annotate(count=Count('num')).filter(count__gt=1).count())))

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
		links_lines.append(_folder(u"Factures amb més d'una linea", str( PurchaseInvoice.objects.values("user", "period", "num").annotate(count=Count('num')).filter(count__gt=1).count())))

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
		links_members.append(_folder(
			"Total membres",
			"Invoices_Soci.count(): " + str(Soci.objects.all().count() )
			) )
		#1.1
		coops_per_member = Soci.objects.values("coop__name").annotate(count=Count("coop"))
		links_coops = []
		for coop in coops_per_member:
			links_coops.append( str(coop.get("count")) + ": " + coop.get("coop__name") )
		links_members.append(_folder("Socios por cooperativa madre", _links_list_to_ul(links_coops)))

		#Section 2
		links_companies = []
		from Invoices.models import Client, Provider
		links_companies.append(_folder("Invoices_Client.count()", str(Client.objects.all().count())))
		links_companies.append(_folder("Invoices_Provider.count()", str(Provider.objects.all().count())))

		#Section 3
		#3.0
		links_taxs =[]
		from Invoices.models import periodTaxes
		links_taxs.append(_folder( "Tax", str(periodTaxes.objects.all().count()) ))
		#3.1
		from Invoices.models import VATS
		links_vats = []
		links_vats.append(_folder("Invoices_VATS", _links_list_to_ul(VATS.objects.all().values("value"))))
		#3.2
		links_invoices = []
		from Invoices.models import SalesInvoice, PurchaseInvoice
		links_invoices.append(_folder("Invoices_SalesInvoice.count()", str(SalesInvoice.objects.all().count())))
		links_invoices.append(_folder("-", _links_list_to_ul(SalesInvoice.objects.values("period__label", "period__first_day","period__date_close").annotate(count=Count("period__label"))) ))

		links_invoices.append(_folder("Invoices_PurchaseInvoice.count()", str(PurchaseInvoice.objects.all().count())))
		links_invoices.append(_folder("-", _links_list_to_ul(PurchaseInvoice.objects.values("period__label", "period__first_day","period__date_close").annotate(count=Count("period__label"))) ))

		#Section 4
		links_coop = []
		links_coop.append(_section("Cooperativas madre") )
		from Invoices.models import Coop
		for coop in Coop.objects.all():
			links_coop.append(_folder(coop.name + " id: " + str(coop.id), "Invoices.models,coop") )

		#Section 5
		links_balances = []
		from Invoices.models import PeriodClose
		links_balances.append(_folder("Invoices_PeriodClose.count()", str(PeriodClose.objects.all().count())))
		periods = PeriodClose.objects.values("period__label", "period__first_day","period__date_close").annotate(count=Count("period__label"))
		links_balances.append(_folder( "-", _links_list_to_ul(periods) ))

		#Render
		links.append( _folder(_section("Coopers"), _links_list_to_ul(links_members)))
		links.append( _folder(_section("Companies"), _links_list_to_ul(links_companies)))
		links.append( _folder(_section("Invoices"), _links_list_to_ul(links_taxs + links_vats + links_invoices + links_balances )) )
		links.append( _folder(_section("Mother Coops"), _links_list_to_ul(links_coop)))

		return links
	def group_finances(self):
		links = []

		#Section 1
		from Finances.models import cooper
		links_members = []
		links_members.append(_folder(
			"Total membres",
			"Finances_cooper.count(): " + str(cooper.objects.all().count() ) 
			) )
		#1.1
		coops_per_member = cooper.objects.values("coop__name").annotate(count=Count("coop"))
		links_coops = []
		for coop in coops_per_member:
			links_coops.append( str(coop.get("count")) + ": " + coop.get("coop__name") )
		links_members.append(_folder("Socios por cooperativa madre", _links_list_to_ul(links_coops)))

		#Section 2
		links_companies = []
		from Finances.models import company
		links_companies.append(_folder("Finances_company.c	ount()", str(company.objects.all().count())))

		#Section 3
		#3.0
		from Finances.models import tax
		links_taxs = []
		links_taxs.append(_folder( "Tax", str(tax.objects.all().count()) ))
		#3.1
		from Finances.models import vats
		links_vats = []
		links_vats.append(_folder("Invoices_VATS", _links_list_to_ul(vats.objects.all().values("value"))))
		#3.2
		links_invoices = []
		from Finances.models import purchases_invoice, sales_invoice
		links_invoices.append(_folder("Finances_sales_invoice.count()", str(sales_invoice.objects.all().count())))
		links_invoices.append(_folder("Finances_purchases_invoice.count()", str(purchases_invoice.objects.all().count())))
		from Finances.models import purchases_line, sales_line
		links_invoices.append(_folder("Finances_sales_line.count()", str(sales_line.objects.all().count())))
		links_invoices.append(_folder("Finances_purchases_line.count()", str(purchases_line.objects.all().count())))

		#Section 5
		links_balances = []
		from Finances.models import period_close
		periods = period_close.objects.values("period").annotate(count=Count('period'))
		links_balances.append(_folder( "Periodes", _links_list_to_ul(periods) ))

		links.append(_folder(_section("Coopers"), _links_list_to_ul(links_members)))
		links.append(_folder(_section("Companies"), _links_list_to_ul(links_companies)))
		links.append(_folder(_section("Invoices"), _links_list_to_ul(links_taxs + links_vats + links_invoices + links_balances)))

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
		links_coop = []
		links_coop.append(_section("Cooperativas madre") )
		from General.models import Company
		for coop in Company.objects.filter(name__in=["XIPU", "Interprofessionals"]):
			links_coop.append(_folder(coop.name + " id: " + str(coop.id), "General.models,Company") )

		#Section 5
		links_types = []
		from Welcome.models import Fee
		links_types.append( _folder( "Welcome.Fee", 
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

	def avatar(self):
		return mark_safe("<img src='/static/Anon_user.png' width='15px'>")

	def groups_list(self):
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
			if obj.GET.has_key("execution"):
				context['importer'] = upgrader_tool(obj)
			else:
				context['importer'] = None
				menu_list.append( _link( "/admin/?execution=1", " ⊙:> [/admin/?execution=1] Comença migració")) 

			statics = statics_object(obj, obj.user)

			context['menu'] = mark_safe(_links_list_to_ul(menu_list ))
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
