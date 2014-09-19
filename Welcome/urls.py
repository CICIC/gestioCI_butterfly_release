#encoding=utf-8

from django.conf.urls import patterns, include, url
from Welcome import views
from Welcome.views import add_contract_to_address

urlpatterns = patterns('',
	url(r'^public_form/$', views.public_form, name='public_form'),
	url(r'^public_view_person/$', views.public_view_person, name='public_view_person'),
	url(r'^public_view_project/$', views.public_view_project, name='public_view_project'),
	url(r'^public_view_company/$', views.public_view_company, name='public_view_company'),
	url(r'^add_contract_to_address/(?P<person_id>\d+)/(?P<address_id>\d+)/(?P<id>\d+)/$',
	   add_contract_to_address,
	   name='add_contract_to_address'),
)