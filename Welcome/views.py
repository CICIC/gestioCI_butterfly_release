#encoding=utf-8
from django.http import HttpResponse
from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse

def public_form(request):
	#return HttpResponse("You're going to sign up %s.")
	#p = get_object_or_404(Poll, pk=poll_id)
	class parameters(object):
		pass
	p = parameters()
	p.title="You're going to sign up %s."
	p.id = 25

	return render(request, 'public_form.html', {
				'form': p,
				'error_message': "You didn’t something.",
			})
	return HttpResponseRedirect(reverse('Welcome:public_form', args=(p.id,)))
	
