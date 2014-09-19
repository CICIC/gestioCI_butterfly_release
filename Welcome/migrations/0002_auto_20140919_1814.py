# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Welcome', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ic_labor_contract',
            name='company',
            field=models.ForeignKey(verbose_name='Empresa contractant', blank=True, to='General.Company', null=True),
        ),
    ]
