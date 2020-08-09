from django.db import models
from django.contrib.auth import get_user_model


class Graveyard(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(blank=False, max_length=300)
    address = models.CharField(blank=False, max_length=250)
    width = models.IntegerField(blank=False)
    length = models.IntegerField(blank=False)
    default_place_price = models.IntegerField(blank=False)


class Place(models.Model):
    id = models.AutoField(primary_key=True)
    number = models.IntegerField(blank=False)
    location = models.ForeignKey(Graveyard, on_delete=models.CASCADE, related_name='places')
    tree = models.CharField(max_length=150)
    owner = models.ForeignKey(get_user_model(), on_delete=models.SET_NULL, null=True, related_name='places')
    tree_status = models.CharField(max_length=100)
    is_busy = models.BooleanField(default=False)



