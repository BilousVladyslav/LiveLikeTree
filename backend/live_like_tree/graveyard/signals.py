from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Graveyard, Place


@receiver(post_save, sender=Graveyard)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        for number in range(1, instance.width * instance.length + 1):
            Place.objects.create(number=number, location=instance)
