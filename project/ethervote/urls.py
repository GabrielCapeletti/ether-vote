from django.conf.urls import url
from ethervote import views

urlpatterns = [
    url(r'^elections/$', views.electionList),
    url(r'^elector/$', views.elector),
    url(r'^vote/$', views.vote),
    url(r'^bulletinboard/$', views.bulletinBoard),

]
