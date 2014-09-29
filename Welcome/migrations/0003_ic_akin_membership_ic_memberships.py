# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Welcome', '0002_remove_ic_akin_membership_ic_membership'),
    ]

    operations = [
        migrations.AddField(
            model_name='ic_akin_membership',
            name='ic_memberships',
            field=models.ManyToManyField(related_name=b'akin_memberships', null=True, verbose_name='vinculada al Projectes Socis', to='Welcome.iC_Membership', blank=True),
            preserve_default=True,
        ),
    ]
