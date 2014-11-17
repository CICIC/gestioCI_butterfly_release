# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('Finances', '0004_auto_20141116_0015'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailnotification',
            name='pointed_date',
            field=models.DateField(default=datetime.datetime(2014, 11, 16, 0, 28, 6, 442142), help_text="Per l'opci\xf3 -El dia senyalat-", verbose_name='Senyalar dia'),
        ),
        migrations.AlterField(
            model_name='purchases_line',
            name='percent_vat',
            field=models.ForeignKey(verbose_name='IVA (%)', to='Finances.iC_Duty', help_text="El % d'IVA que s'aplica en la factura."),
        ),
        migrations.AlterField(
            model_name='sales_line',
            name='percent_invoiced_vat',
            field=models.ForeignKey(verbose_name='IVA Facturat (%)', to='Finances.iC_Duty', help_text="El % d'IVA que s'aplica en la factura. Indicar un valor d'IVA per concepte"),
        ),
    ]
