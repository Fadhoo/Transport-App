from rest_framework import serializers
from .models import TransportationLine, Ticket


class TransportationLineSerializer(serializers.ModelSerializer):

    class Meta:
        model = TransportationLine
        fields = ('name', 'description', 'transportation_line_logo', 'pk')
        read_only_fields = ['pk']


class TicketSerializer(serializers.ModelSerializer):

    class Meta:
        model = Ticket
        fields = ('date', 'price', 'departure_state', 'arrival_state', 'transport', 'pk')