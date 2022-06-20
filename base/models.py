from django.db import models

# Create your models here.

class Item(models.Model):
    name = models.CharField(max_length=200)
    description = models.CharField(max_length=500, default='')
    created = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name + ' ' + self.description
