# Generated by Django 2.1 on 2020-03-24 12:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='nafdacnumber',
            name='reference_number',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]