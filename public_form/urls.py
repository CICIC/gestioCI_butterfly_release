from django.conf.urls import *
from public_form.views import entry_page_to_gestioCI, create_membership, wait_membership, activate_membership

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
	url(r'^entry_page_to_gestioCI/$',
	   entry_page_to_gestioCI,
	   name='entry_page_to_gestioci'),
	)

