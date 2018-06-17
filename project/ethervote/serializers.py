
from ethervote.models import Election
from ethervote.models import Elector
from ethervote.models import Vote
from ethervote.models import BulletinBoard

from rest_framework import serializers

class ElectionSerializer(serializers.Serializer):
   title  = serializers.CharField(required=False, allow_blank=True, max_length=100)
   uuid   = serializers.IntegerField(read_only=False)
   userId = serializers.IntegerField(read_only=False)

class ElectorSerializer(serializers.Serializer):
   name = serializers.CharField(required=False, allow_blank=True, max_length=100)
   electionId = serializers.IntegerField(read_only=False)
   userId = serializers.IntegerField(read_only=False)

class VoteSerializer(serializers.Serializer):
   candidateId =  serializers.IntegerField(read_only=False)
   electionId = serializers.IntegerField(read_only=False)
   userId = serializers.IntegerField(read_only=False)

class BulletinBoardSerializer(serializers.Serializer):
   electionId = serializers.IntegerField(read_only=False)

