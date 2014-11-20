# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Finances', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='icf_cooper',
            name='ic_membership',
        ),
        migrations.RemoveField(
            model_name='icf_cooper',
            name='registrationprofile_ptr',
        ),
    ]
