# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('Finances', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailnotification',
            name='pointed_date',
            field=models.DateField(default=datetime.datetime(2014, 11, 16, 0, 14, 19, 691383), help_text="Per l'opci\xf3 -El dia senyalat-", verbose_name='Senyalar dia'),
        ),
    ]
