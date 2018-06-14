from django.conf.urls import url
from ethervote import views

urlpatterns = [
    url(r'^elections/$', views.election_list),
]
