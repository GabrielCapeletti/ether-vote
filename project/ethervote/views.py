# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from ethervote.models import Election
from ethervote.models import Elector
from ethervote.models import Vote
from ethervote.models import BulletinBoard
from ethervote.serializers import ElectionSerializer
from ethervote.serializers import ElectorSerializer
from ethervote.serializers import VoteSerializer
from ethervote.serializers import BulletinBoardSerializer



# Create your views here

@csrf_exempt
def electionList(request):
	if request.method == 'GET':
	        election = Election("Eleicao",12,13)
		#TODO Load from etherium		
		serializer = ElectionSerializer(election)
		return JsonResponse(serializer.data, safe=False)


	elif request.method == 'POST':
		data = JSONParser().parse(request)
		serializer = ElectionSerializer(data=data)
		if serializer.is_valid():
		    #TODO Save to etherium 
		    return JsonResponse(serializer.data)
		return JsonResponse(serializer.errors, status=400)

@csrf_exempt
def elector(request):
	if request.method == 'POST':
		data = JSONParser().parse(request)
		serializer = ElectorSerializer(data=data)
		if serializer.is_valid():
		    #TODO Add elector to election 
		    return JsonResponse(serializer.data)
		return JsonResponse(serializer.errors, status=400)

	if request.method == 'DELETE':
		data = JSONParser().parse(request)
		serializer = ElectorSerializer(data=data)
		if serializer.is_valid():
		    #TODO Remove elector from election 
		    return JsonResponse(serializer.data)
		return JsonResponse(serializer.errors, status=400)

@csrf_exempt
def vote(request):
	if request.method == 'POST':
		data = JSONParser().parse(request)
		serializer = VoteSerializer(data=data)
		if serializer.is_valid():
		    #TODO Add vote to electionn 
		    return JsonResponse(serializer.data)
		return JsonResponse(serializer.errors, status=400)


@csrf_exempt
def bulletinBoard(request):
	if request.method == 'GET':
		electionId = request.GET.get('electionId', '1')
		#TODO Get all votes from the blockchain related to electionId
		#Temp
	 	data = [Vote(electionId,1,2),Vote(electionId,2,2)]
	    	#data = BulletinBoard(electionId,votes)	
		serializer = VoteSerializer(data,many=True)
		return JsonResponse(serializer.data,safe=False)


		

