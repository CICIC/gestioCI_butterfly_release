from django.conf.urls import patterns, url
from Invoices import views

urlpatterns = patterns('',
url(r'^index', views.index, name='index'),
url(r'^manageSalesInvoices/(?P<invoice_id>\d+)/$', views.manageSalesInvoices, name='manageSalesInvoices'),
url(r'^managePurchaseInvoices/(?P<invoice_id>\d+)/$', views.managePurchaseInvoices, name='managePurchaseInvoices'),

url(r'^SalesInvoicesViews/(?P<pk>\d+)', views.SalesInvoicesView.as_view(), name='SalesInvoicesView'),
url(r'^PurchaseInvoicesViews/(?P<pk>\d+)/$', views.PurchaseInvoicesView.as_view(), name='PurchaseInvoicesView'),

url(r'^SalesInvoicesCreate/', views.SalesInvoicesCreate.as_view(), name='SalesInvoicesCreate'),
url(r'^SalesInvoicesUpdate/(?P<pk>\d+)', views.SalesInvoicesUpdate.as_view(), name='SalesInvoicesUpdate'),
url(r'^SalesInvoicesDelete/(?P<pk>\d+)', views.SalesInvoicesDelete.as_view(), name='SalesInvoicesDelete'),
#	url(r'^exportSalesInvoices/(?P<period_id>\d+)/$', views.manageSalesInvoices, name='exportSalesInvoices')
)


