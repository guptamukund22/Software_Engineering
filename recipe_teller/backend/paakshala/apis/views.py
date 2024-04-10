from django.shortcuts import render

# Create your views here.
from rest_framework import generics

from paakshala_project import models
from .serializers import item_Serializer,category_Serializer,User_Serializer

class Listitems(generics.ListCreateAPIView):
    lookup_field = 'user'
    queryset = models.item.objects.all()
    serializer_class = item_Serializer

class Detailitem(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.item.objects.all()
    serializer_class = item_Serializer



class Listcategory(generics.ListCreateAPIView):
    queryset = models.Category.objects.all()
    serializer_class = category_Serializer

class Detailcategory(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Category.objects.all()
    serializer_class = category_Serializer


class ListUsers(generics.ListCreateAPIView):
    queryset = models.User.objects.all()
    serializer_class = User_Serializer

class DetailUsers(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.User.objects.all()
    serializer_class = User_Serializer







