#encoding=utf-8

from django.shortcuts import redirect

from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse

from django.shortcuts import render_to_response
from django.template import RequestContext

from django.utils.translation import ugettext_lazy as _

def create_membership(request, record_type_id=4):

	from public_form.forms import create_membership_form

	if request.POST:
		print "#POST-------------------------------------------------------------------"
		print "#Create form from request-----------------------------------------------"
		form = create_membership_form(request.POST)
		if form.is_valid():
			record_type_id = request.POST["type"]
			print "#Save person--------------------------------------------------------"
			from Welcome.models import Person
			current_person = form.save()
			current_person.name = form.cleaned_data.get("name")
			current_person.nickname = form.cleaned_data.get("nickname")
			current_person.save()
			print current_person.id
			print "#Save project--------------------------------------------------------"
			from Welcome.models import iC_Type
			current_project = None
			print record_type_id
			print iC_Type.objects.get(clas="iC_Project_Membership").id
			if str(record_type_id) == str(iC_Type.objects.get(clas="iC_Project_Membership").id):
				print "se ha de guardar el rpojectyo"
				from Welcome.models import Project
				current_project = Project(name=form.cleaned_data.get("project_name"), website=form.cleaned_data.get("project_website"))
				current_project.save()
				print current_project.id

			print "#Create user $ activation key---------------------------------------"
			from public_form.bots import user_registration_bot
			urb = user_registration_bot()
			current_user = urb.register(request, current_person, current_project, record_type_id,  **form.cleaned_data)
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
						"type" : record_type_id ,
						"type_person": "public"
						}
				)
	print "#Load extra data--------------------------------------------------------------"
	extra_context = {}

	extra_context['record_type'] = record_type_id
	extra_context['moment'] = _(u"Benvinguda")
	extra_context['moment_img'] = "welcome_flow.png"
	extra_context['reverse_string'] = "public_form:create_membership"
	extra_context['tag_top'] = _(u"Missatge de benvinguda al procés d'alta. Aneu pasant...")
	extra_context['tag'] = _(u"La cobertura legal és només pels usuaris públics. Els anònims no quedaran coberts legalment.")
	extra_context['tag_send'] = _(u"Crearem un usuari i t'enviem un correu d'activació. Fes click al link del correu i ja podràs entrar amb el teu usuari/contrasenya al entorn virtual per tal de completar l'alta.")

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
		from General.models import Project
		try:
			project = Project.objects.get(nickname='CIC') #site project "Cooperativa Integral"
		except:
			project = Project()
		print "proceso"
		if record_type_string == "ic_akin_membership":
			from Welcome.models import iC_Akin_Membership
			#from General.models import Project
			ic_m = iC_Akin_Membership( person=account.person, ic_project=project)
			#fee_amount = 0 #si Soci Cooperatiu Individual o Soci Afí Individual:30 ecos / 30 euros / 6 hores; si Projecte Col·lectiu: 60 ecos / 60 euros / 12hores)
			ic_m.record_type = account.record_type
			ic_m.human_id = account.person.id
			ic_m.save()
			return HttpResponseRedirect( "/cooper/General/person/" + account.person.id.__str__()  )
			
		elif record_type_string == "ic_person_membership":
			from Welcome.models import iC_Person_Membership
			#ic_m = iC_Membership( human=account.person, ic_project=project)
			ic_m = iC_Person_Membership( person=account.person, ic_project=project)
			fee_amount = 30 #si Soci Cooperatiu Individual o Soci Afí Individual:30 ecos / 30 euros / 6 hores; si Projecte Col·lectiu: 60 ecos / 60 euros / 12hores)
		elif record_type_string == "ic_project_membership":
			from Welcome.models import iC_Project_Membership
			#ic_m = iC_Membership( human=account.person, ic_project=project, project=account.project)
			ic_m = iC_Project_Membership( person=account.person, ic_project=project, project=account.project)
			fee_amount = 60 #si Soci Cooperatiu Individual o Soci Afí Individual:30 ecos / 30 euros / 6 hores; si Projecte Col·lectiu: 60 ecos / 60 euros / 12hores)
		ic_m.record_type = account.record_type
		ic_m.human_id = account.person.id
		ic_m.save()
		from Welcome.models import Fee
		from General.models import Unit
		from datetime import date, timedelta, datetime
		current_fee = Fee(
			human = account.person,
			project = project,
			amount = fee_amount,
			unit = Unit.objects.get(name="Euro"),
			membership = ic_m,
			issue_date = datetime.now(),
			deadline_date = datetime.now() + timedelta(days=5) ,
		)
		current_fee.save()
		from Cooper.admin import *
		return HttpResponseRedirect( "/cooper/General/person/" + account.person.id.__str__()  )

	extra_context = {}
	extra_context['moment'] = _(u"No s'ha pogut activar res")
	extra_context['moment_img'] = "welcome_flow.png"
	context = RequestContext(request)
	for key, value in extra_context.items():
		context[key] = callable(value) and value() or value

	return render_to_response('waiting_membership.html',
							  account,
							  context_instance=context)
