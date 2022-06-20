from django.contrib import admin
from django.urls import path
#from myapi import views
from . import views # alternative that references current app 
from rest_framework.urlpatterns import format_suffix_patterns

urlpatterns = [
    # option 1 - a path per crud verb
    #path('', views.read),
    path('read', views.read),
    path('readitem/<int:id>', views.readItem),
    path('create', views.create),
    path('update/<int:id>', views.update),
    path('delete/<int:id>', views.delete),

    # option 2 - a path per http request signature
    #path('', views.readCreateItems),
    path('items', views.readCreateItems),
    path('item/<int:id>', views.readUpdateDeleteItem),
]

urlpatterns = format_suffix_patterns(urlpatterns)