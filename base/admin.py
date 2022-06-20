from django.contrib import admin

# Register your models here.

#from .models import Item
from base.models import Item
admin.site.register(Item)
