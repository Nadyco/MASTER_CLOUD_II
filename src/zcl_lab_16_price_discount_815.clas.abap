CLASS zcl_lab_16_price_discount_815 DEFINITION
  PUBLIC
  INHERITING FROM zcl_lab_15_flight_price_815
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "se redefine el metodo agregando un 10%
    METHODS add_price REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: ls_flight TYPE  /dmo/flight.
ENDCLASS.

CLASS zcl_lab_16_price_discount_815 IMPLEMENTATION.

  METHOD add_price.
*   como la estructura del padre es importing no lo puedo modificar
*   por eso declaro una estructura del mismo tipo para aplicar el porc
*   sobre el precio
    ls_flight = is_flight.
    ls_flight-price = ( ls_flight-price * 10 ) / 100.

    super->add_price( is_flight = ls_flight ).
  ENDMETHOD.

ENDCLASS.
