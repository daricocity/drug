# Generated by Django 2.1 on 2020-03-29 15:19

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0006_auto_20200329_1608'),
    ]

    operations = [
        migrations.AlterField(
            model_name='drug',
            name='nafdac_number',
            field=models.ForeignKey(blank=True, null=True, on_delete='', to=settings.AUTH_USER_MODEL),
        ),
    ]
