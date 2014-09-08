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
			context['current_session'] = current_session

		if obj.GET.has_key("human_id"):
			from General.models import Human, Project
			current_human = Human.objects.get( id=obj.GET["human_id"] ) 
			context['current_human'] = current_human

		if current_human and current_session:
			if current_human in current_session.assistants.all():
				from public_form.forms import public_form_self_admin
				from Welcome.models import iC_Membership
				from General.models import Project
				try:
					project = Project.objects.get(id=current_human.id)
					current_membership = iC_Membership( human=project, ic_project=project, join_date=datetime.now())
					current_membership.name = current_membership
					current_membership.save()
				except ObjectDoesNotExist:
					try:
						current_membership = iC_Membership( human=Human.objects.get(id=current_human.id), join_date=datetime.now())
						current_membership.save()
					except ObjectDoesNotExist:
						current_membership = None
				print "Pots registar el projecte."
				form = public_form_self_admin(instance=current_membership)
				print form 
				context['current_sesion_form'] = form
			else:
				from public_form.forms import learn_session_proxy_form
				print "Pots confirmar asistència."
				context['current_sesion_form'] = learn_session_proxy_form(instance=current_session)
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
				current_session = Human.objects.get( id=obj ) 
				context['current_human'] = current_session
			except ObjectDoesNotExist:
				context['current_human'] = _(u"Cap projecte seleccionat.").encode("utf-8")
			return ''

			
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