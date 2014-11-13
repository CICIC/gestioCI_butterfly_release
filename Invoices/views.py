from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.views import generic
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy

from django.contrib.auth.decorators import login_required

from django.shortcuts import render
from django.shortcuts import get_object_or_404

from Invoices.models import SalesInvoice
from Invoices.models import PurchaseInvoice

from django import forms
from django.forms import extras
from django.forms.extras.widgets import SelectDateWidget

#>>>>>>>import export

def make_custom_datefield(f):
        formfield = f.formfield()
        if isinstance(f, models.DateField):
                formfield.widget.format = '%m/%d/%Y'
                formfield.widget.attrs.update({'class':'datePicker', 'readonly':'true'})
        return formfield

def manageSalesInvoices(request, invoice_id):
#	try:
#		salesinvoice = SalesInvoice.objects.get(pk=invoice_id)
#	except SalesInvoice.DoesNotExist:
#		raise Http404
	salesinvoice = get_object_or_404(SalesInvoice, pk=invoice_id)
	return render(request, 'Invoices/SalesInvoice.html', {'salesinvoice': salesinvoice})

#def exportLittleBig_Sales(request, invoice_id):
#def exportLittleBig_Purchase (request, invoice_id):
#def exportLittleFat_Sales(request, period_id):
#	try:
#		salesinvoice = SalesInvoice.objects.get(pk=invoice_id)
#	except SalesInvoice.DoesNotExist:
#		raise Http404
#	LittleFat_Sales = SalesInvoice.objects.filter(period = period_id).order_by('date')        	
#	export_init ( LittleFat_Sales, "1tablittlefat.csv" )


def managePurchaseInvoices(request, invoice_id):
#        try:
#                purchaseinvoice = PurchaseInvoice.objects.get(pk=invoice_id)
#        except PurchaseInvoice.DoesNotExist:
#                raise Http404
	purchaseinvoice = get_object_or_404(PurchaseInvoice, pk=invoice_id)
        return render(request, 'Invoices/PurchaseInvoice.html', {'purchaseinvoice': purchaseinvoice})

#@login_required
def index(request):
        #latest_salesinvoices_list = SalesInvoice.objects.filter(user=request.user).order_by('date')[:5]
	if request.user.is_authenticated():
	       	latest_salesinvoices_list = SalesInvoice.objects.filter(user=request.user).order_by('date')[:5]
        	output = ','.join([p.number for p in latest_salesinvoices_list])

		latest_purchaseinvoices_list = PurchaseInvoice.objects.filter(user=request.user).order_by('date')[:5]
        	output = ','.join([p.number for p in latest_purchaseinvoices_list])

		context = {'latest_salesinvoices_list': latest_salesinvoices_list, 
				'latest_purchaseinvoices_list': latest_purchaseinvoices_list}
     	#latest_purchaseinvoices_list = PurchaseInvoice.objects.order_by('date')[:5]
        #output = ','.join([q.number for q in latest_purchaseinvoices_list])

        #template = loader.get_template('Invoices/index.html')
        #context = RequestContext(request, {
        #                'latest_salesinvoices_list': latest_salesinvoices_list,
	#		'latest_purchaseinvoices_list': latests_salesinvoices_list,
        #                })
        #/return HttpResponse(template.render(context))
#        context = {'latest_salesinvoices_list': latest_salesinvoices_list}#, 
		  # 'latest_purchaseinvoices_list': latest_purchaseinvoices_list}
		return render(request, 'Invoices/index.html', context)
	return render(request, 'Invoices/index.html', '')

class SalesInvoicesView(generic.DetailView):
        model = SalesInvoice
        template_name = 'Invoices/SalesInvoice.html'
class SalesInvoicesCreate(CreateView):
	model = SalesInvoice
	fields = ['number', 'date', 'client', 'value', 'percentInvoicedVAT',  'percentAssignedVAT']
	date = forms.DateField(widget=extras.SelectDateWidget)
	template_name = 'Invoices/SalesInvoiceCreate.html'
class SalesInvoicesUpdate(UpdateView):
        model = SalesInvoice
        fields = ['number', 'date', 'client', 'value', 'percentInvoicedVAT',  'percentAssignedVAT']
	template_name = 'Invoices/SalesInvoiceUpdate.html'
	date = forms.DateField(widget=extras.SelectDateWidget)
	def make_custom_datefield(f):
        	formfield = f.formfield()
        	if isinstance(f, models.DateField):
                	formfield.widget.format = '%m/%d/%Y'
                	formfield.widget.attrs.update({'class':'datePicker', 'readonly':'true'})
        	return formfield
	#template_name_suffix = '_update_form'
class SalesInvoicesDelete(DeleteView):
        model = SalesInvoice
	template_name = 'Invoices/SalesInvoiceDelete.html'
	success_url = reverse_lazy('SalesInvoices')


class PurchaseInvoicesView(generic.DetailView):
        model = PurchaseInvoice
        template_name = 'Invoices/PurchaseInvoice.html'
class PurchaseInvoicesCreate(CreateView):
	model = PurchaseInvoice
	fields = ['number', 'date', 'client', 'value', 'percentInvoicedVAT',  'percentAssignedVAT']
	date = forms.DateField(widget=extras.SelectDateWidget)
	template_name = 'Invoices/PurchaseInvoiceCreate.html'
class PurchaseInvoicesUpdate(UpdateView):
        model = PurchaseInvoice
        fields = ['number', 'date', 'client', 'value', 'percentInvoicedVAT',  'percentAssignedVAT']
	template_name = 'Invoices/PurchaseInvoiceUpdate.html'
	date = forms.DateField(widget=extras.SelectDateWidget)
	def make_custom_datefield(f):
        	formfield = f.formfield()
        	if isinstance(f, models.DateField):
                	formfield.widget.format = '%m/%d/%Y'
                	formfield.widget.attrs.update({'class':'datePicker', 'readonly':'true'})
        	return formfield
	#template_name_suffix = '_update_form'
class PurchaseInvoicesDelete(DeleteView):
        model = PurchaseInvoice
	template_name = 'Invoices/PurchaseInvoiceDelete.html'
	success_url = reverse_lazy('PurchaseInvoices')


















