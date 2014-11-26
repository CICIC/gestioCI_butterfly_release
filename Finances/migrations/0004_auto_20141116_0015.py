# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        ('Welcome', '__first__'),
        ('Finances', '0003_auto_20141116_0014'),
    ]

    operations = [
        migrations.CreateModel(
            name='iC_Duty',
            fields=[
                ('ic_record', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='Welcome.iC_Record')),
                ('value', models.IntegerField(db_index=True, unique=True, verbose_name='IVA', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(100)])),
            ],
            options={
                'verbose_name': 'IVA',
                'verbose_name_plural': 'IVAs',
            },
            bases=('Welcome.ic_record',),
        ),
        migrations.AlterField(
            model_name='emailnotification',
            name='pointed_date',
            field=models.DateField(default=datetime.datetime(2014, 11, 16, 0, 15, 16, 138738), help_text="Per l'opci\xf3 -El dia senyalat-", verbose_name='Senyalar dia'),
        ),
    ]
