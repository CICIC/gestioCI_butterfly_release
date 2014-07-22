import csv
from django.http import HttpResponse
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.utils.encoding import force_unicode
def export_as_csv_action(description="Export selected objects as CSV file", fields=None, exclude=None, header=True, force_fields=None):
	"""
	This function returns an export csv action
	'fields' and 'exclude' work like in django ModelForm
	'header' is whether or not to output the column names as the first row
	if 'force_field' is True, you can give as a list of string whatever django admin can read in display_list
	else it will check if the fields are in the model and reduce the list
	"""
	def export_as_csv(modeladmin, request, queryset):
		"""
		Generic csv export admin action.
		based on http://djangosnippets.org/snippets/2020/
		extended for being able to give list_display as fields and work with admin-defined functions
		"""
		opts = modeladmin.model._meta
		if not force_fields:
			field_names = set([field for field in opts.fields])
			if fields:
				fieldset = set(fields)
				field_names = field_names & fieldset
		elif fields:
			field_names = fields
		else:
			raise("option force_fields can only be used in parallel with option fields")

		if exclude:
			excludeset = set(exclude)
			field_names = field_names - excludeset

		response = HttpResponse(mimetype='text/csv')
		response['Content-Disposition'] = 'attachment; filename=%s.csv' % unicode(opts).replace('.', '_')

		writer = csv.writer(response)

		if header:
			headers = []
			for field in field_names:
				
				try:
					headers.append(modeladmin.model._meta.get_field(field).verbose_name.encode('utf-8'))
				except:
					try:
						headers.append(getattr(getattr(modeladmin.model, field), 'short_description').encode('utf-8'))
					except:
						headers.append(getattr(getattr(modeladmin, field), 'short_description').encode('utf-8'))
			writer.writerow(headers)

		for obj in queryset:
			row = []
			for field in field_names:
				try:
					valor = modeladmin.model._meta.get_field(field).verbose_name
					row.append(unicode(getattr(obj,field)).encode('utf-8'))
				except:
					try:
						row.append(unicode(getattr(modeladmin.model, field)(obj)).encode('utf-8'))
					except:
						row.append(unicode(getattr(modeladmin, field)(obj)).encode('utf-8'))
			writer.writerow(row)
		return response
	export_as_csv.short_description = description
	return export_as_csv


# example usage:
