#encoding=utf-8
from django import template
from datetime import date, timedelta, datetime
from django.utils.translation import ugettext_lazy as _
from django.contrib import messages
register = template.Library()
from django.utils.safestring import mark_safe
from django.core import urlresolvers
from django.db.models.loading import get_model
from Welcome.models import iC_Record_Type, iC_Self_Employed, iC_Stallholder

'''
@param: 
	REQUEST
	use:
		GET.key("learn_session_id")
		GET.key("human_id")

@return:
	context['current_human']: General.model > Based on key(human_id), will be a Project or a Person or a Human
	context['dont_memberships'] : Boolean > True meaning human does not have any membership
	context['current_memberships']:  queryset > Welcome.ic_Membership, related object for Human
	context['current_memberships_self']: queryset > Welcome.ic_Self_Employed, related object for Human
	current_memberships_stallholder']: queryset > Welcome.ic_Stallholder, related object for Human
'''

def _links_list_to_ul(links):
	output = "<ul>"
	for link in links:
		output += "<li>%s</li>" % (link)
	return "%s</ul>" % (output)

def _safe_render(output, section, image, links):
	try:
		output = output.replace("\t","") % ( "'100%'", section, image, links)
	except:
		try:
			section = section.decode("utf-8")
			output = output.replace("\t","") % ( "'100%'", section, image, links)
		except:
			try:
				section = section.encode("utf-8")
				output = output.replace("\t","") % ( "'100%'", section, image, links)
			except:
				try:
					output = output.replace("\t","") % (image, "section", links)
				except:
					output = output % (image, "section", links)
	return output

def _section(caption):
	return "<h3>%s</h3>"  % (  caption ) 

def _link(url, caption):
	return "<a href='%s'>%s</a>"  % ( url, caption ) 

class member_object(object):
	def __init__(self, user):
		self.user = user

	def get_member_group_data(self, group, model):

		from public_form.models import RegistrationProfile
		from General.models import Human
		try:
			current_registration = RegistrationProfile.objects.get(user=self.user)
		except:
			return model.objects.filter(id=-1)
		else:
			if hasattr(model, "person"):
				try:
					current_human = Human.objects.get(id=current_registration.person.id)
					if model.objects.filter(human=current_human).count() > 0:
						return model.objects.filter(human=current_human)
				except:
					pass
			if hasattr(model, "ic_project"):
				try:
					current_human = Human.objects.get(id=current_registration.project.id)
					if model.objects.filter(human=current_human).count()>0:
						return model.objects.filter(human=current_human)
				except:
					pass

			if hasattr(model, "ic_membership"):
				try:
					current_human = Human.objects.get(id=current_registration.project.id)
					if model.objects.filter(ic_membership__human=current_human).count()>0:
						return model.objects.filter(ic_membership__human=current_human)
				except:
					pass

			if hasattr(model, "ic_self_employed"):
				try:
					current_human = Human.objects.get(id=current_registration.project.id)
					if model.objects.filter(ic_self_employed__ic_membership__human=current_human).count()>0:
						return model.objects.filter(ic_self_employed__ic_membership__human=current_human)
				except:
					pass

		return model.objects.filter(id=-1)

	def render_group_get_objects(self, group):
		output = ""
		links = []
		sections = []

		record = iC_Record_Type.objects.get(clas=group.name)

		model = get_model ( "Welcome", group.name )

		objects = self.get_member_group_data(group, model)
		for object in objects:
			admin_url = urlresolvers.reverse("member:%s_%s_change" % (object._meta.app_label, object._meta.model_name), args=(object.id,))

			if isinstance(object, iC_Stallholder):
				sections.append( _section( _(u" Particular de Firaire " ).encode("utf-8") ) )
			elif isinstance(object, iC_Self_Employed):
				if self.user.groups.all().filter(name="iC_Stallholder"):
					sections.append( _section( _(u" Comú als Autoocupats " ).encode("utf-8") ) )
			else:
				print object.human._selflink()
				links.append( object.human.self_link_no_pop( "", "/cooper/" ) )
				sections.append( _section( object.record_type.name ) )

			links.append( _link(admin_url, object.record_type.name) )
		return sections, links

	def render_group(self,group):

		image = "<img src='/static/%s_user.png' width='25px'></li>" % (group.name)
		sections, links = self.render_group_get_objects(group)
		output = ""
		for section in sections:
			output =  "<li> \
						<table border=1 width=%s> \
							<tr><td colspan=2><h4>%s</h4></td></tr> \
							<tr> \
								<td width=27>%s</td> \
								<td><span class='mini quiet'>%s</span></td> \
							</tr> \
						</table></li>" 
			output = _safe_render( output, section, image, _links_list_to_ul(links) )

		return output

	def avatar(self):
		return mark_safe("<img src='/static/Anon_user.png' width='15px'>")

	def groups_list(self):
		output = ""
		for group in self.user.groups.all():
			output += self.render_group(group)

		return mark_safe( output )

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

			member = member_object(obj.user)
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