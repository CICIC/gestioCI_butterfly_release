from django.shortcuts import render
import warnings

from django.conf import settings
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, QueryDict
from django.template.response import TemplateResponse

from django.utils.http import is_safe_url, urlsafe_base64_decode
from django.utils.translation import ugettext as _
from django.utils.six.moves.urllib.parse import urlparse, urlunparse
from django.shortcuts import resolve_url

from django.contrib.auth.views import login
from django.views.decorators.debug import sensitive_post_parameters
from django.views.decorators.cache import never_cache
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth import (REDIRECT_FIELD_NAME, login as auth_login,
    logout as auth_logout, get_user_model, update_session_auth_hash)
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm, PasswordResetForm, SetPasswordForm, PasswordChangeForm
from django.contrib.auth.tokens import default_token_generator
from django.contrib.sites.shortcuts import get_current_site

@sensitive_post_parameters()
@csrf_protect
@never_cache
def cooper_login(request, template_name='registration/login.html',
		redirect_field_name=REDIRECT_FIELD_NAME,
		authentication_form=AuthenticationForm,
		current_app=None, extra_context=None):
	
	"""
	Displays the login form and handles the login action.
	"""
	redirect_to = request.POST.get(redirect_field_name, request.GET.get(redirect_field_name, ''))

	if request.method == "POST":
		form = authentication_form(request, data=request.POST)
		if form.is_valid():

			# Ensure the user-originating redirection url is safe.
			if not is_safe_url(url=redirect_to, host=request.get_host()):
				redirect_to = resolve_url(settings.LOGIN_REDIRECT_URL)

			# Okay, security check complete. Log the user in.
			auth_login(request, form.get_user())

			return HttpResponseRedirect(redirect_to)
	else:
		from Cooper.forms import UserAdminAuthenticationForm
		form = UserAdminAuthenticationForm(request)

	current_site = get_current_site(request)
	from Cooper.admin import user_admin_site
	current_site = user_admin_site
	context = {
		'form': form,
		redirect_field_name: redirect_to,
		'site': current_site,
		'site_name': current_site.name,
	}
	if extra_context is not None:
		context.update(extra_context)
	return TemplateResponse(request, template_name, context, current_app=current_app)

def cooper_login_view(request, *args, **kwargs):

	if request.method == 'POST':
		if not request.POST.get('remember', None):
			request.session.set_expiry(0)
	return cooper_login(request, *args, **kwargs)