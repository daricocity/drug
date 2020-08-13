from django.contrib import admin
from .models import NafdacNumber, Company, Drug

# Register your models here.
############### NAFDAC NUMBER ADMIN ###############
admin.site.register(Drug)
admin.site.register(Company)
admin.site.register(NafdacNumber)
