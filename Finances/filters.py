#encoding=utf-8
from django.contrib.admin import SimpleListFilter
from django.utils.translation import ugettext_lazy as _
from Finances.models import *
#
#Use this in like => list_filter = (onlyownedFilter,)
class onlyownedFilter(SimpleListFilter):
	# Human-readable title which will be displayed in the
	# right admin sidebar just above the filter options.
	title = _(u'Hola usuari')

	# Parameter for the filter that will be used in the URL query.
	parameter_name = 'onlyowned'

	def lookups(self, request, model_admin):
		return (
			('Mine', _(u'les meves factures')),
		)

	def queryset(self, request, queryset):
	# Compare the requested value (either '80s' or '90s')
	# to decide how to filter the queryset.
		if self.value() == 'Mine':
			return queryset.filter(user=request.user)
#
#Use this in a ModelAdmin.list_filter property
class First_Period_Filter (SimpleListFilter):
	title = _(u'primer període')
	parameter_name = 'first_period'

	def lookups(self, request, model_admin):
		qs_periods = iCf_Period.objects.all()
		yFilters = ()
		for ob_period in qs_periods:
			yFilters = yFilters + ((ob_period.id, ob_period),)
		return yFilters

	def queryset(self, request, queryset):
		if self.value():
			qs_period = iCf_Period.objects.get( id = self.value() )
			qs = queryset.filter ( icf_self_employed__user__date_joined__gt = qs_period.first_day, icf_self_employed__user__date_joined__lt = qs_period.date_close )
			return qs

		return queryset
#
#Use this in a ModelAdmin.list_filter property
class Closing_Filter (SimpleListFilter):
	title = _(u'Resultats (Selecciona avanç un Període)')
	parameter_name = 'closing'

	def lookups(self, request, model_admin):
		return (
			('1', _('Socis que han tancat')),
			('2', _('Socis que han creat el registre pero no han tancat')),
			('3', _('Socis que no han creat el registre')),
		)

	def queryset(self, request, queryset):
		if request.GET.has_key('first_period'):
			id_period = request.GET['first_period']
			if self.value() == '1':
				qs = queryset.filter( icf_self_employed__period_close__period_id = id_period, icf_self_employed__period_close__closed = True )
				return qs
			if self.value() == '2':
				qs = queryset.filter( icf_self_employed__period_close__period_id = id_period, icf_self_employed__period_close__closed = False )
				return qs
			if self.value() == '3':
				qs = queryset.exclude( icf_self_employed__period_close__period_id = id_period )
				return qs
#