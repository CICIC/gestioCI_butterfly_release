# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
import django.core.validators
import mptt.fields


class Migration(migrations.Migration):

    dependencies = [
        ('Welcome', '__first__'),
        ('General', '__first__'),
        ('public_form', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='iCf_Company',
            fields=[
                ('company_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='General.Company')),
                ('name', models.CharField(help_text='El nom fiscal del client a qui es factura. Ex. SOM EL QUE SOM SL', max_length=200, verbose_name='Nom Fiscal')),
                ('CIF', models.CharField(help_text='NIF:12345678A - CIF: A12345678 - NIE: X12345678A del client a qui es factura.', max_length=30, null=True, verbose_name='CIF/NIF/NIE', blank=True)),
                ('otherCIF', models.CharField(help_text='Camps no NIF/CIF/NIE del client a qui es factura.', max_length=50, null=True, verbose_name='Altres identificadors', blank=True)),
            ],
            options={
                'verbose_name': 'B - Client',
                'verbose_name_plural': 'B - Clients',
            },
            bases=('General.company',),
        ),
        migrations.CreateModel(
            name='iCf_Client',
            fields=[
                ('icf_company_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='Finances.iCf_Company')),
            ],
            options={
                'verbose_name': 'B - Client',
                'verbose_name_plural': 'B - Clients',
            },
            bases=('Finances.icf_company',),
        ),
        migrations.CreateModel(
            name='iCf_Coop',
            fields=[
                ('company_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='General.Company')),
                ('name', models.CharField(unique=True, max_length=200, verbose_name='Nom', db_index=True)),
            ],
            options={
                'verbose_name': 'I - Cooperativa',
                'verbose_name_plural': 'I - Cooperatives',
            },
            bases=('General.company',),
        ),
        migrations.CreateModel(
            name='iCf_Cooper',
            fields=[
                ('ic_self_employed', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Self_Employed')),
                ('clients', models.ManyToManyField(to='Finances.iCf_Client', verbose_name='Clients')),
                ('ic_membership', models.OneToOneField(null=True, blank=True, to='Welcome.iC_Membership', verbose_name='rel_to_new_system')),
            ],
            options={
                'verbose_name': 'D - Socia',
                'verbose_name_plural': 'D -  Socies',
            },
            bases=('public_form.registrationprofile',),
        ),
        migrations.CreateModel(
            name='iCf_Provider',
            fields=[
                ('icf_company_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='Finances.iCf_Company')),
            ],
            options={
                'verbose_name': 'C - Prove\xefdor',
                'verbose_name_plural': 'C - Prove\xefdors',
            },
            bases=('Finances.icf_company',),
        ),
        migrations.CreateModel(
            name='iCf_Record',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200, null=True, verbose_name='Nom', blank=True)),
                ('description', models.TextField(null=True, verbose_name='Descripci\xf3', blank=True)),
            ],
            options={
                'verbose_name': 'Registre financer CI',
                'verbose_name_plural': 'o- Registres financers CI',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='iCf_Purchase_movement',
            fields=[
                ('icf_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Record')),
                ('concept', models.CharField(max_length=200, verbose_name='Concept')),
                ('execution_date', models.DateField(help_text='La data en que es realitza. Exemple dd/mm/aaaa', null=True, verbose_name='Data de realitzaci\xf3', blank=True)),
                ('value', models.DecimalField(help_text='Import en unitats monet\xe0ries', verbose_name='Import u.m.', max_digits=10, decimal_places=2)),
                ('petition_date', models.DateField(help_text='La data de petici\xf3. Exemple dd/mm/aaaa', verbose_name='Data previsi\xf3')),
                ('acceptation_date', models.DateField(help_text="La data en que s'accepta. Exemple dd/mm/aaaa", null=True, verbose_name="Data d'acceptament", blank=True)),
                ('currency', models.ForeignKey(verbose_name='Moneda', to='General.Unit', help_text='Indica el tipus de moneda del moviment')),
                ('icf_cooper', models.ForeignKey(verbose_name='n\xba COOP', to='Finances.iCf_Cooper')),
            ],
            options={
                'verbose_name': 'M - Reintegrament',
                'verbose_name_plural': 'M - Reintegraments',
            },
            bases=('Finances.icf_record',),
        ),
        migrations.CreateModel(
            name='iCf_Period_close',
            fields=[
                ('icf_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Record')),
                ('closed', models.BooleanField(default=False, help_text='closed_help_text', verbose_name='closed')),
                ('system_closed', models.BooleanField(default=False, help_text='closed by bot after expiring time', verbose_name='admin closed')),
                ('sales_base', models.DecimalField(verbose_name='Base Imposable Emeses (\u20ac)', max_digits=10, decimal_places=2, blank=True)),
                ('sales_invoiced_vat', models.DecimalField(verbose_name='IVA Facturat (\u20ac)', max_digits=10, decimal_places=2, blank=True)),
                ('sales_assigned_vat', models.DecimalField(verbose_name='IVA Assignat (\u20ac)', max_digits=10, decimal_places=2, blank=True)),
                ('sales_total', models.DecimalField(verbose_name='Total Emeses (\u20ac)', max_digits=10, decimal_places=2, blank=True)),
                ('purchases_base', models.DecimalField(verbose_name='Base Imposable Despeses (\u20ac)', max_digits=10, decimal_places=2, blank=True)),
                ('purchases_vat', models.DecimalField(verbose_name='IVA Despeses (\u20ac)', max_digits=10, decimal_places=2, blank=True)),
                ('purchases_irpf', models.DecimalField(verbose_name='Retenci\xf3 IRPF (\u20ac)', max_digits=10, decimal_places=2, blank=True)),
                ('purchases_total', models.DecimalField(verbose_name='Total Despeses (\u20ac)', max_digits=10, decimal_places=2, blank=True)),
                ('vat_type', models.IntegerField(default=1, verbose_name="Tipus d'IVA", choices=[(0, 'Pagament IVA oficial'), (1, "Pagament IVA segons l'IVA assignat")])),
                ('savings_with_assigned_vat_donation', models.DecimalField(default=0, help_text="D'aquest import d'estalvi, vols aportar alguna quantitat a la CIC? En cas afirmatiu, indica l'import.", verbose_name='Aportaci\xf3 (\u20ac)', max_digits=10, decimal_places=2)),
                ('period_tax', models.DecimalField(help_text='C\xe0lcul Quota Trimestral (segons taula quotes)', verbose_name='Quota', max_digits=10, decimal_places=2, blank=True)),
                ('advanced_tax', models.DecimalField(default=0, verbose_name='Quota avan\xe7ada', max_digits=10, decimal_places=2, blank=True)),
                ('donation', models.DecimalField(default=0, help_text=" Com que els resultats econ\xf2mics reflectits en aquest fitxer no sempre es corresponen amb l'activitat real del projecte, us volem donar aquesta opci\xf3 per aportar el que considereu oport\xfa. Si voleu, podeu indicar un import d\xb4aportaci\xf3 al finan\xe7ament d'activitats de la CIC en \u20ac i Ecos", verbose_name='Aportaci\xf3 (\u20ac)', max_digits=7, decimal_places=2)),
                ('cooper', models.ForeignKey(verbose_name='n\xba COOP', blank=True, to='Finances.iCf_Cooper', null=True)),
            ],
            options={
                'verbose_name': '03 - Resultats',
                'verbose_name_plural': '03 - Resultats',
            },
            bases=('Finances.icf_record',),
        ),
        migrations.CreateModel(
            name='iCf_Period',
            fields=[
                ('icf_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Record')),
                ('label', models.CharField(max_length=200, verbose_name='T\xedtol')),
                ('first_day', models.DateField(help_text='Primer dia del per\xedode', verbose_name='Inici')),
                ('date_open', models.DateField(verbose_name='Obert')),
                ('date_close', models.DateField(verbose_name='Tancat')),
                ('exported', models.BooleanField(default=False, help_text='Administraci\xf3 ha exportat els registres CSV del per\xedode.', verbose_name='Archivat')),
            ],
            options={
                'verbose_name': 'G - Trimestres',
                'verbose_name_plural': 'G - Trimestres',
            },
            bases=('Finances.icf_record',),
        ),
        migrations.CreateModel(
            name='iCf_Invoice_line',
            fields=[
                ('icf_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Record')),
                ('value', models.DecimalField(help_text='La Base Imposable de la l\xednia. Exemple 1000,30 . Indicar una coma pels decimals.', verbose_name='Base Imposable (\u20ac)', max_digits=10, decimal_places=2)),
            ],
            options={
                'abstract': False,
            },
            bases=('Finances.icf_record',),
        ),
        migrations.CreateModel(
            name='iCf_Purchase_line',
            fields=[
                ('line', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Invoice_line')),
                ('percent_irpf', models.IntegerField(default=0, help_text='El % de retenci\xf3 de IRPF (Nom\xe9s en lloguers i factures de persones f\xedsiques).', verbose_name='IRPF (%)', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(100)])),
            ],
            options={
                'verbose_name': 'L\xednia de factura despesa',
                'verbose_name_plural': 'L\xednies de factura despesa',
            },
            bases=('Finances.icf_invoice_line',),
        ),
        migrations.CreateModel(
            name='iCf_Invoice',
            fields=[
                ('icf_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Record')),
                ('date', models.DateField(help_text="La data d'emissi\xf3 de la factura. Exemple dd/mm/aaaa", verbose_name='Data')),
                ('expiring_date', models.DateField(help_text='La data de venciment. Exemple dd/mm/aaaa', null=True, verbose_name='Data venciment', blank=True)),
                ('who_manage', models.IntegerField(default=0, help_text="Si selecciona la opci\xf3 'desde la cooperativa' haur\xe0 d'ampliar informaci\xf3.", verbose_name='Forma de pagament', choices=[(0, 'Gestionat per la socia'), (1, 'Gestionat per la cooperativa')])),
                ('issue_date', models.DateField(default=datetime.datetime.today, null=True, verbose_name="Data d'emisi\xf3", blank=True)),
                ('deadline_date', models.DateField(null=True, verbose_name='Data de venciment', blank=True)),
                ('payment_date', models.DateField(null=True, verbose_name='Data de pagament', blank=True)),
                ('transfer_date', models.DateField(help_text='La data en que es liquida la factura. Exemple dd/mm/aaaa', null=True, verbose_name='Data de liquidaci\xf3', blank=True)),
            ],
            options={
                'abstract': False,
                'verbose_name': 'Factura',
                'verbose_name_plural': 'Factures',
            },
            bases=('Finances.icf_record',),
        ),
        migrations.CreateModel(
            name='iCf_Purchase',
            fields=[
                ('invoice', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Invoice')),
                ('num', models.CharField(help_text='N\xfamero Factura prove\xefdor.', max_length=20, verbose_name='N\xba Factura', validators=[django.core.validators.RegexValidator(b'^[0-9a-zA-Z]*$', 'Nom\xe8s n\xfameros i lletres')])),
                ('provider', models.ForeignKey(verbose_name='Prove\xefdor', to='Finances.iCf_Provider')),
            ],
            options={
                'verbose_name': '2 - Factura Despesa',
                'verbose_name_plural': '2 - Factures Despeses',
            },
            bases=('Finances.icf_invoice',),
        ),
        migrations.CreateModel(
            name='iCf_Duty',
            fields=[
                ('icf_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Record')),
                ('value', models.IntegerField(db_index=True, unique=True, verbose_name='IVA', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(100)])),
            ],
            options={
                'verbose_name': 'IVA',
                'verbose_name_plural': 'IVAs',
            },
            bases=('Finances.icf_record',),
        ),
        migrations.CreateModel(
            name='iCf_Sale',
            fields=[
                ('invoice', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Invoice')),
                ('num', models.IntegerField(help_text='N\xfamero Factura: COOPXXXX/any/XXXX. Introdu\xefu nom\xe9s el n\xfamero final.', verbose_name='N\xba Factura')),
                ('client', models.ForeignKey(related_name=b'sales_invoice_clients', verbose_name='Client', to='Finances.iCf_Client')),
            ],
            options={
                'verbose_name': '01 - Factura Emesa',
                'verbose_name_plural': '01 - Factures Emeses',
            },
            bases=('Finances.icf_invoice',),
        ),
        migrations.CreateModel(
            name='iCf_Sale_line',
            fields=[
                ('line', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Invoice_line')),
                ('percent_invoiced_vat', models.ForeignKey(verbose_name='IVA Facturat (%)', to='Finances.iCf_Duty', help_text="El % d'IVA que s'aplica en la factura. Indicar un valor d'IVA per concepte")),
            ],
            options={
                'verbose_name': 'L\xednia de factura emesa',
                'verbose_name_plural': 'L\xednies de factura emesa',
            },
            bases=('Finances.icf_invoice_line',),
        ),
        migrations.CreateModel(
            name='iCf_Sales_movement',
            fields=[
                ('icf_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Record')),
                ('concept', models.CharField(max_length=200, verbose_name='Concept')),
                ('execution_date', models.DateField(help_text='La data en que es realitza. Exemple dd/mm/aaaa', null=True, verbose_name='Data de realitzaci\xf3', blank=True)),
                ('value', models.DecimalField(help_text='Import en unitats monet\xe0ries', verbose_name='Import u.m.', max_digits=10, decimal_places=2)),
                ('planned_date', models.DateField(help_text='La data prevista. Exemple dd/mm/aaaa', verbose_name='Data previsi\xf3')),
                ('who_manage', models.IntegerField(default=0, help_text="Si selecciona la opci\xf3 'desde la cooperativa' haur\xe0 d'ampliar informaci\xf3.", verbose_name='Forma de pagament', choices=[(0, 'Gestionat per la socia'), (1, 'Gestionat per la cooperativa')])),
                ('currency', models.ForeignKey(verbose_name='Moneda', to='General.Unit', help_text='Indica el tipus de moneda del moviment')),
                ('icf_cooper', models.ForeignKey(verbose_name='n\xba COOP', to='Finances.iCf_Cooper')),
            ],
            options={
                'verbose_name': 'L - Abonament',
                'verbose_name_plural': 'L - Abonaments',
            },
            bases=('Finances.icf_record',),
        ),
        migrations.CreateModel(
            name='iCf_Tax',
            fields=[
                ('icf_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Record')),
                ('value', models.DecimalField(unique=True, verbose_name='Quota Trimestral', max_digits=10, decimal_places=2, db_index=True)),
                ('min_base', models.IntegerField(verbose_name='Base imposable M\xednima')),
                ('max_base', models.IntegerField(verbose_name='Base imposable M\xe0xima')),
            ],
            options={
                'verbose_name': 'A - Taula quotes',
                'verbose_name_plural': 'A - Taula quotes',
            },
            bases=('Finances.icf_record',),
        ),
        migrations.CreateModel(
            name='iCf_Type',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'', help_text='El nom del Concepte', unique=True, max_length=200, verbose_name='Nom')),
                ('description', models.TextField(verbose_name='Descripci\xf3', blank=True)),
                ('lft', models.PositiveIntegerField(editable=False, db_index=True)),
                ('rght', models.PositiveIntegerField(editable=False, db_index=True)),
                ('tree_id', models.PositiveIntegerField(editable=False, db_index=True)),
                ('level', models.PositiveIntegerField(editable=False, db_index=True)),
                ('clas', models.CharField(help_text='Model de django o classe python associada al Tipus financer de CI', max_length=200, verbose_name='Clase', blank=True)),
            ],
            options={
                'verbose_name': 'c- Tipus financer CI',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='iCf_Record_Type',
            fields=[
                ('icf_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.iCf_Type')),
            ],
            options={
                'verbose_name': 'Tipus de Registre financer CI',
                'verbose_name_plural': 'c-> Tipus de Registres financers CI',
            },
            bases=('Finances.icf_type',),
        ),
        migrations.CreateModel(
            name='period_payment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('value', models.DecimalField(verbose_name='Import', max_digits=10, decimal_places=2)),
                ('currency', models.ForeignKey(verbose_name='Moneda', to='General.Unit', help_text='Selecciona la moneda')),
                ('period_close', models.ForeignKey(verbose_name='Trimestre', to='Finances.iCf_Period_close')),
            ],
            options={
                'verbose_name': 'Pagament',
                'verbose_name_plural': 'Pagaments',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='icf_type',
            name='parent',
            field=mptt.fields.TreeForeignKey(related_name=b'children', blank=True, to='Finances.iCf_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='icf_record',
            name='record_type',
            field=mptt.fields.TreeForeignKey(verbose_name='Tipus de Registre financer de CI', blank=True, to='Finances.iCf_Record_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='icf_purchase_line',
            name='percent_vat',
            field=models.ForeignKey(verbose_name='IVA (%)', to='Finances.iCf_Duty', help_text="El % d'IVA que s'aplica en la l\xednia."),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='icf_purchase',
            unique_together=set([('icf_cooper', 'period', 'num')]),
        ),
        migrations.AddField(
            model_name='icf_period_close',
            name='period',
            field=models.ForeignKey(verbose_name='Trimestre', blank=True, to='Finances.iCf_Period', null=True),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='icf_period_close',
            unique_together=set([('cooper', 'period')]),
        ),
        migrations.AddField(
            model_name='icf_invoice',
            name='icf_cooper',
            field=models.ForeignKey(verbose_name='n\xba COOP', to='Finances.iCf_Cooper'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='icf_invoice',
            name='lines',
            field=models.ForeignKey(related_name=b'rel_lines', verbose_name='L\xednes', blank=True, to='Finances.iCf_Invoice_line', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='icf_invoice',
            name='payment_type',
            field=mptt.fields.TreeForeignKey(verbose_name='Forma de pagament', blank=True, to='Welcome.Payment_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='icf_invoice',
            name='period',
            field=models.ForeignKey(verbose_name='Trimestre', blank=True, to='Finances.iCf_Period', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='icf_invoice',
            name='rel_account',
            field=models.ForeignKey(related_name=b'rel_invoices', verbose_name='Compte relacionat', blank=True, to='General.Record', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='icf_invoice',
            name='unit',
            field=models.ForeignKey(verbose_name='Unitat', to='General.Unit'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='icf_cooper',
            name='providers',
            field=models.ManyToManyField(to='Finances.iCf_Provider', verbose_name='Prove\xefdors'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='icf_cooper',
            name='registrationprofile_ptr',
            field=models.OneToOneField(parent_link=True, auto_created=True, to='public_form.RegistrationProfile'),
            preserve_default=True,
        ),
        migrations.CreateModel(
            name='cooper_proxy_balance',
            fields=[
            ],
            options={
                'verbose_name': 'L - Balan\xe7 projecte',
                'proxy': True,
                'verbose_name_plural': 'L - Balan\xe7 projectes',
            },
            bases=('Finances.icf_cooper',),
        ),
        migrations.CreateModel(
            name='cooper_proxy_companies',
            fields=[
            ],
            options={
                'verbose_name': 'B - Els meus clients i prove\xefdors',
                'proxy': True,
                'verbose_name_plural': 'B - Els meus clients i prove\xefdors',
            },
            bases=('Finances.icf_cooper',),
        ),
        migrations.CreateModel(
            name='cooper_proxy_transactions',
            fields=[
            ],
            options={
                'verbose_name': 'K - Transaccions',
                'proxy': True,
                'verbose_name_plural': 'K - Transaccions',
            },
            bases=('Finances.icf_cooper',),
        ),
    ]
