CLASS zcl_lab_05_flight_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS check_FLIGHT
      IMPORTING iv_carrier_id   TYPE /dmo/flight-carrier_id
                iv_conn_id      TYPE /dmo/flight-connection_id
      RETURNING VALUE(rv_exist) TYPE abap_boolean.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_flight_815 IMPLEMENTATION.

  METHOD check_flight.
    SELECT FROM /dmo/flight
    FIELDS COUNT( * )
    WHERE carrier_id   = @iv_carrier_id
     AND connection_id = @iv_conn_id.
    IF sy-subrc EQ 0.
      rv_exist = abap_true.
    ELSE.
      rv_exist = abap_false.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
