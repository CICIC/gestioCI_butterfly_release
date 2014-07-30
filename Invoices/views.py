#encoding=utf-8
from django.http import HttpResponse
from django.template.loader import render_to_string
from django.contrib.auth.decorators import login_required

@login_required
def print_period_close(request, period_close_id):

	from Invoices.models import period_close
	from Invoices.admin import period_close_user
	from Invoices.forms import period_close_form

	period_close = period_close.objects.get(pk=period_close_id)
	#set some default values
	period_close_form.is_new = False
	period_close_form.obj = period_close
	period_close_form.request = request
	from django.utils.translation import ugettext_lazy as _
	#set fields
	period_close_form.fieldsets = (
		({'name': _(u'Període')}, {'fields': (('period',),('cooper',)) }),
		({'name': _('Emeses')}, {'fields': (('sales_base', 'sales_invoiced_vat'), ('sales_total', 'sales_assigned_vat'))}),
		({'name': _('Despeses')}, {'fields': (('purchases_base', 'purchases_vat'), ('purchases_total', 'purchases_irpf'))}),
		({'name': _('Seleccio IVA')}, { 'fields': (('oficial_vat_total', 'assigned_vat_total'), ('vat_type',)) }),
		({'name': _('Estalvi')}, {'fields': (('savings_with_assigned_vat', 'savings_with_assigned_vat_donation'),)}),
		({'name': _('Aportacio a la CIC')}, {'fields': (('donation',),)}),
		({'name': _('Total impostos')}, {'fields': (('total_vat', 'total_irpf'),)}),
		({'name': _('Quota Trimestral')}, {'fields': (('period_tax', 'advanced_tax' ),)}),
		({'name': _('Totals')}, {'fields': (('total', 'total_to_pay'),)}),
	)
	from Invoices.models import period_close_base_fields
	period_close_form.current_fields = period_close_base_fields
	html = render_to_string( 'admin/Invoices/period_close/print_form.html', {'adminform': period_close_form})
	return render_pdf(html)



import ho.pisa as pisa
import cStringIO as StringIO
import cgi
from django.template import RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse

def render_pdf(html):
	result = StringIO.StringIO()
	pdf = pisa.pisaDocument(StringIO.StringIO(html.encode("utf-8")), result)
	if not pdf.err:
		return HttpResponse(result.getvalue(), mimetype='application/pdf')
	return HttpResponse(_(u'Error al generar el PDF: %s') % cgi.escape(html))

