# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Welcome', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ic_self_employed',
            name='mentor_membership',
            field=models.ForeignKey(related_name=b'mentor_of_SE', verbose_name='Mentor projecte', blank=True, to='Welcome.iC_Akin_Membership', null=True),
        ),
    ]
