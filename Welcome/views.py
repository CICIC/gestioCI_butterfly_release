#encoding=utf-8
from django.http import HttpResponse
from django.shortcuts import render_to_response, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from Welcome.forms import public_form
from django.template import RequestContext
from django.contrib.auth.decorators import login_required
from django.utils.translation import ugettext_lazy as _
from django.utils.safestring import mark_safe
def public_form(request):
	# Get the context from the request.
	context = RequestContext(request)

	# A HTTP POST?
	from Welcome.forms import public_form
	if request.method == 'POST':
		form = public_form(request.POST)

		# Have we been provided with a valid form?
		if form.is_valid():
			selected_type = request.POST['type']
			print selected_type
			if selected_type == "1" :
				to_url = 'Welcome:public_view_project'
			elif selected_type == "2":
				to_url = 'Welcome:public_view_person'
			elif selected_type == "3":
				to_url = 'Welcome:public_view_person'
			else:
				to_url = "Welcome:public_form"
			print to_url
			return HttpResponseRedirect( reverse(to_url) )
		else:
			# The supplied form contained errors - just print them to the terminal.
			print form.errors
	else:
		# If the request was not a POST, display the form to enter details.
		form = public_form()
	# Bad form (or form details), no form supplied...
	# Render the form with error messages (if any).
	return render_to_response('public_form.html', {'form': form}, context)

def public_view_person(request):
	print "dsdg"
	# Get the context from the request.
	context = RequestContext(request)
	print "dentro"
	# A HTTP POST?
	from Welcome.forms import public_form_person
	if request.method == 'POST':
		form = public_form_person(request.POST)

		# Have we been provided with a valid form?
		if form.is_valid():
			pass
		else:
			# The supplied form contained errors - just print them to the terminal.
			print form.errors
	else:
		# If the request was not a POST, display the form to enter details.
		form = public_form_person()
	# Bad form (or form details), no form supplied...
	# Render the form with error messages (if any).
	return render_to_response('public_form.html', {'form': form}, context)

def public_view_project(request):
	# Get the context from the request.
	context = RequestContext(request)

	# A HTTP POST?
	from Welcome.forms import public_form_project
	if request.method == 'POST':
		form = public_form_project(request.POST)

		# Have we been provided with a valid form?
		if form.is_valid():
			pass
		else:
			# The supplied form contained errors - just print them to the terminal.
			print form.errors
	else:
		# If the request was not a POST, display the form to enter details.
		form = public_form_project()
	# Bad form (or form details), no form supplied...
	# Render the form with error messages (if any).
	return render_to_response('public_form.html', {'form': form}, context)

from Welcome.forms import public_form_person
def public_view_company(request):
	# Get the context from the request.
	context = RequestContext(request)

	# A HTTP POST?
	from Welcome.forms import public_form_company
	if request.method == 'POST':
		form = public_form_company(request.POST)

		# Have we been provided with a valid form?
		if form.is_valid():
			pass
		else:
			# The supplied form contained errors - just print them to the terminal.
			print form.errors
	else:
		# If the request was not a POST, display the form to enter details.
		form = public_form_company()
	# Bad form (or form details), no form supplied...
	# Render the form with error messages (if any).
	return render_to_response('public_form.html', {'form': form}, context)


'''
type = 0 => address_contract ==> cessió (contract_use)
type = 1 => address_contract ==> lloger (contract_hire)
type = 2 => labor_contract
type = 3 => add main address
type = 4 => add other address
'''
@login_required
def self_employed_save_item(request, person_id, address_id, id, type):
	from General.models import Person, Address, Project
	from Welcome.models import iC_Stallholder, iC_Self_Employed
	try:
		current_person = Person.objects.get(id=person_id)
	except:
		current_person = None
	try:
		current_address = Address.objects.get(id=address_id)
	except:
		current_address = None
	try:
		current_project = Project.objects.get(id=person_id)
	except:
		current_project = None

	try:
		membership = iC_Stallholder.objects.get(id=id)
		callback_clas = "ic_stallholder"
	except:
		try:
			membership= iC_Self_Employed.objects.get(id=id)
			callback_clas = "ic_self_employed"
		except:
			membership = None
			callback_clas = "ic_self_employed"

	if current_person and current_address and type=="0":
		from Welcome.models import iC_Address_Contract, iC_Document, iC_Document_Type
		typ = iC_Document_Type.objects.get(clas='contract_use')
		ic_doc = iC_Document()
		ic_doc.doc_type = typ
		ic_doc.current_person = current_person
		ic_doc.name = typ.name.encode("utf-8") + " " + str(current_person) + " " + str(current_address)
		ic_doc.save()
		ic = iC_Address_Contract(ic_document=ic_doc, address=current_address)
		ic.name = ic_doc.name
		ic.save()
		ic.ic_document.doc_type = ic_doc.doc_type
		ic.ic_document.save()
		membership.rel_address_contracts.add(ic)
		membership.save()

	elif current_person and current_address and type=="1":
		from Welcome.models import iC_Address_Contract, iC_Document, iC_Document_Type
		typ = iC_Document_Type.objects.get(clas='contract_hire')
		ic_doc = iC_Document()
		ic_doc.doc_type = typ
		ic_doc.current_person = current_person
		ic_doc.name = typ.name.encode("utf-8") + " " + str(current_person) + " " + str(current_address)
		ic_doc.save()
		ic = iC_Address_Contract(ic_document=ic_doc, address=current_address)
		ic.name = ic_doc.name
		ic.save()
		ic.ic_document.doc_type = ic_doc.doc_type
		ic.ic_document.save()
		membership.rel_address_contracts.add(ic)
		membership.save()

	elif current_person and current_address and type=="2":
		from Welcome.models import iC_Licence, iC_Document, iC_Document_Type
		typ = iC_Document_Type.objects.get(clas='iC_Licence')
		ic_doc = iC_Document()
		ic_doc.doc_type = typ
		ic_doc.current_person = current_person
		ic_doc.name = typ.name.encode("utf-8") + " " + str(current_person) + " " + str(current_address)
		ic_doc.save()
		ic = iC_Licence(ic_document=ic_doc, rel_address = current_address)
		ic.rel_address = current_address
		ic.name = ic_doc.name 
		ic.save()
		ic.ic_document.doc_type = ic_doc.doc_type
		ic.ic_document.save()
		membership.rel_licences.add(ic)
		membership.save()

	elif current_project and type=="3":
		from General.models import Address, rel_Human_Addresses
		adr = Address()
		adr.save()
		adr.p_address = _("<introducir>")
		adr.town = _("<introducir>")
		adr.postalcode = _("<00000>")
		related_address = rel_Human_Addresses(human=current_project, address=adr, main_address = True)
		related_address.save()
		return HttpResponseRedirect("/admin/General/address/" + str(adr.id) + "/?_popup=1")
	elif current_project and type=="4":
		from General.models import Address, rel_Human_Addresses
		adr = Address()
		adr.save()
		adr.p_address = _("<introducir>")
		adr.town = _("<introducir>")
		adr.postalcode = _("<00000>")
		related_address = rel_Human_Addresses(human=current_project, address=adr)
		related_address.save()
		return HttpResponseRedirect("/admin/General/address/" + str(adr.id) +  "/?_popup=1")
	callback_url = "/admin/Welcome/" + callback_clas + "/" + str(id)  + "/"
	return HttpResponseRedirect(callback_url)

from django.http import HttpResponse
from django.template.loader import render_to_string
from django.contrib.auth.decorators import login_required

class render_obj(object):
	pass

@login_required
def print_task_list(request, icse):

	try:
		from Welcome.models import iC_Self_Employed
		current_icse = iC_Self_Employed.objects.get(id=icse)
	except:
		return "No encontrado"
	obj = render_obj()
	obj.current_project= current_icse.ic_membership.human
	obj.current_admin = request.user

	obj.insurances = current_icse.rel_insurances
	obj.address_contracts =  current_icse.rel_address_contracts
	obj.licences = current_icse.rel_licences

	obj.fee =  current_icse.ic_membership.join_fee

	if current_icse.rel_fees.all().count()>0:
		obj.quarter_fee = current_icse.rel_fees.all()[0]
	from django.conf.urls.static import static
	html = render_to_string( 'task_list.html', {'obj': obj})
	return render_pdf(html.encode("utf-8"))

@login_required
def print_certificate(request, icse, type):

	try:
		from Welcome.models import iC_Self_Employed
		icse = iC_Self_Employed.objects.get(id=icse)
	except:
		icse = None
		return "No encontrado"

	obj = render_obj()

	obj.project = icse.ic_membership.human
	from datetime import datetime
	obj.date = datetime.now()
	from General.models import Relation
	ref_typ = Relation.objects.get(clas='reference')
	from General.models import rel_Human_Persons
	rels = icse.ic_membership.human.human_persons.filter(relation=ref_typ)
	obj.member_name = ""
	obj.member_card = ""
	template = ''
	obj.persons = "<ul>"
	for rel in rels:
		obj.persons += "<li>"
		if hasattr(rel, 'person'):
			obj.persons +=  rel.person.name.encode("utf-8") + _(" amb DNI: ").encode("utf-8") +rel.person.id_card
		else:
			obj.persons +=   icse.ic_membership.human.person.name + _(" amb DNI: ").encode("utf-8") + icse.ic_membership.human.person.id_card
		obj.persons += "</li>"
	obj.persons += "</ul>"
	obj.persons = mark_safe(obj.persons)
	if type == "0" or type =="10":
		obj.address = ""
		obj.job = ""
		for license in icse.rel_licences.all():
			obj.job += license.rel_job.name
			obj.address += str(license.rel_address)
		template = 'certificate.html' if type=="0" else 'certificate_stallholder.html'
	elif type=="1" or type=="11":
		obj.jobs = ""
		for license in icse.rel_licences.all():
			obj.jobs += license.rel_job.name
		template = 'certificate_services.html' if type=="1" else 'certificate_services_stallholder.html'
	elif type=="2":
		pass
	elif type=="3":
		obj = None
		template = 'cif.html'
	html = render_to_string( template, {'obj': obj})
	return render_pdf(html.encode("utf-8"))

import ho.pisa as pisa
import cStringIO as StringIO
import cgi
from django.template import RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse

def render_pdf(html):
	print html
	return HttpResponse(html)
	result = StringIO.StringIO()
	pdf = pisa.pisaDocument(StringIO.StringIO(html.encode("utf-8")), result)
	if not pdf.err:
		print result.getvalue()
		return HttpResponse(result.getvalue(), mimetype='application/pdf')
	return HttpResponse(_(u'Error al generar el PDF: %s') % cgi.escape(html))

	'''
			if human.id:
				user = user( form.name, form.email, "password" )

			return HttpResponseRedirect('anonymous/Welcome/ic_membership/', args=(human.id,))

			# Save the new category to the database.
			form.save(commit=True)

			# Now call the index() view.
			# The user will be shown the homepage.
			pass

			return index(request)
			switch case human:
				case person:
					reverse = 'General:Public_PersonAdmin'
				case company:
					reverse = 'General:Public_CompanyAdmin'
				case project:
					reverse = 'General:Public_ProjectAdmin'

			'''

	'''
	switch case human:
	case person:
		reverse = 'General:Public_PersonAdmin'
	case company:
		reverse = 'General:Public_CompanyAdmin'
	case project:
		reverse = 'General:Public_ProjectAdmin'
	return HttpResponseRedirect(reverse(reverse), args=(p.id,)))
	'''


'''
from django.utils import simplejson

def ajax_example(request):
		if not request.POST:
				return render_to_response('weblog/ajax_example.html', {})
		xhr = request.GET.has_key('xhr')
		response_dict = {}
		name = request.POST.get('name', False)
		total = request.POST.get('total', False)
		response_dict.update({'name': name, 'total': total})
		if total:
				try:
						total = int(total)
				except:
						total = False
		if name and total and int(total) == 10:
				response_dict.update({'success': True})
		else:
				response_dict.update({'errors': {}})
				if not name:
						response_dict['errors'].update({'name': 'This field is required'})
				if not total and total is not False:
						response_dict['errors'].update({'total': 'This field is required'})
				elif int(total) != 10:
						response_dict['errors'].update({'total': 'Incorrect total'})
		if xhr:
				return HttpResponse(simplejson.dumps(response_dict), mimetype='application/javascript')
		return render_to_response('weblog/ajax_example.html', response_dict)
'''
