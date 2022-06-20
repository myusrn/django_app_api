from rest_framework import serializers
from base.models import Item

class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = '__all__' 
        # or to be explicit about fields that will be exposed
        #fields = ['id', 'name', 'description', 'created']
