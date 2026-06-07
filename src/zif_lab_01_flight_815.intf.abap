INTERFACE zif_lab_01_flight_815
  PUBLIC .

  INTERFACES zif_lab_03_airports_815.

  CLASS-DATA: comp_id  TYPE string.
  DATA: conn_id TYPE string.

  METHODS:
    set_CONN_ID IMPORTING iv_CONN_ID TYPE string,
    get_CONN_ID RETURNING VALUE(rv_CONN_ID) TYPE string.

ENDINTERFACE.
