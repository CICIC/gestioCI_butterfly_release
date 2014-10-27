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

from django.utils.safestring import mark_safe
from datetime import date, timedelta, datetime
from General.models import Project, Human
from django.contrib.auth.decorators import login_required

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
	print "User:"
	print current_user.id
	try:
		current_registration = RegistrationProfile.objects.get(user=current_user.id)
		record_type_id = current_registration.record_type.id
		current_person = current_registration.person
		current_project = current_registration.project
	except ObjectDoesNotExist:
		pass
	print "Registration:"
	print current_registration
	#TAB 1: Memberships
	membership = None
	from Welcome.models import iC_Membership, iC_Akin_Membership, iC_Project_Membership, iC_Person_Membership
	qobjects = iC_Membership

	if current_registration:
		print current_registration.record_type
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
					print "person"
					print current_registration.person.id
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
				label = membership_fee
				if not label:
					label = membership_ices
				if not label:
					label = _(u"Has completat el procès d'alta")
				links.append( label)
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
				label = membership_fee
				if not label:
					label = membership_ices
				if not label:
					if not current_user.is_superuser:
						label = _(u" Has completat el procès d'alta")
						links.append( label)
					else:
						pass

			elif type == "iC_Akin_Membership":
				from Welcome.forms import iC_Akin_Membership_form
				from Welcome.models import iC_Akin_Membership
				form = iC_Akin_Membership_form(instance=membership)
				can_edit = True
				show_form = False
				if membership:
					if membership.ic_membership is None:
						show_form = True
						can_edit = True
						label = _(u" Escollir projecte vinculat")
						links.append( label)
					else:
						if not current_user.is_superuser:
							label = _(u" Has completat el procès d'alta")
						else:
							pass
						links.append( label)
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
					main_address = membership_self.ic_membership.human.rel_human_addresses_set.filter(main_address=True)
					if main_address.count() > 0:
						
						message =  _(u"Adreça principal: ").encode("utf-8")
						url = reverse("member:General_address_change",  args=[main_address.first().address.id] ) + "?next=public_form"
						link = "%s <a href='%s'> %s </a>"  % (message, url,  main_address.first().address.__str__())
						links.append( mark_safe(link) )
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

					if membership_self._has_assisted_socialcoin():
						message = _(u"Acció fora del sistema. Pagar cuota.").encode('utf8')
						links.append( message )
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
				if membership and type.lower() == "ic_self_employed" or membership and type.lower() == "ic_stallholder":
					if membership_self:
						label = _(u" Accedir al teu registre d'alta: ").encode("utf-8")
						url = reverse("member:Welcome_" + type.lower() + "_change",  args=[membership_self.id] ) + "?next=public_form"
						links.append( mark_safe("%s <a class='changelink' href='%s'> %s </a>" % (label, url,  membership_self.__str__())))
				else:
					label = _(u" Accedir al teu registre d'alta: ").encode("utf-8")
					url = reverse("member:Welcome_" + type.lower() + "_change",  args=[membership.id] ) + "?next=public_form"
					links.append( mark_safe("%s <a class='changelink' href='%s'> %s </a>" % (label, url,  membership.__str__())))

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


	#STATE ROAD MAP PICTURE
	moment_img = "welcome_flow.png"

	if current_user.is_superuser:
		moment_img="welcome_flow_general.png"
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
							try:
								current_project = Project.objects.get(id=membership.ic_membership.ic_project.id)
								moment_img = "welcome_flow_DONE_akin.png"
							except:
								pass
						else:
							moment_img = "welcome_flow_PROJECT_akin.png"

	elif not current_person:
		moment_img = "welcome_flow_FORM.png"
	else:
		moment_img = "welcome_flow.png"

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
	'''if not current_project:
		current_project = _(u"Omple el formulari de dades de projecte")
	if not current_person:
		current_person = _(u"Omple el formulari de dades de persona")'''
	foot_content = ""
	if request.POST:

		form = create_membership_form(request.POST)

		if form.is_valid():
			record_type_id = request.POST["type"]


			from Welcome.models import Person
			current_person = form.save()
			current_person.name = form.cleaned_data.get("username")
			current_person.nickname = form.cleaned_data.get("username")
			current_person.save()

			from Welcome.models import iC_Record_Type
			from Welcome.models import Project
			'''if str(record_type_id) == str(iC_Record_Type.objects.get(clas="iC_Project_Membership").id):
				current_project = Project(name=form.cleaned_data.get("project_name"), website=form.cleaned_data.get("project_website"))
				current_project.save()
			else:
				current_project = Project()'''

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
		else:
			from Welcome.models import Record_Type
			from Welcome.models import iC_Record_Type
			from Welcome.models import Fee
			from Welcome.models import Unit
			from Welcome.models import UnitRatio

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
				ic_m.human_id = account.project.id

			else:
				print '(activate_membership) RECORD_TYPE_STRING no reconegut!, esborro Quota !'
				current_fee.delete()
				return 'FALSE'

			#fee_amount = 60 #si Soci Cooperatiu Individual o Soci Afí Individual:30 ecos / 30 euros / 6 hores; si Projecte Col·lectiu: 60 ecos / 60 euros / 12hores)
		ic_m.record_type = account.record_type
		#ic_m.human_id = account.person.id
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

@login_required
def save_form_profile(request):

	from Welcome.models import iC_Record
	form_id = request.POST["form_id"].replace(".","")
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
			p = Project.objects.get(id=request.POST["ic_membership_project"])
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

from Welcome.models import Record_Type, iC_Record_Type, Fee, Unit, UnitRatio

'''
	request.POST.key["public_form_action"] value should be in:
	{POST.key.value} > form > description
	a) "public_form_action_join_session" > public_form.forms.learn_session_proxy_form > A form for initial state to join human with session
	b) "public_form_action_save_membership" > public_form.forms.public_form_self_admin > A form to create membership

'''

def get_current_human_or_none(request):
	try:
		current_human = Human.objects.get(id=request.POST["current_human"])
	except:
		current_human = None
		messages.warning(request, _(u"No s'ha trobat al humà") )
	return current_human

def get_current_session_or_none(request, type="current_session", current_human = None, session_type = 1):
	current_session = None
	try:
		from Welcome.models import Learn_Session
		current_session = Learn_Session.objects.get(id=request.POST[type])
	except:
		if current_human:
			current_session = current_human.assist_sessions.filter(nonmaterial__id = session_type).first()
		if not current_session:
			messages.warning(request, _(u"No s'ha trobat la sessió") )
	return current_session

def apply_join_session(request, current_human, current_session):

	if not current_human in current_session.assistants.all():
		try:
			current_human.assist_sessions.add(current_session)
		except Exception as e:
			messages.error(request, '%s (%s)' % (e.message, type(e)) )
			messages.info(request, _(u" Aquest humà ja ha està afegit.") )
		try:
			current_human.save()
			messages.info(request, _(u"S'ha afegit l'assistencia a la sessió." ) )
		except Exception as e:
			messages.error(request, '%s (%s)' % (e.message, type(e)) )
			messages.info(request, _(u"No s'ha establert l'assistència a la sessió.") )
	else:
		messages.info(request, _(u" Aquest humà ja ha està afegit.") )

def get_url_for (current_human, current_session, current_coin_session = None):
	callback_url = "/admin/public_form/human_proxy/"
	output = ""
	if current_human and current_session:
		output =  "%s?human_id=%s&learn_session_id=%s" % (callback_url, current_human.id,current_session.id)
	elif current_human:
		output =  "%s?human_id=%s" % (callback_url, current_human.id)
	elif current_session:
		output =  "%s?learn_session_id=%s" % (callback_url, current_session.id)
		if current_coin_session :
			if output == "":
				output = "%s?coin_session_id=%s" % (callback_url, current_coin_session.id)
			else:
				output += "&coin_session_id=%s" % (current_coin_session.id)
	else:
		output = callback_url
	return output

'''
Will try to cast param human_id on a project or a person to save it with POST data.

Retrieve a project by request.POST.key("current_human") id
	Set its type, description and ecommerce fields
	Saves
Otherwise, reports not found
Retrieve a person by request.POST.key("current_human") id
	Sets its name, telephones and email
	Saves
'''
def save_current_human(request, current_human):
	from General.models import Project, Person, Project_Type
	from Welcome.models import iC_Project_Membership, iC_Person_Membership

	try:
		current_project = Project.objects.get(id=request.POST["current_human"])
		current_project.project_type = Project_Type.objects.get(id=request.POST.get("project_type", -1))
		current_project.description = request.POST.get("description", "")

		current_project.ecommerce = request.POST.get("ecommerce", False)
		current_project.save()
	except ObjectDoesNotExist:
		current_project = None
		messages.warning(request, _(u"No s'ha trobat cap project") )

	try:
		current_person = Person.objects.get(id=request.POST["current_human"])
	except ObjectDoesNotExist:
		messages.warning(request, _(u"No s'ha trobat cap persona") )
		try:
			current_person = Person()
			current_person.name = "Persona del projecte:" + current_human.name
			current_person.telephone_land = current_human.telephone_land
			current_person.telephone_cell = current_human.telephone_cell
			current_person.email = current_human.email
			current_person.save()
			from General.models import rel_Human_Persons, Relation
			relation = Relation.objects.get(clas="reference")
			relobj, is_new= rel_Human_Persons.objects.get_or_create(human=current_project, person_id = current_person.id, relation = relation)
			if is_new:
				relobj.save()
		except Exception as e:
			messages.info(request, _(u"Error al grabar persona") )
			messages.error(request, '%s (%s)' % (e.message, type(e)) )

	return current_project, current_person

'''
If current_person then will try to create a iC_Person_Membership and return it
Also will create a project which request.POST.get("project_type", 31) should be individual
otherwise return none
'''
def save_current_individual(current_human, current_person, request):
	from General.models import Project_Type
	ic = None
	if current_person:
		try:
			from Welcome.models import iC_Person_Membership
			messages.info(request, _(u"Afegir membership person") )
			ic = iC_Person_Membership(
								person=current_person, 
								human=current_human, 
								join_date=datetime.now()
								)
		except:
			pass
	return ic

def save_current_collective(current_project, request):
	from Welcome.models import iC_Project_Membership
	ic = None
	if current_project:
		try:
			ic = iC_Project_Membership.objects.get(project=current_project)
		except ObjectDoesNotExist:
			messages.info(request, "No he trobat relació a ic_pro_memb. lacreo: " + str(current_project.id))
			ic = iC_Project_Membership(ic_project=current_project, human=current_project, project=current_project, join_date=datetime.now())
	return ic
'''
def save_relation_project_person():
	from General.models import rel_Human_Persons, Relation
		try:
			relation = Relation.objects.get(clas="reference")
			relobj, is_new= rel_Human_Persons.objects.get_or_create(human=current_project, person_id = current_person.id, relation = relation)
			if is_new:
				relobj.save()
			except Exception as e:
				messages.info(request, _(u"Error al crear relación projecto persona") )
				messages.error(request, '%s (%s)' % (e.message, type(e)) )'''

def save_fees(request, current_person, current_project, current_human, ic):
	fee_type = None
	current_fee = None

	#expected field clas="((45_eco) advanced_fee)"
	if request.POST.get("project_subtype", -1) == "1":
		fee_type = iC_Record_Type.objects.get(clas__contains='individual')
		messages.info(request, "Busco cuota 1")
	elif request.POST.get("project_subtype", -1) == "2":
		fee_type = iC_Record_Type.objects.get(clas__contains='collective')
		messages.info(request, "Busco cuota 2")
	fee_type_quarter = iC_Record_Type.objects.get(clas__contains='advanced_fee')
	amount_advanced_tax = fee_type_quarter.clas.split("_")[0].replace("((","")
	if current_person:
		human = current_person
	elif current_project:
		human = current_project
	else:
		human = current_human

	if not current_project:
		current_project = current_human

	if fee_type:
		current_fee = Fee(
			human = human,
			project = current_project,
			record_type = fee_type,
			amount = fee_type.clas.split("_")[0].replace("(", ""),
			unit = Unit.objects.get(name="Euro"),
			issue_date = datetime.now(),
			deadline_date = datetime.now() + timedelta(days=5) ,
		)
	try:
		messages.info(request, '### guardant quota alta: '+str(current_fee))
		current_fee.save()
	except Exception as e:
		messages.info(request, _(u"Error al grabar quota") )
		messages.error(request, '%s (%s)' % (e.message, type(e)) )
	else:
		ic.join_fee = current_fee
		ic.save()
	return amount_advanced_tax, fee_type_quarter

def save_other_fields(request, ic ):
	try:
		ic.virtual_market = request.POST.get("virtual_market", 0)
		if request.POST.get("expositors", 0):
			from General.models import rel_Human_Addresses
			cic_address = rel_Human_Addresses.objects.filter(human__name__contains="Cooperativa Integral Catalana", main_address=True).first()
			if cic_address:
				ic.save()
				ic.expositors.add(cic_address.address)
			else:
				messages.error(request, "Nos'ha trobat l'adreça de la CIC")
		ic.name = str(ic)
		ic.save()
	except Exception as e:
		messages.info(request, _(u"Error al grabar MEMBRE") )
		messages.error(request, '%s (%s)' % (e.message, type(e)) )

def save_self_employed(current_person, current_project, current_human, ic, request, amount_advanced_tax, fee_type_quarter):
	ice = None
	if current_person:
		human = current_person
	elif current_project:
		human = current_project
	else:
		human = current_human

	if not current_project:
		current_project = current_human

	try:
		messages.info(request, _(u"Busco self_employed") )
		from Welcome.models import iC_Self_Employed
		ice = iC_Self_Employed.objects.get(ic_membership=ic)
	except ObjectDoesNotExist:
		messages.info(request, _(u"Creant registre self employed") )
		ice = iC_Self_Employed ()
		ice.ic_membership = ic

		ice.organic = request.POST.get("organic", False) == "on"
		try:
			current_fee_quarter = Fee(
				human = human,
				project = current_project,
				record_type = fee_type_quarter,
				amount = amount_advanced_tax,
				unit = Unit.objects.get(name="Euro"),
				issue_date = datetime.now(),
				deadline_date = datetime.now() + timedelta(days=5) ,
			)
			current_fee_quarter.save()
			ice.save()
			ice.rel_fees.add(current_fee_quarter)
			ice.save()
		except Exception as e:
			messages.info(request, _(u"Error al grabar AUTOCUPAT") )
			messages.error(request, '%s (%s)' % (e.message, type(e)) )
	return ice

def save_stall_holder(ic, ice, request):

	from Welcome.models import iC_Stallholder
	try:
		ich = iC_Stallholder.objects.get(ic_self_employed=ice)
	except ObjectDoesNotExist:
		ich = iC_Stallholder()
		ich.ic_self_employed=ice
		ich.ic_membership= ic
		ich.tent_type=request.POST.get("tent_type", "none")
		try:
			ich.name = str(ich)
			ich.save()
		except Exception as e:
			messages.info(request, _(u"Error al grabar FIRAIRE") )
			messages.error(request, '%s (%s)' % (e.message, type(e)) )
	return ich

@login_required
def save_form_self_employed(request):

	current_human = get_current_human_or_none(request)
	current_session = get_current_session_or_none(request, "current_session", current_human, 1)
	current_coin_session = get_current_session_or_none(request, "current_coin_session", current_human, 2)

	if not request.POST:
		return HttpResponseRedirect(get_url_for(current_human, current_session))

	if request.POST["public_form_action"] ==  "public_form_action_save_membership":
		from public_form.forms import public_form_self_admin
		form = public_form_self_admin(request.POST)
		if not form.is_valid():
			for err in form.errors:
				if err != "organic":
					error_text = str(form.fields[err].label.encode("utf-8")) + ": " + _(u"Aquest camp es obligatori").encode("utf-8")
					messages.error(request, error_text)
			try:
				return HttpResponseRedirect(get_url_for(current_human, None))
			except:
				return HttpResponseRedirect(get_url_for(None, None))
	if request.POST["public_form_action"] == "public_form_action_join_session":
		apply_join_session(request, current_human, current_session)
		return HttpResponseRedirect(get_url_for(current_human, current_session))

	if request.POST["public_form_action"] == "public_form_action_join_coin_session":
		apply_join_session(request, current_human, current_coin_session)
		return HttpResponseRedirect(get_url_for(current_human, current_session, current_coin_session))

	ic = None
	ice = None

	if request.POST["public_form_action"] ==  "public_form_action_save_membership":

		messages.info(request, "Post params: project_type: " + request.POST.get("project_type", "nada"))
		messages.info(request, "Post params: project_subtype: " + request.POST.get("project_subtype", "nada"))

		current_project, current_person = save_current_human(request, current_human)

		if current_human:
			if request.POST.get("project_subtype", -1) == "1":
				ic = save_current_individual(current_human, current_person, request)

			if request.POST.get("project_subtype", -1) == "2":
				ic = save_current_collective(current_project, request)
		else:
			messages.info(request, _(u"Faig redire per falta dhuma") )
			return HttpResponseRedirect(get_url_for(current_human, current_session))

		if ic:
			amount_advanced_tax, fee_type_quarter = save_fees(request, current_person, current_project, current_human, ic)
			#save_other_fields(request, ic)
			ice = save_self_employed(current_person, current_project, current_human, ic, request, amount_advanced_tax, fee_type_quarter)
			messages.info(request, "Soc firaire " + str(request.POST.get("project_type", -1) == "32") )
			if ice and request.POST.get("project_type", -1) == "32":
				icsh = save_stall_holder(ic, ice, request)

	return HttpResponseRedirect(get_url_for(current_human, current_session))
