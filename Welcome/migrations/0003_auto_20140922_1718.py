# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Welcome', '0002_auto_20140919_1814'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ic_insurance',
            name='company',
            field=models.ForeignKey(verbose_name='Empresa asseguradora', blank=True, to='General.Company', null=True),
        ),
        migrations.AlterField(
            model_name='learn_session',
            name='assistants',
            field=models.ManyToManyField(related_name=b'assist_sessions', to=b'General.Human', blank=True, help_text='Quan escullis cada entitat assistent, desa el formulari per veure el seu nom aqu\xed', null=True, verbose_name='Assistents'),
        ),
    ]
