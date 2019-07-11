from django.db import models


class TransportationLine(models.Model):
    email = models.EmailField(max_length=70)
    name = models.CharField(max_length=500)
    transportation_line_logo = models.ImageField()
    description = models.CharField(max_length=200, default="")

    def __str__(self):
        return self.name


class Ticket(models.Model):
    LAGOS = 'LAG'
    ABUJA = 'ABJ'
    KADUNA = 'KAD'
    JOS = 'JOS'
    BENIN = 'BEN'
    SOKOTO = 'SKT'
    PORTHARCOUT = 'PHC'
    ENUGU = 'ENU'
    IBADAN = 'IBD'
    EDO = 'EDO'
    OGUN = 'OGN'
    DELTA = 'DEL'
    CALABAR = 'CAL'

    CITY = (
        (LAGOS, 'Lagos'),
        (ABUJA, 'Abuja'),
        (KADUNA, 'Kaduna'),
        (JOS, 'Jos'),
        (BENIN, 'Benin'),
        (SOKOTO, 'Sokoto'),
        (PORTHARCOUT, 'Portharcout'),
        (ENUGU, 'Enugu'),
        (IBADAN, 'Ibadan'),
        (EDO, 'Edo'),
        (OGUN, 'Ogun'),
        (DELTA, 'Delta'),
        (CALABAR, 'Calabar'),

    )

    transport = models.ForeignKey(TransportationLine, on_delete=models.CASCADE)
    date = models.DateField()
    price = models.IntegerField()
    departure_state = models.CharField(max_length=20, choices=CITY, default='Choose a City')
    arrival_state = models.CharField(max_length=20, choices=CITY, default='Choose a City')

    def __str__(self):
        return self.departure_state + '-' + self.arrival_state