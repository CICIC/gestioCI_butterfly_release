from django.conf.urls import patterns, include, url

from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

#NON-STAFF ADMIN CONTROL PANEL FOR COOPERS
from Cooper.admin import user_admin_site

#INITIALIZE
#django_cron.autodiscover()
admin.autodiscover()


#URL PARAMETERS
#JS 
js_info_dict = {
	'packages': ('Invoices.package',),
}


#URL PATTERNS
urlpatterns = patterns('',
#Password recovery management
url(r'^cooper/password_reset/$', 'django.contrib.auth.views.password_reset', name='admin_password_reset'),
url(r'^cooper/password_reset/done/$', 'django.contrib.auth.views.password_reset_done', name='password_reset_done'),
url(r'^cooper/reset/(?P<uidb36>[0-9A-Za-z]+)-(?P<token>.+)/$', 'django.contrib.auth.views.password_reset_confirm',  name='password_reset_confirm'),
url(r'^cooper/reset/done/$', 'django.contrib.auth.views.password_reset_complete',  name='password_reset_complete'),
#Localization
url(r'^jsi18n/$', 'django.views.i18n.javascript_catalog', js_info_dict),
url(r'^i18n/', include('django.conf.urls.i18n')),
#Our semantic entity sites
url(r'^admin/', include(admin.site.urls)),
url(r'^cooper/', include(user_admin_site.urls)),
#Just to be removed, add backward compatibility with gestioCIv07 where Cooper APP where called Soci.
url(r'^soci/', include(user_admin_site.urls)),

#Our invoicing module
url(r'^invoices/', include('Invoices.urls', namespace='Invoices')),
#Our welcoming module

#Default http index --> redirect to soci space
url(r'^', include(user_admin_site.urls)),

)

#MEDIA
#Add this to serve static files like csv (config in ./settings.py)
urlpatterns + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
