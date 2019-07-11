from django.urls import path
from django.conf.urls import url
from . import views

app_name = 'Transport_lines'

urlpatterns = [
    path('', views.TransportLineViewSet.as_view(), name='home'),

    #search, list, create
    #transport_lines/ticket/
    path('ticket/', views.BookingView.as_view()),
    #transport_lines/1/
    url(r'^(?P<pk>[0-9]+)/$', views.TicketView.as_view()),



]
