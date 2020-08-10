from django.contrib.auth import get_user_model
from django.core.exceptions import ObjectDoesNotExist

from rest_framework import serializers
from rest_framework.generics import get_object_or_404

from graveyard.models import Place, Graveyard
from .models import Order, PlaceInfo


class PlaceInfoSerializer(serializers.Serializer):
    number = serializers.IntegerField(required=True)
    tree = serializers.CharField(max_length=150, required=True)


class OrderSerializer(serializers.ModelSerializer):
    places = PlaceInfoSerializer(many=True)
    graveyard = serializers.SlugRelatedField(slug_field='id', queryset=Graveyard.objects.all())

    class Meta:
        model = Order
        fields = ['graveyard', 'places', 'id', 'to_pay', 'created', 'status']
        read_only_fields = ['to_pay', 'created', 'status']

    def validate(self, attrs):
        queryset = Place.objects.filter(location=attrs['graveyard'], is_busy=False)
        for place in attrs['places']:
            get_object_or_404(queryset, number=place['number'])

        return attrs

    def create(self, validated_data):
        to_pay = validated_data['graveyard'].default_place_price * len(validated_data['places'])
        order = Order.objects.create(graveyard=validated_data['graveyard'],
                                     owner=self.context['user'],
                                     to_pay=to_pay)

        queryset = Place.objects.filter(location=validated_data['graveyard'], is_busy=False)
        for place_info_data in validated_data['places']:
            place = get_object_or_404(queryset, number=place_info_data['number'])
            place.is_busy = True
            place.save()
            PlaceInfo.objects.create(number=place_info_data['number'],
                                     tree=place_info_data['tree'],
                                     order=order)
        return order


class OrderStatusChangeSerializer(serializers.ModelSerializer):

    class Meta:
        model = Order
        fields = ['id', 'to_pay', 'status']

    def validate(self, attrs):
        order = self.instance
        if attrs['status'] == 'paid' and order.to_pay > attrs['to_pay']:
            raise serializers.ValidationError('Insufficient funds.')
        elif attrs['status'] != 'paid' and attrs['status'] != 'cancelled':
            raise serializers.ValidationError('Wrong status.')
        return attrs

    def update(self, instance, validated_data):
        if validated_data['status'] == 'paid':
            for place_info in instance.places.all():
                place = Place.objects.get(location=instance.graveyard, number=place_info.number)
                place.owner = instance.owner
                place.tree = place_info.tree
                place.tree_status = 'Grows'
                place.save()
            instance.status = instance.PAID

        elif validated_data['status'] == 'cancelled':
            for place_info in instance.places.all():
                place = Place.objects.get(location=instance.graveyard, number=place_info.number)
                place.is_busy = False
                place.save()
            instance.status = instance.CANCELLED
        instance.save()
        return instance
