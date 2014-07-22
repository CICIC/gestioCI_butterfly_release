# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'sales_movement.execution_date'
        db.alter_column(u'Invoices_sales_movement', 'execution_date', self.gf('django.db.models.fields.DateField')(null=True))

    def backwards(self, orm):

        # Changing field 'sales_movement.execution_date'
        db.alter_column(u'Invoices_sales_movement', 'execution_date', self.gf('django.db.models.fields.DateField')(default=datetime.datetime(2014, 7, 21, 0, 0)))

    models = {
        u'Invoices.client': {
            'CIF': ('django.db.models.fields.CharField', [], {'max_length': '30', 'null': 'True', 'blank': 'True'}),
            'Meta': {'object_name': 'client'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'otherCIF': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'})
        },
        u'Invoices.coop': {
            'Meta': {'object_name': 'coop'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '200', 'db_index': 'True'})
        },
        u'Invoices.cooper': {
            'IVA_assignat': ('django.db.models.fields.IntegerField', [], {'default': '0', 'max_length': '2'}),
            'Meta': {'object_name': 'cooper'},
            'coop': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.coop']"}),
            'coop_number': ('django.db.models.fields.IntegerField', [], {'unique': 'True', 'max_length': '4', 'db_index': 'True'}),
            'extra_days': ('django.db.models.fields.IntegerField', [], {'default': '0', 'max_length': '2'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'preTAX': ('django.db.models.fields.DecimalField', [], {'default': '0', 'max_digits': '10', 'decimal_places': '2'}),
            'user': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['auth.User']", 'unique': 'True'})
        },
        u'Invoices.csvimport': {
            'Meta': {'object_name': 'CSVImport'},
            'encoding': ('django.db.models.fields.CharField', [], {'max_length': '32', 'blank': 'True'}),
            'error_log': ('django.db.models.fields.TextField', [], {}),
            'field_list': ('django.db.models.fields.CharField', [], {'max_length': '255', 'blank': 'True'}),
            'file_name': ('django.db.models.fields.CharField', [], {'max_length': '255', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'import_date': ('django.db.models.fields.DateField', [], {'auto_now': 'True', 'blank': 'True'}),
            'import_user': ('django.db.models.fields.CharField', [], {'default': "'anonymous'", 'max_length': '255', 'blank': 'True'}),
            'model_name': ('django.db.models.fields.CharField', [], {'default': "'iisharing.Item'", 'max_length': '255'}),
            'upload_file': ('django.db.models.fields.files.FileField', [], {'max_length': '100'}),
            'upload_method': ('django.db.models.fields.CharField', [], {'default': "'manual'", 'max_length': '50'})
        },
        u'Invoices.currencies': {
            'Meta': {'object_name': 'currencies'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'Invoices.email': {
            'Meta': {'object_name': 'Email'},
            'body': ('django.db.models.fields.TextField', [], {}),
            'efrom': ('django.db.models.fields.EmailField', [], {'default': "'gee@gestion.org'", 'max_length': '75'}),
            'eto': ('django.db.models.fields.CharField', [], {'default': "'camp reservat pel sistema'", 'max_length': '75'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'subject': ('django.db.models.fields.CharField', [], {'max_length': '200'})
        },
        u'Invoices.emailnotification': {
            'Meta': {'object_name': 'EmailNotification', '_ormbases': [u'Invoices.Email']},
            u'email_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['Invoices.Email']", 'unique': 'True', 'primary_key': 'True'}),
            'ento': ('django.db.models.fields.IntegerField', [], {}),
            'notification_type': ('django.db.models.fields.IntegerField', [], {}),
            'offset_days': ('django.db.models.fields.IntegerField', [], {'default': '0', 'max_length': '2'}),
            'period': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.period']"}),
            'pointed_date': ('django.db.models.fields.DateField', [], {'default': 'datetime.datetime(2014, 7, 21, 0, 0)'}),
            'sent_to_user': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['auth.User']", 'null': 'True', 'blank': 'True'})
        },
        u'Invoices.period': {
            'Meta': {'object_name': 'period'},
            'date_close': ('django.db.models.fields.DateField', [], {}),
            'date_open': ('django.db.models.fields.DateField', [], {}),
            'exported': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'first_day': ('django.db.models.fields.DateField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '200'})
        },
        u'Invoices.provider': {
            'CIF': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'Meta': {'object_name': 'provider'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'otherCIF': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'})
        },
        u'Invoices.purchase_invoice': {
            'Meta': {'object_name': 'purchase_invoice'},
            'cooper': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.cooper']", 'null': 'True', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'percentExpencedVAT': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.vats']"}),
            'percentIRPFRetention': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'period': ('django.db.models.fields.related.ForeignKey', [], {'default': '1', 'to': u"orm['Invoices.period']"}),
            'provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.provider']"}),
            'type': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'who_manage': ('django.db.models.fields.IntegerField', [], {'default': '0'})
        },
        u'Invoices.purchase_line': {
            'Meta': {'object_name': 'purchase_line'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'purchase_invoice': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.purchase_invoice']"})
        },
        u'Invoices.purchase_movement': {
            'Meta': {'object_name': 'purchase_movement'},
            'acceptation_date': ('django.db.models.fields.DateField', [], {}),
            'cooper': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.cooper']"}),
            'currency': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.currencies']", 'null': 'True', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {}),
            'execution_date': ('django.db.models.fields.DateField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'petition_date': ('django.db.models.fields.DateField', [], {}),
            'purchase_invoice': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.purchase_invoice']"}),
            'status': ('django.db.models.fields.IntegerField', [], {}),
            'type': ('django.db.models.fields.IntegerField', [], {}),
            'value': ('django.db.models.fields.DecimalField', [], {'max_digits': '10', 'decimal_places': '2'})
        },
        u'Invoices.sales_invoice': {
            'Meta': {'unique_together': "(('cooper', 'period', 'num'),)", 'object_name': 'sales_invoice'},
            'client': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.client']"}),
            'cooper': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.cooper']", 'null': 'True', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'num': ('django.db.models.fields.IntegerField', [], {}),
            'period': ('django.db.models.fields.related.ForeignKey', [], {'default': '1', 'to': u"orm['Invoices.period']"}),
            'type': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'who_manage': ('django.db.models.fields.IntegerField', [], {'default': '0'})
        },
        u'Invoices.sales_line': {
            'Meta': {'object_name': 'sales_line'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'percentInvoicedVAT': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.vats']"}),
            'sales_invoice': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.sales_invoice']"}),
            'value': ('django.db.models.fields.DecimalField', [], {'max_digits': '10', 'decimal_places': '2'})
        },
        u'Invoices.sales_movement': {
            'Meta': {'object_name': 'sales_movement'},
            'cooper': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.cooper']"}),
            'currency': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.currencies']", 'null': 'True', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {}),
            'execution_date': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'planned_date': ('django.db.models.fields.DateField', [], {}),
            'sales_invoice': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['Invoices.sales_invoice']"}),
            'status': ('django.db.models.fields.IntegerField', [], {}),
            'type': ('django.db.models.fields.IntegerField', [], {}),
            'value': ('django.db.models.fields.DecimalField', [], {'max_digits': '10', 'decimal_places': '2'})
        },
        u'Invoices.tax': {
            'Meta': {'object_name': 'tax'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'max_base': ('django.db.models.fields.IntegerField', [], {}),
            'min_base': ('django.db.models.fields.IntegerField', [], {}),
            'taxId': ('django.db.models.fields.IntegerField', [], {'unique': 'True', 'db_index': 'True'})
        },
        u'Invoices.vats': {
            'Meta': {'object_name': 'vats'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'value': ('django.db.models.fields.IntegerField', [], {'unique': 'True', 'db_index': 'True'})
        },
        u'auth.group': {
            'Meta': {'object_name': 'Group'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        u'auth.permission': {
            'Meta': {'ordering': "(u'content_type__app_label', u'content_type__model', u'codename')", 'unique_together': "((u'content_type', u'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['contenttypes.ContentType']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Group']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Permission']"}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        }
    }

    complete_apps = ['Invoices']