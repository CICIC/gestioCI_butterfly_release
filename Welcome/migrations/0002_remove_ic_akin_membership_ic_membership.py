# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Welcome', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ic_akin_membership',
            name='ic_membership',
        ),
    ]
