# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Welcome', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='ic_self_employed',
            name='extra_days',
            field=models.IntegerField(default=0, help_text='Dies extra que pot editar el trimestre en curs.', max_length=2, verbose_name='Dies extra'),
            preserve_default=True,
        ),
    ]
