#encoding=utf-8
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
	'packages': ('finances.package',),
}
from Cooper.urls import urlpatterns as cooper_patterns

#URL PATTERNS
urlpatterns =  cooper_patterns + patterns('',
#Localization
url(r'^jsi18n/$', 'django.views.i18n.javascript_catalog', js_info_dict),
url(r'^i18n/', include('django.conf.urls.i18n')),
#
url(r'^cooper/', include(user_admin_site.urls )),
#
#Just to be removed, add backward compatibility with gestioCIv07 where Cooper APP where called Soci.
url(r'^soci/', include(user_admin_site.urls)),
# 
# Section: FINANCES
# Description: Our invoicing module.
# WARNING(20112014): This App should only be expected to be available for iC_Self_Employed related Django.contrib.auth.users.
# >  See Manual, reference [GestioCI-Codi] Section: Funcionalitats Modul_02 Faturació GestioCI.Finances (app) > Entrada socis (no autoocupats)
# >  on url:
# > (https://wiki.enredaos.net/index.php?title=GestioCI-Codi#Entrada_socis_.28no_autoocupats.29)
url(r'^finances/', include('Finances.urls', namespace='finances')),
#
#Our semantic entity sites
url(r'^admin/', include(admin.site.urls)),
#Our welcoming module
url(r'^welcome/', include('Welcome.urls', namespace='Welcome')),
#public_form
url(r'^public_form/', include('public_form.urls', namespace='public_form')),
#Default http index --> redirect to soci space
url(r'^', include(user_admin_site.urls)),
#url(r'^media/',),
) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) #+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

#MEDIA
#Add this to serve static files like csv (config in ./settings.py)
urlpatterns + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

