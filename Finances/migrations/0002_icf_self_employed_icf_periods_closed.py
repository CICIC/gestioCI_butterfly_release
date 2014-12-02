# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Finances', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='icf_self_employed',
            name='icf_periods_closed',
            field=models.ManyToManyField(related_name=b'rel_icfse_icf_period_close', verbose_name='Periodes de facturacio', to='Finances.iCf_Period_close'),
            preserve_default=True,
        ),
    ]
