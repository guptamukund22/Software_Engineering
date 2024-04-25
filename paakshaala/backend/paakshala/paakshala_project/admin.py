from django.contrib import admin

# Register your models here.
from .models import item,User,Category,Recipe

admin.site.register(item)
admin.site.register(User)
admin.site.register(Category)
admin.site.register(Recipe)
