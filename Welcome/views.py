#encoding=utf-8
from django.http import HttpResponse
from django.shortcuts import render_to_response, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from Welcome.forms import public_form
from django.template import RequestContext

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
