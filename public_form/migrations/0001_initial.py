# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('General', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Welcome', '0002_auto_20140919_1814'),
    ]

    operations = [
        migrations.CreateModel(
            name='RegistrationProfile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('activation_key', models.CharField(max_length=40, verbose_name='Clau')),
                ('person', models.ForeignKey(verbose_name='Persona', to='General.Person', unique=True)),
                ('project', models.ForeignKey(verbose_name='Project', blank=True, to='General.Project', null=True)),
                ('record_type', models.ForeignKey(verbose_name='Tipus alta', to='Welcome.iC_Record_Type')),
                ('user', models.ForeignKey(verbose_name='user', to=settings.AUTH_USER_MODEL, unique=True)),
            ],
            options={
                'verbose_name': 'Alta Membre: proc\xe9s activaci\xf3',
                'verbose_name_plural': 'Alta Membre: proc\xe9s activaci\xf3',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='human_proxy',
            fields=[
            ],
            options={
                'verbose_name': 'Persona | Projecte',
                'proxy': True,
                'verbose_name_plural': 'Persones | Projectes',
            },
            bases=('General.human',),
        ),
        migrations.CreateModel(
            name='learn_Session_proxy',
            fields=[
            ],
            options={
                'verbose_name': 'ASSIT\xc8NCIA SESSI\xd3 ACOLLIDA',
                'proxy': True,
                'verbose_name_plural': 'ASSIT\xc8NCIA SESSI\xd3 ACOLLIDA',
            },
            bases=('Welcome.learn_session',),
        ),
    ]
