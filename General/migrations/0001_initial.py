# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import mptt.fields


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text="El nom de l'Espai", max_length=100, verbose_name='Nom')),
                ('p_address', models.CharField(help_text='Adre\xe7a postal v\xe0lida per a enviaments', max_length=200, verbose_name='Direcci\xf3')),
                ('town', models.CharField(help_text='Poble, ciutat o municipi', max_length=150, verbose_name='Poblaci\xf3')),
                ('postalcode', models.CharField(max_length=5, null=True, verbose_name='Codi postal', blank=True)),
                ('ic_larder', models.BooleanField(default=False, verbose_name='\xc9s Rebost?')),
                ('size', models.DecimalField(decimal_places=2, max_digits=20, blank=True, help_text="Quantitat d'unitats (accepta 2 decimals)", null=True, verbose_name='Tamany')),
                ('longitude', models.IntegerField(null=True, verbose_name='Longitud (geo)', blank=True)),
                ('latitude', models.IntegerField(null=True, verbose_name='Latitud (geo)', blank=True)),
                ('description', models.TextField(help_text='Localitzaci\xf3 exacta, indicacions per arribar o comentaris', null=True, verbose_name="Descripci\xf3 de l'Adre\xe7a", blank=True)),
            ],
            options={
                'verbose_name': 'Adre\xe7a',
                'verbose_name_plural': 's- Adreces',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Human',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text='El nom de la Entitat', max_length=200, verbose_name='Nom')),
                ('birth_date', models.DateField(help_text='El dia que va comen\xe7ar a existir', null=True, verbose_name='Data de naixement', blank=True)),
                ('death_date', models.DateField(help_text="El dia que va deixar d'existir", null=True, verbose_name="Data d'acabament", blank=True)),
                ('nickname', models.CharField(help_text="El sobrenom (nickname) de l'entitat Humana", max_length=50, verbose_name='Sobrenom', blank=True)),
                ('email', models.EmailField(help_text="L'adre\xe7a d'email principal de l'entitat humana", max_length=100, verbose_name='Email', blank=True)),
                ('telephone_cell', models.CharField(help_text="El tel\xe8fon principal de l'entitat Humana", max_length=20, verbose_name='Tel\xe8fon m\xf2bil', blank=True)),
                ('telephone_land', models.CharField(max_length=20, verbose_name='Tel\xe8fon fix', blank=True)),
                ('website', models.CharField(help_text="L'adre\xe7a web principal de l'entitat humana", max_length=100, verbose_name='Web', blank=True)),
                ('description', models.TextField(null=True, verbose_name='Descripci\xf3 entitat', blank=True)),
            ],
            options={
                'verbose_name': 'Hum\xe0',
                'verbose_name_plural': 'e- Humans',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Company',
            fields=[
                ('human', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Human')),
                ('legal_name', models.CharField(max_length=200, null=True, verbose_name='Nom Fiscal', blank=True)),
                ('vat_number', models.CharField(max_length=20, null=True, verbose_name='CIF', blank=True)),
            ],
            options={
                'verbose_name': 'Empresa',
                'verbose_name_plural': 'e- Empreses',
            },
            bases=('General.human',),
        ),
        migrations.CreateModel(
            name='Job',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text="El nom de l'Art", unique=True, max_length=200, verbose_name='Nom')),
                ('verb', models.CharField(help_text='El verb de la acci\xf3, infinitiu', max_length=200, verbose_name='Verb', blank=True)),
                ('gerund', models.CharField(help_text='El verb en gerundi, present', max_length=200, verbose_name='Gerundi', blank=True)),
                ('description', models.TextField(verbose_name='Descripci\xf3', blank=True)),
                ('lft', models.PositiveIntegerField(editable=False, db_index=True)),
                ('rght', models.PositiveIntegerField(editable=False, db_index=True)),
                ('tree_id', models.PositiveIntegerField(editable=False, db_index=True)),
                ('level', models.PositiveIntegerField(editable=False, db_index=True)),
                ('clas', models.CharField(help_text="Model de django o classe python associada a l'Ofici'", max_length=50, verbose_name='Clase', blank=True)),
                ('parent', mptt.fields.TreeForeignKey(related_name=b'subarts', blank=True, to='General.Job', null=True)),
            ],
            options={
                'verbose_name': 'Ofici',
                'verbose_name_plural': 'a- Oficis',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Material',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200, null=True, verbose_name='Nom', blank=True)),
                ('description', models.TextField(null=True, verbose_name='Descripci\xf3', blank=True)),
            ],
            options={
                'verbose_name': 'Obra Material',
                'verbose_name_plural': 'o- Obres Materials',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Asset',
            fields=[
                ('material', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Material')),
                ('reciprocity', models.TextField(verbose_name='Reciprocitat', blank=True)),
            ],
            options={
                'verbose_name': 'Actiu',
                'verbose_name_plural': 'o- Actius',
            },
            bases=('General.material',),
        ),
        migrations.CreateModel(
            name='Nonmaterial',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200, null=True, verbose_name='Nom', blank=True)),
                ('description', models.TextField(null=True, verbose_name='Descripci\xf3', blank=True)),
            ],
            options={
                'verbose_name': 'Obra Inmaterial',
                'verbose_name_plural': 'o- Obres Inmaterials',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('nonmaterial', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Nonmaterial')),
                ('image', models.ImageField(upload_to=b'files/images', width_field=b'width', height_field=b'height', blank=True, null=True, verbose_name='Imatge (jpg/png)')),
                ('url', models.URLField(null=True, verbose_name='Url de la imatge', blank=True)),
                ('height', models.IntegerField(null=True, verbose_name='Al\xe7ada', blank=True)),
                ('width', models.IntegerField(null=True, verbose_name='Amplada', blank=True)),
            ],
            options={
                'verbose_name': 'Imatge',
                'verbose_name_plural': 'o- Imatges',
            },
            bases=('General.nonmaterial',),
        ),
        migrations.CreateModel(
            name='Person',
            fields=[
                ('human', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Human')),
                ('surnames', models.CharField(help_text='Els cognoms de la Persona', max_length=200, verbose_name='Cognoms', blank=True)),
                ('id_card', models.CharField(max_length=9, verbose_name='DNI/NIE', blank=True)),
                ('email2', models.EmailField(max_length=75, verbose_name='Email alternatiu', blank=True)),
                ('nickname2', models.CharField(max_length=50, verbose_name='Sobrenom a la Xarxa Social', blank=True)),
            ],
            options={
                'verbose_name': 'Persona',
                'verbose_name_plural': 'e- Persones',
            },
            bases=('General.human',),
        ),
        migrations.CreateModel(
            name='Project',
            fields=[
                ('human', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Human')),
                ('socialweb', models.CharField(max_length=100, verbose_name='Web Social', blank=True)),
                ('email2', models.EmailField(max_length=75, verbose_name='Email alternatiu', blank=True)),
                ('ecommerce', models.BooleanField(default=False, verbose_name='Comer\xe7 electr\xf2nic?')),
                ('lft', models.PositiveIntegerField(editable=False, db_index=True)),
                ('rght', models.PositiveIntegerField(editable=False, db_index=True)),
                ('tree_id', models.PositiveIntegerField(editable=False, db_index=True)),
                ('level', models.PositiveIntegerField(editable=False, db_index=True)),
                ('parent', mptt.fields.TreeForeignKey(related_name=b'subprojects', verbose_name='Projecte Marc', blank=True, to='General.Project', null=True)),
            ],
            options={
                'verbose_name': 'Projecte',
                'verbose_name_plural': 'e- Projectes',
            },
            bases=('General.human', models.Model),
        ),
        migrations.CreateModel(
            name='Record',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200, null=True, verbose_name='Nom', blank=True)),
                ('description', models.TextField(null=True, verbose_name='Descripci\xf3', blank=True)),
            ],
            options={
                'verbose_name': 'Registre',
                'verbose_name_plural': 'o- Registres',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='AccountCrypto',
            fields=[
                ('record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Record')),
                ('number', models.CharField(max_length=34, verbose_name='Adre\xe7a de la bitlletera', blank=True)),
            ],
            options={
                'verbose_name': 'Compte Criptomoneda',
                'verbose_name_plural': 'o- Comptes Criptomonedes',
            },
            bases=('General.record',),
        ),
        migrations.CreateModel(
            name='AccountCes',
            fields=[
                ('record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Record')),
                ('code', models.CharField(max_length=10, null=True, verbose_name='Codi ecoxarxa', blank=True)),
                ('number', models.CharField(max_length=4, null=True, verbose_name='N\xfamero compte', blank=True)),
            ],
            options={
                'verbose_name': 'Compte CES',
                'verbose_name_plural': 'o- Comptes CES',
            },
            bases=('General.record',),
        ),
        migrations.CreateModel(
            name='AccountBank',
            fields=[
                ('record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Record')),
                ('code', models.CharField(max_length=11, null=True, verbose_name='Codi SWIFT/BIC', blank=True)),
                ('number', models.CharField(max_length=34, null=True, verbose_name='N\xfamero de Compte IBAN', blank=True)),
                ('bankcard', models.BooleanField(default=False, verbose_name='Amb Tarjeta?')),
            ],
            options={
                'verbose_name': 'Compte Bancari',
                'verbose_name_plural': 'o- Comptes Bancaris',
            },
            bases=('General.record',),
        ),
        migrations.CreateModel(
            name='Region',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text="El nom de l'Espai", max_length=100, verbose_name='Nom')),
                ('description', models.TextField(null=True, verbose_name='Descripci\xf3 de la Regi\xf3', blank=True)),
                ('lft', models.PositiveIntegerField(editable=False, db_index=True)),
                ('rght', models.PositiveIntegerField(editable=False, db_index=True)),
                ('tree_id', models.PositiveIntegerField(editable=False, db_index=True)),
                ('level', models.PositiveIntegerField(editable=False, db_index=True)),
                ('parent', mptt.fields.TreeForeignKey(related_name=b'subregions', blank=True, to='General.Region', null=True)),
            ],
            options={
                'verbose_name': 'Regi\xf3',
                'verbose_name_plural': 's- Regions',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Human_Addresses',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('main_address', models.BooleanField(default=False, verbose_name='Adre\xe7a principal?')),
                ('address', models.ForeignKey(related_name=b'rel_human', verbose_name='Adre\xe7a', to='General.Address', help_text="Un cop escollida l'adre\xe7a, desa el perfil per veure el seu nom aqu\xed.")),
                ('human', models.ForeignKey(to='General.Human')),
            ],
            options={
                'verbose_name': 'H_adr',
                'verbose_name_plural': "Adre\xe7es de l'entitat",
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Human_Companies',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('company', models.ForeignKey(verbose_name='Empresa vinculada', to='General.Company')),
                ('human', models.ForeignKey(related_name=b'human_companies', to='General.Human')),
            ],
            options={
                'verbose_name': 'H_emp',
                'verbose_name_plural': 'Empreses vinculades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Human_Jobs',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('human', models.ForeignKey(to='General.Human')),
                ('job', mptt.fields.TreeForeignKey(verbose_name='Ofici', to='General.Job')),
            ],
            options={
                'verbose_name': 'H_ofi',
                'verbose_name_plural': "Oficis de l'entitat",
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Human_Materials',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('human', models.ForeignKey(to='General.Human')),
                ('material', models.ForeignKey(verbose_name='obra Material', to='General.Material')),
            ],
            options={
                'verbose_name': 'H_mat',
                'verbose_name_plural': 'Obres materials',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Human_Nonmaterials',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('human', models.ForeignKey(to='General.Human')),
                ('nonmaterial', models.ForeignKey(verbose_name='obra Inmaterial', to='General.Nonmaterial')),
            ],
            options={
                'verbose_name': 'H_inm',
                'verbose_name_plural': 'Obres inmaterials',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Human_Persons',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('human', models.ForeignKey(related_name=b'human_persons', to='General.Human')),
                ('person', models.ForeignKey(related_name=b'rel_humans', verbose_name='Persona vinculada', to='General.Person')),
            ],
            options={
                'verbose_name': 'H_per',
                'verbose_name_plural': 'Persones vinculades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Human_Projects',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('human', models.ForeignKey(related_name=b'human_projects', to='General.Human')),
                ('project', mptt.fields.TreeForeignKey(related_name=b'rel_humans', verbose_name='Projecte vinculat', to='General.Project', help_text='Un cop escollit el projecte, desa el perfil per veure el seu nom aqu\xed.')),
            ],
            options={
                'verbose_name': 'H_pro',
                'verbose_name_plural': 'Projectes vinculats',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Human_Records',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('human', models.ForeignKey(to='General.Human')),
            ],
            options={
                'verbose_name': 'H_rec',
                'verbose_name_plural': 'Registres vinculats',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Human_Regions',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('human', models.ForeignKey(to='General.Human')),
                ('region', mptt.fields.TreeForeignKey(verbose_name='Regi\xf3', to='General.Region')),
            ],
            options={
                'verbose_name': 'H_reg',
                'verbose_name_plural': 'Regions vinculades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Material_Addresses',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('address', models.ForeignKey(related_name=b'materials', verbose_name='Adre\xe7a vinculada', to='General.Address')),
                ('material', models.ForeignKey(to='General.Material')),
            ],
            options={
                'verbose_name': 'M_adr',
                'verbose_name_plural': 'Adre\xe7es vinculades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Material_Jobs',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('job', models.ForeignKey(related_name=b'materials', verbose_name='Arts/Oficis vinculades', to='General.Job')),
                ('material', models.ForeignKey(to='General.Material')),
            ],
            options={
                'verbose_name': 'M_ofi',
                'verbose_name_plural': 'Arts/Oficis vinculades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Material_Materials',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('material', models.ForeignKey(to='General.Material')),
                ('material2', models.ForeignKey(related_name=b'submaterials', verbose_name='obres Materials vinculades', to='General.Material')),
            ],
            options={
                'verbose_name': 'M_mat',
                'verbose_name_plural': 'obres Materials vinculades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Material_Nonmaterials',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('material', models.ForeignKey(to='General.Material')),
                ('nonmaterial', models.ForeignKey(verbose_name='Inmaterial vinculat', to='General.Nonmaterial')),
            ],
            options={
                'verbose_name': 'M_inm',
                'verbose_name_plural': 'Inmaterials vinculats',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Material_Records',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('material', models.ForeignKey(to='General.Material')),
            ],
            options={
                'verbose_name': 'M_rec',
                'verbose_name_plural': 'Registres vinculats',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Nonmaterial_Addresses',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('address', models.ForeignKey(verbose_name='Adre\xe7a vinculada', to='General.Address')),
                ('nonmaterial', models.ForeignKey(to='General.Nonmaterial')),
            ],
            options={
                'verbose_name': 'N_adr',
                'verbose_name_plural': 'Adre\xe7es vinculades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Nonmaterial_Jobs',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('job', models.ForeignKey(related_name=b'nonmaterials', verbose_name='Arts/Oficis vinculades', to='General.Job')),
                ('nonmaterial', models.ForeignKey(to='General.Nonmaterial')),
            ],
            options={
                'verbose_name': 'N_ofi',
                'verbose_name_plural': 'Arts/Oficis vinculades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Nonmaterial_Nonmaterials',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nonmaterial', models.ForeignKey(to='General.Nonmaterial')),
                ('nonmaterial2', models.ForeignKey(related_name=b'subnonmaterials', verbose_name='obres Inmaterials vinculades', to='General.Nonmaterial')),
            ],
            options={
                'verbose_name': 'N_mat',
                'verbose_name_plural': 'obres Inmaterials vinculades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='rel_Nonmaterial_Records',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nonmaterial', models.ForeignKey(to='General.Nonmaterial')),
            ],
            options={
                'verbose_name': 'N_rec',
                'verbose_name_plural': 'Registres vinculats',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Relation',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text="El nom de l'Art", unique=True, max_length=200, verbose_name='Nom')),
                ('verb', models.CharField(help_text='El verb de la acci\xf3, infinitiu', max_length=200, verbose_name='Verb', blank=True)),
                ('gerund', models.CharField(help_text='El verb en gerundi, present', max_length=200, verbose_name='Gerundi', blank=True)),
                ('description', models.TextField(verbose_name='Descripci\xf3', blank=True)),
                ('lft', models.PositiveIntegerField(editable=False, db_index=True)),
                ('rght', models.PositiveIntegerField(editable=False, db_index=True)),
                ('tree_id', models.PositiveIntegerField(editable=False, db_index=True)),
                ('level', models.PositiveIntegerField(editable=False, db_index=True)),
                ('clas', models.CharField(help_text='Model de django o classe python associada a la Relaci\xf3', max_length=50, verbose_name='Clase', blank=True)),
                ('parent', mptt.fields.TreeForeignKey(related_name=b'subarts', blank=True, to='General.Relation', null=True)),
            ],
            options={
                'verbose_name': 'Relaci\xf3',
                'verbose_name_plural': 'a- Relacions',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Type',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'', help_text='El nom del Concepte', unique=True, max_length=200, verbose_name='Nom')),
                ('description', models.TextField(verbose_name='Descripci\xf3', blank=True)),
                ('lft', models.PositiveIntegerField(editable=False, db_index=True)),
                ('rght', models.PositiveIntegerField(editable=False, db_index=True)),
                ('tree_id', models.PositiveIntegerField(editable=False, db_index=True)),
                ('level', models.PositiveIntegerField(editable=False, db_index=True)),
                ('clas', models.CharField(help_text='Model de django o classe python associada al Tipus', max_length=200, verbose_name='Clase', blank=True)),
            ],
            options={
                'verbose_name': 'c- Tipus',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Space_Type',
            fields=[
                ('typ', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Type')),
            ],
            options={
                'verbose_name': "Tipus d'Espai",
                'verbose_name_plural': "s--> Tipus d'Espais",
            },
            bases=('General.type',),
        ),
        migrations.CreateModel(
            name='Address_Type',
            fields=[
                ('space_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Space_Type')),
            ],
            options={
                'verbose_name': "Tipus d'Adre\xe7a",
                'verbose_name_plural': "s-> Tipus d'Adreces",
            },
            bases=('General.space_type',),
        ),
        migrations.CreateModel(
            name='Region_Type',
            fields=[
                ('space_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Space_Type')),
            ],
            options={
                'verbose_name': 'Tipus de Regi\xf3',
                'verbose_name_plural': 's-> Tipus de Regions',
            },
            bases=('General.space_type',),
        ),
        migrations.CreateModel(
            name='Being_Type',
            fields=[
                ('typ', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Type')),
            ],
            options={
                'verbose_name': "Tipus d'entitat",
                'verbose_name_plural': "e--> Tipus d'entitats",
            },
            bases=('General.type',),
        ),
        migrations.CreateModel(
            name='Project_Type',
            fields=[
                ('being_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Being_Type')),
            ],
            options={
                'verbose_name': 'Tipus de Projecte',
                'verbose_name_plural': 'e-> Tipus de Projectes',
            },
            bases=('General.being_type',),
        ),
        migrations.CreateModel(
            name='Company_Type',
            fields=[
                ('being_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Being_Type')),
            ],
            options={
                'verbose_name': "Tipus d'Empresa",
                'verbose_name_plural': "e-> Tipus d'Empreses",
            },
            bases=('General.being_type',),
        ),
        migrations.CreateModel(
            name='Artwork_Type',
            fields=[
                ('typ', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Type')),
            ],
            options={
                'verbose_name': "Tipus d'Obra",
                'verbose_name_plural': "o--> Tipus d'Obres",
            },
            bases=('General.type',),
        ),
        migrations.CreateModel(
            name='Record_Type',
            fields=[
                ('artwork_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Artwork_Type')),
            ],
            options={
                'verbose_name': 'Tipus de Registre',
                'verbose_name_plural': 'o-> Tipus de Registres',
            },
            bases=('General.artwork_type',),
        ),
        migrations.CreateModel(
            name='Nonmaterial_Type',
            fields=[
                ('artwork_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Artwork_Type')),
            ],
            options={
                'verbose_name': "Tipus d'obra Inmaterial",
                'verbose_name_plural': "o-> Tipus d'obres Inmaterials",
            },
            bases=('General.artwork_type',),
        ),
        migrations.CreateModel(
            name='Material_Type',
            fields=[
                ('artwork_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Artwork_Type')),
            ],
            options={
                'verbose_name': "Tipus d'obra Material",
                'verbose_name_plural': "o-> Tipus d'obres Materials",
            },
            bases=('General.artwork_type',),
        ),
        migrations.CreateModel(
            name='Unit',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200, null=True, verbose_name='Nom', blank=True)),
                ('description', models.TextField(null=True, verbose_name='Descripci\xf3', blank=True)),
                ('code', models.CharField(max_length=4, verbose_name='Codi o S\xedmbol')),
                ('human', models.ForeignKey(verbose_name='Entitat relacionada', blank=True, to='General.Human', null=True)),
                ('region', mptt.fields.TreeForeignKey(verbose_name="Regi\xf3 d'us associada", blank=True, to='General.Region', null=True)),
            ],
            options={
                'verbose_name': 'Unitat',
                'verbose_name_plural': 'o- Unitats',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Unit_Type',
            fields=[
                ('artwork_type', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Artwork_Type')),
            ],
            options={
                'verbose_name': "Tipus d'Unitat",
                'verbose_name_plural': "o-> Tipus d'Unitats",
            },
            bases=('General.artwork_type',),
        ),
        migrations.CreateModel(
            name='UnitRatio',
            fields=[
                ('record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='General.Record')),
                ('rate', models.DecimalField(verbose_name='Ratio multiplicador', max_digits=6, decimal_places=3)),
                ('in_unit', models.ForeignKey(related_name=b'ratio_in', verbose_name='Unitat entrant', to='General.Unit')),
                ('out_unit', models.ForeignKey(related_name=b'ratio_out', verbose_name='Unitat sortint', to='General.Unit')),
            ],
            options={
                'verbose_name': 'Equivalencia entre Unitats',
                'verbose_name_plural': 'o- Equivalencies entre Unitats',
            },
            bases=('General.record',),
        ),
        migrations.AddField(
            model_name='unit',
            name='unit_type',
            field=mptt.fields.TreeForeignKey(verbose_name="Tipus d'Unitat", blank=True, to='General.Unit_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='type',
            name='parent',
            field=mptt.fields.TreeForeignKey(related_name=b'children', blank=True, to='General.Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_nonmaterial_records',
            name='record',
            field=models.ForeignKey(verbose_name='Registre vinculat', to='General.Record'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_nonmaterial_records',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'no_reg+', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_nonmaterial_nonmaterials',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'ma_mat+', verbose_name='Relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_nonmaterial_jobs',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'no_job+', verbose_name='Relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_nonmaterial_addresses',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'no_adr+', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_material_records',
            name='record',
            field=models.ForeignKey(verbose_name='Registre vinculat', to='General.Record'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_material_records',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'ma_reg+', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_material_nonmaterials',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'ma_non+', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_material_materials',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'ma_mat+', verbose_name='Relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_material_jobs',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'ma_job+', verbose_name='Relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_material_addresses',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'ma_adr+', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_human_regions',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'hu_reg+', verbose_name='relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_human_records',
            name='record',
            field=models.ForeignKey(verbose_name='Registre', to='General.Record'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_human_records',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'hu_rec+', verbose_name='relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_human_projects',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'hu_hum+', verbose_name='relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_human_persons',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'hu_hum+', verbose_name='relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_human_nonmaterials',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'hu_non+', verbose_name='relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_human_materials',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'hu_mat+', verbose_name='relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_human_jobs',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'hu_job+', verbose_name='relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_human_companies',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'hu_hum+', verbose_name='relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rel_human_addresses',
            name='relation',
            field=mptt.fields.TreeForeignKey(related_name=b'hu_adr+', verbose_name='relaci\xf3', blank=True, to='General.Relation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='region',
            name='region_type',
            field=mptt.fields.TreeForeignKey(verbose_name='Tipus de regi\xf3', blank=True, to='General.Region_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='record',
            name='record_type',
            field=mptt.fields.TreeForeignKey(verbose_name='Tipus de Registre', blank=True, to='General.Record_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='project',
            name='project_type',
            field=mptt.fields.TreeForeignKey(verbose_name='Tipus de projecte', blank=True, to='General.Project_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='nonmaterial',
            name='addresses',
            field=models.ManyToManyField(to='General.Address', null=True, verbose_name='Adreces relacionades', through='General.rel_Nonmaterial_Addresses', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='nonmaterial',
            name='jobs',
            field=models.ManyToManyField(to='General.Job', null=True, verbose_name='Arts/Oficis relacionats', through='General.rel_Nonmaterial_Jobs', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='nonmaterial',
            name='nonmaterial_type',
            field=mptt.fields.TreeForeignKey(verbose_name="Tipus d'obra inmaterial", blank=True, to='General.Nonmaterial_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='nonmaterial',
            name='nonmaterials',
            field=models.ManyToManyField(to='General.Nonmaterial', null=True, verbose_name='obres Inmaterials relacionades', through='General.rel_Nonmaterial_Nonmaterials', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='nonmaterial',
            name='records',
            field=models.ManyToManyField(to='General.Record', null=True, verbose_name='Registres relacionats', through='General.rel_Nonmaterial_Records', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='material',
            name='addresses',
            field=models.ManyToManyField(to='General.Address', null=True, verbose_name='Adreces relacionades', through='General.rel_Material_Addresses', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='material',
            name='jobs',
            field=models.ManyToManyField(to='General.Job', null=True, verbose_name='Arts/Oficis relacionats', through='General.rel_Material_Jobs', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='material',
            name='material_type',
            field=mptt.fields.TreeForeignKey(verbose_name="Tipus d'obra f\xedsica", blank=True, to='General.Material_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='material',
            name='materials',
            field=models.ManyToManyField(to='General.Material', null=True, verbose_name='obres Materials relacionades', through='General.rel_Material_Materials', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='material',
            name='nonmaterials',
            field=models.ManyToManyField(to='General.Nonmaterial', null=True, verbose_name='Inmaterials relacionats', through='General.rel_Material_Nonmaterials', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='material',
            name='records',
            field=models.ManyToManyField(to='General.Record', null=True, verbose_name='Registres relacionats', through='General.rel_Material_Records', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='human',
            name='addresses',
            field=models.ManyToManyField(to='General.Address', null=True, verbose_name='Adre\xe7es', through='General.rel_Human_Addresses', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='human',
            name='companies',
            field=models.ManyToManyField(related_name=b'hum_companies', to='General.Company', through='General.rel_Human_Companies', blank=True, null=True, verbose_name='Empreses'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='human',
            name='jobs',
            field=mptt.fields.TreeManyToManyField(to='General.Job', null=True, verbose_name='Activitats, Oficis', through='General.rel_Human_Jobs', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='human',
            name='materials',
            field=models.ManyToManyField(to='General.Material', null=True, verbose_name='obres Materials', through='General.rel_Human_Materials', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='human',
            name='nonmaterials',
            field=models.ManyToManyField(to='General.Nonmaterial', null=True, verbose_name='obres Inmaterials', through='General.rel_Human_Nonmaterials', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='human',
            name='persons',
            field=models.ManyToManyField(related_name=b'hum_persons', to='General.Person', through='General.rel_Human_Persons', blank=True, null=True, verbose_name='Persones'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='human',
            name='projects',
            field=models.ManyToManyField(related_name=b'hum_projects', to='General.Project', through='General.rel_Human_Projects', blank=True, null=True, verbose_name='Projectes'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='human',
            name='records',
            field=models.ManyToManyField(to='General.Record', null=True, verbose_name='Registres', through='General.rel_Human_Records', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='human',
            name='regions',
            field=models.ManyToManyField(to='General.Region', null=True, verbose_name='Regions', through='General.rel_Human_Regions', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='company',
            name='company_type',
            field=mptt.fields.TreeForeignKey(verbose_name="Tipus d'empresa", blank=True, to='General.Company_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='asset',
            name='human',
            field=models.ForeignKey(verbose_name='Entitat', to='General.Human'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='address',
            name='address_type',
            field=mptt.fields.TreeForeignKey(verbose_name="Tipus d'adre\xe7a", blank=True, to='General.Address_Type', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='address',
            name='jobs',
            field=models.ManyToManyField(related_name=b'addresses', null=True, verbose_name='Oficis relacionats', to='General.Job', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='address',
            name='region',
            field=mptt.fields.TreeForeignKey(related_name=b'rel_addresses', verbose_name='Comarca', blank=True, to='General.Region', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='address',
            name='size_unit',
            field=models.ForeignKey(verbose_name='Unitat de mesura', blank=True, to='General.Unit', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='accountcrypto',
            name='human',
            field=models.ForeignKey(related_name=b'accountsCrypto', verbose_name='Entitat humana titular', to='General.Human'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='accountcrypto',
            name='unit',
            field=models.ForeignKey(verbose_name='Unitat (moneda)', to='General.Unit'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='accountces',
            name='entity',
            field=models.ForeignKey(verbose_name='Xarxa del compte', to='General.Project'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='accountces',
            name='human',
            field=models.ForeignKey(related_name=b'accountsCes', verbose_name='Entitat humana persuaria', to='General.Human'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='accountces',
            name='unit',
            field=models.ForeignKey(verbose_name='Unitat (moneda)', to='General.Unit'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='accountbank',
            name='company',
            field=models.ForeignKey(verbose_name='Entitat Bancaria', blank=True, to='General.Company', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='accountbank',
            name='human',
            field=models.ForeignKey(related_name=b'accountsBank', verbose_name='Entitat humana titular', to='General.Human'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='accountbank',
            name='unit',
            field=models.ForeignKey(verbose_name='Unitat (moneda)', blank=True, to='General.Unit', null=True),
            preserve_default=True,
        ),
    ]
