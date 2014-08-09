#encoding=utf-8

from django.shortcuts import redirect

from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse

from django.shortcuts import render_to_response
from django.template import RequestContext

from django.utils.translation import ugettext_lazy as _

def create_membership(request, record_type_id=None):

	from public_form.forms import create_membership_form

	if request.POST:
		print "#POST-------------------------------------------------------------------"
		print "#Create form from request-----------------------------------------------"
		form = create_membership_form(request.POST)
		if form.is_valid():
			print "#Save person--------------------------------------------------------"
			from Welcome.models import Person
			current_person = form.save()
			current_person.save()
			print current_person.id
			print "#Create user $ activation key---------------------------------------"
			record_type = request.POST["type"]

			from public_form.bots import user_registration_bot
			urb = user_registration_bot()
			current_user = urb.register(request, current_person, record_type, **form.cleaned_data)
			#Redirect and wait for user to activate key-------------------------
			return HttpResponseRedirect(
				reverse('public_form:wait_membership', args=(current_user.id,))
			)
		else:
			print "#Cannot save---------------------------------------------------------"
			print form.errors
	else:
		#INITIAL-----------------------------------------------------------------
		#Create form from default------------------------------------------------
		form = create_membership_form( 
				initial= {
						"type" : record_type_id 
						}
				)
	print "#Load extra data--------------------------------------------------------------"
	extra_context = {}
	extra_context['record_type'] = record_type_id
	extra_context['moment'] = _(u"Benvinguda")
	extra_context['moment_img'] = "welcome_flow.png"
	extra_context['reverse_string'] = "public_form:create_membership"
	extra_context['tag'] = _(u"Si et vols mantenir en l'anonimat pots deixar els camps en blanc i omplir el camp de “Nom o Sobrenom”, però en aquest cas no quedaràs cobert legalment.")

	context = RequestContext(request)
	for key, value in extra_context.items():
		context[key] = callable(value) and value() or value
	print "#Render form -----------------------------------------------------------------"
	return render_to_response(
		'create_membership.html', 
		{'form': form}, 
		context_instance=context
	)

def wait_membership(request, user_id = 0):
	print "#Load registration-------------------------------------------------------------"
	from public_form.models import RegistrationProfile
	current_registration = get_object_or_404(RegistrationProfile, user=user_id)
	print "#Load extra data--------------------------------------------------------------"
	extra_context = {}
	extra_context['record_type'] = current_registration.record_type
	extra_context['moment'] = _(u"Esperant activació d'usuari")
	extra_context['moment_img'] = "welcome_flow.png"
	extra_context['reverse_string'] = ""
	extra_context['activation_url'] = current_registration.get_activation_url()

	context = RequestContext(request)
	for key, value in extra_context.items():
		context[key] = callable(value) and value() or value
	print "#Render form -----------------------------------------------------------------"
	return render_to_response(
		'waiting_membership.html', 
		{'RegistrationProfile' : current_registration}, 
		context_instance=context
		)


def activate_membership(request, activation_key):

	from public_form.bots import user_registration_bot
	urb = user_registration_bot()
	account = urb.activate(request, activation_key)

	if not account:
		print "no account"
	else:

		record_type_string = account.record_type.clas.lower()
		if record_type_string == "ic_akin_membership":
			from Welcome.models import iC_Akin_Membership#, iC_Project_Membership, iC_Person_Membership
			ic_m = iC_Akin_Membership( person=account.person)
		elif record_type_string == "ic_person_membership":
			from Welcome.models import iC_Person_Membership
			ic_m = iC_Person_Membership( person=account.person)
		elif record_type_string == "ic_project_membership":
			from Welcome.models import iC_Project_Membership
			ic_m = iC_Project_Membership( person=account.person)
		from General.models import Type, Project

		ic_m.ic_project_id = 97 #Type.objects.get(name="Cooperativa Integral")
		ic_m.save()
		return HttpResponseRedirect( reverse('cooper:{0}_{1}_change'.format("Welcome", record_type_string), args=(ic_m.id,)) )

	extra_context = {}
	extra_context['moment'] = _(u"No s'ha pogut activar res")
	extra_context['moment_img'] = "welcome_flow.png"
	context = RequestContext(request)
	for key, value in extra_context.items():
		context[key] = callable(value) and value() or value

	return render_to_response('waiting_membership.html',
							  account,
							  context_instance=context)