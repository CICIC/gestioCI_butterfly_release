#encoding=utf-8

from django.shortcuts import redirect
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse

from django.shortcuts import render_to_response
from django.template import RequestContext

from django.utils.translation import ugettext_lazy as _
from django.utils.translation import gettext_lazy as __

def entry_page_to_gestioci(request, user_id = None):

	current_user = None
	current_person = None
	current_project = None
	current_registration = None
	record_type_id = None
	membership_id = None
	show_create_form = True
	user_permissions = None
	from public_form.models import RegistrationProfile
	Akin_project = None

	#If there is any user_id on request, we loggid if inactive
	if user_id:
		from django.contrib.auth.models import User
		try:
			current_user= User.objects.get(id=user_id)
			if current_user.is_active:
				current_registration = RegistrationProfile.objects.get(user=user_id)
				record_type_id = current_registration.record_type.id
				current_person = current_registration.person
				current_project = current_registration.project
			else:
				if request.user.is_anonymous:
					from django.contrib.auth import authenticate, login
					current_user.backend='django.contrib.auth.backends.ModelBackend'
					login(request, current_user )
				try:
					current_registration = RegistrationProfile.objects.get(user=request.user.id)
					record_type_id = current_registration.record_type.id
					current_person = current_registration.person
					current_project = current_registration.project
				except ObjectDoesNotExist:
					pass
		except ObjectDoesNotExist:
			pass
	print record_type_id
	#If there is any user logged
	if not current_user and not request.user.is_anonymous():
		current_user = request.user
		try:
			current_registration = RegistrationProfile.objects.get(user=request.user.id)
			record_type_id = current_registration.record_type.id
			current_person = current_registration.person
			current_project = current_registration.project
		except ObjectDoesNotExist:
			pass
	print record_type_id

	#moment
	moment_img = "welcome_flow.png"
	from Welcome.models import iC_Akin_Membership, iC_Project_Membership, iC_Person_Membership
	if current_user:
		if current_registration:
			if current_registration.record_type:
				if current_registration.record_type.clas == "iC_Project_Membership":
					if not current_project:
						moment_img = "welcome_flow_FORM.png"
					qobjects = iC_Project_Membership
				elif current_registration.record_type.clas == "iC_Person_Membership":
					moment_img = "welcome_flow_FORM.png"
					qobjects = iC_Person_Membership
				elif current_registration.record_type.clas == "iC_Akin_Membership":
					qobjects = iC_Akin_Membership
					moment_img = "welcome_flow_akin.png"

			#membership_id
			print moment_img
			print current_registration.record_type.id

			try:
				membership = qobjects.objects.get(
									person=current_registration.person,
									record_type=current_registration.record_type
									)
				
			except ObjectDoesNotExist:
				membership = None
			print membership
			if membership:
				print membership.record_type.clas
				membership_id = membership.id
				if membership.record_type.clas == "iC_Akin_Membership":
					from Welcome.forms import iC_Akin_Membership_form
					from Welcome.models import iC_Akin_Membership
					membership.name = membership
					membership.person = current_person
					Akin_project = iC_Akin_Membership_form(instance=membership)
					Akin_link_project = True
					moment_img = "welcome_flow_DONE_akin.png"
			else:
				moment_img = "welcome_flow_FORM_akin.png"

		if current_user.is_superuser:
			moment_img="welcome_flow.png"
		elif current_user.is_anonymous():
			moment_img = "welcome_flow_FORM.png"
		elif current_user.is_active:
			pass
		elif not current_person:
			moment_img = "welcome_flow_FORM.png"

	print moment_img
	#profile
	profile_desc = _(u"Desconegut")
	profile_type = "Anon"
	if current_user:
		if current_user.is_superuser:
			profile_desc = _(u"Administrador")
			profile_type = "Admin"
		elif current_user.is_active:
			profile_desc = _(u"Member")
			profile_type = current_user.groups.all()[0].name
		elif current_user.is_anonymous():
			profile_desc = _(u"Desconegut")
			profile_type = "Anon"
		else:
			profile_desc = _(u"Member")
			profile_type = current_user.groups.all()[0].name
	print "ww"
	print membership_id
	#Registration url
	user_url = ""
	message_desc = ""
	if current_registration and not current_user.is_active:
		user_url = current_registration.get_activation_url()
	print "ee"
	print membership_id
	if user_url:
		from public_form.models import RegistrationProfile
		from django.utils.safestring import mark_safe
		url = " O fes trampa i utilitza aquest: <a href='" + current_registration.get_activation_url() + "'>" + "Enllaç d'activació per fer trampes em comptes d'utilitzar l'enllaç que hem enviat al teu correu electrònic." + "</a>"
		profile_desc = _(u"Usuari pendent d'activació.")
		message_desc = _(u"Ben fet! Ara necesites activar l'usuari per tal de que poguem relacionar el teu correu electrònic. Pots utilitzar l'enllaç que trobaràs al teu correu")
		profile_type = request.user.groups.all()[0].name
		from django.contrib import messages
		messages.success(request, message_desc )
		messages.info(request, mark_safe(url) )

	#Form
	context = RequestContext(request)

	#groups
	if current_user:
		user_permissions = current_user.groups

	from django.contrib.auth.forms import AuthenticationForm
	from Cooper.admin import UserAdminAuthenticationForm

	
	return render_to_response(
		'entry_page_to_gestioCI.html',
		{
		'Akin_project': Akin_project,
		'membership_id': membership_id,
		'message_desc':message_desc,
		'moment_img' : moment_img,
		'show_create_form': show_create_form,
		'profile_user' : request.user,
		'profile_person' : current_person,
		'profile_project' : current_project,
		'profile_desc' : profile_desc,
		'profile_type' : profile_type,
		'user_permissions': user_permissions,
		'user_url': user_url,
		'record_type_id': record_type_id,
		'form_login': UserAdminAuthenticationForm(),
		'app_path': request.get_full_path(),},
		context_instance=context
	)

def create_membership(request, record_type_id=4):

	from public_form.forms import create_membership_form
	from public_form.models import RegistrationProfile
	from django.core.exceptions import ObjectDoesNotExist
	try:
		current_registration = RegistrationProfile.objects.get(user=request.user.id)
		current_person = current_registration.person
		current_project = current_registration.project
		record_type_id = current_registration.record_type_id
		current_user = current_registration.user
	except ObjectDoesNotExist:
		current_registration = None
		current_person = None
		current_project = None
		current_user = None

	if request.user.is_anonymous:
		current_user = _(u"Omple el formulari de dades d'usuari")
	if not current_project:
		current_project = _(u"Omple el formulari de dades de projecte")
	if not current_person:
		current_person = _(u"Omple el formulari de dades de persona")
	foot_content = ""
	if request.POST:

		form = create_membership_form(request.POST)

		if form.is_valid():
			record_type_id = request.POST["type"]

			from Welcome.models import Person
			current_person = form.save()
			current_person.name = form.cleaned_data.get("name")
			current_person.nickname = form.cleaned_data.get("nickname")
			current_person.save()

			from Welcome.models import iC_Record_Type
			from Welcome.models import Project
			if str(record_type_id) == str(iC_Record_Type.objects.get(clas="iC_Project_Membership").id):
				current_project = Project(name=form.cleaned_data.get("project_name"), website=form.cleaned_data.get("project_website"))
				current_project.save()
			else:
				current_project = Project()

			from public_form.bots import user_registration_bot
			urb = user_registration_bot()
			current_user = urb.register(request, current_person, current_project, record_type_id,  **form.cleaned_data)

			from django.contrib.auth import authenticate, login
			current_user.backend='django.contrib.auth.backends.ModelBackend'
			login(request, current_user)

			return HttpResponseRedirect(
				reverse('public_form:entry_page_to_gestioci', args=(current_user.id,))
			)
		else:
			content_title = _(u"Revisar errors i enviar el formulari.")
			form = create_membership_form(request.POST)
			foot_content = "profile_type.html"
	else:
		content_title = _(u"Omplir i enviar el formulari")
		form = create_membership_form(
		initial= {
			"type" : record_type_id ,
			"type_person": "public"
		})
		
		
		print "#Load extra data--------------------------------------------------------------"
	extra_context = {}
		#Registration url

	user_url = ""
	message_desc = ""
	if current_registration and not request.user.is_anonymous() and not request.user.is_active:
		user_url = current_registration.get_activation_url()
	print "dsgsdgsdgsd"
	print user_url
	if user_url:
		from django.utils.safestring import mark_safe
		url = " <a href='" + current_registration.get_activation_url() + "'>" + "Enllaç d'activació" + "</a>  per fer trampes em comptes d'utilitzar l'enllaç que hem enviat al teu correu electrònic."
		profile_desc = _(u"Usuari pendent d'activació.")
		message_desc = _(u"Ben fet! ") + request.user.username + (u" Ara necesites activar l'usuari per tal de que poguem relacionar el teu correu electrònic. Pots utilitzar l'enllaç que trobaràs al teu correu")
		content_title = mark_safe(url)


	extra_context['content_title'] = content_title
	extra_context['foot_content'] = foot_content
	extra_context['profile_user'] = current_user
	extra_context['message_desc'] = message_desc

	extra_context['profile_person'] = current_person
	extra_context['profile_project'] = current_project

	extra_context['record_type'] = record_type_id
	extra_context['moment'] = _(u"Benvinguda")
	extra_context['moment_img'] = "welcome_flow_FORM.png"
	extra_context['reverse_string'] = "public_form:create_membership"
	extra_context['tag_top'] = ""
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
			from datetime import datetime 
			ic_m = iC_Akin_Membership( person=account.person, ic_project=project, join_date=datetime.now())
			#fee_amount = 0 #si Soci Cooperatiu Individual o Soci Afí Individual:30 ecos / 30 euros / 6 hores; si Projecte Col·lectiu: 60 ecos / 60 euros / 12hores)
			ic_m.record_type = account.record_type
			ic_m.human_id = account.person.id
			ic_m.save()
			ic_m.name = ic_m
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

def link_project_to_member(request):

	from Welcome.forms import iC_Akin_Membership_form
	if request.POST:
		form = iC_Akin_Membership_form(request.POST)
		try:
			print "3333333333333333333333333333333333333333333333"
			print request.POST["membership_id"]
			from Welcome.models import iC_Akin_Membership
			membership = iC_Akin_Membership.objects.get(id=request.POST["membership_id"])
			print "ddddddddddddddddddddddddddddddddddddddd"
			print membership.name
			from Welcome.models import iC_Membership
			membership_proyect = iC_Membership.objects.get(id=request.POST["ic_membership"])
			membership.ic_membership = membership_proyect
			membership.save()
			print "22222222222222222222222222222"
			membership.save()

			print membership.name
		except ObjectDoesNotExist:
			pass
	return HttpResponseRedirect(
				reverse('public_form:entry_page_to_gestioci')
			)
