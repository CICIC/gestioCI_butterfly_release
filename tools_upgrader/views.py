#encoding=utf-8
from xhtml2pdf import pisa
import cStringIO as StringIO
import cgi
import os
from django.template import RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse
from Config.settings import PDF_IMAGES_DIR 

def _fix_pdf_links(uri, rel):
	'''
	Callback function that convert links on the source html to absolute
	paths on the local filesystem. This implementation is temporary and
	it does not take into account actual links that are expected to be
	interactive in the resulting PDF. It will take care of embedded
	resources (i.e. images) and break other kind of URL's (e.g. a href)
	'''
	t = uri.split('/')
	if len(t)>1: t = t[-1] # discard the full path; keep just the resource name
	return os.path.join(PDF_IMAGES_DIR, t)

def render_pdf(html, request):
	result = StringIO.StringIO()
	pdf = pisa.pisaDocument(StringIO.StringIO(html.encode("utf-8")), result, link_callback=_fix_pdf_links)
	try:
		pdf = pisa.pisaDocument(StringIO.StringIO(html), result, link_callback=_fix_pdf_links)
	except:
		try:
			pdf = pisa.pisaDocument(StringIO.StringIO(html.encode("utf-8")), result, link_callback=_fix_pdf_links)
		except:
			try:
				pdf = pisa.pisaDocument(StringIO.StringIO(html.decode("utf-8")), result, link_callback=_fix_pdf_links)
			except Exception as e:
				pdf = pisa.pisaDocument(StringIO.StringIO("Cannot render pdf %s" % (e.message())), result, link_callback=_fix_pdf_links)

	if not pdf.err:
		return HttpResponse(result.getvalue(), content_type='application/pdf')
	return HttpResponse(_(u'Error al generar el PDF: %s') % cgi.escape(html))
