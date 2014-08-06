#encoding=utf-8

from django.conf.urls import patterns, include, url
from Welcome import views

urlpatterns = patterns('',
	url(r'^public_form/$', views.public_form, name='public_form'),
	url(r'^public_view_person/$', views.public_view_person, name='public_view_person'),
	url(r'^public_view_project/$', views.public_view_project, name='public_view_project'),
	url(r'^public_view_company/$', views.public_view_company, name='public_view_company'),
)