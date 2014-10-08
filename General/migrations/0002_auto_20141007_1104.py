# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('General', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='human',
            name='email',
            field=models.EmailField(help_text="L'adre\xe7a d'email principal de l'entitat humana", max_length=100, verbose_name='Email'),
        ),
        migrations.AlterField(
            model_name='human',
            name='telephone_cell',
            field=models.CharField(help_text="El tel\xe8fon principal de l'entitat Humana", max_length=20, verbose_name='Tel\xe8fon m\xf2bil'),
        ),
        migrations.AlterField(
            model_name='person',
            name='id_card',
            field=models.CharField(max_length=9, verbose_name='DNI/NIE'),
        ),
        migrations.AlterField(
            model_name='person',
            name='surnames',
            field=models.CharField(help_text='Els cognoms de la Persona', max_length=200, verbose_name='Cognoms'),
        ),
    ]
