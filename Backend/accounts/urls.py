from django.urls import path, include, re_path
from rest_auth.registration.views import VerifyEmailView, RegisterView
from .views import UserListView, CustomAuthToken, ProfileView
from rest_framework.authtoken import views


app_name = 'accounts'

urlpatterns = [

    path('', UserListView.as_view()),
    path('rest-auth/', include('rest_auth.urls')),
    path('rest-auth/registration/', include('rest_auth.registration.urls')),
    path('registration/', RegisterView.as_view(), name='account_signup'),
    re_path(r'account-confirm-email/(?P<key>[-:\w]+)/$', VerifyEmailView.as_view(), name='account_confirm_email'),
    path('api-token-auth/', CustomAuthToken.as_view(), name='api-token-auth'),
    path('profile/', ProfileView.as_view(), name='profile')
]