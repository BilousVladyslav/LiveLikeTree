from django.db import models
from django.contrib.auth import get_user_model

from graveyard.models import Graveyard


class Order(models.Model):
    CANCELLED = 'cancelled'
    PAID = 'paid'
    WAIT_FOR_PAY = 'waiting'

    STATUSES = [
        (CANCELLED, 'Cancelled'),
        (PAID, 'Paid'),
        (WAIT_FOR_PAY, 'Waiting for payment')
    ]

    graveyard = models.ForeignKey(Graveyard, on_delete=models.CASCADE)
    id = models.AutoField(primary_key=True)
    owner = models.ForeignKey(get_user_model(), on_delete=models.CASCADE, related_name='orders')
    status = models.CharField(choices=STATUSES, default=WAIT_FOR_PAY, max_length=50)
    to_pay = models.IntegerField(blank=False, default=0)
    created = models.DateTimeField(auto_now=True)


class PlaceInfo(models.Model):
    number = models.IntegerField(blank=False)
    tree = models.CharField(max_length=150)
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='places')
