from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework import generics
from .models import Profile, CustomUser
from .serializers import ProfileSerializer, UserSerializer
from django.dispatch import receiver
from django.db.models.signals import post_save
from django.conf import settings


class UserListView(generics.ListCreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer


@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)


for user in CustomUser.objects.all():
    Token.objects.get_or_create(user=user)


class CustomAuthToken(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = UserSerializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            'token': token.key,
            'password': user.password,
            'email': user.email
        })


class ProfileView(generics.RetrieveUpdateDestroyAPIView):
    serializer = ProfileSerializer

    def get_queryset(self):
        return Profile.objects.all()

    def post(self, serializer):
        serializer.save(user=self.request.user)
        return Response(serializer.data)
