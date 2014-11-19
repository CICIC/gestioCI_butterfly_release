# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('General', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='company',
            name='id_card_es',
            field=models.CharField(help_text='NIF:12345678A - CIF: A12345678 - NIE: X12345678A del prove\xefdor a qui es factura.', max_length=200, null=True, verbose_name='CIF / NIF / NIE', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='company',
            name='id_card_non_es',
            field=models.CharField(help_text='Camps no CIF / NIF / NIE del prove\xefdor a qui es factura.', max_length=50, null=True, verbose_name='Altres identificadors', blank=True),
            preserve_default=True,
        ),
    ]
