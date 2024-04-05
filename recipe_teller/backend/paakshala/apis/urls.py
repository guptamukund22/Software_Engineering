from django.urls import path 

from .views import Listitems,Detailitem

urlpatterns = [
    path('',Listitems.as_view()),
    path('<int:pk>/',Detailitem.as_view())
]