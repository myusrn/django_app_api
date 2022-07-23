from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse

def index(request):
        return HttpResponse("Hello Django World!")

def about(request):
        return HttpResponse("<div style='font-family: verdana, serif, \
            sans-serif; font-size: medium'>Version 0.0.1</div>")

from .models import Book
def book_by_id(request, book_id):
        book = Book.objects.get(pk=book_id)
        # return HttpResponse(f"Book: {book.title}, published on {book.pub_date}")
        return render(request, 'book_details.html', {'book':book})

def secrets(request):
        # in powershell set client secret using $env:ClientSecret = "<value>" and clear using $env:ClientSecret = ""
        # in bash set debug run passwork using export ClientSecret='<value>' and clear using unset ClientSecret
        # in drekar k8s container deployment use rancher or k8s secrets manager to expose this environment variable
        # try:
        #         import os; 
        #         client_secret = os.environ['ClientSecret']  
        # except KeyError as ke:
        #         client_secret = '%s not found in environment' % ke
        import environ; env = environ.Env( ClientSecret=(str, 'ClientSecret not found in environment') )
        client_secret = env('ClientSecret')
        return HttpResponse(f"<div style='font-family: verdana, serif, \
            sans-serif; font-size: medium'>ClientSecret = {client_secret}</div>")

