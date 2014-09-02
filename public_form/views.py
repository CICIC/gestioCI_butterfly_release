#encoding=utf-8

from django.shortcuts import redirect

from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse

from django.shortcuts import render_to_response
from django.template import RequestContext

from django.utils.translation import ugettext_lazy as _

def entry_page_to_gestioCI(request):
	context = RequestContext(request)
	return render_to_response(
		'entry_page_to_gestioCI.html',
		{'Profile' : None},
		context_instance=context
	)

def create_membership(request, record_type_id=4):

	from public_form.forms import create_membership_form

	if request.POST:
		print "#POST-------------------------------------------------------------------"
		print "#Create form from request-----------------------------------------------"
		form = create_membership_form(request.POST)
		print "#Created form from request-----------------------------------------------"
		#for fm in form:
		#	print str(fm)

		if form.is_valid():
			record_type_id = request.POST["type"]
			print "#Save person--------------------------------------------------------"
			from Welcome.models import Person

			current_person = form.save()
			#print 'PERSON NAME: '+str(current_person)
			current_person.name = form.cleaned_data.get("name")
			#print 'PERSON NAME: '+current_person.name
			current_person.nickname = form.cleaned_data.get("nickname")
			current_person.save()
			print current_person.id

			print "#Save project--------------------------------------------------------"
			from Welcome.models import iC_Record_Type

			current_project = None
			print record_type_id
			#print iC_Record_Type.objects.get(clas="iC_Project_Membership").id
			if str(record_type_id) == str(iC_Record_Type.objects.get(clas="iC_Project_Membership").id):
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
			print "# CANNOT SAVE! ---------------------------------------------------------"
			print form.errors
			#print form.errors
	else:
		print 'INITIAL-----------------------------------------------------------------'
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
	print "#Render WAIT form -----------------------------------------------------------------"
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

		print "proceso: "+record_type_string
		if record_type_string == "ic_akin_membership":
			from Welcome.models import iC_Akin_Membership
			#from General.models import Project
			ic_m = iC_Akin_Membership( person=account.person, ic_project=project)
			#fee_amount = 0 #si Soci Cooperatiu Individual o Soci Afí Individual:30 ecos / 30 euros / 6 hores; si Projecte Col·lectiu: 60 ecos / 60 euros / 12hores)
			ic_m.record_type = account.record_type
			ic_m.human_id = account.person.id
			ic_m.save()
			return HttpResponseRedirect( "/cooper/General/person/" + account.person.id.__str__()  )

		else:
			from Welcome.models import Record_Type
			from Welcome.models import iC_Record_Type
			from Welcome.models import Fee
			from Welcome.models import Unit
			from Welcome.models import UnitRatio

			from datetime import date, timedelta, datetime

			if record_type_string == "ic_person_membership":
				fee_type = iC_Record_Type.objects.get(clas__contains='individual')
				lohuman = account.person
			elif record_type_string == "ic_project_membership":
				fee_type = iC_Record_Type.objects.get(clas__contains='collective')
				lohuman = account.project

			current_fee = Fee(
				human = lohuman,
				project = project,
				record_type = fee_type,
				#amount = fee_amount,
				unit = Unit.objects.get(name="Euro"),
				#membership = ic_m,
				issue_date = datetime.now(),
				deadline_date = datetime.now() + timedelta(days=5) ,
			)
			print '### guardant quota alta: '+str(current_fee)
			current_fee.save()

			if record_type_string == "ic_person_membership":

				from Welcome.models import iC_Person_Membership
				ic_m = iC_Person_Membership( ic_project=project, human=account.person, person=account.person, join_fee=current_fee)

				ic_m.human_id = account.person.id

			elif record_type_string == "ic_project_membership":

				from Welcome.models import iC_Project_Membership
				from Welcome.models import Person
				from Welcome.models import Relation

				print 'iC_Project_Membership: ic:'+str(project)+' proj:'+str(account.project)
				ic_m = iC_Project_Membership( ic_project=project, human=account.project, project=account.project, join_fee=current_fee)

				ref_typ = Relation.objects.get(clas='reference')
				ref_obj, created = ic_m.human.human_persons.get_or_create(person=account.person, relation=ref_typ)
				print 'iC_Project_Membership: ref created? '+str(created)+' obj: '+str(ref_obj)
				print 'iC_Project_Membership: _get_ref_persons: '+str(ic_m.project._get_ref_persons())
				print 'iC_Project_Membership: join_fee: '+str(ic_m.join_fee)
				ic_m.human_id = account.project.id

			else:
				print '(activate_membership) RECORD_TYPE_STRING no reconegut!, esborro Quota !'
				current_fee.delete()
				return 'FALSE'

			#fee_amount = 60 #si Soci Cooperatiu Individual o Soci Afí Individual:30 ecos / 30 euros / 6 hores; si Projecte Col·lectiu: 60 ecos / 60 euros / 12hores)
		ic_m.record_type = account.record_type
		#ic_m.human_id = account.person.id
		ic_m.save()

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
