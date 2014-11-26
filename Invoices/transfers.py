from django.db import model

class SalesInvoiceTransact( SalesInvoices )
	def status (self):
		Commited = False
		movements = SaleMovements.objects.filter(invoice = self.id)
		for movement in movements:
			Commited = Commited and movement.satus == 1
		Status =  (
			(0, _(u'Transferència pendent.')),
			(1, _(u'Transferència recibida.')),
		)
		return Status[Commited]
	def date ( self):
		if self.status == 1:
			movement = SaleMovements.objects.get(invoice = self.id)
			return movement.execution_date
		else:
			return null
class PurchaseInvoiceTransact( PurchaseInvoices )
	outdated_date =  = models.DateField(verbose_name=_(u"Data de realització"), help_text=_(u"La data en que s'accepta. Exemple dd/mm/aaaa"))
	def status (self):
		if datetime(datetime.now()) < self.outdated_date:
			return Status[2]
		else:
			Commited = False
			movements = PurchaseMovements.objects.filter(invoice = self.id)
			for movement in movements:
				Commited = Commited and movement.satus == 1
			Status =  (
				(2, _(u'Esperant data de venciment')),
				(0, _(u'Pendent de fer transferència')),
				(1, _(u'Transferencia realizada')),
			)
			return Status[Commited]
	def date ( self):
		if self.status == 1:
			movement = PurchaseMovements.objects.get(invoice = self.id)
			return movement.execution_date
		else:
			return null
class PurchaseInvoiceTransactAdmin( ModelAdmin )
	model = PurchaseInvoiceTransact
	list_filter = ('period', )
    display_list = ('provider', 'iban', value, date, status)
	Inlines = (PurchaseMovements)
	def iban (self):
		if self.provider:
			providertrans.objects.get(provider = self.provider).iban
class SalesInvoiceTransactAdmin ( ModelAdmin )
	model = SalesInvoiceTransact
	list_filter = ('period', )
	display_list = ('provider', 'iban', value, date, status)
	Inlines = (SalesMovements)
	
	
	
#model PurchaseInvoice
payment_method = option in payment_methods
outdated = date
iban = provider.iban

class ProviderTrans( Provider ):
	provider =  models.ForeignKey(provider, null=False, blank=False, verbose_name=_(u"Proveedor"))
	iban =  models.CharField(verbose_name=_(u"CCC"), max_length=20, help_text=_(u"CCC"))



class balance ( ModelAdmin )
	model = period
	list_filter = ('period', )
	inlines = ( SalesInvoicesTransactAdmin, PurchaseInvoicesTransactAdmin)

class balance_total ( ModelAdmin )
	model = period
	list_filter = ('period', )
	display_list = ('cooper', Sales_total', 'Purchase_total', 'Sales_movements_total' 'Purchase_movements_total')

	def Sales_total (self):
		return SalesInvoice.object.aggregate(Sum(period = self.period))
	def Purchase_total (self):
		return PurchasesInvoice.object.aggregate(Sum(period = self.period))
	def Sales_total (self):
		return SalesInvoice.object.aggregate(Sum(period = self.period))
	def Purchase_total (self):
		return PurchasesInvoice.object.aggregate(Sum(period = self.period))
	def Sales_movements_total (self):
		return SalesMovements.object.aggregate(Sum(invoice__period = self.period))
	def Purchase_movements_total (self):
		return PurchaseMovements.object.aggregate(Sum(invoice__period = self.period))
