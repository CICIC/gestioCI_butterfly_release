#encoding=utf-8

from django.conf.urls import patterns, include, url
from Welcome import views
from Welcome.views import self_employed_save_item, print_task_list, print_certificate

urlpatterns = patterns('',
	url(r'^public_form/$', views.public_form, name='public_form'),
	url(r'^public_view_person/$', views.public_view_person, name='public_view_person'),
	url(r'^public_view_project/$', views.public_view_project, name='public_view_project'),
	url(r'^public_view_company/$', views.public_view_company, name='public_view_company'),
	url(r'^self_employed_save_item/(?P<person_id>\d+)/(?P<address_id>\d+)/(?P<id>\d+)/(?P<type>\d+)/$',
	   self_employed_save_item,
	   name='self_employed_save_item'),
	url(r'^print_task_list/(?P<icse>\d+)/$', views.print_task_list, name='print_task_list'),
	url(r'^print_certificate/(?P<icse>\d+)/(?P<type>\d+)/(?P<cooperative>\w+)/$', views.print_certificate, name='print_certificate'),
)