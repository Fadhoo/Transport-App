from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics, mixins
from django.db.models import Q
from .models import TransportationLine, Ticket
from .serializers import TransportationLineSerializer, TicketSerializer


class TransportLineViewSet(APIView):

    def get(self, request):
        query = TransportationLine.objects.all()
        serializer = TransportationLineSerializer(query, many=True)
        return Response(serializer.data)


class BookingView(generics.ListAPIView):
    lookup_field = 'pk'
    serializer_class = TicketSerializer

    def get_queryset(self):
        qs = Ticket.objects.all()
        query = self.request.GET.get("q")
        if query is not None:
            qs = qs.filter(
                Q(departure_state__icontains=query)
            ).distinct()
        return qs

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class TicketView(generics.RetrieveUpdateDestroyAPIView):
    lookup_field = 'pk'
    serializer_class = TicketSerializer

    def get_queryset(self):
        return Ticket.objects.all()

    def post(self, serializer):
        serializer.save(user=self.request.user)
        return



