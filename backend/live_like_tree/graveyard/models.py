from django.db import models
from django.contrib.auth import get_user_model
from django.db.models.signals import post_save
from django.dispatch import receiver


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


@receiver(post_save, sender=Graveyard)
def create_places(sender, instance=None, created=False, **kwargs):
    print(instance)
    print(created)
    if created:
        for number in range(1, instance.width * instance.length + 1):
            Place.objects.create(number=number, location=instance)
