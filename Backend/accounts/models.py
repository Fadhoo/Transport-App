from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _
from django.conf import settings


class CustomUser(AbstractUser):
        name = models.CharField(blank=True, max_length=255)

        next_of_kin = models.CharField(blank=True, max_length=255, default="")
        first_name = models.CharField(max_length=255, default="")
        last_name = models.CharField(max_length=255, default="")
        phone_number = models.CharField(max_length=255, default="")

        def __str__(self):
            return self.email


class Profile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='profile')
    title = models.CharField(max_length=5, default=" ")
    first_name = models.CharField(blank=False, max_length=255, default="")
    last_name = models.CharField(blank=False, max_length=255, default="")
    dob = models.DateField(default=" ")
    address = models.CharField(max_length=255, default=" ")
    photo = models.ImageField(upload_to='_profile_pics', blank=True)
    phone_number = models.CharField(blank=False, max_length=255, default="")

    next_of_kin = models.CharField(blank=False, max_length=255, default="")
    next_of_kin_phone_number = models.CharField(blank=False, max_length=255, default="")


