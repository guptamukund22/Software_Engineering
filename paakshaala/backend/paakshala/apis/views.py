from django.shortcuts import render

# Create your views here.
from rest_framework import generics
from rest_framework import filters
from django.db.models import query

from paakshala_project import models
from .serializers import item_Serializer,category_Serializer,User_Serializer,recipe_Serializer


class ListRecipes(generics.ListCreateAPIView):
    queryset = models.Recipe.objects.all()
    serializer_class = recipe_Serializer

    def get_queryset(self):
        qs = models.Recipe.objects.all()
        
        name = self.request.GET.get('name')
        ingredients = self.request.GET.get('ingredients')

        
        if name !=None:
            
            qs = qs.filter(name__icontains = name)

        if ingredients!=None:
            if ',' in ingredients:
                ingred = list(ingredients.split(','))
                for ing in ingred:
                    qs = qs.filter(ingredients__icontains = ing)
            else:
                qs = qs.filter(ingredients__icontains = ingredients)

        
        return qs

class DetailedRecipe(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Recipe.objects.all()
    serializer_class = recipe_Serializer

class Listitems(generics.ListCreateAPIView):
    queryset = models.item.objects.all()
    serializer_class = item_Serializer

    def get_queryset(self):
        user = self.request.GET.get('user')
        
        qs = models.item.objects.filter(user__exact=user)

        return qs
    
    def post(self, request, *args, **kwargs):
    
        
        return super().post(request, *args, **kwargs)
    
    


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







