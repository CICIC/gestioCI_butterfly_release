# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
import mptt.fields
import django.core.files.storage
from django.conf import settings
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        ('Welcome', '__first__'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('General', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='company',
            fields=[
                ('company_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='General.Company')),
                ('name', models.CharField(help_text='El nom fiscal del client a qui es factura. Ex. SOM EL QUE SOM SL', max_length=200, verbose_name='Nom Fiscal')),
                ('CIF', models.CharField(help_text='NIF:12345678A - CIF: A12345678 - NIE: X12345678A del client a qui es factura.', max_length=30, null=True, verbose_name='CIF/NIF/NIE', blank=True)),
                ('otherCIF', models.CharField(help_text='Camps no NIF/CIF/NIE del client a qui es factura.', max_length=50, null=True, verbose_name='Altres identificadors', blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=('General.company',),
        ),
        migrations.CreateModel(
            name='client',
            fields=[
            ],
            options={
                'verbose_name': 'B - Client',
                'verbose_name_plural': 'B - Clients',
            },
            bases=('Finances.company',),
        ),
        migrations.CreateModel(
            name='coop',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=200, verbose_name='Nom', db_index=True)),
            ],
            options={
                'verbose_name': 'I - Cooperativa',
                'verbose_name_plural': 'I - Cooperatives',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='cooper',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('coop_number', models.IntegerField(unique=True, max_length=4, verbose_name='n\xba COOP', db_index=True)),
                ('assigned_vat', models.IntegerField(default=0, help_text="Aquest \xe9s el valor % d'IVA assignat fruit de l'avaluaci\xf3 social.", max_length=2, verbose_name='IVA Assignat', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(100)])),
                ('extra_days', models.IntegerField(default=0, help_text='Dies extra que pot editar el trimestre en curs.', max_length=2, verbose_name='Dies extra')),
                ('advanced_tax', models.DecimalField(default=0, help_text="Quota que s'aplicar\xe0 el primer trimestre", verbose_name='Quota avan\xe7ada (\u20ac)', max_digits=10, decimal_places=2)),
                ('clients', models.ManyToManyField(to='Finances.client', verbose_name='Clients')),
                ('coop', models.ForeignKey(verbose_name='Cooperativa', to='Finances.coop')),
                ('membership', models.ForeignKey(verbose_name='rel_to_new_system', blank=True, to='Welcome.iC_Membership', null=True)),
            ],
            options={
                'verbose_name': 'D - Socia',
                'verbose_name_plural': 'D -  Socies',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CSVImport',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('model_name', models.CharField(default=b'iisharing.Item', help_text=b'Please specify the app_label.model_name', max_length=255, choices=[(b'cooper', b'cooper')])),
                ('field_list', models.CharField(help_text=b'Enter list of fields in order only if\n\t\t   you dont have a header row with matching field names, eg.\n\t\t   "column1=shared_code,column2=org(Organisation|name)"', max_length=255, blank=True)),
                ('upload_file', models.FileField(storage=django.core.files.storage.FileSystemStorage(location=b'/media/sf_hicki/Desarrollo/Matrix/ALEPH/apemtic_COOPER/geeconv08/gestioci_v8_code/media/'), upload_to=b'csv')),
                ('file_name', models.CharField(max_length=255, blank=True)),
                ('encoding', models.CharField(max_length=32, blank=True)),
                ('upload_method', models.CharField(default=b'manual', max_length=50, choices=[(b'manual', b'manual'), (b'cronjob', b'cronjob')])),
                ('error_log', models.TextField(help_text='Cada l\xednea es un error.')),
                ('import_date', models.DateField(auto_now=True)),
                ('import_user', models.CharField(default=b'anonymous', help_text='Usuari id en text', max_length=255, blank=True)),
            ],
            options={
                'verbose_name': 'E - Importar CSV (socies)',
                'verbose_name_plural': 'E - Importar CSV (socies)',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='currencies',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text='Nom del tipus de moneda', max_length=20, verbose_name='Nom')),
            ],
            options={
                'verbose_name': 'H - Moneda',
                'verbose_name_plural': 'H - Monedes',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Email',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('efrom', models.EmailField(default=b'gestioci@cooperativa.cat', help_text=b'', max_length=75, verbose_name='Remitent')),
                ('eto', models.CharField(default=b'camp reservat pel sistema', help_text=b'', max_length=75, verbose_name='Destinatari')),
                ('subject', models.CharField(max_length=200, verbose_name='Assumpte')),
                ('body', models.TextField(verbose_name='Cos')),
                ('is_active', models.BooleanField(default=1, verbose_name='Activat')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='EmailNotification',
            fields=[
                ('email_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='Finances.Email')),
                ('ento', models.IntegerField(help_text="A qui s'envia", verbose_name='Destinataris', choices=[(0, 'Tots els socis'), (1, 'Socis que han tancat'), (2, 'Socis que NO han tancat'), (3, 'Usuari')])),
                ('notification_type', models.IntegerField(help_text="Quan s'executa", verbose_name='Tipus', choices=[(0, 'El primer dia del periode'), (1, 'X dies avan\xe7 de tancar'), (2, 'Dia de tancament'), (3, 'El dia senyalat')])),
                ('pointed_date', models.DateField(default=datetime.datetime(2014, 11, 16, 0, 14, 3, 446912), help_text="Per l'opci\xf3 -El dia senyalat-", verbose_name='Senyalar dia')),
                ('offset_days', models.IntegerField(default=0, help_text=b'', max_length=2, verbose_name='Dies avan\xe7 de tancar')),
            ],
            options={
                'verbose_name': 'J - Notificacions programades',
                'verbose_name_plural': 'J - Notificacions programades',
            },
            bases=('Finances.email',),
        ),
        migrations.CreateModel(
            name='iC_Period',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
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
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='iC_Tax',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('value', models.DecimalField(unique=True, verbose_name='Quota Trimestral', max_digits=10, decimal_places=2, db_index=True)),
                ('min_base', models.IntegerField(verbose_name='Base imposable M\xednima')),
                ('max_base', models.IntegerField(verbose_name='Base imposable M\xe0xima')),
            ],
            options={
                'verbose_name': 'A - Taula quotes',
                'verbose_name_plural': 'A - Taula quotes',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='invoice',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('amount', models.DecimalField(default=0, verbose_name='Import', max_digits=6, decimal_places=2)),
                ('issue_date', models.DateField(default=datetime.datetime.today, null=True, verbose_name="Data d'emisi\xf3", blank=True)),
                ('deadline_date', models.DateField(null=True, verbose_name='Data de venciment', blank=True)),
                ('payment_date', models.DateField(null=True, verbose_name='Data de pagament', blank=True)),
                ('date', models.DateField(help_text="La data d'emissi\xf3 de la factura. Exemple dd/mm/aaaa", verbose_name='Data')),
                ('expiring_date', models.DateField(help_text='La data de venciment. Exemple dd/mm/aaaa', null=True, verbose_name='Data venciment', blank=True)),
                ('who_manage', models.IntegerField(default=0, help_text="Si selecciona la opci\xf3 'desde la cooperativa' haur\xe0 d'ampliar informaci\xf3.", verbose_name='Forma de pagament', choices=[(0, 'Gestionat per la socia'), (1, 'Gestionat per la cooperativa')])),
                ('transfer_date', models.DateField(help_text='La data en que es liquida la factura. Exemple dd/mm/aaaa', null=True, verbose_name='Data de liquidaci\xf3', blank=True)),
            ],
            options={
                'abstract': False,
                'verbose_name': 'Factura',
                'verbose_name_plural': 'Factures',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='invoice_line',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('value', models.DecimalField(help_text='La Base Imposable de la factura. Exemple 1000,30 . Indicar una coma pels decimals.', verbose_name='Base Imposable (\u20ac)', max_digits=10, decimal_places=2)),
            ],
            options={
                'abstract': False,
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='period',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
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
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='period_close',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
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
                ('cooper', models.ForeignKey(verbose_name='n\xba COOP', blank=True, to='Finances.cooper', null=True)),
                ('human', models.ForeignKey(related_name=b'out_periodclose', verbose_name='Hum\xe0 balance', to='General.Human')),
                ('ic_membership', models.ForeignKey(related_name=b'periodclose_membership', verbose_name='Registre de Soci', blank=True, to='Welcome.iC_Membership', null=True)),
                ('period', models.ForeignKey(verbose_name='Trimestre', blank=True, to='Finances.period', null=True)),
                ('project', mptt.fields.TreeForeignKey(related_name=b'in_periodclose', verbose_name='Projecte balance', to='General.Project')),
            ],
            options={
                'verbose_name': '03 - Resultats',
                'verbose_name_plural': '03 - Resultats',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='period_payment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('value', models.DecimalField(verbose_name='Import', max_digits=10, decimal_places=2)),
                ('currency', models.ForeignKey(verbose_name='Moneda', to='Finances.currencies', help_text='Selecciona la moneda')),
                ('period_close', models.ForeignKey(verbose_name='Trimestre', to='Finances.period_close')),
            ],
            options={
                'verbose_name': 'Pagament',
                'verbose_name_plural': 'Pagaments',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='provider',
            fields=[
                ('iban', models.CharField(max_length=20, null=True, verbose_name='IBAN', blank=True)),
            ],
            options={
                'verbose_name': 'C - Prove\xefdor',
                'verbose_name_plural': 'C - Prove\xefdors',
            },
            bases=('Finances.company',),
        ),
        migrations.CreateModel(
            name='purchases_invoice',
            fields=[
                ('invoice', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.invoice')),
                ('num', models.IntegerField(help_text='N\xfamero Factura.', verbose_name='N\xba Factura', validators=[django.core.validators.RegexValidator(b'^[0-9a-zA-Z]*$', 'Nom\xe8s n\xfameros i lletres')])),
                ('provider', models.ForeignKey(verbose_name='Prove\xefdor', to='Finances.provider')),
            ],
            options={
                'verbose_name': '02 - Factura Despesa',
                'verbose_name_plural': '02 - Factures Despeses',
            },
            bases=('Finances.invoice',),
        ),
        migrations.CreateModel(
            name='purchases_line',
            fields=[
                ('line', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.invoice_line')),
                ('percent_irpf', models.IntegerField(default=0, help_text='El % de retenci\xf3 de IRPF (Nom\xe9s en lloguers i factures de persones f\xedsiques).', verbose_name='IRPF (%)', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(100)])),
            ],
            options={
                'verbose_name': 'L\xednia de factura despesa',
                'verbose_name_plural': 'L\xednies de factura despesa',
            },
            bases=('Finances.invoice_line',),
        ),
        migrations.CreateModel(
            name='purchases_movement',
            fields=[
                ('ic_record_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('concept', models.CharField(max_length=200, verbose_name='Concept')),
                ('execution_date', models.DateField(help_text='La data en que es realitza. Exemple dd/mm/aaaa', null=True, verbose_name='Data de realitzaci\xf3', blank=True)),
                ('value', models.DecimalField(help_text='Import en unitats monet\xe0ries', verbose_name='Import u.m.', max_digits=10, decimal_places=2)),
                ('petition_date', models.DateField(help_text='La data de petici\xf3. Exemple dd/mm/aaaa', verbose_name='Data previsi\xf3')),
                ('acceptation_date', models.DateField(help_text="La data en que s'accepta. Exemple dd/mm/aaaa", null=True, verbose_name="Data d'acceptament", blank=True)),
                ('cooper', models.ForeignKey(verbose_name='n\xba COOP', to='Finances.cooper')),
                ('currency', models.ForeignKey(verbose_name='Moneda', to='Finances.currencies', help_text='Indica el tipus de moneda del moviment')),
            ],
            options={
                'verbose_name': 'M - Reintegrament',
                'verbose_name_plural': 'M - Reintegraments',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='sales_invoice',
            fields=[
                ('invoice', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.invoice')),
                ('num', models.IntegerField(help_text='N\xfamero Factura: COOPXXXX/any/XXXX. Introdu\xefu nom\xe9s el n\xfamero final.', verbose_name='N\xba Factura')),
                ('client', models.ForeignKey(related_name=b'sales_invoice_clients', verbose_name='Client', to='Finances.client')),
            ],
            options={
                'verbose_name': '01 - Factura Emesa',
                'verbose_name_plural': '01 - Factures Emeses',
            },
            bases=('Finances.invoice',),
        ),
        migrations.CreateModel(
            name='sales_line',
            fields=[
                ('line', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Finances.invoice_line')),
            ],
            options={
                'verbose_name': 'L\xednia de factura emesa',
                'verbose_name_plural': 'L\xednies de factura emesa',
            },
            bases=('Finances.invoice_line',),
        ),
        migrations.CreateModel(
            name='sales_movement',
            fields=[
                ('ic_record_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('concept', models.CharField(max_length=200, verbose_name='Concept')),
                ('execution_date', models.DateField(help_text='La data en que es realitza. Exemple dd/mm/aaaa', null=True, verbose_name='Data de realitzaci\xf3', blank=True)),
                ('value', models.DecimalField(help_text='Import en unitats monet\xe0ries', verbose_name='Import u.m.', max_digits=10, decimal_places=2)),
                ('planned_date', models.DateField(help_text='La data prevista. Exemple dd/mm/aaaa', verbose_name='Data previsi\xf3')),
                ('who_manage', models.IntegerField(default=0, help_text="Si selecciona la opci\xf3 'desde la cooperativa' haur\xe0 d'ampliar informaci\xf3.", verbose_name='Forma de pagament', choices=[(0, 'Gestionat per la socia'), (1, 'Gestionat per la cooperativa')])),
                ('cooper', models.ForeignKey(verbose_name='n\xba COOP', to='Finances.cooper')),
                ('currency', models.ForeignKey(verbose_name='Moneda', to='Finances.currencies', help_text='Indica el tipus de moneda del moviment')),
            ],
            options={
                'verbose_name': 'L - Abonament',
                'verbose_name_plural': 'L - Abonaments',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='type',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'', help_text='El nom del Concepte', unique=True, max_length=200, verbose_name='Nom')),
                ('description', models.TextField(verbose_name='Descripci\xf3', blank=True)),
                ('lft', models.PositiveIntegerField(editable=False, db_index=True)),
                ('rght', models.PositiveIntegerField(editable=False, db_index=True)),
                ('tree_id', models.PositiveIntegerField(editable=False, db_index=True)),
                ('level', models.PositiveIntegerField(editable=False, db_index=True)),
                ('clas', models.CharField(help_text='Model de django o classe python associada al Tipus CI', max_length=200, verbose_name='Clase', blank=True)),
                ('parent', mptt.fields.TreeForeignKey(related_name=b'children', blank=True, to='Finances.type', null=True)),
            ],
            options={
                'verbose_name': 'c- Tipus ',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='vats',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('value', models.IntegerField(db_index=True, unique=True, verbose_name='IVA', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(100)])),
            ],
            options={
                'verbose_name': 'IVA',
                'verbose_name_plural': 'IVAs',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.AddField(
            model_name='sales_line',
            name='percent_invoiced_vat',
            field=models.ForeignKey(verbose_name='IVA Facturat (%)', to='Finances.vats', help_text="El % d'IVA que s'aplica en la factura. Indicar un valor d'IVA per concepte"),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='sales_invoice',
            unique_together=set([('cooper', 'period', 'num')]),
        ),
        migrations.AddField(
            model_name='purchases_line',
            name='percent_vat',
            field=models.ForeignKey(verbose_name='IVA (%)', to='Finances.vats', help_text="El % d'IVA que s'aplica en la factura."),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='period_close',
            unique_together=set([('cooper', 'period')]),
        ),
        migrations.AddField(
            model_name='invoice',
            name='cooper',
            field=models.ForeignKey(verbose_name='n\xba COOP', to='Finances.cooper'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invoice',
            name='human',
            field=models.ForeignKey(related_name=b'out_invoices', verbose_name='Ens pagador', to='General.Human'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invoice',
            name='ic_membership',
            field=models.ForeignKey(related_name=b'invoices_membership', verbose_name='Registre de Soci', blank=True, to='Welcome.iC_Membership', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invoice',
            name='lines',
            field=models.ForeignKey(related_name=b'rel_lines', verbose_name='L\xednes', blank=True, to='Finances.invoice_line', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invoice',
            name='payment_type',
            field=mptt.fields.TreeForeignKey(verbose_name='Forma de pagament', blank=True, to='Welcome.Payment_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invoice',
            name='period',
            field=models.ForeignKey(verbose_name='Trimestre', to='Finances.period'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invoice',
            name='project',
            field=mptt.fields.TreeForeignKey(related_name=b'in_invoices', verbose_name='Projecte receptor', to='General.Project'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invoice',
            name='rel_account',
            field=models.ForeignKey(related_name=b'rel_invoices', verbose_name='Compte relacionat', blank=True, to='General.Record', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invoice',
            name='unit',
            field=models.ForeignKey(verbose_name='Unitat', to='General.Unit'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='emailnotification',
            name='period',
            field=models.ForeignKey(to='Finances.period'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='emailnotification',
            name='sent_to_user',
            field=models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, help_text='Per la opci\xf3 -Usuari-', null=True, verbose_name='A Soci'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='cooper',
            name='providers',
            field=models.ManyToManyField(to='Finances.provider', verbose_name='Prove\xefdors'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='cooper',
            name='user',
            field=models.OneToOneField(verbose_name='Nom', to=settings.AUTH_USER_MODEL),
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
            bases=('Finances.cooper',),
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
            bases=('Finances.cooper',),
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
            bases=('Finances.cooper',),
        ),
    ]
