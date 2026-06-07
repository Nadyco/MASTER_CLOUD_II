INTERFACE zif_lab_03_airports_815
  PUBLIC .

  METHODS:
    get_airports IMPORTING iv_airport_id     TYPE string
                 RETURNING VALUE(rv_AIRPORT) TYPE /dmo/airport.


ENDINTERFACE.
