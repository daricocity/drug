import os
import random
from django.db import models
from django.urls import reverse
from django.conf import settings
from django.contrib.auth.models import User
from django.db.models.signals import pre_save, post_save
from Drug.utils import unique_nafdac_number_generator

# Create your models here.

def random_nafdac_number(sender, instance, **kwargs):
    if not instance.Nafdac_number:
        instance.Nafdac_number = unique_nafdac_number_generator(instance)
pre_save.connect(random_nafdac_number, sender=User.objects.get(username = 'Admin'))

###############   FILENAME    ###############
def get_filename_ext(filepath):
    base_name = os.path.basename(filepath)
    name, ext = os.path.splitext(base_name)
    return name, ext

def upload_comany_image_path(instance, filename):
    new_filename = random.randint(1,2039489097)
    name, ext = get_filename_ext(filename)
    final_filename = '{new_filename}{ext}'.format(new_filename = new_filename, ext = ext)
    return "company/{final_filename}".format(final_filename = final_filename)

########## NAFDAC NUMBER QUERYSET ##########
class NafdacNumberQuerySet(models.QuerySet):
    def active(self):
        return self.filter(active=True)

########## NAFDAC NUMBER MANAGER ##########
class NafdacNumberManager(models.Manager):
    def get_queryset(self):
        return NafdacNumberQuerySet(self.model, using=self._db)

    def all(self):
        return self.get_queryset().active()


###############   NAFDAC NUMBER   ###############
class NafdacNumber(models.Model):
    Nafdac_number = models.CharField(max_length = 50, blank=True, null=True)
    reference_number = models.CharField(max_length = 50, blank=True, null=True)
    active = models.BooleanField(default=True)
    timestamp = models.DateTimeField(auto_now_add=True)

    objects = NafdacNumberManager()

    def __str__(self):
        return str(self.Nafdac_number)

########## COMPANY QUERYSET ##########
class CompanyQuerySet(models.QuerySet):
    def active(self):
        return self.filter(active=True)

########## NAFDAC NUMBER MANAGER ##########
class CompanyManager(models.Manager):
    def get_queryset(self):
        return CompanyQuerySet(self.model, using=self._db)

    def all(self):
        return self.get_queryset().active()
    
    def get_by_id(self, id):
        qs = self.get_queryset().filter(id = id)
        if qs.count() == 1:
            return qs.first()
        return None

###############   COMPANY   ###############
class Company(models.Model):
    nafdac_number = models.OneToOneField(settings.AUTH_USER_MODEL, related_name = 'Nafdac_Number', on_delete = '')
    company_name = models.CharField(max_length = 250, blank=True, null=True)
    company_address = models.TextField(blank = True, null = True)
    image = models.ImageField(upload_to = upload_comany_image_path, null = True, blank = True)
    active = models.BooleanField(default = True)
    timestamp = models.DateTimeField(auto_now_add = True)

    objects = CompanyManager()

    def __str__(self):
        return str(self.nafdac_number)
    
    def get_drugs(self):
        return Drug.objects.filter(company__nafdac_number = self.nafdac_number)


########## DRUG QUERYSET ##########
class DrugQuerySet(models.QuerySet):
    def active(self):
        return self.filter(active = True)

########## DRUG MANAGER ##########
class DrugManager(models.Manager):
    def get_queryset(self):
        return DrugQuerySet(self.model, using = self._db)

    def all(self):
        return self.get_queryset().active()

###############   Drug   ###############
class Drug(models.Model):
    nafdac_number = models.ForeignKey(settings.AUTH_USER_MODEL, null = True, blank = True, on_delete = '')
    drug_name = models.CharField(max_length = 250, blank = True, null = True)
    tracking_code = models.CharField(max_length = 250, blank = True, null = True)
    production_date = models.CharField(max_length = 250, blank = True, null = True)
    expiry_date = models.CharField(max_length = 250, blank = True, null = True)
    batch_number = models.CharField(max_length = 250, blank = True, null = True)
    image = models.ImageField(upload_to = upload_comany_image_path, null = True, blank = True)
    active = models.BooleanField(default = True)
    timestamp = models.DateTimeField(auto_now_add = True)

    objects = DrugManager()

    def __str__(self):
        return str(self.drug_name)
    
    def get_absolute_url(self):
        return reverse("accounts:drug-update", kwargs={"slug": self.tracking_code})

