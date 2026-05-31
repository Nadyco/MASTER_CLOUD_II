CLASS zcl_lab_15_flight_price_815 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: Mt_flights TYPE TABLE OF /dmo/flight.

    METHODS add_price IMPORTING is_flight TYPE /dmo/flight.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_15_flight_price_815 IMPLEMENTATION.
  METHOD add_price.
    IF NOT is_flight IS INITIAL.
      APPEND is_flight TO mt_flights.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
