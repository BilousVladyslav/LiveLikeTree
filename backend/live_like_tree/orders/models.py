from django.db import models
from django.contrib.auth import get_user_model
from graveyard.models import Place


class Order(models.Model):
    CANCELLED = 'cancelled'
    PAID = 'paid'
    WAIT_FOR_PAY = 'waiting'

    STATUSES = [
        (CANCELLED, 'Cancelled'),
        (PAID, 'Paid'),
        (WAIT_FOR_PAY, 'Waiting for payment')
    ]

    id = models.AutoField(primary_key=True)
    owner = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    status = models.CharField(choices=STATUSES, default=WAIT_FOR_PAY, max_length=50)
    places = models.ManyToManyField(Place, related_name='orders')
