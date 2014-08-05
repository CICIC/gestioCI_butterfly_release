#encoding=utf-8

from django.conf.urls import patterns, include, url
from Welcome import views

urlpatterns = patterns('',
	url(r'^public_form/$', views.public_form, name='public_form'),
)