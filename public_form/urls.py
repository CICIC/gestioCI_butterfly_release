from django.conf.urls import *
from public_form.views import create_membership, wait_membership, activate_membership

urlpatterns = patterns('',
	url(r'^(?P<record_type_id>\d+)/$',
	   create_membership,
	   name='create_membership'),
	url(r'^$',
	   create_membership,
	   name='create_membership'),
	url(r'^wait/(?P<user_id>\w+)/$',
	   wait_membership,
	   name='wait_membership'),
	url(r'^activate/(?P<activation_key>\w+)/$',
	   activate_membership,
	   name='activate_membership'),
	)

