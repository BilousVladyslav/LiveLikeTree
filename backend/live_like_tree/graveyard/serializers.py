from django.contrib.auth import get_user_model
from django.core.exceptions import ObjectDoesNotExist

from rest_framework import serializers

from user_profile.serializers import UsersSerializer

from .models import Place, Graveyard


class GraveyardSerializer(serializers.ModelSerializer):
    free_places_count = serializers.SerializerMethodField()

    class Meta:
        model = Graveyard
        fields = ['id', 'name', 'address', 'width', 'length', 'default_place_price', 'free_places_count']

    def get_free_places_count(self, obj):
        return obj.places.filter(is_busy=False).count()


class PlaceInfoSerializer(serializers.ModelSerializer):
    owner = UsersSerializer(many=False)

    class Meta:
        model = Place
        fields = '__all__'


class PlaceStatusUpdateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Place
        fields = ['id', 'tree_status']
