# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Finances', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='icf_invoice',
            name='lines',
            field=models.ManyToManyField(related_name=b'rn_invoice_lines', null=True, verbose_name='L\xednies', to='Finances.iCf_Invoice_line', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='icf_invoice',
            name='movements',
            field=models.ManyToManyField(related_name=b'rn_invoice_movements', null=True, verbose_name='Moviments', to='Finances.iCf_Movement', blank=True),
            preserve_default=True,
        ),
    ]
