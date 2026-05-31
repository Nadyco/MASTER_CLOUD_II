CLASS zcl_lab_01_ejec_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_ejec_815 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA: lo_obj TYPE REF TO zcl_lab_04_person_815.
    "primer forma de instanciar clase
*    CREATE OBJECT lo_obj.

    " segunda forma de instanciar clase
*    lo_obj = NEW #(  ).

*    Tercer forma en linea de instanciar clase
    " creamos una instancia de la clase
*    DATA(lo_obj) = NEW zcl_lab_04_person_815( ).
*
*    IF lo_obj IS BOUND.
**    llamamos al metodo set
*
*      lo_obj->set_age( iv_age = 46 ).
*
*      lo_obj->get_age(
*        IMPORTING
*          ev_age = DATA(lv_edad) ).
*
*      out->write( |Resultado: { lv_edad }| ).
*    ENDIF..

**    DATA(lo_obj) = NEW zcl_lab_05_flight_815( ).
**
**    IF lo_obj IS BOUND.
**
**      lo_obj->check_flight(
**        EXPORTING
**          iv_carrier_id = 'UA'
**          iv_conn_id    = '0058'
**        RECEIVING
**          rv_exist      = DATA(lv_exist) ).
**
**      out->write( lv_exist ).
**
**    ENDIF.
**
**    " ejercicio 6
**    DATA: ls_object TYPE zcl_lab_06_elements_815=>ty_elem_objects.
*
*    out->write( zcl_lab_06_elements_815=>c_bandera ).
*    out->write( zcl_lab_06_elements_815=>cs_constants-c_blanco ).
*    out->write( zcl_lab_06_elements_815=>cs_constants-c_celeste ).
*    out->write( zcl_lab_06_elements_815=>cs_constants-c_dorado ).
*

*    DATA(lo_obj) = NEW zcl_lab_07_student_815( ).
*
*    lo_obj->set_birth_date( iv_birth_date = '19790125' ).
*
*    out->write( lo_obj->v_birth_date ).

*    DATA(lo_obj) = NEW zcl_lab_08_work_record_815( ).
*
*    lo_obj->open_new_record(
*      iv_date       =  cl_abap_context_info=>get_system_date( )
*      iv_first_name = 'Nadia'
*      iv_last_name  = 'Correa'
**      iv_surname    =
*    ).
*    DATA(lo_obj) = NEW zcl_lab_09_account_815( ).
*    lo_obj->set_isban( iv_isban = 'ISBAN1236546' ).
*
*    lo_obj->get_isban(
*      IMPORTING
*        ev_isban = DATA(lv_isban)
*    ).
*
*    out->write( zcl_lab_10_constructor_815=>log ).
*    DATA(lo_obj) = NEW zcl_lab_10_constructor_815( ).
*    out->write( lo_obj->log ).

*    DATA(lo_obj) = NEW zcl_lab_14_grid_815(
*                      iv_view_type = 'LG'
*                      iv_box       = '26'
*                    ).
*
*    DATA: lo_price    TYPE REF TO zcl_lab_15_flight_price_815,
*          lo_price_10 TYPE REF TO zcl_lab_16_price_discount_815,
*          lo_price_20 TYPE REF TO zcl_lab_17_super_discount_815.
*
*    SELECT SINGLE FROM /dmo/flight
*    FIELDS *
*    WHERE carrier_id = 'SQ'
*     AND connection_id = '0001'
*    INTO @DATA(ls_data).
*
*    lo_price = NEW zcl_lab_15_flight_price_815( ).
*
*    lo_price->add_price( is_flight = ls_data ).
*    out->write( lo_price->mt_flights ).
*
*    lo_price_10 = NEW zcl_lab_16_price_discount_815( ).
*    lo_price_10->add_price( is_flight = ls_data ).
*    out->write( lo_price_10->mt_flights ).
*
*
*    lo_price_20 = NEW zcl_lab_17_super_discount_815( ).
*    lo_price_20->add_price( is_flight = ls_data ).
*    out->write( lo_price_20->mt_flights ).
*
*    out->write( 'Resultado final MT_FLIGHT' ).
*    out->write( lo_price->mt_flights ).

    DATA(lo_animal) = NEW zcl_lab_18_animal_815( ).
    DATA(lo_lion) = NEW zcl_lab_19_lion_815( ).


    out->write( lo_animal->walk( ) ).
    out->write( lo_lion->walk( ) ).

    out->write( 'Narrowing Cast' ).
*    la clase padre o base va a apuntar a la clase hija
*    lo_animal = lo_lion.

    out->write( lo_animal->walk( ) ).
    out->write( lo_lion->walk( ) ).

    out->write( 'Widening Cast' ).
    TRY.
        lo_lion ?= lo_animal.

      CATCH cx_sy_move_cast_error.
        out->write( 'casting error' ).
        EXIT.
    ENDTRY.

    out->write( lo_animal->walk( ) ).
    out->write( lo_lion->walk( ) ).

  ENDMETHOD.
ENDCLASS.
