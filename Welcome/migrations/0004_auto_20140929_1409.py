# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Welcome', '0003_ic_akin_membership_ic_memberships'),
    ]

    operations = [
        migrations.RenameField(
            model_name='ic_akin_membership',
            old_name='ic_memberships',
            new_name='ic_membership',
        ),
    ]
