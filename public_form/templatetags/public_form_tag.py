#encoding=utf-8
from django import template
from datetime import date, timedelta, datetime
from django.utils.translation import ugettext_lazy as _
from django.contrib import messages
register = template.Library()
from django.utils.safestring import mark_safe
'''
@param: 
	REQUEST
	use:
		GET.key("learn_session_id")
		GET.key("human_id")

@returns: 
	context:current_sesion_form
		can be:
			public_form.forms.learn_session_proxy_form
				A form for initial state to join human with session
				Action: view(save_form_self_employed['public_form_action_join_session'])
			public_form.forms.public_form_self_admin
				A form for create membership
				Action: view(save_form_self_employed['public_form_action_save_membership'])
	context:public_form_action_value
		a value for action stored in a hidden so the view can check wich action has to do with the posted form
	context:current_sesion
		learn_session object
	context:current_human
		human object
'''
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
		current_coin_session = None

		from django.core.exceptions import ObjectDoesNotExist
		from Welcome.models import Learn_Session

		if obj.GET.has_key("learn_session_id"):
			current_session = Learn_Session.objects.get( id=obj.GET["learn_session_id"] ) 

		if obj.GET.has_key("human_id"):
			from General.models import Human, Project
			current_human = Human.objects.get( id=obj.GET["human_id"] ) 

		if obj.GET.has_key("coin_session_id"):
			from General.models import Human, Project
			current_coin_session = Learn_Session.objects.get( id=obj.GET["coin_session_id"] ) 

		if current_human and current_human.assist_sessions.filter(nonmaterial__id = 1).count()>0:
			current_session = current_human.assist_sessions.filter(nonmaterial__id = 1).first()

		if current_human and current_human.assist_sessions.filter(nonmaterial__id = 2).count() > 0:
			current_coin_session = current_human.assist_sessions.filter(nonmaterial__id = 2).first()

		context['has_coin_session'] = False
		context['has_session'] = False
		if current_human and current_session:
			if current_human in current_session.assistants.all():
				context['has_session'] = True
				from public_form.forms import public_form_self_admin
				context['current_sesion_form'] = public_form_self_admin()
				context['public_form_action_value'] = "public_form_action_save_membership"
			else:
				from public_form.forms import learn_session_proxy_form
				context['current_sesion_form'] = learn_session_proxy_form(instance=current_session)
				context['public_form_action_value'] = "public_form_action_join_session"

		if current_human and current_coin_session:
			if current_human in current_coin_session.assistants.all():
				context['has_coin_session'] = True
			else:
				from public_form.forms import learn_session_proxy_form
				context['current_coin_sesion_form'] = learn_session_proxy_form(instance=current_coin_session)
				context['public_form_action_value'] = "public_form_action_join_coin_session"

		context['current_human'] = current_human
		context['current_session'] = current_session
		context['current_coin_session'] = current_coin_session

		return ''

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
			current_human = None
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
						ic = None
					context['current_memberships'] = ic
					try:
						icp = iC_Membership.objects.filter(human=current_human)
					except ObjectDoesNotExist:
						icp = None
					context['current_memberships_person'] = icp

					try:
						icse = iC_Self_Employed.objects.filter(ic_membership__human=current_human)
					except ObjectDoesNotExist:
						icse = None
					context['current_memberships_self'] = icse

					#try:
					#	icsh = iC_Stallholder.objects.filter(ic_self_employed__ic_membership__human=current_human)
					#except ObjectDoesNotExist:
					#	icsh = None
					context['current_memberships_stallholder'] = None

					context['dont_memberships'] = ic.count()==0 and icse.count()==0 #and icsh.count()==0
					#Try to cast type
					from General.models import Person, Project
					try:
						current_entity = Project.objects.get( id=obj ) 
						from General.models import Relation
						context['current_project_referents'] = current_entity.human_persons.filter(relation=Relation.objects.get(clas='reference'))
					except ObjectDoesNotExist:
						try:
							current_entity = Person.objects.get( id=obj ) 
						except ObjectDoesNotExist:
							pass
					if current_entity:
						context['current_human'] = current_entity
			return ''

'''On a template, by loading this tag
we can get a session_tag_node 
havig on param an object rather than a simple type
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

'''
Some times, template localize id's as integers
with point on miles. So this is to get str
'''
@register.filter
def get_id(value):
	if hasattr(value, "id"):
		return str(value.id)
	else:
		return value


'''
Some times, template localize id's as integers
with point on miles. So this is to get str
'''
@register.filter
def get_class(value):
	from General.models import Person, Project, Human
	if isinstance(value,Person):
		return mark_safe("<img class='user_grid' src='/static/user_images/Person_user.png' >") 
	elif isinstance(value,Project):
		return mark_safe("<img class='user_grid' src='/static/user_images/Project_user.png' >") 
	elif isinstance(value,Human):
		return mark_safe("<img class='user_grid' src='/static/user_images/Anon_user.png' >") 
	else:
		return _(" Entitat: ")

@register.filter
def get_projects(value):
	from General.models import Person
	if isinstance(value, Person):
		from General. models import rel_Human_Persons
		return rel_Human_Persons.objects.filter(person=value)
	else:
		return None
	



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