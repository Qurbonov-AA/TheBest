# Generated by Django 3.2.6 on 2021-10-12 11:47

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('academy', '0004_alter_lessons_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='lessons',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2021, 10, 12, 16, 47, 38, 464887), verbose_name='Registratsiya sanasi:'),
        ),
    ]