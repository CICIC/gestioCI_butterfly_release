#encoding=utf-8
from django.db import models
from django.contrib import messages
from mptt.models import MPTTModel
from mptt.fields import TreeForeignKey, TreeManyToManyField
from datetime import date, timedelta

from datetime import datetime
from django.utils.translation import ugettext_lazy as _
from django.utils.translation import gettext as __
from decimal import Decimal

from General.models import *

from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
#from General.models import Record, Human, Person, Project, Relation

a_strG = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/admin/General/"
a_strW = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/admin/Welcome/"
a_strWC = "<a onclick='return showRelatedObjectLookupPopup(this);' href='/cooper/Welcome/"
#a_str2 = "?_popup=1&_changelist_filters=_popup=1&t=human' target='_blank' style='margin-left:-100px'>"
#a_str2 = "?_popup=1&_changelist_filters=_popup=1' target='_blank' style='margin-left:-100px'>"
a_str2 = "' target='_blank' style='margin-left:-100px'>"
a_str3 = "' target='_blank'>"

add_pers = 'add Persona'#_(u"Nova Persona")
add_proj = 'add Project'#_(u"Nou Projecte")
a_edit = '<b>Editar</b>'

str_remove = __(u"treu") #_(u"treu")
ul_tag = '<ul>'
ul_tag1 = '<ul style="margin-left:-10em;">'
ul_tag_err = "<ul class='error'>"

ico_no = "<img src='/static/admin/img/icon-no.gif' alt='False'>"
ico_yes = "<img src='/static/admin/img/icon-yes.gif' alt='True'>"

str_addfee = "crea Quota d'alta"
str_valid = "valida"
str_payed = "pagada"



'''
@app.route('/update_fnk', method=["POST"])
def update_fnk(self, **data):
		print 'JEELOW'
		print str(self)
		print str(data)
		ret_val = 'JOOL'

		return jsonify({"update_fnk", ret_val})
'''

def erase_id_link(field, id):
	out = '<a class="erase_id_on_box" name="'+str(field)+','+str(id)+'" href="javascript:;">'+str_remove+'</a>'
	return out

def show_thumbnail(img):
	print 'IMG: '+str(img)
	#print 'HEIGHT: '+str(img.height)
	#print 'WIDTH: '+str(img.width)
	#for im in img:
	#	print str(im)#+' = '#+img[im]

	url = img.image
	out = '<img src="/media/'+str(url)+'" height="50" >'
	return out

# Create your models here.

class iC_Record(Artwork):	# create own ID's
	record_type = TreeForeignKey('iC_Record_Type', blank=True, null=True, verbose_name=_(u"Tipus de Registre CI"))
	class Meta:
		verbose_name= _(u'Registre CI')
		verbose_name_plural= _(u'o- Registres CI')
	def __unicode__(self):
		if self.record_type is None or self.record_type == '':
			return self.name
		elif self.name is None or self.name == '':
			return self.record_type.name+': ??'
		else:
			return self.name
	def _selflink(self):
		if self.id:
				return a_strG + "ic_record/" + str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
		else:
				return "Not present"
	_selflink.allow_tags = True

	def __init__(self, *args, **kwargs):
		super(iC_Record, self).__init__(*args, **kwargs)

		#if not 'rel_tit' in globals():
		#	rel_tit = Relation.objects.get(clas='holder')


class iC_Type(Concept):	# create own ID's
	clas = models.CharField(blank=True, verbose_name=_(u"Clase"), max_length=200, help_text=_(u"Model de django o classe python associada al Tipus CI"))
	class Meta:
		verbose_name = _(u"c- Tipus CI")

	def __unicode__(self):
		if self.clas is None or self.clas == '':
			if self:
				return self.name
			else:
				return "iC_Type vacio"
		else:
			return self.name+' ('+self.clas+')'


class iC_Record_Type(iC_Type):
	ic_type = models.OneToOneField('iC_Type', primary_key=True, parent_link=True)
	class Meta:
		verbose_name= _(u'Tipus de Registre CI')
		verbose_name_plural= _(u'c-> Tipus de Registres CI')




class Fee(iC_Record):
	ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
	human = models.ForeignKey('General.Human', related_name='out_fees', verbose_name=_(u"Ens pagador"))
	project = TreeForeignKey('General.Project', related_name='in_fees', verbose_name=_(u"Projecte receptor"))
	amount = models.DecimalField(default=0, max_digits=6, decimal_places=2, verbose_name=_(u"Import"))
	unit = models.ForeignKey('General.Unit', verbose_name=_(u"Unitat"))
	#ic_membership = models.ForeignKey('iC_Membership', related_name='fees', blank=True, null=True, verbose_name=_(u"Registre de Soci"))
	def _ic_membership(self):
		#print 'ic_MEMBERSHIP'
		#print self.membership.all()
		if hasattr(self, 'membership') and self.membership:
			return self.membership.first()
		else:
			return 'none'
	_ic_membership.allow_tags = True
	_ic_membership.short_description = _(u"Registre de Soci")
	def _ic_selfemployed(self):
		#print 'ic_SELFEMPLOYED'
		if hasattr(self, 'selfemployed'):
			#print self.selfemployed.all()
			return self.selfemployed.first()
		else:
			return 'none'
	_ic_selfemployed.allow_tags = True
	_ic_selfemployed.short_description = _(u"Registre d'Autoocupat")

	issue_date = models.DateField(default=datetime.today, blank=True, null=True, verbose_name=_(u"Data d'emisió"))
	deadline_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de venciment"))
	payment_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de pagament"))
	payment_type = TreeForeignKey('Payment_Type', blank=True, null=True, verbose_name=_(u"Forma de pagament"))

	rel_account = models.ForeignKey('General.Record', related_name='rel_fees', blank=True, null=True,
																	limit_choices_to={'record_type__parent__clas':'account'}, verbose_name=_(u"Compte relacionat"))

	def __unicode__(self):
		if self.record_type is None:
			#record_type = "<record:type.name>"
			return 'Fee ??: '+self.human.__unicode__()+' ['+str(self.amount)+' '+self.unit.code+']'
		else:
			record_type = self.record_type.name
		return record_type +': '+self.human.__unicode__()+' ['+str(self.amount)+' '+self.unit.code+']'#' > '+self.project.nickname

	class Meta:
		verbose_name = _(u"Quota")
		verbose_name_plural = _(u"r- Quotes")

	def _is_payed(self):
		if self.payment_date is None or self.payment_date == '':
			return False
		else:
			return True
	_is_payed.boolean = True
	_is_payed.short_description = _(u"Pagada?")
	payed = property(_is_payed)

	def __init__(self, *args, **kwargs):
		super(Fee, self).__init__(*args, **kwargs)
		if not hasattr(self, 'project') or self.project is None or self.project == '':
			self.project = Project.objects.get(nickname='CIC')	# if empty, put generic ic_record_type for project membership
		#print 'INIT'
		#print args
		#print kwargs
		if hasattr(self, 'record_type') and self.record_type is not None:
			if self.record_type.clas.startswith('(') and self.unit is not None:
				#pass
				#print 'Fee INIT: has record_type, call _auto_amount()'
				self._auto_amount()

	def _auto_amount(self):
		if self.record_type.clas.startswith('(') and self.unit is not None:

			arr = self.record_type.clas.split(' ')[0].strip('()').split('_')
			if arr[0].isdigit():
				uni = Unit.objects.filter(code=arr[1])
				if uni.count() == 1:
					eqi = UnitRatio.objects.filter(in_unit=uni.first(), out_unit=self.unit)
					rate = 1
					if eqi.count() == 0:
						#print uni.first()
						#print self.unit
						if uni.first() == self.unit:
							#print '_AUTO_AMOUNT: equal!'
							pass
						else:
							print '_AUTO_AMOUNT: not equal'
							eqi2 = UnitRatio.objects.filter(in_unit=self.unit)
							#print '_AUTO_AMOUNT: eqi2: '+str(eqi2)
							#print '_AUTO_AMOUNT: eqi2.first '+str(eqi2.first().out_unit.name)
							eqi3 = UnitRatio.objects.filter(in_unit=uni.first(), out_unit=eqi2.first().out_unit)
							#print '_AUTO_AMOUNT: eqi3: '+str(eqi3)
							rate2 = eqi3.first().rate
							print '_AUTO_AMOUNT: rate2: '+str(rate2)
							rate = (1/eqi2.first().rate)*rate2
					elif eqi.count() == 1:
						rate = eqi.first().rate
					else:
						print '_AUTO_AMOUNT: eqi ??: '+str(eqi)
					val = float(arr[0])/float(rate)
					setattr(self, 'amount', val)
					#print '_AUTO_AMOUNT: tudo bem, val='+str(val)+' rate='+str(rate)
					return True # if bool breaks the init, put 'return' alone...
				else:
					print '_AUTO_AMOUNT: uni.count != 1 !!? '+str(uni)
					return None
			print '_AUTO_AMOUNT: arr[0] not digit! '+str(arr[0])
			return None
		return None
	_auto_amount.boolean = True
	_auto_amount.short_description = _(u"Auto import!")

	def _erase_account(self):
		if hasattr(self, 'rel_account'):
			return erase_id_link('rel_account', self.rel_account.id)
		return False
	_erase_account.allow_tags = True
	_erase_account.short_description = ''

	def _min_fee_data(self):
		out = ul_tag_err
		#print 'MIN_FEE_DATA: '+str(self)
		if not hasattr(self, 'payment_date') or self.payment_type is None or self.payment_type == '':
			out += "<li>Falta la forma de pagament.</li>"
		if not hasattr(self, 'issue_date') or self.issue_date is None:
			out += "<li>Falta la data d'emisió.</li>"
		if not hasattr(self, 'deadline_date') or self.deadline_date is None:
			out += "<li>Falta la data de venciment.</li>"
		if not hasattr(self, 'amount') or self.amount is None or self.amount == '':
			out += "<li>Falta l'import.</li>"

		if out == ul_tag_err:
			return ico_yes
		#print 'OUT: '+out
		return out+"<li>"+ico_no+"</li></ul>"
	_min_fee_data.allow_tags = True
	_min_fee_data.short_description = ''

	def _selflink(self):
		if self.id:
			return a_strW + "fee/" + str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
		else:
			return "Not present"
	_selflink.allow_tags = True
	_selflink.short_description = ''



class Payment_Type(iC_Type):
	ic_type = models.OneToOneField('iC_Type', primary_key=True, parent_link=True)
	class Meta:
		verbose_name = _(u"Forma de pagament")
		verbose_name_plural = _(u"c-> Formes de pagament")



#-------	A L T E S	 S O C I S

class iC_Akin_Membership(iC_Record):
	ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
	person = models.OneToOneField('General.Person', verbose_name=_(u"Persona, membre afí"))
	ic_project = TreeForeignKey('General.Project', related_name='akin_memberships', verbose_name=_(u"Cooperativa Integral"))
	ic_company = models.ForeignKey('General.Company', blank=True, null=True, related_name='akin_memberships', verbose_name=_(u"entitat legal"))

	ic_membership = models.ForeignKey('iC_Membership', blank=True, null=True, related_name='akin_memberships', verbose_name=_(u"vinculada al Projecte Soci"))
	join_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'Alta"))
	end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de Baixa"))

	def _has_id_card(self):
		if self.person.id_card is None or self.person.id_card == '':
			return False
		else:
			return True
	_has_id_card.boolean = True
	_has_id_card.short_description = _(u"Dni/Nie?")
	has_id_card = property(_has_id_card)

	def __unicode__(self):
		if self.record_type is None or self.record_type == '':
			return self.ic_project.nickname+' > '+self.person.__unicode__()
		else:
			return self.record_type.name+': '+self.person.__unicode__()
	def __init__(self, *args, **kwargs):
		super(iC_Akin_Membership, self).__init__(*args, **kwargs)
		self.record_type = iC_Record_Type.objects.get(clas='iC_Akin_Membership')	# there's only one ic_record_type for this kind of member
		if not hasattr(self, 'ic_project') or self.ic_project is None:
			self.ic_project = Project.objects.get(nickname='CIC')

	class Meta:
		verbose_name = _(u"Alta de Soci Afí CI")
		verbose_name_plural = _(u"- Altes de Socis Afins CI")

	def _person_link(self):
		if hasattr(self, 'person'):
			return self.person._selflink()
		else:
			return str_none
			lnk1 = a_strG + "person/add/" + a_str2 + add_pers + "</a>"
			return lnk1
	_person_link.allow_tags = True
	_person_link.short_description = ''


class iC_Membership(iC_Record):
	ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
	human = models.ForeignKey('General.Human', verbose_name=_(u"Ens Soci"))
	ic_project = TreeForeignKey('General.Project', related_name='memberships', verbose_name=_(u"Cooperativa Integral"))
	ic_company = models.ForeignKey('General.Company', blank=True, null=True, related_name='memberships', verbose_name=_(u"entitat legal"))

	contribution = TreeForeignKey('General.Relation', blank=True, null=True, verbose_name=_(u"Tipus de contribució"))
	join_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'Alta"))
	end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de Baixa"))
	join_fee = models.ForeignKey('Fee', blank=True, null=True, related_name="membership", verbose_name=_(u"Cuota d'alta"))

	ic_CESnum = models.CharField(max_length=8, blank=True, null=True, verbose_name=_(u"Numero al CES/iCES"))

	virtual_market = models.BooleanField(default=False, verbose_name=_(u"Mercat Virtual?"))
	expositors = models.ManyToManyField('General.Address', blank=True, null=True, verbose_name=_(u"Expositors"))

	def __unicode__(self):
		if self.record_type is None or self.record_type == '':
			if self.ic_CESnum is None or self.ic_CESnum == '':
				return self.ic_project.nickname+' (!record_type) > '+self.human.__unicode__()
			return self.ic_CESnum+' ('+self.human.nickname+') !record_type'
		else:
			if self.human:
				if self.ic_CESnum is None or self.ic_CESnum == '':
					return self.record_type.name+': '+self.human.__unicode__()
				return self.ic_CESnum+' ('+self.human.nickname+')'
			else:
				return self.record_type+': ??'

	class Meta:
		verbose_name = _(u"Alta de Soci CI")
		verbose_name_plural = _(u"r-> Altes de Socis CI (tots menys afins)")

	def _join_fee_payed(self):
		if self.join_fee:
			return self.join_fee.payed
		return None
	_join_fee_payed.boolean = True
	_join_fee_payed.short_description = _(u"Quota d'Alta Pagada?")
	joinfee_payed = property(_join_fee_payed)

	def _human_link(self):
		if hasattr(self, 'human'):
			return self.human._selflink()
		else:
			return str_none
			lnk1 = a_strG + "person/add/" + a_str2 + add_pers + "</a>"
			lnk2 = a_strG + "project/add/" + a_str3 + add_proj + "</a>"
			return lnk1+' / '+lnk2
	_human_link.allow_tags = True
	_human_link.short_description = ''

	def _joinfee_link(self):
		if hasattr(self, 'join_fee') and self.join_fee is not None:
			if self.join_fee._min_fee_data() == ico_yes:
				return self.join_fee._selflink()+' &nbsp; '+ico_yes
			else:
				return self.join_fee._selflink()+' &nbsp; '+ico_no
		else:
			return str_none
			#lnk = a_strW + "fee/add/?"+args+"record_type="+str(uid)+"&human="+str(self.human.id)+'&unit='+str(eur.id)+"&amount="+arr[0] + a_str2 + str_addfee +"</a>"
			#return lnk
			#return self.join_fee._selflink()

	_joinfee_link.allow_tags = True
	_joinfee_link.short_description = ''

	def _is_selfemployed(self):
		if hasattr(self, 'selfemployed_recs') and self.selfemployed_recs.count() > 0:
			return True
		return False
	_is_selfemployed.boolean = True
	_is_selfemployed.short_description = _(u"AO")
	is_selfemployed = property(_is_selfemployed)

	def _ic_selfemployed_list(self):
		if self._is_selfemployed():
			out = ul_tag
			for rec in self.selfemployed_recs.all():
				out += '<li>'+ a_strW + 'ic_self_employed/'+str(rec.id) + a_str3 + '<b>'+str(rec.name) + '</b></a></li>'
			if out == ul_tag:
				return str_none
			return out+'</ul>'
		return str_none
	_ic_selfemployed_list.allow_tags = True
	_ic_selfemployed_list.short_description = _(u"reg. alta Autoocupat")

	def _expositors_list(self):
		out = ul_tag
		for add in self.expositors.all():
			out += '<li>'+ add.name +' - '+erase_id_link('expositors', add.id)+'</li>'
		if out == ul_tag:
			return str_none
		return out+'</ul>'
	_expositors_list.allow_tags = True
	_expositors_list.short_description = ''

	def _selflink(self):
		if self.id:
			return a_strW + "ic_membership/" + str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
		else:
			return "Not present"
	_selflink.allow_tags = True
	_selflink.short_description = ''

	def __init__(self, *args, **kwargs):
		super(iC_Membership, self).__init__(*args, **kwargs)
		try:
			if not hasattr(self, 'ic_project') or self.ic_project is None:
				self.ic_project = Project.objects.get(nickname='CIC')
			if not hasattr(self, 'join_fee') or self.join_fee is None:
				if hasattr(self, 'record_type') and self.record_type is not None:
					clas = self.record_type.clas
					#print 'CLAS: '+clas

					if hasattr(self.human, 'person') and self.human.person is not None:
						typ = iC_Record_Type.objects.get(clas__contains='individual')
					elif hasattr(self.human, 'project') and self.human.project is not None:
						print 'PROJ_TYPE: '+str(self.human.project.project_type.parent.clas)
						if self.human.project.project_type.parent.clas == 'online':
							typ = iC_Record_Type.objects.get(clas__contains='collective')
						else:
							print 'Proyecto de un tipo que no esta en la rama clas=online, no generamos quota automàtica...'
							return None
					eur = Unit.objects.get(code='€')
					uid = typ.id
					arr = typ.clas.split(' ')[0].strip('()').split('_')
					#print arr
					#print Fee
					amo = str(arr[0])
					fees = Fee.objects.filter(record_type=typ, human=self.human, unit=eur, amount=amo)
					print 'TYP: '+str(typ)+' HUMAN:'+str(self.human)+' UNIT:'+str(eur)+' AMOUN:'+str(amo)
					#print Fee.objects.get_or_create
					newfee, created = Fee.objects.get_or_create(record_type=typ, human=self.human, unit=eur, amount=amo)
					if created:
						self.join_fee = newfee
						print 'CREATED JOIN_FEE: '+str(self.join_fee)
						self.save()
					else:
						print "ERROR: CAN'T CREATE AUTOMATIC JOIN_FEE! human:"+str(self.human)
		except Exception as e:
			print '%s (%s)' % (e.message, type(e))

class iC_Person_Membership(iC_Membership):
	ic_membership = models.OneToOneField('iC_Membership', primary_key=True, parent_link=True)
	person = models.ForeignKey('General.Person', verbose_name=_(u"Persona Sòcia"))
	labor_contract = models.OneToOneField('iC_Labor_Contract', blank=True, null=True, verbose_name=_(u"Contracte laboral?"))

	class Meta:
		verbose_name = _(u"Alta de Soci Cooperatiu individual CI")
		verbose_name_plural = _(u"- Altes Socis Cooperatius Individuals CI")

	def __init__(self, *args, **kwargs):
		super(iC_Person_Membership, self).__init__(*args, **kwargs)
		self.record_type = iC_Record_Type.objects.get(clas='iC_Person_Membership')	# there's only one ic_record_type for this kind of member

	def _person_link(self):
		if hasattr(self, 'person'):
			return self.person._selflink()
		else:
			return str_none
			lnk1 = a_strG + "person/add/" + a_str2 + add_pers + "</a>"
			return lnk1
	_person_link.allow_tags = True
	_person_link.short_description = ''

	def _selflink(self):
		if self.id:
			return a_strW + "ic_person_membership/"+str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
		else:
			return "Not present"
	_selflink.allow_tags = True
	_selflink.short_description = ''


class iC_Project_Membership(iC_Membership):
	ic_membership = models.OneToOneField('iC_Membership', primary_key=True, parent_link=True)
	project = models.ForeignKey('General.Project', verbose_name=_(u"Projecte Sòci"))
	#person = models.OneToOneField('General.Person', verbose_name=_(u"Persona referencia"))
	class Meta:
		verbose_name = _(u"Alta de Projecte Col·lectiu CI")
		verbose_name_plural = _(u"- Altes Socis Projectes Col·lectius CI")

	#def __unicode__(self):
	#	if self.record_type is None or self.record_type == '':
	#		return self.ic_project.nickname+' > '+self.project.__unicode__()
	#	else:
	#		return self.record_type.name+': '+self.project.__unicode__()
	def __init__(self, *args, **kwargs):
		super(iC_Project_Membership, self).__init__(*args, **kwargs)
		if self.record_type is None or self.record_type == '':
			self.record_type = iC_Record_Type.objects.get(clas='iC_Project_Membership')	# if empty, put generic ic_record_type for project membership

	def _project_link(self):
		if hasattr(self, 'project'):
			return self.project._selflink()
		else:
			return str_none
			lnk1 = a_strG + "project/add/" + a_str2 + add_proj + "</a>"
			return lnk1
	_project_link.allow_tags = True
	_project_link.short_description = ''

	def _selflink(self):
		if self.id:
			return a_strW + "ic_project_membership/" + str(self.id) + a_str2 + a_edit + "</a>"# % str(self.id)
		else:
			return "Not present"
	_selflink.allow_tags = True
	_selflink.short_description = ''



'''
class iC_Membership_Type(iC_Record_Type):
	record_type = models.OneToOneField('iC_Record_Type', primary_key=True, parent_link=True)
	class Meta:
		verbose_name = _(u"Tipus de Soci")
		verbose_name_plural = _(u"c-> Tipus de Socis")
'''


class iC_Self_Employed(iC_Record):

	ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
	ic_membership = models.ForeignKey('iC_Membership', related_name='selfemployed_recs', verbose_name=_(u"Registre de Soci"))

	join_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'Alta autoocupat"))
	end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de Baixa autoocupat"))

	rel_fees = models.ManyToManyField('Fee', related_name='selfemployed', blank=True, null=True,verbose_name=_(u"Quotes trimestrals"))#limit_choices_to={'record_type__parent__clas': 'quarterly_fee'})#human':ic_membership.human.pk})#.self_employed})

	organic = models.BooleanField(default=False, verbose_name=_(u"Productes ecològics/organics?"))
	#welcome_session = models.BooleanField(default=False, verbose_name=_(u"Assistencia sessió d'acollida?"))

	'''
	req_address_contract = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix contractes (lloguer, cessió, etc)?"))
	req_insurance = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix assegurances?"))
	req_licence = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix llicències?"))
	req_images = models.SmallIntegerField(default=0, verbose_name=_(u"Requereix fotos?"))
	'''
	rel_address_contracts = models.ManyToManyField('iC_Address_Contract', related_name="selfemployed", blank=True, null=True, verbose_name=_(u"Contractes d'Adreça vinculats"))
	rel_insurances = models.ManyToManyField('iC_Insurance', related_name="selfemployed", blank=True, null=True, verbose_name=_(u"Assegurances vinculades"))
	rel_licences = models.ManyToManyField('iC_Licence', related_name="selfemployed", blank=True, null=True, verbose_name=_(u"Llicències vinculades"))
	rel_images = models.ManyToManyField('General.Image', related_name="selfemployed", blank=True, null=True, verbose_name=_(u"Imatges requerides"))


	rel_accountBank = models.ForeignKey('General.AccountBank', blank=True, null=True, verbose_name=_(u"Compte bancari CI associat"))
	#socialcoin_session = models.BooleanField(default=False, verbose_name=_(u"Assistencia sessió moneda social?"))

	assigned_vat = models.DecimalField(max_digits=4, decimal_places=2, default=18, blank=True, null=True, verbose_name=_(u"IVA assignat"))
	review_vat = models.BooleanField(default=False, verbose_name=_(u"IVA en revisió?"))
	last_review_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data última revisió IVA"))

	mentor_membership = models.ForeignKey('iC_Membership', related_name='mentor_of_SE', blank=True, null=True, verbose_name=_(u"Mentor projecte"))
	mentor_comment = models.TextField(blank=True, null=True, verbose_name=_(u"Comentaris soci mentor"))
	extra_days=models.IntegerField(blank=True, null=True, verbose_name=_(u"Dies extra"), help_text=_(u"Dies extra que pot editar el trimestre en curs."), max_length=2, default=0)
	def _has_assisted_welcome(self):
		sess = self.ic_membership.human.assist_sessions.filter(record_type__clas='welcome_session')

		if sess.count() > 0:
			return ico_yes  + " " + str(sess.first().datetime.date()) + " " + str(sess.first().name.encode("utf-8"))
		else:
			return ico_no
	_has_assisted_welcome.allow_tags = True
	_has_assisted_welcome.short_description = _(u"Assistencia a l'Acollida?")
	welcome_session = property(_has_assisted_welcome)

	def _has_assisted_socialcoin(self):
		sess = self.ic_membership.human.assist_sessions.filter(record_type__clas='socialcoin_session')
		if sess.count() > 0:
			return ico_yes+' &nbsp;'+str(sess.first().datetime.date())+' ('+str(sess.first().name.encode("utf-8"))+')'
		else:
			return ico_no
	_has_assisted_socialcoin.allow_tags = True
	_has_assisted_socialcoin.short_description = _(u"Assistencia a Moneda Social?")
	socialcoin_session = property(_has_assisted_socialcoin)

	def __unicode__(self):
		if self.record_type is None or self.record_type == '':
			if self.ic_membership.ic_project is None or self.ic_membership.ic_project.nickname == '':
				return '?? > '+self.ic_membership.__unicode__()
			else:
				return self.ic_membership.ic_project.nickname+' > '+self.ic_membership.__unicode__()
		else:
			return self.record_type.name+': '+self.ic_membership.__unicode__()

	class Meta:
		verbose_name = _(u"Alta Proj.Autoocupat")
		verbose_name_plural = _(u"- Altes Proj. Autoocupats")

	def __init__(self, *args, **kwargs):
		super(iC_Self_Employed, self).__init__(*args, **kwargs)
		if self.record_type is None or self.record_type == '':
			self.record_type = iC_Record_Type.objects.get(clas='iC_Self_Employed')

	def _member_link(self):
		if hasattr(self, 'ic_membership') and self.ic_membership.id:
			print 'ID: '+str(self.ic_membership.id)
			slug = 'ic_membership'
			if hasattr(self.ic_membership.human, 'project'):
				#print 'PROJECT! '+str(self.ic_membership.human.project)
				slug = 'ic_project_membership'
			elif hasattr(self.ic_membership.human, 'person'):
				#print 'PERSON! '+str(self.ic_membership.human.person)
				slug = 'ic_person_membership'
			else:
				return slug+'!!'
			out = a_strW + slug + '/' + str(self.ic_membership.id) + a_str2 + a_edit + '</a>'
			return out
		else:
			return "Not present"
	_member_link.allow_tags = True
	_member_link.short_description = ''

	def _human_link(self):
		if hasattr(self.ic_membership, 'human') and self.ic_membership.human.id:
			#print 'HUMAN ID: '+str(self.ic_membership.human.id)
			slug = 'human'
			if hasattr(self.ic_membership.human, 'project'):
				#print 'PROJECT! '+str(self.ic_membership.human.project)
				slug = 'project'
			elif hasattr(self.ic_membership.human, 'person'):
				#print 'PERSON! '+str(self.ic_membership.human.person)
				slug = 'person'
			else:
				return slug+'!!'
			link = a_strG + slug + '/' + str(self.ic_membership.human.id) + a_str3 + a_edit + '</a>'
			out = self.ic_membership.human.__unicode__()
			return '<strong>'+out+'</strong> &nbsp; <- '+link
		else:
			return "Not present"
	_human_link.allow_tags = True
	_human_link.short_description = 'Soci'

	def _rel_fees(self): #= models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
		fees = self.rel_fees.all()
		out = ul_tag
		#print 'N fees: '+str(fees.count())
		if fees.count() > 0:
			for fee in fees:
				print fee
				ico = ico_no
				if fee.payed:
					ico = ico_yes
				fee_dat = fee._min_fee_data()
				if "alt='False'" in fee_dat:
					fee_val = ico_no
				elif "alt='True'" in fee_dat:
					fee_val = ico_yes
				#print fee_val
				out += "<li>"+a_strW +"fee/"+str(fee.id)+a_str3 + "<b>"+fee.__unicode__() +"</b></a>: &nbsp; "+ str_valid+": "+ fee_val +" &nbsp; "+str_payed+": "+ ico+" </li>"
			#print out+'</ul>'
			return out+'</ul>'
		return str_none
	_rel_fees.allow_tags = True
	_rel_fees.short_description = ''#_(u"contractes?")

	def _join_fee(self):
		fee = self.ic_membership.join_fee
		out = ul_tag
		if fee:
			ico = ico_no
			if fee.payed:
				ico = ico_yes
			fee_dat = fee._min_fee_data()
			if "alt='False'" in fee_dat:
				fee_val = ico_no
			elif "alt='True'" in fee_dat:
				fee_val = ico_yes
			out += "<li>"+a_strW +"fee/"+str(fee.id)+a_str3 + "<b>"+fee.__unicode__() +"</b></a>: &nbsp; "+ str_valid+": "+ fee_val +" &nbsp; "+str_payed+": "+ ico+" </li>"

			return out+'</ul>'
		return str_none
	_join_fee.allow_tags = True
	_join_fee.short_description = ''

	def _akin_members(self):
		return "dbafb"
		from Welcome.models import iC_Akin_Membership
		out = ""
		if self.id:
			current_memberships = iC_Akin_Membership.objects.filter(ic_membership=self.id)
			if current_memberships.count() > 0:
				for rel in current_memberships:
					if hasattr(rel, 'person'):
						fields = "[%s] [%s] [%s] [%s]" % ( 	rel.person.id_card,
							rel.person.email,
							str(rel.person.telephone_cell),
							str(rel.person.telephone_land)
						)
						out += a_strG + 'person/'+ str(rel.person.id) + a_str3 + '<b>'+str(rel.person.name.encode("utf-8")) + '</b></a> ' + fields + "<br>"
					else:
						print '_REL_ID_CARDS: rel has not Person! '+str(rel)
		else:
			out = _("(Cap)")
		add_button = a_strW + "ic_akin_membership/add'"
		add_button = "%s > %s </a>" % (add_button, _(u"Afegeix soci afí").encode("utf-8") )
		return out + "<br>" + add_button
	_akin_members.allow_tags = True
	_akin_members.short_description = _(u"Socis afins")

	def _rel_id_cards(self): #= models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
		rels = rel_Human_Persons.objects.filter(human=self.ic_membership.human)
		out = ''
		if rels.count() > 0:
			for rel in rels:
				if hasattr(rel, 'person'):
					fields = "[%s] [%s] [%s] [%s]" % ( 	rel.person.id_card,
						rel.person.email,
						str(rel.person.telephone_cell),
						str(rel.person.telephone_land)
					)
					out += a_strG +'person/'+str(rel.person.id)+a_str3 + '<b>'+str(rel.person.name.encode("utf-8")) + '</b></a> ' + fields + "<br>"

				else:
					print '_REL_ID_CARDS: rel has not Person! '+str(rel)
			return out
		else:
			out = a_strG +'person/'+str(self.ic_membership.human.id)+a_str3+ str(self.ic_membership.human)+'</a> ['+str(self.ic_membership.human.person.id_card) + "]"
			return out
	_rel_id_cards.allow_tags = True
	_rel_id_cards.short_description = _(u"Socis de referència")

	def _render_address(self, adr):

		output = "<br><ul>"
		output += "<li>" + _(u"Adreça: ").encode("utf-8") + adr.p_address.encode("utf-8") + "</li>"
		output += "<li>" + _(u"Població: ").encode("utf-8") + adr.town.encode("utf-8")  + "</li>"
		try:
			output += "<li>" + _(u"CP: ").encode("utf-8") + adr.postalcode.encode("utf-8") + "</li>"
		except:
			output += "<li>" + _(u"CP: ").encode("utf-8") + " (Cap) </li>"

		try:
			output += "<li>" + _(u"Comarca: ").encode("utf-8") + adr.region.name.encode("utf-8") + "</li>"
		except:
			output += "<li>" + _(u"Comarca: (cap) ").encode("utf-8")  + "</li>"

		output += "<li>" + _(u"Ubicació específica: ").encode("utf-8") + str(adr) + "</li>"

		if self.rel_address_contracts.filter(address=adr, ic_document__doc_type__clas="contract_use").count()>0:
			contract = self.rel_address_contracts.get(address=adr, ic_document__doc_type__clas="contract_use")
			link = " " + a_strW + "ic_address_contract/" + str(contract.id) + "' >" + _("Editar").encode("utf-8") + "</a>"
			output += "<li>" + _(u"Cessió d'ús: ").encode("utf-8") + str(contract.ic_document) + link + "</li>"
		else:
			if self.id:
				if hasattr(self.ic_membership.human, 'project'):
					persons = self.ic_membership.human.project.persons
					if persons.count() > 0:
						current_person = persons.first()
				elif hasattr(self.ic_membership.human, 'person'):
					current_person = self.ic_membership.human.person
				add_button = ""
				if current_person:
					add_button = reverse('Welcome:self_employed_save_item', args=(current_person.id, adr.id, self.id, 0))
				add_button = "<a  href='%s' > %s </a>" % (add_button, _("Afegeix").encode("utf-8") )
				output += "<li>" + _(u"Cessió d'ús: ").encode("utf-8") + add_button + "</li>"
			else:
				pass
		if self.rel_address_contracts.filter(address=adr, ic_document__doc_type__clas="contract_hire").count()>0:
			contract = self.rel_address_contracts.get(address=adr, ic_document__doc_type__clas="contract_hire")
			link = " " + a_strW + "ic_address_contract/" + str(contract.id) + "'>" + _("Editar").encode("utf-8") + "</a>"
			output += "<li>" + _(u"Contracte lloguer: ").encode("utf-8") + contract.ic_document.name.encode("utf-8") + link + "</li>"
		else:
			if hasattr(self.ic_membership.human, 'project'):
				persons = self.ic_membership.human.project.persons
				if persons.count() > 0:
					current_person = persons.first()
			elif hasattr(self.ic_membership.human, 'person'):
				current_person = self.ic_membership.human.person
			if current_person:
				add_button = reverse('Welcome:self_employed_save_item', args=(current_person.id, adr.id, self.id, 1))
			add_button = "<a href='%s'> %s </a>" % (add_button,  _("Afegeix").encode("utf-8") )
			output += "<li>" + _(u"Contracte lloguer: ").encode("utf-8") + add_button + "</li>"

		if self.rel_licences.filter(rel_address=adr).count()>0:
			contract = self.rel_licences.get(rel_address=adr)
			link = " " + a_strW + "ic_licence/" + str(contract.id) + "'>" + _("Editar").encode("utf-8") + "</a>"
			output += "<li>" + _(u"Llicència activitat: ").encode("utf-8") + str(contract.ic_document) + link + "</li>"
		else:
			if hasattr(self.ic_membership.human, 'project'):
				persons = self.ic_membership.human.project.persons
				if persons.count() > 0:
					current_person = persons.first()
			elif hasattr(self.ic_membership.human, 'person'):
				current_person = self.ic_membership.human.person
			if current_person:
				add_button = reverse('Welcome:self_employed_save_item', args=(current_person.id, adr.id, self.id, 2))
			add_button = "<a href='%s'> %s </a>" % (add_button,  _("Afegeix").encode("utf-8") )
			output += "<li>" + _(u"Llicència activitat: ").encode("utf-8") + add_button + "</li>"
		link = a_strG + "address/" + str(adr.id) + "'>" + _("Editar aquesta adreca").encode("utf-8") + "</a>"
		output += "<li>" + link + "</li>"
		output += "</ul>"
		return output

	def _main_address_render(self):

		try:
			adr = self.ic_membership.human.rel_human_addresses_set.filter(main_address=True).first().address
		except:
			adr = None
		output = ""
		if adr:
			output = self._render_address(adr)

		if hasattr(self.ic_membership.human, 'project'):
			current_human = self.ic_membership.human.project
		elif hasattr(self.ic_membership.human, 'person'):
			current_human = self.ic_membership.human.person
		if adr:
			return output
		else:
			add_button = reverse('Welcome:self_employed_save_item', args=(current_human.id, 0, self.id, 3))
			add_button = "<a  onclick='return showRelatedObjectLookupPopup(this);' href='%s' %s %s </a>" % (add_button, a_str3, _("Afegeix adreca principal").encode("utf-8") )
			return output + add_button


	_main_address_render.allow_tags = True
	_main_address_render.short_description = _(u"Adreça principal")

	def _other_address_render(self):

		addresses = self.ic_membership.human.rel_human_addresses_set.filter(main_address=False)
		output = ""
		for adr in addresses:
			try:
				output += self._render_address(adr.address)
			except Exception as e:
				output += '%s (%s)' % (e.message, type(e))
		if self.id:
			if hasattr(self.ic_membership.human, 'project'):
				current_human = self.ic_membership.human.project
			elif hasattr(self.ic_membership.human, 'person'):
				current_human = self.ic_membership.human.person
			else:
				current_human = self.ic_membership.human
			add_button = reverse('Welcome:self_employed_save_item', args=(current_human.id, 0, self.id, 4))
			add_button = "<a onclick='return showRelatedObjectLookupPopup(this);' href='%s' %s %s </a>" % (add_button, a_str3, _("Afegeix una altra adreca").encode("utf-8") )
			output = output + add_button

		return output
	_other_address_render.allow_tags = True
	_other_address_render.short_description = _(u"Altres adreces")

	def _rel_address_contract(self): #= models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
		addrs = self.rel_address_contracts.all()
		out = ul_tag
		if addrs.count() > 0:
			for adr in addrs:
				if adr._min_addrcontract_data() == ico_yes:
					ico = ico_yes
				else:
					ico = ico_no
				out += '<li>'+a_strW +'ic_address_contract/'+str(adr.id)+a_str3 + '<b>'+adr.__unicode__() +'</b></a>: '+adr.doc_type.name+' &nbsp; '+ico+'</li>'
			return out + '</ul>'
		return str_none
	_rel_address_contract.allow_tags = True
	_rel_address_contract.short_description = ''#_(u"contractes?")

	def _rel_licences(self): #= models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
		lics = self.rel_licences.all()
		out = ul_tag
		job = adr = ''
		if lics.count() > 0:
			for lic in lics:
				if lic.rel_job:
					job = lic.rel_job.name
				if lic.rel_address:
					adr = lic.rel_address.name
				if lic._min_licence_data() == ico_yes:
					ico = ico_yes
				else:
					ico = ico_no
				out += '<li>'+a_strW +'ic_licence/'+str(lic.id)+a_str3 + '<b>'+lic.__unicode__() +'</b></a>: '+job+' '+adr+' &nbsp; '+ico+'</li>'
			return out + '</ul>'
		return str_none
	_rel_licences.allow_tags = True
	_rel_licences.short_description = ''

	def _rel_insurances(self): #= models.SmallIntegerField(default=0, verbose_name=_(u"Requereix DNI membres?"))
		insus = self.rel_insurances.all()
		out = ul_tag
		job = adr = ''
		if insus.count() > 0:
			for ins in insus:
				if ins.rel_job:
					job = ins.rel_job.name
				if ins.rel_address:
					adr = ins.rel_address.name
				if ins._min_insurance_data() == ico_yes:
					ico = ico_yes
				else:
					ico = ico_no
				out += '<li>'+a_strW +'ic_insurance/'+str(ins.id)+a_str3 + '<b>'+ins.ic_document.__unicode__() +'</b></a>: '+job+' '+adr+' &nbsp; '+ico+'</li>'
			return out + '</ul>'
		return str_none
	_rel_insurances.allow_tags = True
	_rel_insurances.short_description = ''

	def _rel_images(self):
		imgs = self.rel_images.all()
		out = '<div class="thumb_line">'
		if imgs.count() > 0:
			for img in imgs:
				out += '<div class="thumb">'+a_strG + 'image/'+str(img.id)+a_str3 + show_thumbnail(img) + '<br>'+ img.__unicode__() +'</a></div> '#+str(url)
			return out+'</div>'
		return str_none
	_rel_images.allow_tags = True
	_rel_images.short_description = ''

	def _min_human_data(self):
		hum = self.ic_membership.human
		out = ul_tag_err

		if hasattr(self.ic_membership.human, 'project'):
			#print 'PROJECT! '+str(self.ic_membership.human.project)
			slug = 'project/'
		elif hasattr(self.ic_membership.human, 'person'):
			#print 'PERSON! '+str(self.ic_membership.human.person)
			slug = 'person/'
		else:
			return slug+'!!'

		if hum.email is None or hum.email == '':
			out += '<li>Falta el Email. ' + hum.self_link + '</li>'
		if hum.telephone_cell is None or hum.telephone_cell == '':
			out += '<li>Falta el Teléfon mobil. ' + hum.self_link + '</li>'
		if hum.description is None or hum.description == '':
			out += '<li>Falta alguna Descripció. ' + hum.self_link + '</li>'
		if hum.addresses.all().count() < 1:
			out += '<li>Falta alguna Adreça. ' + hum.self_link + '</li>'
		elif hum.rel_human_addresses_set.filter(main_address=True).count() < 1:
			address = hum.rel_human_addresses_set.filter(main_address=True).first().address
			if address:
				link = a_strG + "address/" + address.id + "'>" + _("Editar").encode("utf-8") + "</a>"
				out += '<li>Alguna adreça ha de ser la principal. ' + link + '</li>'
			else:
				out += '<li>Alguna adreça ha de ser la principal. ' + link + '</li>'
		else:
			adr = hum.rel_human_addresses_set.filter(main_address=True).first().address
			link = a_strG + "address/" + str(adr.id) + "'>" + _("Editar").encode("utf-8") + "</a>"
			if adr.postalcode is None or adr.postalcode == '':
				out += "<li>A l'adreça principal li falta el Codi Postal. " + link + "</li>"
			if adr.region is None or adr.region == '':
				out += "<li>A l'adreça principal li falta la Comarca " + link + "</li>"

		if hasattr(hum, 'project'):
			if hum.project.project_type is None or hum.project.project_type == '':
				out += '<li>És projecte i falta el Tipus. ' + hum.project.self_link + '</li>'
			if hum.project._get_ref_persons().count() < 1:
				out += '<li>Falta alguna Persona de Referencia.' + hum.project.self_link + '</li>'
		#print str(self.ic_stallholder)
		if hasattr(self, 'ic_stallholder'):
			if self.ic_stallholder.tent_type is None or self.ic_stallholder.tent_type == '':
				out += '<li>És firaire i falta el tipus de carpa. </li>'
		#print out
		if out == ul_tag_err:
			return ico_yes
		return out+'<li>'+ico_no+'</li></ul>'
	_min_human_data.allow_tags = True
	_min_human_data.short_description = 'Dades mínimes?'

	def print_task_list(self):
		if self.id:
			url = reverse("Welcome:print_task_list", args=(self.id,))
			text = _("Imprimir llista de tasques").encode("utf-8")
			link = "<a href='%s' target='_blank'> %s </a>" % (url, text)
			return link
		else:
			return str_none;

	print_task_list.short_description="PDF"
	def print_certificate(self):
		if self.id:
			url = reverse("Welcome:print_certificate", args=(self.id, 0))
			text = _("Imprimir certificat local").encode("utf-8")
			link = "<a href='%s' target='_blank'> %s </a>" % (url, text)

			url = reverse("Welcome:print_certificate", args=(self.id, 1))
			text = _("Imprimir certificat d'activitat").encode("utf-8")
			link += "<br> <a href='%s' target='_blank'> %s </a>" % (url, text)

			url = reverse("Welcome:print_certificate", args=(self.id, 2))
			text = _("Imprimir model de factura").encode("utf-8")
			link += "<br> <a href='%s' target='_blank'> %s </a>" % (url, text)

			url = reverse("Welcome:print_certificate", args=(self.id, 3))
			text = _("Imprimir CIF").encode("utf-8")
			link += "<br> <a href='%s' target='_blank'> %s </a>" % (url, text)

			return link
		else:
			return str_none;

	print_certificate.short_description="PDF"
	def _user_member(self):
		from django.core.exceptions import ObjectDoesNotExist
		from public_form.models import RegistrationProfile, RegistrationManager

		rt_id = self.record_type.id
		current_person = self.ic_membership.human.persons.first()
		current_project = self.ic_membership.ic_project
		try:
			current_registration = RegistrationProfile.objects.get(person=current_person, project = current_project, record_type = rt_id)
			from Welcome.admin import global_PASSWORD
			return  _(" Usuari: ").encode("utf-8") + current_registration.user.username + " " + _(" Contrasenya:").encode("utf-8") + current_registration.user.username + global_PASSWORD
		except ObjectDoesNotExist:
			return _("Encara no s'ha creat.")
	_user_member.short_description = "Usuari per entrar al entorno virtual"

class iC_Stallholder(iC_Self_Employed):	# Firaire
	ic_self_employed = models.OneToOneField('iC_Self_Employed', primary_key=True, parent_link=True)
	#req_photos = models.SmallIntegerField(default=1, verbose_name=_(u"Requereix fotos?"))
	TentType = (
		('none',_(u"sense")),
		('wood',_(u"de fusta")),
		('metal',_(u"metàlica"))
	)
	tent_type = models.CharField(max_length=5, choices=TentType, blank=True, null=True, verbose_name=_(u"Tipus de carpa"))

	class Meta:
		verbose_name = _(u"Alta Proj.Autoocupat Firaire")
		verbose_name_plural = _(u"- Altes Proj. Autoocupats Firaires")

	def __init__(self, *args, **kwargs):
		super(iC_Stallholder, self).__init__(*args, **kwargs)
		self.record_type = iC_Record_Type.objects.get(clas='iC_Stallholder')


class Learn_Session(iC_Record):
	nonmaterial = models.ForeignKey('General.Nonmaterial', verbose_name=_(u"Formació (obra inmaterial)"))
	assistants = models.ManyToManyField('General.Human', related_name='assist_sessions', blank=True, null=True,
						verbose_name=_(u"Assistents"), help_text=_(u"Quan escullis cada entitat assistent, desa el formulari per veure el seu nom aquí"))
	facilitator = models.ForeignKey('General.Human', related_name='facilitate_sessions', blank=True, null=True, verbose_name=_(u"Facilitador"))
	datetime = models.DateTimeField(blank=True, null=True, verbose_name=_(u"Dia i Hora"))
	duration = models.TimeField(default='01:00', verbose_name=_(u"Duració"))
	address = models.ForeignKey('General.Address', blank=True, null=True, verbose_name=_(u"Adreça"))
	def __unicode__(self):
		try:
			if not hasattr(self, 'facilitator') or self.facilitator is None:
				if not hasattr(self, 'nonmaterial') or self.nonmaterial is None:
					if not hasattr(self, 'address') or self.address is None:
						return '??: (??)'
					else:
						return '??: '+str(self.datetime.date())+' (??) '+self.address.name
				else:
					return self.nonmaterial.name+': '+str(self.datetime.date())+' (??) '+self.address.name
			else:
				return self.nonmaterial.name+': '+str(self.datetime.date())+' ('+self.facilitator.name+') '+self.address.name
		except Exception as e:
			print e.message

	class Meta:
		verbose_name = _(u"Sessió formativa")
		verbose_name_plural = _(u"r- Sessions formatives")

	def _assistants_link(self):
		#try:
		assis = self.assistants.all()
		if assis.count() > 0:
			out = ul_tag
			for ass in assis:
				slug = 'person'
				if hasattr(ass, 'project'):
					slug = 'project'
				out += '<li>'+a_strG+ slug+'/'+str(ass.id)+ a_str3+ '<b>'+ass.__unicode__()+'</b></a> - '+erase_id_link('assistants', ass.id)
			return out+'</ul>'
		#except Exception as e:
		#	print e
		return str_none
	_assistants_link.allow_tags = True
	_assistants_link.short_description = ''

	def _num_assistants(self):
		return self.assistants.count()
	_num_assistants.short_description = _(u"Num")

class Project_Accompaniment(iC_Record):
	human = models.ForeignKey('General.Human', related_name='accompaniments', verbose_name=_(u"Projecte"))
	situation = models.TextField(blank=True, verbose_name=_(u"Situació actual"))
	needs = models.TextField(blank=True, verbose_name=_(u"Necessitats"))
	petitioner = models.ForeignKey('General.Human', related_name='petitions', blank=True, null=True, verbose_name=_(u"Peticionari"))
	petition = models.TextField(blank=True, verbose_name=_(u"Comentari petició"))
	facilitator = models.ForeignKey('General.Human', related_name='facilitate_projects', blank=True, null=True, verbose_name=_(u"Facilitador"))

	class Meta:
		verbose_name = _(u"Expedient Projecte Productiu")
		verbose_name_plural = _(u"r- Expedients P.Productius")



#-------	D O C U M E N T S

class iC_Document(iC_Record):
	ic_record = models.OneToOneField('iC_Record', primary_key=True, parent_link=True)
	doc_type = TreeForeignKey('iC_Document_Type', blank=True, null=True, verbose_name=_(u"Tipus de document"))
	#description = models.TextField(blank=True, verbose_name=_(u"Comentari"))
	doc_file = models.FileField(upload_to='ic/docs', blank=True, null=True, verbose_name=_(u"Document escanejat"))

	def _ic_membership(self):
		if hasattr(self, 'membership') and self.membership:
			print 'ADDRESS_CONTRACT te MEMBERSHIP ??!! '
			return self.membership.first()
		elif hasattr(self, 'selfemployed') and hasattr(self.selfemployed.first(), 'ic_membership'):
			return self.selfemployed.first().ic_membership
		return str_none
	_ic_membership.allow_tags = True
	_ic_membership.short_description = _(u"alta Soci")

	def _ic_selfemployed(self):
		if hasattr(self, 'selfemployed'):
			return self.selfemployed.first()
		return str_none
	_ic_selfemployed.allow_tags = True
	_ic_selfemployed.short_description = _(u"Autoocupat")


class iC_Document_Type(iC_Record_Type):
	record_type = models.OneToOneField('iC_Record_Type', primary_key=True, parent_link=True)
	class Meta:
		verbose_name = _(u"Tipus de Document CI")
		verbose_name_plural = _(u"c-> Tipus de Documents CI")



class iC_Labor_Contract(iC_Document):
	ic_document = models.OneToOneField('iC_Document', primary_key=True, parent_link=True)
	person = models.ForeignKey('General.Person', verbose_name=_(u"Persona contractada"))
	company = models.ForeignKey('General.Company', verbose_name=_(u"Empresa contractant"), null=True, blank=True)
	start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici del contracte"))
	end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final del contracte"))
	rel_fees = models.ManyToManyField('Fee', blank=True, null=True, verbose_name=_(u"Quotes relacionades"))

	def __unicode__(self):

		if self.company:
			return self.company.nickname+': '+self.person.name+' '+self.person.surnames+' ('+self.person.id_card+')'
		else:
			return self.person.name+' '+self.person.surnames+' ('+self.person.id_card+')'

	class Meta:
		verbose_name = _(u"Contracte Laboral CI")
		verbose_name_plural = _(u"d- Contractes Laborals CI")


class iC_Address_Contract(iC_Document):
	ic_document = models.OneToOneField('iC_Document', primary_key=True, parent_link=True)
	#ic_membership = models.ForeignKey('iC_Membership', blank=True, null=True, verbose_name=_(u"Soci (registre)"))
	company = models.ForeignKey('General.Company', verbose_name=_(u"Empresa titular (CI)"), null=True, blank=True)
	address = models.ForeignKey('General.Address', verbose_name=_(u"Adreça contractada"))
	price = models.DecimalField(max_digits=13, decimal_places=2, blank=True, null=True, verbose_name=_(u"Import"))
	price_unit = models.ForeignKey('General.Unit', blank=True, null=True, verbose_name=_(u"Unitat"))
	start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici del contracte"))
	end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final del contracte"))

	def __unicode__(self):
		try:
			if hasattr(self, 'selfemployed') and self.selfemployed.count() > 0:
				#print 'SELFEMPLOYED! '+str(self.selfemployed.first().ic_membership.human)
				if hasattr(self.selfemployed.first(), 'ic_membership') and self.selfemployed.first().ic_membership is not None:
					return self.selfemployed.first().ic_membership.human.__unicode__()+': '+self.address.name
				else:
					return self.selfemployed.first().__unicode__()+' ??: '+self.address.name
			elif self.company:
				return self.company.nickname+': ?? > '+self.address.name
			elif self.address:
				return '??: ?? > '+self.address.__unicode__()
			else:
				return '¿no name?!' #self.name
		except:
			return ""

	class Meta:
		verbose_name = _(u"Contracte d'Adreça CI")
		verbose_name_plural = _(u"d- Contractes d'Adreçes CI")

	def _address_link(self):
		if hasattr(self, 'address'):
			return self.address._selflink()
		return str_none
	_address_link.allow_tags = True
	_address_link.short_description = ''

	#def _is_valid(self):
	#	if hasattr(self, 'address') and self.address and hasattr(self, 'company') and self.company:
	#		if hasattr(self, 'price') and hasattr(self, 'price_unit'):
	#			if hasattr(self, 'start_date') and self.start_date:
	#				return True
	#	return False
	#_is_valid.boolean = True
	#_is_valid.short_description = _(u"Valid?")

	def _min_addrcontract_data(self):
		out = ul_tag_err
		if self.address is None or self.address == '':
			out += "<li>Falta l'adreça.</li>"
		if self.price is None:
			out += "<li>Falta l'import'.</li>"
		if self.start_date is None:
			out += "<li>Falta la data d'inici.</li>"

		if out == ul_tag_err:
			return ico_yes
		return out+'<li>'+ico_no+'</li></ul>'
	_min_addrcontract_data.allow_tags = True
	_min_addrcontract_data.short_description = ''


class iC_Insurance(iC_Document):
	ic_document = models.OneToOneField('iC_Document', primary_key=True, parent_link=True)
	company = models.ForeignKey('General.Company', verbose_name=_(u"Empresa asseguradora"), blank=True, null=True)
	number = models.CharField(max_length=30, blank=True, null=True, verbose_name=_(u"Número de Pòlissa"))
	price = models.DecimalField(max_digits=13, decimal_places=2, blank=True, null=True, verbose_name=_(u"Import"))
	price_unit = models.ForeignKey('General.Unit', blank=True, null=True, verbose_name=_(u"Unitat"))
	start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici de l'assegurança"))
	end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final de l'assegurança"))
	rel_address = models.ForeignKey('General.Address', blank=True, null=True, verbose_name=_(u"Adreça assegurada"))
	rel_job = models.ForeignKey('General.Job', blank=True, null=True, verbose_name=_(u"Ofici assegurat"))
 	payed_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data pagament de l'assegurança"))
	#description = models.TextField(blank=True, null=True, verbose_name=_(u"Descripció assegurança"))

	def __unicode__(self):
		if hasattr(self, 'selfemployed') and self.selfemployed.count():
			if self.company:
				return self.company.nickname+': '+self.selfemployed.first().ic_membership.__unicode__()
			else:
				return self.selfemployed.first().ic_membership.__unicode__()
		else:
			return self.doc_type.name+': ?? '+self.number

	class Meta:
		verbose_name = _(u"Assegurança soci CI")
		verbose_name_plural = _(u"d- Assegurances socis CI")

	def _erase_address(self):
		if hasattr(self, 'rel_address'):
			return erase_id_link('rel_address', self.rel_address.id)
		return False
	_erase_address.allow_tags = True
	_erase_address.short_description = ''

	def _erase_job(self):
		if hasattr(self, 'rel_job'):
			return erase_id_link('rel_job', self.rel_job.id)
		return False
	_erase_job.allow_tags = True
	_erase_job.short_description = ''

	#def _is_valid(self):
	#	if hasattr(self, 'number') and not self.number == '':
	#		if hasattr(self, 'company') and not self.company == '':
	#			if hasattr(self, 'start_date') and self.start_date:
	#				if hasattr(self, 'price') and hasattr(self, 'price_unit'):
	#					return True
	#	return False
	#_is_valid.boolean = True
	#_is_valid.short_description = _(u"Valid?")

	def _min_insurance_data(self):
		out = ul_tag_err
		if self.number is None or self.number == '':
			out += "<li>Falta el número de pòlissa.</li>"
		if self.company is None:
			out += "<li>Falta l'Asseguradora.</li>"
		if self.start_date is None:
			out += "<li>Falta la data d'inici.</li>"
		if self.price is None or self.price == '':
			out += "<li>Falta l'import.</li>"
		if self.price_unit is None:
			out += "<li>Falta l'unitat.</li>"

		if out == ul_tag_err:
			return ico_yes
		return out+'<li>'+ico_no+'</li></ul>'
	_min_insurance_data.allow_tags = True
	_min_insurance_data.short_description = ''


class iC_Licence(iC_Document):
	ic_document = models.OneToOneField('iC_Document', primary_key=True, parent_link=True)
	#membership = models.ForeignKey('iC_Membership', verbose_name=_(u"Soci (registre)"))
	number = models.CharField(max_length=30, blank=True, null=True, verbose_name=_(u"Número de Licència"))
	#price = models.DecimalField(max_digits=7, decimal_places=2, blank=True, null=True, verbose_name=_(u"Import (euros)"))
	start_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data d'inici de la licència"))
	end_date = models.DateField(blank=True, null=True, verbose_name=_(u"Data de final de la licència"))
	rel_address = models.ForeignKey('General.Address', blank=True, null=True, verbose_name=_(u"Adreça relacionada"))
	rel_job = models.ForeignKey('General.Job', blank=True, null=True, verbose_name=_(u"Ofici relacionat"))

	def __unicode__(self):
		try:
			if hasattr(self, 'selfemployed') and self.selfemployed.count():
				return self.doc_type.name+': '+self.selfemployed.first().ic_membership.__unicode__()
			else:
				return self.doc_type.name+': ?? '+self.number
		except:
			return "iC_License"

	class Meta:
		verbose_name = _(u"Llicència soci CI")
		verbose_name_plural = _(u"d- Llicències socis CI")

	def _erase_address(self):
		if hasattr(self, 'rel_address'):
			return erase_id_link('rel_address', self.rel_address.id)
		return False
	_erase_address.allow_tags = True
	_erase_address.short_description = ''

	def _erase_job(self):
		if hasattr(self, 'rel_job'):
			return erase_id_link('rel_job', self.rel_job.id)
		return False
	_erase_job.allow_tags = True
	_erase_job.short_description = ''

	#def _is_valid(self):
	#	if hasattr(self, 'number') and not self.number == '':
	#		if hasattr(self, 'start_date') and self.start_date:
	#			return True
	#	return False
	#_is_valid.boolean = True
	#_is_valid.short_description = _(u"Valid?")

	def _min_licence_data(self):
		out = ul_tag_err
		if self.number is None or self.number == '':
			out += "<li>Falta el número de la licència.</li>"
		if self.start_date is None:
			out += "<li>Falta la data d'inici.</li>"

		if out == ul_tag_err:
			return ico_yes
		return out+'<li>'+ico_no+'</li></ul>'
	_min_licence_data.allow_tags = True
	_min_licence_data.short_description = ''



from django.db.models.signals import post_save
#from django.core.signals import post_save
from django.dispatch import receiver

@receiver(post_save, sender=Fee)
def my_callback(sender, **kwargs):

	print("Post Save!")
	if kwargs['instance'].record_type:
		clas = kwargs['instance'].record_type.clas
		if 'individual' in clas:
			print 'INDIVDUAL'
			print sender

		print kwargs['instance'].record_type.clas
		print kwargs['instance'].id
