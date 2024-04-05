from django.shortcuts import render

# Create your views here.
from rest_framework import generics

from paakshala_project import models
from .serializers import paakshala_Serializer

class Listitems(generics.ListCreateAPIView):
    queryset = models.item.objects.all()
    serializer_class = paakshala_Serializer

class Detailitem(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.item.objects.all()
    serializer_class = paakshala_Serializer



