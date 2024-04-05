from django.db import models
from datetime import datetime

# Create your models here.
class item(models.Model):
    item_name = models.CharField(max_length=100)
    category = models.CharField(max_length=200)
    quantity = models.CharField(max_length=100,default='0.5 kg')
    added_on = models.DateField(default=datetime.today)

    def __str__(self):
        return self.item_name
    
