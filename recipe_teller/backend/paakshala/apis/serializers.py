from rest_framework import serializers
from paakshala_project import models

class item_Serializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'item_name',
            'category',
            'quantity',
            'added_on',
        )
        model = models.item

class category_Serializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'name',
            'Reminder_Duration'
        )
        model = models.Category

class User_Serializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'mailid',
            'categories_list'
        )
        model = models.User