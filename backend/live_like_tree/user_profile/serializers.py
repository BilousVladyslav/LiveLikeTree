from django.contrib.auth import get_user_model

from rest_framework import serializers


class UserProfileSerializer(serializers.ModelSerializer):

    class Meta:
        model = get_user_model()
        fields = ['email', 'username', 'first_name', 'last_name']
        read_only_fields = ['username', 'email']


class UsersSerializer(serializers.ModelSerializer):
    full_name = serializers.SerializerMethodField()

    class Meta:
        model = get_user_model()
        fields = ['username', 'full_name']

    def get_full_name(self, obj):
        return f'{obj.first_name} {obj.last_name}'
