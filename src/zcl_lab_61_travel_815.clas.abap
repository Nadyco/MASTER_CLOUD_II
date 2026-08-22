CLASS zcl_lab_61_travel_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_travel IMPORTING iv_carrier_id    TYPE /dmo/carrier_id
                                 iv_conn_id       TYPE /dmo/connection_id
                       RETURNING VALUE(rs_flight) TYPE /dmo/flight.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_61_TRAVEL_815 IMPLEMENTATION.


  METHOD get_travel.

    DATA: lv_carrier_id TYPE /dmo/carrier_id,
          lv_conn_id    TYPE /dmo/connection_id.

    SELECT SINGLE FROM /dmo/flight
    FIELDS *
    WHERE carrier_id = @iv_carrier_id
     AND connection_id = @iv_conn_id
     INTO @rs_flight .

    TEST-SEAM  select_data.
      "este bloque se llama solo cuando se hace el testing
      SELECT SINGLE FROM /dmo/flight
    FIELDS *
    WHERE carrier_id = @lv_carrier_id
     AND connection_id = @lv_conn_id
     INTO @DATA(ls_flight).

    END-TEST-SEAM.

  ENDMETHOD.
ENDCLASS.
