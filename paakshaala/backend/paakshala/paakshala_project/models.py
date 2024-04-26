from django.db import models
from datetime import datetime,timedelta
from django.utils import timezone

# Create your models here.

class Recipe(models.Model):

    name = models.CharField(max_length=200)
    ingredients = models.TextField()
    type = models.CharField(max_length=10)
    time = models.CharField(max_length=100)
    instructions = models.TextField()
    course = models.CharField(max_length=100)
    website = models.TextField()


    def __str__(self):
        return self.ingredients

class Category(models.Model):
    name = models.CharField(max_length=100)
    Reminder_Duration = models.DurationField(default = timedelta(days=5))
    category_click = models.IntegerField(default=0)

    def __str__(self):
        return self.name
 
class User(models.Model):
    Username = models.CharField(max_length=100)
    mailid = models.CharField(max_length=200)
    # Format  = 'Category of the item: '["Item_name, quantity, Entry Date"]'
    categories_list = models.TextField(default='')

    def __str__(self):
        return self.Username

class item(models.Model):
    user = models.CharField(max_length=200,default='user')
    item_name = models.CharField(max_length=100)
    category = models.CharField(max_length=100,default='')
    quantity = models.CharField(max_length=100,default='0.5 kg')
    added_on = models.DateField(default=datetime.now().strftime("%Y-%m-%d"))
    


    def __str__(self):
        return self.item_name
    
