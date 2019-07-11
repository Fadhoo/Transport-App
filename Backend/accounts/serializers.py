from rest_framework import serializers
from .models import Profile, CustomUser


class ProfileSerializer(serializers.ModelSerializer):

    class Meta:
        model = Profile
        fields = [
            'title',
            'first_name',
            'last_name',
            'dob',
            'address',
            'photo',
            'phone_number',
            'next_of_kin',
            'next_of_kin_phone_number'
        ]


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = CustomUser
        fields = ['email', 'password', 'username']