#encoding=utf-8
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

def _links_list_to_ul(links):
	output = "<ul>"
	for link in links:
		output += "<li>%s</li>" % (link)
	return "%s</ul>" % (output)

def _safe_render(output, section, image, links):
	width = "'100%'"
	try:
		output = output.replace("\t","") % ( width, section, image, links)
	except:
		try:
			section = section.decode("utf-8")
			output = output.replace("\t","") % ( width, section, image, links)
		except:
			try:
				section = section.encode("utf-8")
				output = output.replace("\t","") % ( width, section, image, links)
			except:
				try:
					output = output.replace("\t","") % ( width, image, "section", links)
				except:
					output = output % (width, image, "section", links)
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

class member_object(object):
	def __init__(self, request, user):
		self.user = user
		self.request = request

	def group_finances(self):
		from Finances.models import cooper

		links = []
		sections = []

		sections.append( _section( "-- ") ) 
		links.append( _folder( "Finances_Cooper.count()", str(cooper.objects.all().count())  ) )
		return links, sections
		
	def group_invoices(self):
		from Invoices.models import Soci

		links = []
		sections = []

		sections.append( _section( "--") ) 
		links.append( _folder( "Invoices_Soci.count()", str(Soci.objects.all().count() ) ) )
		return links, sections
		
	def group_finances(self):
		from Finances.models import cooper

		links = []
		sections = []

		sections.append( _section( "-- ") ) 
		links.append( _folder( "Finances_Cooper.count()", str(cooper.objects.all().count())  ) )
		return links, sections
		
	def group_welcome(self):
		from Welcome.models import iC_Self_Employed

		links = []
		sections = []

		sections.append( _section( "--") ) 
		links.append( _folder( "Welcome_ic_self_employed.count()", str(iC_Self_Employed.objects.all().count() ) ) )
		return links, sections

	def render_group(self,group):

		image = "<h2>%s</h2>" % (group)

		if group == "Invoices":
			links, sections = self.group_invoices()
		elif  group == "Finances":
			links, sections = self.group_finances()
		elif  group == "Welcome":
			links, sections = self.group_welcome()
		for section in sections:
			class render_object(object):
				pass
			obj = render_object()
			obj.section = mark_safe(section)
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

class human_tag_node(template.Node):
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

			member = member_object(obj, obj.user)
			member.is_member = True

			context['member'] = member
			return ''

'''On a template, by loading this tag
we can get a human_tag_node 
havig on param an object rather than a simple type
'''
@register.tag
def human_tag(parser, token):
	# token is the string extracted from the template, e.g. "box_user_loader my_object"
	# it will be splitted, and the second argument will be passed to a new
	# constructed FooNode
	try:
		tag_name, obj = token.split_contents()
	except ValueError:
		raise template.TemplateSyntaxError, "%r tag requires exactly one argument" % token.contents.split()[0]
	return human_tag_node(obj)
