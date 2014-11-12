from django.conf.urls import patterns, include, url

from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

#NON-STAFF ADMIN CONTROL PANEL FOR COOPERS
from Cooper.admin import user_admin_site
from Cooper.views import cooper_login_view

#URL PATTERNS
urlpatterns = patterns('',
	#Password recovery management
	url(r'^cooper/password_reset/$', 'django.contrib.auth.views.password_reset', name='admin_password_reset'),
	url(r'^cooper/password_reset/done/$', 'django.contrib.auth.views.password_reset_done', name='password_reset_done'),
	url(r'^cooper/reset/(?P<uidb36>[0-9A-Za-z]+)-(?P<token>.+)/$', 'django.contrib.auth.views.password_reset_confirm',  name='password_reset_confirm'),
	url(r'^cooper/reset/done/$', 'django.contrib.auth.views.password_reset_complete',  name='password_reset_complete'),
	url(r'^login/$', "django.contrib.auth.views.login", name='login'),
	url(r'^cooper/login/$', cooper_login_view, name='login_cooper'),
) 