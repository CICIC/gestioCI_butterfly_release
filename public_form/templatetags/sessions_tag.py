from django import template
from datetime import date, timedelta, datetime
from django.utils.translation import ugettext_lazy as _

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
			
			from Welcome.models import Learn_Session
			context['sessions_list'] = Learn_Session.objects.filter(datetime__lte=datetime.now(),record_type__clas='welcome_session' )
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