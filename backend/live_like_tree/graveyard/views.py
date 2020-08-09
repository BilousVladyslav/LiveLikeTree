from rest_framework.filters import SearchFilter
from rest_framework.viewsets import GenericViewSet
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import SessionAuthentication, BasicAuthentication, TokenAuthentication
from rest_framework.mixins import RetrieveModelMixin,UpdateModelMixin, ListModelMixin

from . import serializers
from .models import Graveyard, Place


class GraveyardsViewSet(GenericViewSet,
                        ListModelMixin,
                        RetrieveModelMixin):
    serializer_class = serializers.GraveyardSerializer
    lookup_field = 'id'
    queryset = Graveyard.objects.all()


class PlacesViewSet(GenericViewSet,
                    ListModelMixin,
                    UpdateModelMixin):
    filter_backends = [SearchFilter]
    search_fields = ['location__id']
    queryset = Place.objects.order_by('number')

    def get_serializer_class(self):
        if self.action == 'list':
            return serializers.PlaceSerializer
        else:
            return serializers.PlaceStatusUpdateSerializer


class UserPlacesViewSet(GenericViewSet,
                        ListModelMixin,
                        RetrieveModelMixin):
    permission_classes = [IsAuthenticated]
    authentication_classes = [BasicAuthentication, SessionAuthentication, TokenAuthentication]
    serializer_class = serializers.PlaceInfoSerializer
    lookup_field = 'id'

    def get_queryset(self):
        return Place.objects.filter(owner=self.request.user)
