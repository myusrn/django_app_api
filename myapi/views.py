from rest_framework.decorators import api_view
#from django.http import JsonResponse
from rest_framework.response import Response
from rest_framework import status
#from rest_framework.exceptions import MethodNotAllowed
from base.models import Item
from .serializers import ItemSerializer

@api_view(['GET']) # read
def read(request):
   #person = {'name': 'Dennis', 'age': 28} 
   #return Response(person)
   items = Item.objects.all()
   serializer = ItemSerializer(items, many=True)
   return Response(serializer.data)

@api_view(['GET'])  # read item using /<id>
def readItem(request, id):
   try:
      item = Item.objects.get(pk = id)
   except Item.DoesNotExist:
      return Response(status = status.HTTP_404_NOT_FOUND)
   if request.method == 'GET':
      serializer = ItemSerializer(item)
      return Response(serializer.data)

@api_view(['POST']) # create using { "name": "item created using post request" }
def create(request):
      serializer = ItemSerializer(data=request.data)
      if serializer.is_valid():
         serializer.save()
      return Response(serializer.data)  

@api_view(['PUT']) # update using { "id": 4, "name": "item updated using post request" }
def update(request, id):
   try:
      item = Item.objects.get(pk = id)
   except Item.DoesNotExist:
      return Response(status = status.HTTP_404_NOT_FOUND)
   serializer = ItemSerializer(item, data=request.data)
   if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
   else:
      return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE']) # delete using { "id": 5 }
def delete(request, id):
   try:
      item = Item.objects.get(pk=id)
   except Item.DoesNotExist:
      return Response(status=status.HTTP_404_NOT_FOUND)   
   item.delete()
   return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['GET', 'POST']) # read and create items
def readCreateItems(request, format=None):
   if request.method == 'GET': # get all items, serialize them, return json
      items = Item.objects.all()
      serializer = ItemSerializer(items, many=True)
      #return JsonResponse(serializer.data, safe=False)
      #return JsonResponse({'items': serializer.data})
      return Response(serializer.data)

   elif request.method == 'POST':
      serializer = ItemSerializer(data=request.data)
      if serializer.is_valid():
         serializer.save()
         return Response(serializer.data, status=status.HTTP_201_CREATED)

@api_view(['GET', 'PUT', 'DELETE']) # read, update and delete item
def readUpdateDeleteItem(request, id, format=None):
   try:
      item = Item.objects.get(pk = id)
   except Item.DoesNotExist:
      return Response(status=status.HTTP_404_NOT_FOUND)

   if request.method == 'GET':
      serializer = ItemSerializer(item)
      return Response(serializer.data)

   elif request.method == 'PUT':
      #pass
      serializer = ItemSerializer(item, data=request.data)
      if serializer.is_valid():
         serializer.save()
         return Response(serializer.data)
      else:
         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
      
   elif request.method == 'DELETE':
      #pass
      item.delete()
      return Response(status=status.HTTP_204_NO_CONTENT)
