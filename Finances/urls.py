from django.conf.urls import patterns, include, url
from Finances import views
urlpatterns = patterns('',
url(r'^print/(?P<period_close_id>\d+)/$', views.print_period_close, name='print'),
)