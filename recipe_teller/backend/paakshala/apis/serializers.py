from rest_framework import serializers
from paakshala_project import models

class paakshala_Serializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'item_name',
            'category',
            'quantity',
            'added_on',
        )
        model = models.item