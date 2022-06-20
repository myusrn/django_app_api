from django.urls import path

from . import views

urlpatterns = [ 
    path('', views.index, name='index'),
    path('about', views.about, name='about'),
    path('book/<int:book_id>', views.book_by_id, name='book_by_id' ),
    path('secrets', views.secrets, name='secrets'),
    #path('staticfiles', views.???, name='staticfiles' ),
]