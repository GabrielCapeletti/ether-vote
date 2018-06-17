# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

class Election:
    def __init__(self,title,uuid,userId):
	self.title = title
	self.userId = userId
	self.uuid = uuid

class Elector:
    def __init__(self,electionId,userId,name):
	self.electionId = electionId
	self.userId = userId
	self.name = name

class Vote:
    def __init__(self,electionId,userId,candidateId):
	self.electionId = electionId
	self.userId = userId
	self.candidateId = candidateId 

class BulletinBoard:
    def __init__(self,electionId,votes):
	self.electionId = electionId 
	self.votes = votes

