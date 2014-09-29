# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
import mptt.fields


class Migration(migrations.Migration):

    dependencies = [
        ('General', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='iC_Record',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200, null=True, verbose_name='Nom', blank=True)),
                ('description', models.TextField(null=True, verbose_name='Descripci\xf3', blank=True)),
            ],
            options={
                'verbose_name': 'Registre CI',
                'verbose_name_plural': 'o- Registres CI',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='iC_Membership',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('join_date', models.DateField(null=True, verbose_name="Data d'Alta", blank=True)),
                ('end_date', models.DateField(null=True, verbose_name='Data de Baixa', blank=True)),
                ('ic_CESnum', models.CharField(max_length=8, null=True, verbose_name='Numero al CES/iCES', blank=True)),
                ('virtual_market', models.BooleanField(default=False, verbose_name='Mercat Virtual?')),
            ],
            options={
                'verbose_name': 'Alta de Soci CI',
                'verbose_name_plural': 'r-> Altes de Socis CI (tots menys afins)',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='iC_Project_Membership',
            fields=[
                ('ic_membership', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Membership')),
                ('project', models.ForeignKey(verbose_name='Projecte S\xf2ci', to='General.Project')),
            ],
            options={
                'verbose_name': 'Alta de Projecte Col\xb7lectiu CI',
                'verbose_name_plural': '- Altes Socis Projectes Col\xb7lectius CI',
            },
            bases=('Welcome.ic_membership',),
        ),
        migrations.CreateModel(
            name='iC_Person_Membership',
            fields=[
                ('ic_membership', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Membership')),
            ],
            options={
                'verbose_name': 'Alta de Soci Cooperatiu individual CI',
                'verbose_name_plural': '- Altes Socis Cooperatius Individuals CI',
            },
            bases=('Welcome.ic_membership',),
        ),
        migrations.CreateModel(
            name='iC_Document',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('doc_file', models.FileField(upload_to=b'ic/docs', null=True, verbose_name='Document escanejat', blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='iC_Licence',
            fields=[
                ('ic_document', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Document')),
                ('number', models.CharField(max_length=30, null=True, verbose_name='N\xfamero de Lic\xe8ncia', blank=True)),
                ('start_date', models.DateField(null=True, verbose_name="Data d'inici de la lic\xe8ncia", blank=True)),
                ('end_date', models.DateField(null=True, verbose_name='Data de final de la lic\xe8ncia', blank=True)),
                ('rel_address', models.ForeignKey(verbose_name='Adre\xe7a relacionada', blank=True, to='General.Address', null=True)),
                ('rel_job', models.ForeignKey(verbose_name='Ofici relacionat', blank=True, to='General.Job', null=True)),
            ],
            options={
                'verbose_name': 'Llic\xe8ncia soci CI',
                'verbose_name_plural': 'd- Llic\xe8ncies socis CI',
            },
            bases=('Welcome.ic_document',),
        ),
        migrations.CreateModel(
            name='iC_Labor_Contract',
            fields=[
                ('ic_document', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Document')),
                ('start_date', models.DateField(null=True, verbose_name="Data d'inici del contracte", blank=True)),
                ('end_date', models.DateField(null=True, verbose_name='Data de final del contracte', blank=True)),
                ('company', models.ForeignKey(verbose_name='Empresa contractant', blank=True, to='General.Company', null=True)),
                ('person', models.ForeignKey(verbose_name='Persona contractada', to='General.Person')),
            ],
            options={
                'verbose_name': 'Contracte Laboral CI',
                'verbose_name_plural': 'd- Contractes Laborals CI',
            },
            bases=('Welcome.ic_document',),
        ),
        migrations.CreateModel(
            name='iC_Insurance',
            fields=[
                ('ic_document', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Document')),
                ('number', models.CharField(max_length=30, null=True, verbose_name='N\xfamero de P\xf2lissa', blank=True)),
                ('price', models.DecimalField(null=True, verbose_name='Import', max_digits=13, decimal_places=2, blank=True)),
                ('start_date', models.DateField(null=True, verbose_name="Data d'inici de l'asseguran\xe7a", blank=True)),
                ('end_date', models.DateField(null=True, verbose_name="Data de final de l'asseguran\xe7a", blank=True)),
                ('payed_date', models.DateField(null=True, verbose_name="Data pagament de l'asseguran\xe7a", blank=True)),
                ('company', models.ForeignKey(verbose_name='Empresa asseguradora', blank=True, to='General.Company', null=True)),
                ('price_unit', models.ForeignKey(verbose_name='Unitat', blank=True, to='General.Unit', null=True)),
                ('rel_address', models.ForeignKey(verbose_name='Adre\xe7a assegurada', blank=True, to='General.Address', null=True)),
                ('rel_job', models.ForeignKey(verbose_name='Ofici assegurat', blank=True, to='General.Job', null=True)),
            ],
            options={
                'verbose_name': 'Asseguran\xe7a soci CI',
                'verbose_name_plural': 'd- Assegurances socis CI',
            },
            bases=('Welcome.ic_document',),
        ),
        migrations.CreateModel(
            name='iC_Address_Contract',
            fields=[
                ('ic_document', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Document')),
                ('price', models.DecimalField(null=True, verbose_name='Import', max_digits=13, decimal_places=2, blank=True)),
                ('start_date', models.DateField(null=True, verbose_name="Data d'inici del contracte", blank=True)),
                ('end_date', models.DateField(null=True, verbose_name='Data de final del contracte', blank=True)),
                ('address', models.ForeignKey(verbose_name='Adre\xe7a contractada', to='General.Address')),
                ('company', models.ForeignKey(verbose_name='Empresa titular (CI)', blank=True, to='General.Company', null=True)),
                ('price_unit', models.ForeignKey(verbose_name='Unitat', blank=True, to='General.Unit', null=True)),
            ],
            options={
                'verbose_name': "Contracte d'Adre\xe7a CI",
                'verbose_name_plural': "d- Contractes d'Adre\xe7es CI",
            },
            bases=('Welcome.ic_document',),
        ),
        migrations.CreateModel(
            name='iC_Akin_Membership',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('join_date', models.DateField(null=True, verbose_name="Data d'Alta", blank=True)),
                ('end_date', models.DateField(null=True, verbose_name='Data de Baixa', blank=True)),
                ('ic_company', models.ForeignKey(related_name=b'akin_memberships', verbose_name='entitat legal', blank=True, to='General.Company', null=True)),
            ],
            options={
                'verbose_name': 'Alta de Soci Af\xed CI',
                'verbose_name_plural': '- Altes de Socis Afins CI',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='Fee',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('amount', models.DecimalField(default=0, verbose_name='Import', max_digits=6, decimal_places=2)),
                ('issue_date', models.DateField(default=datetime.datetime.today, null=True, verbose_name="Data d'emisi\xf3", blank=True)),
                ('deadline_date', models.DateField(null=True, verbose_name='Data de venciment', blank=True)),
                ('payment_date', models.DateField(null=True, verbose_name='Data de pagament', blank=True)),
                ('human', models.ForeignKey(related_name=b'out_fees', verbose_name='Ens pagador', to='General.Human')),
            ],
            options={
                'verbose_name': 'Quota',
                'verbose_name_plural': 'r- Quotes',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='iC_Self_Employed',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('join_date', models.DateField(null=True, verbose_name="Data d'Alta autoocupat", blank=True)),
                ('end_date', models.DateField(null=True, verbose_name='Data de Baixa autoocupat', blank=True)),
                ('organic', models.BooleanField(default=False, verbose_name='Productes ecol\xf2gics/organics?')),
                ('assigned_vat', models.DecimalField(decimal_places=2, default=18, max_digits=4, blank=True, null=True, verbose_name='IVA assignat')),
                ('review_vat', models.BooleanField(default=False, verbose_name='IVA en revisi\xf3?')),
                ('last_review_date', models.DateField(null=True, verbose_name='Data \xfaltima revisi\xf3 IVA', blank=True)),
                ('mentor_comment', models.TextField(null=True, verbose_name='Comentaris soci mentor', blank=True)),
                ('extra_days', models.IntegerField(default=0, max_length=2, blank=True, help_text='Dies extra que pot editar el trimestre en curs.', null=True, verbose_name='Dies extra')),
            ],
            options={
                'verbose_name': 'Alta Proj.Autoocupat',
                'verbose_name_plural': '- Altes Proj. Autoocupats',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='iC_Stallholder',
            fields=[
                ('ic_self_employed', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Self_Employed')),
                ('tent_type', models.CharField(blank=True, max_length=5, null=True, verbose_name='Tipus de carpa', choices=[(b'none', 'sense'), (b'wood', 'de fusta'), (b'metal', 'met\xe0lica')])),
            ],
            options={
                'verbose_name': 'Alta Proj.Autoocupat Firaire',
                'verbose_name_plural': '- Altes Proj. Autoocupats Firaires',
            },
            bases=('Welcome.ic_self_employed',),
        ),
        migrations.CreateModel(
            name='iC_Type',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'', help_text='El nom del Concepte', unique=True, max_length=200, verbose_name='Nom')),
                ('description', models.TextField(verbose_name='Descripci\xf3', blank=True)),
                ('lft', models.PositiveIntegerField(editable=False, db_index=True)),
                ('rght', models.PositiveIntegerField(editable=False, db_index=True)),
                ('tree_id', models.PositiveIntegerField(editable=False, db_index=True)),
                ('level', models.PositiveIntegerField(editable=False, db_index=True)),
                ('clas', models.CharField(help_text='Model de django o classe python associada al Tipus CI', max_length=200, verbose_name='Clase', blank=True)),
            ],
            options={
                'verbose_name': 'c- Tipus CI',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='iC_Record_Type',
            fields=[
                ('ic_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Type')),
            ],
            options={
                'verbose_name': 'Tipus de Registre CI',
                'verbose_name_plural': 'c-> Tipus de Registres CI',
            },
            bases=('Welcome.ic_type',),
        ),
        migrations.CreateModel(
            name='iC_Document_Type',
            fields=[
                ('record_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record_Type')),
            ],
            options={
                'verbose_name': 'Tipus de Document CI',
                'verbose_name_plural': 'c-> Tipus de Documents CI',
            },
            bases=('Welcome.ic_record_type',),
        ),
        migrations.CreateModel(
            name='Learn_Session',
            fields=[
                ('ic_record_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('datetime', models.DateTimeField(null=True, verbose_name='Dia i Hora', blank=True)),
                ('duration', models.TimeField(default=b'01:00', verbose_name='Duraci\xf3')),
                ('address', models.ForeignKey(verbose_name='Adre\xe7a', blank=True, to='General.Address', null=True)),
                ('assistants', models.ManyToManyField(related_name=b'assist_sessions', to='General.Human', blank=True, help_text='Quan escullis cada entitat assistent, desa el formulari per veure el seu nom aqu\xed', null=True, verbose_name='Assistents')),
                ('facilitator', models.ForeignKey(related_name=b'facilitate_sessions', verbose_name='Facilitador', blank=True, to='General.Human', null=True)),
                ('nonmaterial', models.ForeignKey(verbose_name='Formaci\xf3 (obra inmaterial)', to='General.Nonmaterial')),
            ],
            options={
                'verbose_name': 'Sessi\xf3 formativa',
                'verbose_name_plural': 'r- Sessions formatives',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.CreateModel(
            name='Payment_Type',
            fields=[
                ('ic_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Type')),
            ],
            options={
                'verbose_name': 'Forma de pagament',
                'verbose_name_plural': 'c-> Formes de pagament',
            },
            bases=('Welcome.ic_type',),
        ),
        migrations.CreateModel(
            name='Project_Accompaniment',
            fields=[
                ('ic_record_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('situation', models.TextField(verbose_name='Situaci\xf3 actual', blank=True)),
                ('needs', models.TextField(verbose_name='Necessitats', blank=True)),
                ('petition', models.TextField(verbose_name='Comentari petici\xf3', blank=True)),
                ('facilitator', models.ForeignKey(related_name=b'facilitate_projects', verbose_name='Facilitador', blank=True, to='General.Human', null=True)),
                ('human', models.ForeignKey(related_name=b'accompaniments', verbose_name='Projecte', to='General.Human')),
                ('petitioner', models.ForeignKey(related_name=b'petitions', verbose_name='Peticionari', blank=True, to='General.Human', null=True)),
            ],
            options={
                'verbose_name': 'Expedient Projecte Productiu',
                'verbose_name_plural': 'r- Expedients P.Productius',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.AddField(
            model_name='ic_type',
            name='parent',
            field=mptt.fields.TreeForeignKey(related_name=b'children', blank=True, to='Welcome.iC_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_self_employed',
            name='ic_membership',
            field=models.ForeignKey(related_name=b'selfemployed_recs', verbose_name='Registre de Soci', to='Welcome.iC_Membership'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_self_employed',
            name='mentor_membership',
            field=models.ForeignKey(related_name=b'mentor_of_SE', verbose_name='Mentor projecte', blank=True, to='Welcome.iC_Membership', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_self_employed',
            name='rel_accountBank',
            field=models.ForeignKey(verbose_name='Compte bancari CI associat', blank=True, to='General.AccountBank', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_self_employed',
            name='rel_address_contracts',
            field=models.ManyToManyField(related_name=b'selfemployed', null=True, verbose_name="Contractes d'Adre\xe7a vinculats", to='Welcome.iC_Address_Contract', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_self_employed',
            name='rel_fees',
            field=models.ManyToManyField(related_name=b'selfemployed', null=True, verbose_name='Quotes trimestrals', to='Welcome.Fee', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_self_employed',
            name='rel_images',
            field=models.ManyToManyField(related_name=b'selfemployed', null=True, verbose_name='Imatges requerides', to='General.Image', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_self_employed',
            name='rel_insurances',
            field=models.ManyToManyField(related_name=b'selfemployed', null=True, verbose_name='Assegurances vinculades', to='Welcome.iC_Insurance', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_self_employed',
            name='rel_licences',
            field=models.ManyToManyField(related_name=b'selfemployed', null=True, verbose_name='Llic\xe8ncies vinculades', to='Welcome.iC_Licence', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_record',
            name='record_type',
            field=mptt.fields.TreeForeignKey(verbose_name='Tipus de Registre CI', blank=True, to='Welcome.iC_Record_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_person_membership',
            name='labor_contract',
            field=models.OneToOneField(null=True, blank=True, to='Welcome.iC_Labor_Contract', verbose_name='Contracte laboral?'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_person_membership',
            name='person',
            field=models.ForeignKey(verbose_name='Persona S\xf2cia', to='General.Person'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_membership',
            name='contribution',
            field=mptt.fields.TreeForeignKey(verbose_name='Tipus de contribuci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_membership',
            name='expositors',
            field=models.ManyToManyField(to='General.Address', null=True, verbose_name='Expositors', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_membership',
            name='human',
            field=models.ForeignKey(verbose_name='Ens Soci', to='General.Human'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_membership',
            name='ic_company',
            field=models.ForeignKey(related_name=b'memberships', verbose_name='entitat legal', blank=True, to='General.Company', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_membership',
            name='ic_project',
            field=mptt.fields.TreeForeignKey(related_name=b'memberships', verbose_name='Cooperativa Integral', to='General.Project'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_membership',
            name='join_fee',
            field=models.ForeignKey(related_name=b'membership', verbose_name="Cuota d'alta", blank=True, to='Welcome.Fee', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_labor_contract',
            name='rel_fees',
            field=models.ManyToManyField(to='Welcome.Fee', null=True, verbose_name='Quotes relacionades', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_document',
            name='doc_type',
            field=mptt.fields.TreeForeignKey(verbose_name='Tipus de document', blank=True, to='Welcome.iC_Document_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_akin_membership',
            name='ic_membership',
            field=models.ManyToManyField(related_name=b'akin_memberships', null=True, verbose_name='vinculada al Projectes Socis', to='Welcome.iC_Membership', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_akin_membership',
            name='ic_project',
            field=mptt.fields.TreeForeignKey(related_name=b'akin_memberships', verbose_name='Cooperativa Integral', to='General.Project'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ic_akin_membership',
            name='person',
            field=models.OneToOneField(verbose_name='Persona, membre af\xed', to='General.Person'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='fee',
            name='payment_type',
            field=mptt.fields.TreeForeignKey(verbose_name='Forma de pagament', blank=True, to='Welcome.Payment_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='fee',
            name='project',
            field=mptt.fields.TreeForeignKey(related_name=b'in_fees', verbose_name='Projecte receptor', to='General.Project'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='fee',
            name='rel_account',
            field=models.ForeignKey(related_name=b'rel_fees', verbose_name='Compte relacionat', blank=True, to='General.Record', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='fee',
            name='unit',
            field=models.ForeignKey(verbose_name='Unitat', to='General.Unit'),
            preserve_default=True,
        ),
    ]
