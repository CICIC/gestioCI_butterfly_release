#encoding=utf-8
from django.contrib import messages
from datetime import datetime 
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

from django.utils.safestring import mark_safe

class Action_block(object):
	def __init__(self, title, group, form, action, links, id, show_form, can_edit):
		self.title = title
		self.group = group
		self.form = form
		self.links = links
		self.action = action
		self.id = id
		self.show_form = show_form
		self.can_edit = can_edit

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
		try:
			if type == "iC_Project_Membership":
				qobjects = iC_Project_Membership
				membership = qobjects.objects.get( project=current_registration.project)
			elif type == "iC_Person_Membership":
				qobjects = iC_Person_Membership
				membership = qobjects.objects.get( person=current_registration.person)
			elif type == "iC_Akin_Membership":
				qobjects = iC_Akin_Membership
				membership = qobjects.objects.get( person=current_registration.person)

			membership_id = membership.id
			type = membership.record_type.clas

			if type == "iC_Akin_Membership":
				from Welcome.forms import iC_Akin_Membership_form
				from Welcome.models import iC_Akin_Membership
				Akin_project = iC_Akin_Membership_form(instance=membership)
				Akin_link_project = True

		except ObjectDoesNotExist:
			membership = None

	#SPECIAL STATE: Activation pending user. Work on registration url.
	user_url = ""
	message_desc = ""
	if current_registration and not current_user.is_active:
		user_url = current_registration.get_activation_url()
	
	if user_url:
		from public_form.models import RegistrationProfile
		activation_label = _(u"Enllaç d'activació").encode("utf-8")
		url = current_registration.get_activation_url()  + "?next=public_form"
		activation_link = "<a href='%s'> %s </a>"  % (url,  activation_label)
		activation_message = _(u"Activa ara el teu usuari. Consulta el teu correu o utilitza aquest %s").encode("utf-8")
		activation_message = activation_message % (activation_link)

		messages.info(request, mark_safe(activation_message) )

		message_desc = _(u"Ben fet! Tens un usuari creat per realitzar el procés d'alta. Activa'l amb l'enllaç rebut al teu correu!")
		messages.success(request, message_desc )

		profile_desc = _(u"Usuari pendent d'activació.")
		profile_type = request.user.groups.all()[0].name
	#END ACTIVATION SECTION

	#SPECIAL STATE, A SELF_EMPLOYED MEMBERSHIP HAS BEEN CREATED AND NO ONE HAS INCLUDED THIS USER TO iC_Self_Employed Group
	if membership:
		from django.contrib.auth.models import User, Group
		try:
			self_employed_group = current_user.groups.get(name="iC_Self_Employed")
		except ObjectDoesNotExist:
			self_groups = current_user.groups.filter(name__in=["iC_Person_Membership", "iC_Project_Membership" ])
			if self_groups:
				try:
					from Welcome.models import iC_Self_Employed
					membership_self= iC_Self_Employed.objects.get(ic_membership = membership_id)
					self_employed_group = Group.objects.get(name="iC_Self_Employed")
					self_employed_group.user_set.add(current_user)
				except ObjectDoesNotExist:
					membership_self = None
	#END SPECIAL STATE, A SELF_EMPLOYED MEMBERSHIP HAS BEEN...
	
	#CONTEXT
	context = RequestContext(request)
	membership_self = None
	membership_fee = None
	membership_ices = None

	#PERMISSIONS
	user_permissions = []
	if current_user:

		action = reverse("public_form:save_form_profile")

		for group in current_user.groups.all():
			form = title = None
			links = []
			type = group.name
			can_edit = False
			show_form = False
			if type == "iC_Project_Membership":
				from Welcome.forms import iC_Project_Membership_form
				from Welcome.models import iC_Project_Membership
				form = iC_Project_Membership_form(instance=membership)

				if membership:
					if not membership._join_fee_payed():
						membership_fee = _(u"Acció fora del sistema: Pagar cuota.")
						if not membership.join_fee.payment_type:
							membership_fee = _(u"Escollir forma de pagament")
							can_edit = show_form = True
						else:
							membership_fee = _(u"Acció fora del sistema: Pagar cuota => " + membership.join_fee.payment_type.name)
							can_edit = False
							show_form = True
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
							can_edit = True
							show_form = True
						else:
							membership_fee = _(u"Acció fora del sistema: Pagar cuota => " + membership.join_fee.payment_type.name)
					if not membership.ic_CESnum:
						membership_ices = _(u"Esperar a que t'adjudiquin un compte ICES")
				
			elif type == "iC_Akin_Membership":
				from Welcome.forms import iC_Akin_Membership_form
				from Welcome.models import iC_Akin_Membership
				form = iC_Akin_Membership_form(instance=membership)
			elif type == "iC_Self_Employed":
				from django.contrib.auth.models import User, Group
				from Welcome.models import iC_Self_Employed
				can_edit = True
				show_form = True
				try:
					self_groups = current_user.groups.filter(name__in=["iC_Person_Membership", "iC_Project_Membership" ])
					membership_self= iC_Self_Employed.objects.get(ic_membership = membership_id)
				except ObjectDoesNotExist:
					membership_self = None

				if membership_self:

					from Welcome.forms import iC_Self_Employed_form
					form = iC_Self_Employed_form(instance=membership_self)
					can_edit = True
					action = reverse("public_form:save_form_self_employed")
					if membership_self.mentor_membership:
						message = __(u" Fer les tasquesa assignades: ").encode('utf8')
						links.append( message )
					else:
						message = _(u" Afegir mentor ").encode('utf8')
						url = "/cooper/Welcome/ic_self_employed/" + str(membership_self.id) + "?next=public_form"
						link = "<a href='%s'> %s </a>"  % (url,  message)
						links.append( mark_safe(link) )

					from General.models import str_none
					if membership_self._rel_address_contract() != str_none: 
						message = membership_self._rel_address_contract()
						links.append( message )
					else:
						message = _(u" Tens que establir Adreça principal").encode('utf8')
						url = "/cooper/Welcome/ic_self_employed/" + str(membership_self.id) + "?next=public_form"
						link = "<a href='%s'> %s </a>"  % (url,  message)
						links.append( mark_safe(link) )
					links.append( _(u" Lista de tareas") )
					if membership_self._rel_address_contract() != str_none:
						message = membership_self._rel_address_contract()
						links.append( message )
					else:
						message = _(u"  Tens que establir Altres adreces").encode('utf8')
						url = "/cooper/Welcome/ic_self_employed/" + str(membership_self.id) + "?next=public_form"
						link = "<a href='%s'> %s </a>"  % (url,  message)
						links.append( mark_safe(link) )

					if membership_self._rel_insurances() != str_none:
						message = membership_self._rel_insurances()
						links.append( message )
					else:
						message = _(u" Portar contractes assegurança").encode('utf8')
						url = "/cooper/Welcome/ic_self_employed/" + str(membership_self.id) + "?next=public_form"
						link = "<a href='%s'> %s </a>"  % (url,  message)
						links.append( mark_safe(link) )

					if membership_self._rel_licences() != str_none:
						message = membership_self._rel_licences()
						links.append( message )
					else:
						message = _(u" Portar traspàs llicencia activitat ").encode('utf8')
						url = "/cooper/Welcome/ic_self_employed/" + str(membership_self.id) + "?next=public_form"
						link = "<a href='%s'> %s </a>"  % (url,  message)
						links.append( mark_safe(link) )

					if membership_self._rel_licences() != str_none: 
						message = membership_self._rel_licences()
						links.append( message )
					else:
						message = _(u" Portar traspàs lloguer").encode('utf8')
						url = "/cooper/Welcome/ic_self_employed/" + str(membership_self.id) + "?next=public_form"
						link = "<a href='%s'> %s </a>"  % (url,  message)
						links.append( mark_safe(link) )

					if membership_self._rel_licences() != str_none: 
						message = membership_self._rel_licences()
						links.append( message )
					else:
						message = _(u" Portar traspàs cessió ús").encode('utf8')
						url = "/cooper/Welcome/ic_self_employed/" + str(membership_self.id) + "?next=public_form"
						link = "<a href='%s'> %s </a>"  % (url,  message)
						links.append( mark_safe(link) )
						links.append( _(u" Soci. Quotes") )

					if membership_self._rel_fees() != str_none: 
						message = membership_self._rel_licences()
						links.append( message )
					else:
						message = _(u" Portar quota alta autoocupat").encode('utf8')
						url = "/cooper/Welcome/ic_self_employed/" + str(membership_self.id) + "?next=public_form"
						link = "<a href='%s'> %s </a>"  % (url,  message)
						links.append( mark_safe(link) )

					if membership_self._rel_licences() != str_none: 
						message = membership_self._rel_licences()
						links.append( message )
					else:
						message = _(u" Portar quota 1er trimestre").encode('utf8')
						url = "/cooper/Welcome/ic_self_employed/" + str(membership_self.id) + "?next=public_form"
						link = "<a href='%s'> %s </a>"  % (url,  message)
						links.append( mark_safe(link) )

					if membership_self._has_assisted_socialcoin():
						message = _(u"Acció fora del sistema. Pagar cuota.").encode('utf8')
						links.append( message )
					elif membership_self._has_assisted_welcome():
						print "Link: you have to go to session coin"
						message = _(u" Anar a sessió de moneda social i d'Alta ").encode('utf8')
						url = "/cooper/Welcome/learn_session/" + "?next=public_form"
						link = "<a href='%s'> %s </a>"  % (url,  message)
						links.append( mark_safe(link) )
					else:
						print "Link: you have to go to sessions"
						message = _(u" Anar a sessió d'acollida: ").encode('utf8')
						url = "/cooper/Welcome/learn_session/" + "?next=public_form"
						link = "<a href='%s'> %s </a>" % (url,  message)
						links.append( mark_safe(link) )
			elif type == "iC_Welcome":
				pass
			#COMMON BLOCK FOR MEMBERSHIP

			if not membership and not group.name == "iC_Self_Employed" and not group.name=="iC_Stallholder":
				if not current_user.is_anonymous() and not current_user.is_active:
					print activation_message
					links.append( mark_safe(activation_message) )

			if membership and type.lower() != "ic_welcome":
				if membership and type.lower() == "ic_self_employed":
					url = reverse("member:Welcome_" + type.lower() + "_change",  args=[membership_self.id] ) + "?next=public_form"
					link = "<a href='" + url + "'> Accedir al teu registre d'alta: " + membership_self.__str__() + "</a>"
					links.append( mark_safe(link))
				else:
					url = reverse("member:Welcome_" + type.lower() + "_change",  args=[membership_id] ) + "?next=public_form"
					link = "<a href='" + url + "'> Accedir al teu registre d'alta: " + membership.__str__() + "</a>"
					links.append( mark_safe(link))

			if group.name.lower() == "ic_welcome":
				label = _(u"Alta socias cooperativa").encode("utf-8")
				links.append( label )

				label = _(u"Crear una persona").encode("utf-8")
				url = "/admin/General/person/add"
				links.append( mark_safe("<a class='addlink' href='%s'> %s </a>" % (url,  label)))
				label = _(u"Llistar persones").encode("utf-8")
				url = "/admin/General/person/"
				links.append( mark_safe("<a class='changelink' href='%s'> %s </a>" % (url,  label)))

				label = _(u"Crear una projecte").encode("utf-8")
				url = "/admin/General/project/add"
				links.append( mark_safe("<a class='addlink' href='%s'> %s </a>" % (url,  label)))
				label = _(u"Llistar projectes").encode("utf-8")
				url = "/admin/General/project/"
				links.append( mark_safe("<a class='changelink' href='%s'> %s </a>" % (url,  label)))

				
				label = _(u"(0) Visitants que activen procés").encode("utf-8")
				url = "/admin/public_form/registrationprofile/?only_membership_filter=10"
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

				label = _(u"(a) Formularis omplerts").encode("utf-8")
				url = "/admin/Welcome/ic_membership/"
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

				label = _(u"(b) Gestionar pagament de quotes").encode("utf-8")
				url = "/admin/Welcome/fee/" + "?next=public_form"
				link = "<a href='%s'> %s </a>" % (url, label)
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

				label = _(u"(c) Llistats de noves socies").encode("utf-8")
				url = "/admin/Welcome/ic_membership/" + "?next=public_form"
				link = "<a href='%s'> %s </a>" % (url, label)
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

				label = _(u"(d) Alta ICES ").encode("utf-8")
				url = "/admin/Welcome/ic_membership/" + "?next=public_form"
				link = "<a href='%s'> %s </a>" % (url, label)
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

				label = _(u"(e) Activar socia ").encode("utf-8")
				url = "/admin/Welcome/ic_membership/" + "?next=public_form"
				link = "<a href='%s'> %s </a>" % (url, label)
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

				label = _(u"Alta socias autocupadas").encode("utf-8")
				links.append( label )

				label = _(u"(1) Acollida general grupal acollida").encode("utf-8")
				url = "/admin/Welcome/ic_self_employed/add/?next=public_form"
				link = "<a href='%s'> %s </a>" % (url, label)
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

				label = _(u"(2) Acollida inicial individual").encode("utf-8")
				url = "/admin/Welcome/ic_self_employed/?next=public_form"
				link = "<a href='%s'> %s </a>" % (url, label)
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

				label = _(u"(4) Inscripción sessió d'alta ").encode("utf-8")
				url = "/admin/Welcome/learn_session/" + "?next=public_form"
				link = "<a href='%s'> %s </a>" % (url, label)
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

				label = _(u"(5) Inscripción sessió moneda solcial").encode("utf-8")
				url = "/admin/Welcome/learn_session/" + "?next=public_form"
				link = "<a href='%s'> %s </a>" % (url, label)
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

				label = _(u"(6) Sessió realitzar alta").encode("utf-8")
				url = "/admin/Welcome/ic_self_employed/?next=public_form"
				link = "<a href='%s'> %s </a>" % (url, label)
				links.append( mark_safe("<a href='%s'> %s </a>" % (url,  label)))

			if current_user.is_superuser:
				try:
					from Welcome.models import iC_Record_Type
					desc = iC_Record_Type.objects.get(clas=group.name).name
				except ObjectDoesNotExist:
					desc = group.name
				link = "<a href=/admin/Welcome/" + type.lower() + "> _: " + desc + "</a>"
				links.append( mark_safe(link) )
				print link

			title = _(group.name).encode("utf-8")

			new_action = Action_block( title, group, form, action, links, membership_id, show_form, can_edit)
			user_permissions.append( new_action )

	#SECTION PROFILE 
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
			profile_desc = _(u"Necesita activar l'usuari")
			profile_type = current_user.groups.all()[0].name
	#EDN SECTION PROFILE 

	print "Micaso________________"
	print membership_self
	#STATE ROAD MAP PICTURE
	moment_img = "welcome_flow.png"

	if current_user.is_superuser:
		moment_img="welcome_flow.png"
	elif current_user.is_anonymous():
		moment_img = "welcome_flow_FORM.png"
	elif current_user.is_staff:
		moment_img = "welcome_flow_general.png"
	elif current_user.is_active:
		if membership_self:
			from Welcome.models import ico_no
			if membership_self._has_assisted_socialcoin() != ico_no:
				print "has"
				moment_img = "welcome_flow_self5.png"
			elif membership_self._has_assisted_welcome() != ico_no:
				moment_img = "welcome_flow_self4.png"
			elif membership_self._rel_licences() != str_none:
				moment_img = "welcome_flow_self3.png"
			else:
				moment_img = "welcome_flow_self2.png"
		elif membership:
			print "as>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
			print "as>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
			if current_registration:
				if current_registration.record_type:
					type = current_registration.record_type.clas
					if type == "iC_Project_Membership":
						if not membership:
							moment_img = "welcome_flow_FORM.png"
						elif not membership._join_fee_payed():
							moment_img = "welcome_flow_FEE.png"
						elif not membership.ic_CESnum:
							moment_img = "welcome_flow_ICES.png"
						else:
							moment_img = "welcome_flow_DONE.png"

					elif type == "iC_Person_Membership":
						if not membership:
							moment_img = "welcome_flow_FORM.png"
						elif not membership._join_fee_payed():
							print "as>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
							moment_img = "welcome_flow_FEE.png"
						elif not membership.ic_CESnum:
							moment_img = "welcome_flow_ICES.png"
						else:
							moment_img = "welcome_flow_DONE.png"
					elif type == "iC_Akin_Membership":
						if not membership:
							moment_img = "welcome_flow_PROJECT_akin.png"
						elif membership.ic_membership:
							from General.models import Project
							current_project = Project.objects.get(id=membership.ic_membership.ic_project.id)
							moment_img = "welcome_flow_DONE_akin.png"
						else:
							moment_img = "welcome_flow_PROJECT_akin.png"

	elif not current_person:
		moment_img = "welcome_flow_FORM.png"
	else:
		moment_img = "welcome_flow.png"

		print "wwweeeeeeeeeeeeeeeeeeeeeeeeee"
		print membership
	#END STATE ROAD MAP PICTURE
	
	#LOG IN PANEL
	from django.contrib.auth.forms import AuthenticationForm
	from Cooper.admin import UserAdminAuthenticationForm
	form_login = UserAdminAuthenticationForm()
	#END LOGIN PANEL
	
	#RENDER
	return render_to_response(
		'entry_page_to_gestioCI.html',
		{ 
		'membership_fee': membership_fee,
		'membership_ices': membership_ices,
		'membership': membership,
		'membership_self': membership_self,
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
				ic_m = iC_Project_Membership( ic_project=project, human=account.project, project=account.project, join_fee=current_fee, join_date=datetime.now())

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
		ic_m.name = ic_m
		ic_m.save()

	return HttpResponseRedirect( reverse("public_form:entry_page_to_gestioci")  )

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
	print membership_type
	if membership_type == "iC_Akin_Membership":
		from Welcome.models import iC_Membership, iC_Project_Membership
		print "akin"
		from Welcome.forms import iC_Akin_Membership_form
		form = iC_Akin_Membership_form(request.POST)
		from Welcome.models import iC_Akin_Membership
		membership = iC_Akin_Membership.objects.get(id=form_id)
		from General.models import Project
		try:
			p = Project.objects.get(id=request.POST["ic_membership"])
			pm = iC_Membership(ic_project = p, human=membership.person)
			pm.save()
			membership.ic_membership = pm
			membership.save()
			messages.success(request, _(u"S'ha vinculat el project correctament"))
		except ObjectDoesNotExist:
			messages.error(request, _(u"No s'ha vinculat el project correctament"))
	elif membership_type == "iC_Person_Membership":
		from Welcome.forms import iC_Person_Membership_form
		form = iC_Person_Membership_form(request.POST)
		from Welcome.models import iC_Person_Membership
		membership = iC_Person_Membership.objects.get(id=form_id)
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
		from Welcome.forms import iC_Project_Membership_form
		form = iC_Project_Membership_form(request.POST)
		from Welcome.models import iC_Project_Membership
		membership = iC_Project_Membership.objects.get(id=form_id)
		from Welcome.models import Payment_Type

		if membership.project.id != request.POST["project"]:
			from General.models import Project
			old_project = Project.objects.get(id=membership.project.id)
			new_project = Project.objects.get(id=request.POST["project"])
			from public_form.models import RegistrationProfile
			register = RegistrationProfile.objects.get(user = request.user)
			register.project = new_project
			membership.project = new_project
			register.save()
			membership.save()

		print membership.project.id
		try:
			if request.POST.has_key("payment_type"):
				pt = Payment_Type.objects.get(id=request.POST["payment_type"])
				membership.join_fee.payment_type = pt
				membership.join_fee.save()
			messages.success(request, _(u"S'ha guardat. "))
		except ObjectDoesNotExist:
			print "not found"
			messages.error(request, _(u"No s'ha guardat."))
	return HttpResponseRedirect(
				reverse('public_form:entry_page_to_gestioci')
			)


def save_form_self_employed(request):
	print "savinb"
	from Welcome.models import iC_Record
	form_id = request.POST["form_id"]
	print form_id
	try:
		membership_type = iC_Record.objects.get(id=form_id).record_type.clas
	except ObjectDoesNotExist:
		membership_type = None
	form = None
	print membership_type
	if membership_type == "iC_Self_Employed":
		try:
			if request.POST:
				from Welcome.models import iC_Self_Employed
				from Welcome.forms import iC_Self_Employed_form
				form = iC_Self_Employed_form(request.POST)
				#print form.errors
				#messages.Error(request, form.errors)
		except ObjectDoesNotExist:
			pass
		messages.error(request, _(u"No s'ha guardat."))
	return HttpResponseRedirect(
				reverse('public_form:entry_page_to_gestioci')
			)
