from rest_framework.filters import SearchFilter
from rest_framework.viewsets import GenericViewSet
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import SessionAuthentication, BasicAuthentication, TokenAuthentication
from rest_framework.mixins import RetrieveModelMixin, UpdateModelMixin, ListModelMixin, CreateModelMixin

from . import serializers
from .models import Order


class OrdersViewSet(GenericViewSet,
                    ListModelMixin,
                    RetrieveModelMixin,
                    CreateModelMixin):
    permission_classes = [IsAuthenticated]
    authentication_classes = [BasicAuthentication, SessionAuthentication, TokenAuthentication]
    serializer_class = serializers.OrderSerializer
    lookup_field = 'id'

    def get_queryset(self):
        return Order.objects.filter(owner=self.request.user)

    def get_serializer_context(self):
        return {'user': self.request.user}


class OrdersStatusViewSet(GenericViewSet,
                          ListModelMixin,
                          RetrieveModelMixin,
                          CreateModelMixin,
                          UpdateModelMixin):
    permission_classes = [IsAuthenticated]
    authentication_classes = [BasicAuthentication, SessionAuthentication, TokenAuthentication]
    serializer_class = serializers.OrderStatusChangeSerializer
    lookup_field = 'id'

    def get_queryset(self):
        return Order.objects.filter(owner=self.request.user, status='waiting')

    def get_serializer_context(self):
        return {'user': self.request.user}
