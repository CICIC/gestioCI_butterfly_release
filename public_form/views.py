#encoding=utf-8
from django.contrib import messages
from django.shortcuts import redirect
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse

from django.shortcuts import render_to_response
from django.template import RequestContext

from django.utils.translation import ugettext_lazy as _
from django.utils.translation import gettext_lazy as __

class Action_block(object):
	def __init__(self, title, group, form, action, links, id):
		self.title = title
		self.group = group
		self.form = form
		self.links = links
		self.action = action
		self.id = id

def entry_page_to_gestioci(request, user_id = None):

	current_person = None
	current_project = None
	current_registration = None
	record_type_id = None
	membership_id = None
	show_create_form = True
	user_permissions = None
	from public_form.models import RegistrationProfile
	Akin_project = None

	#USER: If there is any user_id on params retrieve object; else get logged user or anonymous...
	from django.contrib.auth.models import User
	try:
		current_user = User.objects.get(id=user_id)
	except ObjectDoesNotExist:
		current_user = request.user

	#LOGGED USER: So if [request.user is anonymous] and [user_id on paramas is inactive user] then login son can follow membership proces
	if request.user.is_anonymous() and not current_user.is_anonymous() and not current_user.is_active:
		from django.contrib.auth import authenticate, login
		current_user.backend='django.contrib.auth.backends.ModelBackend'
		login(request, current_user )

	#REGISTRATION: Retrieve registration info for this user
	try:
		current_registration = RegistrationProfile.objects.get(user=current_user.id)
		record_type_id = current_registration.record_type.id
		current_person = current_registration.person
		current_project = current_registration.project
	except ObjectDoesNotExist:
		pass

	#TAB 1: Memberships
	membership = None
	from Welcome.models import iC_Membership, iC_Akin_Membership, iC_Project_Membership, iC_Person_Membership
	qobjects = iC_Membership
	if current_registration:
		if current_registration.record_type:
			type = current_registration.record_type.clas
			if type == "iC_Project_Membership":
				qobjects = iC_Project_Membership
			elif type == "iC_Person_Membership":
				qobjects = iC_Person_Membership
			elif type == "iC_Akin_Membership":
				qobjects = iC_Akin_Membership

		try:
			membership = qobjects.objects.get( person=current_registration.person, record_type=current_registration.record_type)
			print membership
			membership_id = membership.id
			type = membership.record_type.clas

			if type == "iC_Akin_Membership":
				from Welcome.forms import iC_Akin_Membership_form
				from Welcome.models import iC_Akin_Membership
				Akin_project = iC_Akin_Membership_form(instance=membership)
				Akin_link_project = True

		except ObjectDoesNotExist:
			membership = None

	#STATE ROAD MAP PICTURE
	moment_img = "welcome_flow.png"
	can_save = True
	if current_user.is_superuser:
		moment_img="welcome_flow.png"
	elif current_user.is_anonymous():
		moment_img = "welcome_flow_FORM.png"
	elif current_user.is_active:
		pass
	elif not current_person:
		moment_img = "welcome_flow_FORM.png"
	if current_registration:
		if current_registration.record_type:
			type = current_registration.record_type.clas
			if type == "iC_Project_Membership":
				if not current_project:
					moment_img = "welcome_flow_FORM.png"
			elif type == "iC_Person_Membership":
				if not membership:
					moment_img = "welcome_flow_FORM.png"
				elif not membership._join_fee_payed():
					moment_img = "welcome_flow_FEE.png"
				elif not membership.ic_CESnum:
					moment_img = "welcome_flow_ICES.png"
				else:
					moment_img = "welcome_flow_DONE.png"
					can_save = False
			elif type == "iC_Akin_Membership":
				if not membership:
					moment_img = "welcome_flow_PROJECT_akin.png"
				elif membership.ic_membership:
					moment_img = "welcome_flow_DONE_akin.png"
					can_save = False
				else:
					moment_img = "welcome_flow_PROJECT_akin.png"
		else:
			moment_img = "welcome_flow.png"

	#PROFILE
	profile_desc = _(u"Desconegut")
	profile_type = "Anon"
	if current_user:
		if current_user.is_superuser:
			profile_desc = _(u"Administrador")
			profile_type = "Admin"
		elif current_user.is_active:
			if current_user.is_staff:
				profile_desc = _(u"Logejat")
			else:
				profile_desc = _(u"Soci")
			profile_type = current_user.groups.all()[0].name
		elif current_user.is_anonymous():
			profile_desc = _(u"Desconegut")
			profile_type = "Anon"
		else:
			profile_desc = _(u"Member")
			profile_type = current_user.groups.all()[0].name

	#SPECIAL STATE: Activation pending user. Work on registration url.
	user_url = ""
	message_desc = ""
	if current_registration and not current_user.is_active:
		user_url = current_registration.get_activation_url()

	if user_url:
		from public_form.models import RegistrationProfile
		from django.utils.safestring import mark_safe
		url = "Activa ara el teu usuari. Consulta el teu correu o utilitza aquest <a href='" + current_registration.get_activation_url() + "'>" + "enllaç d'activació</a>."
		profile_desc = _(u"Usuari pendent d'activació.")
		message_desc = _(u"Ben fet! Tens un usuari creat per realitzar el procés d'alta. Activa'l amb l'enllaç rebut al teu correu!")
		profile_type = request.user.groups.all()[0].name
		from django.contrib import messages
		messages.success(request, message_desc )
		messages.info(request, mark_safe(url) )

	#CONTEXT
	context = RequestContext(request)

	membership_fee = None
	membership_ices = None
					
	#PERMISSIONS
	user_permissions = []
	if current_user:
		#form
		form = None
		for group in current_user.groups.all():
			type = group.name
			if type == "iC_Project_Membership":
				from Welcome.forms import iC_Project_Membership_form
				from Welcome.models import iC_Project_Membership
				form = iC_Project_Membership_form(instance=membership)
				if membership:
					if not membership._join_fee_payed():
						membership_fee = _(u"Pagar cuota.")
					if not membership.ic_CESnum:
						membership_ices = _(u"Esperar a que t'adjudiquin un compte ICES")
			elif type == "iC_Person_Membership":
				from Welcome.forms import iC_Person_Membership_form
				from Welcome.models import iC_Person_Membership
				form = iC_Person_Membership_form(instance=membership)
				if membership:
					if not membership._join_fee_payed():
						membership_fee = _(u"Acció fora del sistema: Pagar cuota.")
						if not membership.join_fee.payment_type:
							membership_fee = _(u"Escollir forma de pagament")
						else:
							membership_fee = _(u"Acció fora del sistema: Pagar cuota => " + membership.join_fee.payment_type.name)
					if not membership.ic_CESnum:
						membership_ices = _(u"Esperar a que t'adjudiquin un compte ICES")
			elif type == "iC_Akin_Membership":
				from Welcome.forms import iC_Akin_Membership_form
				from Welcome.models import iC_Akin_Membership
				form = iC_Akin_Membership_form(instance=membership)
			elif type == "iC_Welcome":
				pass


			#COMMON BLOCK FOR MEMBERSHIP
			action = reverse("public_form:save_form_profile")
			#link
			links = []
			if not current_user.is_anonymous() and not current_user.is_active:
				links.append( mark_safe(url) )

			if membership:
				url = reverse("member:Welcome_" + type.lower() + "_change",  args=[membership_id] ) + "?next='public_form'"
				link = "<a href=" + url + "> Editar: " + membership.__str__() + "</a>"
				from django.utils.safestring import mark_safe
				links.append( mark_safe(link))

			if group.name.lower() == "ic_welcome":
				url = "/admin/Welcome/fee/" + "?next='public_form'"
				link = "<a href=" + url + "> Gestionar pagament de quotes </a>"
				from django.utils.safestring import mark_safe
				links.append (mark_safe(link))
				url = "/admin/Welcome/ic_membership/" + "?next='public_form'"
				link = "<a href=" + url + "> Gestionar comptes ICES </a>"
				from django.utils.safestring import mark_safe
				links.append( mark_safe(link) )

			if current_user.is_superuser:
				try:
					from Welcome.models import iC_Record_Type
					desc = iC_Record_Type.objects.get(clas=group.name).name
				except ObjectDoesNotExist:
					desc = group.name
				link = "<a href=/admin/Welcome/" + type.lower() + "> _: " + desc + "</a>"
				from django.utils.safestring import mark_safe
				links.append( mark_safe(link) )
				print link
			print links
			new_action = Action_block( group.name, group, form, action, links, membership_id)
			user_permissions.append( new_action )

	#LOGGIN PANEL
	from django.contrib.auth.forms import AuthenticationForm
	from Cooper.admin import UserAdminAuthenticationForm
	form_login = UserAdminAuthenticationForm()

	#RENDER
	return render_to_response(
		'entry_page_to_gestioCI.html',
		{ 
		'can_save' : can_save,
		'membership_fee': membership_fee,
		'membership_ices': membership_ices,
		'membership': membership,
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
		'form_login': form_login,
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
				ic_m = iC_Person_Membership( ic_project=project, human=account.person, person=account.person, join_fee=current_fee, join_date=datetime.now())

				ic_m.human_id = account.person.id

			elif record_type_string == "ic_project_membership":

				from Welcome.models import iC_Project_Membership
				from Welcome.models import Person
				from Welcome.models import Relation

				print 'iC_Project_Membership: ic:'+str(project)+' proj:'+str(account.project)
				ic_m = iC_Project_Membershipjoin_date=datetime.now()( ic_project=project, human=account.project, project=account.project, join_fee=current_fee)

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

		return HttpResponseRedirect( reverse("public_person:entry_page_to_gestioci")  )

	extra_context = {}
	extra_context['moment'] = _(u"No s'ha pogut activar res")
	extra_context['moment_img'] = "welcome_flow.png"
	context = RequestContext(request)
	for key, value in extra_context.items():
		context[key] = callable(value) and value() or value

	return render_to_response('waiting_membership.html',
							  account,
							  context_instance=context)

def save_form_profile(request):

	from Welcome.models import iC_Record
	form_id = request.POST["form_id"]
	print form_id
	try:
		membership_type = iC_Record.objects.get(id=form_id).record_type.clas
	except ObjectDoesNotExist:
		membership_type = None

	form = None
	if membership_type == "iC_Akin_Membership":
		print "akin"
		from Welcome.forms import iC_Akin_Membership_form
		form = iC_Akin_Membership_form(request.POST)
		from Welcome.models import iC_Akin_Membership
		membership = iC_Akin_Membership.objects.get(id=form_id)
		
		from Welcome.models import iC_Membership
		try:
			membership_proyect = iC_Membership.objects.get(id=request.POST["ic_membership"])
			membership.ic_membership = membership_proyect
			membership.save()
			messages.success(request, _(u"S'ha vinculat el project correctament"))
		except ObjectDoesNotExist:
			messages.error(request, _(u"No s'ha vinculat el project correctament"))
	elif membership_type == "iC_Person_Membership":
		print "person"
		from Welcome.forms import iC_Person_Membership_form
		form = iC_Person_Membership_form(request.POST)
		from Welcome.models import iC_Person_Membership
		membership = iC_Person_Membership.objects.get(id=form_id)
		print request.POST["payment_type"]
		from Welcome.models import Payment_Type
		try:
			pt = Payment_Type.objects.get(id=request.POST["payment_type"])
			membership.join_fee.payment_type = pt
			membership.join_fee.save()
			messages.success(request, _(u"S'ha guardat el tipus de pagament. ") + pt.name)
		except ObjectDoesNotExist:
			print "not found"
			messages.error(request, _(u"No s'ha guardat el tipus de pagament."))
	elif membership_type == "iC_Project_Membership":
		print "Project"
		from Welcome.forms import iC_Project_Membership_form
		form = iC_Project_Membership_form(request.POST)
		from Welcome.models import iC_Project_Membership
		membership = iC_Project_Membership.objects.get(id=form_id)
		
		from Welcome.models import Payment_Type
		try:
			pt = Payment_Type.objects.get(id=request.POST["payment_type"])
			membership.join_fee.payment_type = pt
			membership.save()
			messages.success(request, _(u"S'ha guardat el tipus de pagament. ") + pt.name)
		except ObjectDoesNotExist:
			messages.error(request, _(u"No s'ha guardat el tipus de pagament."))
	return HttpResponseRedirect(
				reverse('public_form:entry_page_to_gestioci')
			)
