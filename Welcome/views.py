#encoding=utf-8
from django.http import HttpResponse
from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from Welcome.forms import public_form

def public_form(request):
	#return HttpResponse("You're going to sign up %s.")
	#p = get_object_or_404(Poll, pk=poll_id)

	from Welcome.forms import public_form

	public_form.title="You're going to sign up %s."
	public_form.id = 25
	from Welcome.admin import MembershipAdmin
	public_form.fieldsets =  MembershipAdmin.fieldsets

	return render(request, 'public_form.html', {
				'form': public_form,
				'error_message': "You didn’t something.",
			})
	return HttpResponseRedirect(reverse('Welcome:public_form', args=(p.id,)))

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
