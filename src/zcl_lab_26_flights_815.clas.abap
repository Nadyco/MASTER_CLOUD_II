CLASS zcl_lab_26_flights_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    INTERFACES zif_lab_01_flight_815 .
    INTERFACES zif_lab_02_customer_815.

    ALIASES:
    get_conn_id  FOR  zif_lab_01_flight_815~get_conn_id,
    set_conn_id  FOR zif_lab_01_flight_815~set_conn_id,
    get_customer FOR zif_lab_02_customer_815~get_customer,
    get_airports FOR zif_lab_03_airports_815~get_airports.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_26_flights_815 IMPLEMENTATION.


  METHOD zif_lab_01_flight_815~get_conn_id.
    rv_CONN_ID = zif_lab_01_flight_815~conn_id.
  ENDMETHOD.


  METHOD zif_lab_01_flight_815~set_conn_id.
    me->zif_lab_01_flight_815~conn_id = iv_CONN_ID.
  ENDMETHOD.

  METHOD zif_lab_02_customer_815~get_customer.

    SELECT SINGLE FROM /dmo/customer
    FIELDS first_name, last_name
    WHERE customer_id = @iv_customer_id
    INTO @rs_address.

  ENDMETHOD.

  METHOD zif_lab_03_airports_815~get_airports.

    SELECT SINGLE FROM /dmo/airport
    FIELDS *
    WHERE airport_id =  @iv_airport_id
    INTO @rv_AIRPORT.

  ENDMETHOD.

ENDCLASS.
