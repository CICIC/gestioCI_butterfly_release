# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('Finances', '0002_auto_20141116_0014'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailnotification',
            name='pointed_date',
            field=models.DateField(default=datetime.datetime(2014, 11, 16, 0, 14, 49, 444725), help_text="Per l'opci\xf3 -El dia senyalat-", verbose_name='Senyalar dia'),
        ),
    ]
