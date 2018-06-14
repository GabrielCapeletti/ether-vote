
from ethervote.election import Election
from rest_framework import serializers

class ElectionSerializer(serializers.Serializer):
 
   title = serializers.CharField(required=False, allow_blank=True, max_length=100)
   uuid = serializers.IntegerField(read_only=False)
     
