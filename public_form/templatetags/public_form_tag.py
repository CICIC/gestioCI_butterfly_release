#encoding=utf-8
from django import template
from datetime import date, timedelta, datetime
from django.utils.translation import ugettext_lazy as _
from django.contrib import messages
register = template.Library()

class sessions_tag_node(template.Node):
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

		current_human = None
		current_session = None
		from django.core.exceptions import ObjectDoesNotExist

		if obj.GET.has_key("learn_session_id"):
			from Welcome.models import Learn_Session
			current_session = Learn_Session.objects.get( id=obj.GET["learn_session_id"] ) 

		if obj.GET.has_key("human_id"):
			from General.models import Human, Project
			current_human = Human.objects.get( id=obj.GET["human_id"] ) 

		if current_human and current_session:
			if current_human in current_session.assistants.all():
				from public_form.forms import public_form_self_admin
				form = public_form_self_admin()
				context['current_sesion_form'] = form
				context['public_form_action_value'] = "public_form_action_save_membership"
			else:
				from public_form.forms import learn_session_proxy_form
				context['current_sesion_form'] = learn_session_proxy_form(instance=current_session)
				context['public_form_action_value'] = "public_form_action_join_session"

		context['current_session'] = current_session
		context['current_human'] = current_human
		return ''

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

			from General.models import Human
			from django.core.exceptions import ObjectDoesNotExist
			try:
				current_human = Human.objects.get( id=obj ) 
				context['current_human'] = current_human
			except ObjectDoesNotExist:
				context['current_human'] = _(u"Cap projecte seleccionat. Selecciona un projecte fent click sobre el nom en la llista.").encode("utf-8")
			else:
				if current_human:
					from Welcome.models import iC_Membership
					from Welcome.models import iC_Akin_Membership, iC_Person_Membership, iC_Project_Membership
					from Welcome.models import iC_Stallholder, iC_Self_Employed

					try:
						ic = iC_Membership.objects.filter(ic_project=current_human)
					except:
						try:
							ic = iC_Membership.objects.filter(human=current_human)
						except ObjectDoesNotExist:
							ic = None
					context['current_memberships'] = ic

					try:
						icse = iC_Self_Employed.objects.filter(ic_membership__human=current_human)
					except ObjectDoesNotExist:
						icse = None
					context['current_memberships_self'] = icse

					try:
						icsh = iC_Stallholder.objects.filter(ic_self_employed__ic_membership__human=current_human)
					except ObjectDoesNotExist:
						icsh = None
					context['current_memberships_stallholder'] = icsh

					context['dont_memberships'] = ic.count()==0 and icse.count()==0 and icsh.count()==0

			return ''
'''

				try:
					ic = iC_Membership.objects.filter(project=current_human)
				except ObjectDoesNotExist:
					try:
						ic = iC_Membership.objects.filter(human=current_human)
					except ObjectDoesNotExist:
						ic = None

						icse_s = iC_Self_Employed.objects.filter(human=current_human)
				if icse.count>0:
					for icse in icse_s:
						icsh_s = iC_Self_Employed.objects.filter(self_employed = icse)
				icproj_s = iC_Project_Membership.objects.filter(human=current_human)
				icpers_s = iC_Person_Membership.objects.filter(human=current_human)
'''
@register.tag
def sessions_tag(parser, token):
		# token is the string extracted from the template, e.g. "box_user_loader my_object"
		# it will be splitted, and the second argument will be passed to a new
		# constructed FooNode
		try:
				tag_name, obj = token.split_contents()
		except ValueError:
				raise template.TemplateSyntaxError, "%r tag requires exactly one argument" % token.contents.split()[0]
		return sessions_tag_node(obj)
		
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

@register.filter
def do_something(value):
  return "some value"