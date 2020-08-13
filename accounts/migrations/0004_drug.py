# Generated by Django 2.1 on 2020-03-29 12:30

import accounts.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0003_company'),
    ]

    operations = [
        migrations.CreateModel(
            name='Drug',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('drug_name', models.CharField(blank=True, max_length=250, null=True)),
                ('tracking_code', models.CharField(blank=True, max_length=250, null=True)),
                ('production_date', models.CharField(blank=True, max_length=250, null=True)),
                ('expiry_date', models.CharField(blank=True, max_length=250, null=True)),
                ('batch_number', models.CharField(blank=True, max_length=250, null=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to=accounts.models.upload_comany_image_path)),
                ('active', models.BooleanField(default=True)),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('nafdac_number', models.ForeignKey(on_delete='', related_name='Nafdac_Number', to='accounts.Company')),
            ],
        ),
    ]