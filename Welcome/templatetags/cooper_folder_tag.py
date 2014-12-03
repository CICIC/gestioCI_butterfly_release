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
from Finances.models import iCf_Period_close
def _links_list_to_ul(links):
	output = "<ul>"
	for link in links:
		try:
			output += "<li>%s</li>" % (link)
		except:
			try:
				output += "<li>%s</li>" % (link.encode("utf-8"))
			except:
				output += "<li>%s</li>" % (link.decode("utf-8"))
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

def _member_folder(object):
	caption = object.print_certificate.short_description.encode("utf-8") 
	value = object.print_certificate()
	return "<h5>%s</h5> %s" % ( caption, value ) 

def _finances_folder(object, user):
	try:
		# Periode vigent en facturació
		from Finances.bots import bot_period
		periods_lists = []
		#opened_one = bot_period.get_opened_periods_list(user)
		from Finances.models import iCf_Period
		list = bot_period.get_opened_periods_list(user)
		if not list:
			list = iCf_Period.objects.all()
		for period in list:
			# Registre corresponent al periode pel membre actual:
			pc = period.get_period_closed(object.icf_self_employed)
			# Registre tipus del periode obert:
			label, code = period.render_icf_se_period(pc)
			periods_lists.append(_folder(label, pc.__unicode__() ))
			value = "<a href='/cooper/Finances/icf_sale'> %s </a>" % ( pc.render_total_sales() )
			periods_lists.append(_folder(_(u"Emeses (€)").encode("utf-8"), value))
			value = "<a href='/cooper/Finances/icf_purchase'> %s </a>" % ( pc.render_total_purchases() )
			periods_lists.append(_folder(_(u"Despeses (€)").encode("utf-8"), value))
		value = _links_list_to_ul(periods_lists)
	except Exception, err:
		import traceback
		print traceback.format_exc()
		from tools_upgrader.objects import Self_Employed_auth
		value = Self_Employed_auth(object)._get_user_member_field()
	return value

def _fees_folder(object):
	caption = _(u"Quotes").encode("utf-8")
	value = object._rel_fees("/cooper/")
	return _folder( caption, value ) 

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

	def get_current_registration(self):

		from public_form.models import RegistrationProfile
		from General.models import Human
		from django.contrib.auth.models import User

		try:
			user = User.objects.get(id=self.user.id)
			current_registration = RegistrationProfile.objects.get(user=user)
			self.current_registration = current_registration
			return current_registration
		except:
			from django.contrib import messages
			text = _(u"No s'ha trobat Registre de perfil.").encode("utf-8")
			text = text + " / " + str(self.user.id) + " / " + self.user.__unicode__()
			text = text + " / grup: " + group.name
			text = text + " / model: " + str(model)
			url = mark_safe("<a href='/admin/public_form/registrationprofile/'> Fix </a>")
			messages.error(self.request, text )
			messages.info(self.request, url )
			self.current_registration = None
		return None

	def _get_current_registration_human(self, human):
		try:
			return Human.objects.get(id=human.id)
		except:
			return human

	def get_member_group_data(self, group, model):
		if self.get_current_registration():

			filter_human = self.current_registration.person

			if group.name in ("iC_Stallholder", "iC_Self_Employed"):
				if self.current_registration.record_type.clas in ("iC_Self_Employed",):
					filter_human = self._get_current_registration_human(self.current_registration.person)
					if model.objects.filter(ic_membership__human = filter_human ).count() == 0:
						filter_human = self._get_current_registration_human(self.current_registration.project)
					return model.objects.filter(ic_membership__human = filter_human )

				if self.current_registration.record_type.clas in ("iC_Person_Membership", "iC_Akin_Membership"):
					filter_human = self._get_current_registration_human(self.current_registration.person)
					if model.objects.filter(ic_membership__human = filter_human ).count() == 0:
						filter_human = self._get_current_registration_human(self.current_registration.project)
					return model.objects.filter(ic_membership__human = filter_human )
				else:
					filter_human = self.current_registration.project
					return model.objects.filter(ic_membership__ic_project = filter_human )
	

			if group.name in ("iC_Person_Membership", "iC_Akin_Membership"):
				filter_human = self.current_registration.person
				return model.objects.filter(person=filter_human)
			if group.name in ("iC_Project_Membership",):
				filter_human = self.current_registration.project
				return model.objects.filter(human=filter_human)

		return model.objects.filter(id=-1)

	def render_selfemployed(self, object, sections, links):

		sections.append( _section( object.record_type.name ) )
		links.append( _member_folder( object ) )
		try:
			caption = _(u"Mentor projecte").encode("utf-8")
			caption_person = _render_person(object.mentor_membership, "/cooper/")
			links.append( _folder( caption, caption_person  ) )
		except:
			pass

		try:
			#PATCH: bydefault Stallholder are xipu, selfemployed interprofessionals
			if not object.ic_membership.ic_company:
				from General.models import Company
				if not self.user.groups.all().filter(name="iC_Stallholder"):
					coop = Company.objects.get(name="Interprofessionals")
				else:
					coop = Company.objects.get(name="XIPU")
				object.ic_membership.ic_company = coop
				object.save()

			links.append( _folder( "Cooperativa", str(object.ic_membership.ic_company) ) )
		except:
			pass

		value = object._rel_id_cards(False, "/cooper/")
		caption =  object._rel_id_cards.short_description.encode("utf-8").decode("utf-8")
		links.append( _folder( caption, value ))
		links.append( _folder( object._akin_members.short_description.encode("utf-8"), object._akin_members(False, "/cooper/").decode("utf-8")  ) )
		if not self.user.groups.all().filter(name="iC_Stallholder"):
			links.append( _member_folder( object ) )
			links.append( _fees_folder( object ) )

		links.append(_folder("finances",_finances_folder( object, self.user )) )
		return sections, links

	def render_member(self, object, sections, links):
		try:
			value = object.ic_CESnum
			caption =  _(u"Numero al CES/iCES").encode("utf-8")
			links.append( _folder( caption, value ))
		except:
			pass

		if isinstance(object, iC_Project_Membership):
			caption = _("Projecte").encode("utf-8")
			links.append( _folder( caption, object.human.self_link_no_pop( "", "/cooper/", object.project.__unicode__() ) ) )
			links_ref = []
			for person in object.ic_project._get_ref_persons():
				links_ref.append( _render_person(person) )
			links.append( _folder("Referentes", _links_list_to_ul(links_ref) ) )

		if isinstance(object, iC_Person_Membership) or isinstance(object, iC_Akin_Membership):
			caption = _("Persona").encode("utf-8")
			links.append( _folder( caption, object.person.self_link_no_pop( "", "/cooper/", object.person.__unicode__() ) ) )

			caption = _(u"Els meus comptes").encode("utf-8")
			links_account = []
			for account in object.person._my_accounts():
				links_account.append( _link( account.link(), account.name  + " / " + account.record_type.name) )
			links.append( _folder(caption, _links_list_to_ul(links_account) )  )

			try:
				caption = _("Projecte").encode("utf-8")
				caption_human = object.ic_membership.human.self_link_no_pop( "", "/cooper/", object.ic_membership.human.__unicode__() )
				links.append( _folder( caption, object.ic_membership.human.self_link_no_pop( "", "/cooper/", object.ic_membership.human.__unicode__() ) ) )
				caption = _(u"Comptes de ").encode("utf-8") +  object.ic_membership.human.__unicode__()
				links_account = []
				for account in object.ic_membership.human._my_accounts():
					links_account.append( _link( account.link(), account.name + " / " + account.record_type.name) )
				links.append( _folder(caption, _links_list_to_ul(links_account) )  )
			except:
				pass

		try:
			links.append( _folder( object.ic_membership._join_fee.short_description.encode("utf-8"), object.ic_membership._join_fee("/cooper/", "/cooper") ))
		except:
			pass

		sections.append( _section( object.record_type.name ) )

		return sections, links

	def render_group_get_objects(self, group):

		output = ""
		links = []
		sections = []

		record = iC_Record_Type.objects.get(clas=group.name)
		model = get_model ( "Welcome", group.name )
		objects = self.get_member_group_data(group, model)

		for object in objects:
			admin_url = urlresolvers.reverse("member:%s_%s_change" % (object._meta.app_label, object._meta.model_name), args=(object.id,))
			links.append( _folder ( _(u"Documents de registre").encode("utf-8"), _link(admin_url, object.record_type.name) ) )

			if isinstance(object, iC_Self_Employed) or isinstance(object, iC_Stallholder):

				sections, links = self.render_selfemployed(object, sections, links)
			else:
				sections, links= self.render_member(object, sections, links)
				pass

		return sections, links

	def render_group(self,group):

		image = "<img src='/static/%s_user.png' width='25px'>" % (group.name)
		sections, links = self.render_group_get_objects(group)
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

		for group in self.user.groups.all():

			if group.name == "iC_Self_Employed" and self.user.groups.all().filter(name="iC_Stallholder"):
				pass
			else:
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
