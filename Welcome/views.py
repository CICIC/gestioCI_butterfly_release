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
type = 5 => remove cardid (person.id / 0 / ic_membership.human.id, 5)
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
		next_url = request.GET.get("next","")
		return HttpResponseRedirect("/admin/General/address/" + str(adr.id)  + "/?next=" + next_url)
	elif current_project and type=="4":
		from General.models import Address, rel_Human_Addresses
		adr = Address()
		adr.name = current_project.name
		adr.p_address = _("<introducir>")
		adr.town = _("<introducir>")
		adr.postalcode = _("00000")
		adr.save()
		related_address = rel_Human_Addresses(human=current_project, address=adr)
		related_address.save()
		next_url = request.GET.get("next","")
		return HttpResponseRedirect("/admin/General/address/" + str(adr.id) + "/?next=" + next_url)
	elif type=="5":
		from django.core.exceptions import ObjectDoesNotExist
		try:
			from General.models import rel_Human_Persons, Person, Human
			current_human = Human.objects.get(id=id)
			current_person = Person.objects.get(id=person_id)
			rel_Human_Persons.objects.get(person=current_person,human=current_human).delete()
			next_url = request.GET.get("next","")
			return HttpResponseRedirect(next_url)
		except ObjectDoesNotExist as e:
			from django.contrib import messages
			messages.error(request, e.message )
			messages.info(request, _(u" No s'ha pogut desvincular el sóci membre.") )
		except Exception as e:
			from django.contrib import messages
			messages.error(request, e.message )
			messages.info(request, _(u" No s'ha pogut desvincular el sóci membre.") )

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

	fee = current_icse.ic_membership.join_fee
	name = fee.record_type.name.encode("utf-8")
	obj.fee = "%s: [%s %s]" % (name.decode("utf-8"), str(fee.amount), fee.unit.code)

	obj.is_stall_holder = current_icse.record_type.clas == "iC_Stallholder"

	if current_icse.rel_fees.all().count()>0:
		fee = current_icse.rel_fees.all().first()
		name = fee.record_type.name.encode("utf-8")
		obj.quarter_fee = "%s: [%s %s]" % (name.decode("utf-8"), str(fee.amount), fee.unit.code)	
	from django.conf.urls.static import static
	html = render_to_string( 'task_list.html', {'obj': obj})
	return render_pdf(html.encode("utf-8"), request)

@login_required
def print_certificate(request, icse, type, cooperative):

	try:
		from Welcome.models import iC_Self_Employed
		icse = iC_Self_Employed.objects.get(id=icse)
	except:
		icse = None
		return "No encontrado"

	obj = render_obj()

	obj.project = icse.ic_membership.human
	from datetime import datetime
	obj.date = icse.ic_membership.join_date
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
			person = rel.person
		else:
			person = icse.ic_membership.human.person
		obj.persons += person.name.encode('ascii', 'xmlcharrefreplace') + " " + person.surnames.encode('ascii', 'xmlcharrefreplace') + " " +  _(" amb DNI: ").encode("utf-8") + str(person.id_card)
		obj.persons += "</li>"
	obj.persons += "</ul>"
	obj.persons = mark_safe(obj.persons)

	if type == "0" or type =="10":
		obj.jobs_and_address = "<ul>"
		jobs = []
		for adr in icse.ic_membership.human.addresses.all():
			for job in adr.jobs.all():
				jobs.append(job.id)
				obj.jobs_and_address += "<li>" + job.name.encode('ascii', 'xmlcharrefreplace') 
				caption = _(u"al local situat a l'adreça:").encode("utf-8")
				region = adr.region.name.encode('ascii', 'xmlcharrefreplace')
				try:
					address_text = adr.p_address.encode("utf-8")
					obj.jobs_and_address += " %s %s %s %s (%s) %s" % (caption, address_text.decode("utf-8"), adr.postalcode, adr.town.encode("utf-8"), region, "</li>" )
				except:
					obj.jobs_and_address = caption + "/" + address_text + "</li>"
					
		for job in icse.ic_membership.human.jobs.all():
			if not job.id in jobs:
				obj.jobs_and_address += "<li>" + job.name.encode('ascii', 'xmlcharrefreplace') + "</li>"

		obj.jobs_and_address += "</ul>"
		obj.jobs_and_address = mark_safe(obj.jobs_and_address)
		template = 'certificate_' + cooperative + '.html' if type=="0" else 'certificate_stallholder_' + cooperative + '.html'

	html = render_to_string( template, {'obj': obj})
	#return HttpResponse(html)
	return render_pdf(html.encode("utf-8"), request)

from xhtml2pdf import pisa
import cStringIO as StringIO
import cgi
import os
from django.template import RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse
from Config.settings import PDF_IMAGES_DIR 

def _fix_pdf_links(uri, rel):
	'''
	Callback function that convert links on the source html to absolute
	paths on the local filesystem. This implementation is temporary and
	it does not take into account actual links that are expected to be
	interactive in the resulting PDF. It will take care of embedded
	resources (i.e. images) and break other kind of URL's (e.g. a href)
	'''
	t = uri.split('/')
	if len(t)>1: t = t[-1] # discard the full path; keep just the resource name
	return os.path.join(PDF_IMAGES_DIR, t)

def render_pdf(html, request):
	result = StringIO.StringIO()
	pdf = pisa.pisaDocument(StringIO.StringIO(html), result, link_callback=_fix_pdf_links)
	if not pdf.err:
		return HttpResponse(result.getvalue(), content_type='application/pdf')
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
