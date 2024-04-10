from django.contrib import admin

# Register your models here.
from .models import item,User,Category

admin.site.register(item)
admin.site.register(User)
admin.site.register(Category)
