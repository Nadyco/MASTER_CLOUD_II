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

    DATA(lo_manage) = NEW zcl_lab_53_check_user_815( ).
    DATA: lv_num1   TYPE i VALUE 10,
          lv_num2   TYPE i VALUE 0,
          lv_result TYPE i.

    TRY.

        TRY.

            lv_result = lv_num1 + lv_num2.
            lv_result = lv_num1 / lv_num2.
            lv_result = lv_num1 - lv_num2.

          CATCH zcx_lab_52_operations_815 INTO DATA(lo_excep).
            out->write( lo_excep->get_text( ) ).

          CLEANUP.
            out->write( |Cleanup1 ......| ).
            out->write( |Resultado { lv_result }| ).

        ENDTRY.

      CATCH cx_sy_zerodivide INTO DATA(lo_excep1).
        out->write( lo_excep1->get_text( ) ).
        lv_num2 = 2.
        RETRY.
      CLEANUP.
        out->write( |Cleanup2 ......| ).

    ENDTRY.

    out->write( |Resultado { lv_result }| ).
*    DATA(lo_manage) = NEW zcl_lab_53_check_user_815( ).
*    DATA: lv_ope1 TYPE i VALUE 2,
*          lv_div  TYPE i VALUE 0.
*
*    TRY.
*        lo_manage->check_user( iv_uname = ' ' ).
*        DATA(result) = lv_ope1 / lv_div.
*
*      CATCH zcx_lab_52_operations_815 INTO DATA(lo_excep).
*        out->write( lo_excep->get_text( ) ).
*        "handle exception
*
*      CATCH cx_sy_zerodivide INTO DATA(lo_excep1).
*        out->write( lo_excep1->get_text( ) ).
*        lv_div = 2.
*        RETRY.
*
*    ENDTRY.
*
*
*    out->write( |Resultado { result }| ).


*     CATCH zcx_lab_52_operations_815.

*    DATA(lo_close_window) = NEW zcl_lab44_operating_system_815( ).
*    DATA(lo_on_close_windows) = NEW zcl_lab_45_chrome_815( ).
*
*    out->write( 'Activation False' ).
*    SET HANDLER lo_on_close_windows->on_close_window FOR lo_close_window ACTIVATION abap_false.
*
*    lo_close_window->mouse_movement(  ).
*
*    out->write( lo_close_window->mouse_movement(  ) ).
*
*    out->write( 'Activation True' ).
*    SET HANDLER lo_on_close_windows->on_close_window FOR lo_close_window .
*
*    lo_close_window->mouse_movement(  ).
*
*    out->write( lo_close_window->mouse_movement(  ) ).
*    DATA(lo_touch_screen) = NEW zcl_lab_42_screen_815( iv_screen_type = 'A01' ).
*    DATA(lo_on_toch_screen) = NEW zcl_lab_43_navigation_815( ).
*
*    SET HANDLER lo_on_toch_screen->on_touch_screen FOR lo_touch_screen.
*
*    lo_touch_screen->element_selected( ).
*
*    IF NOT lo_on_toch_screen->posh IS INITIAL AND
*       NOT lo_on_toch_screen->posv IS INITIAL.
*
*      out->write( 'se disparo el evento on_touch_screen' ).
*      out->write( |Posicion Horizontal: { lo_on_toch_screen->posh } | ).
*      out->write( |Posicion Vertical: { lo_on_toch_screen->posv } | ).
*      out->write( |Tipo Sender: { lo_on_toch_screen->sender_type } | ).
*
*    ELSE.
*      out->write( 'NO se disparo el evento on_touch_screen' ).
*    ENDIF.

*    DATA(lo_obj) = NEW zcl_lab_38_prod_price_815( ).
*    DATA(lo_obj1) = NEW zcl_lab_38_prod_price_815( ).
*
*    lo_obj->price = 10.
*
*    lo_obj1->price = 20.
*
*    lo_obj = lo_obj1.
*
*    out->write( lo_obj ).
*    out->write( lo_obj1 ).

*    DATA:lo_phone TYPE REF TO zcl_lab_36_phone_815.
*    DATA:lo_screen TYPE REF TO zcl_lab_37_screen_815.
*
*    lo_screen = NEW zcl_lab_37_screen_815( ).
*
*    lo_phone = NEW zcl_lab_36_phone_815( io_screen = lo_screen ).
*
*    lo_screen->set_screen( iv_screen = 'Screen' ).
*
*    out->write( lo_phone->o_screen->get_screen( ) ).





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
*
*    DATA(lo_animal) = NEW zcl_lab_18_animal_815( ).
*    DATA(lo_lion) = NEW zcl_lab_19_lion_815( ).
*
*
*    out->write( lo_animal->walk( ) ).
*    out->write( lo_lion->walk( ) ).
*
*    out->write( 'Narrowing Cast' ).
**    la clase padre o base va a apuntar a la clase hija
**    lo_animal = lo_lion.
*
*    out->write( lo_animal->walk( ) ).
*    out->write( lo_lion->walk( ) ).
*
*    out->write( 'Widening Cast' ).
*    TRY.
*        lo_lion ?= lo_animal.
*
*      CATCH cx_sy_move_cast_error.
*        out->write( 'casting error' ).
*        EXIT.
*    ENDTRY.
*
*    out->write( lo_animal->walk( ) ).
*    out->write( lo_lion->walk( ) ).

*    DATA(lo_obj) = NEW zcl_lab_26_flights_815( ).
*    lo_obj->set_conn_id( iv_conn_id = 'CN' ).
*
*    lo_obj->get_conn_id(
*      RECEIVING rv_conn_id = DATA(lv_connid) ).
*
*    out->write( lv_connid ).
*
*    lo_obj->get_customer(
*      EXPORTING  iv_customer_id = '000026'
*      RECEIVING  rs_address     = DATA(ls_customer)  ).
*
*    out->write( ls_customer ).
*
*    lo_obj->get_airports(
*      EXPORTING  iv_airport_id =  'MAD'
*      RECEIVING  rv_airport    = DATA(ls_airport) ).
*
*    out->write( ls_airport ).
*
*
**    out->write( lo_obj->get_company_capital( ) ).
**
*    DATA(lo_obj1) = NEW zcl_nc_connections( ).
*    out->write( lo_obj1->get_connections( i_departure = 'FRA' ) ).

*    DATA: lt_objects TYPE STANDARD TABLE OF REF TO zcl_lab_29_organization_815,
*          ls_objects TYPE REF TO zcl_lab_29_organization_815.

*    DATA(lo_obj) = NEW zcl_lab_30_org_germany_815( ).
*    APPEND lo_obj TO lt_objects.
*
*    DATA(lo_obj1) = NEW zcl_lab_31_org_france_815( ).
*    APPEND lo_obj1 TO lt_objects.
*
*    LOOP AT lt_objects INTO ls_objects.
*      out->write( ls_objects->get_location( ) ).
*    ENDLOOP.

*    DATA: lt_objects_if TYPE STANDARD TABLE OF REF TO zif_lab_04_employee_815,
*          ls_objects_if TYPE REF TO zif_lab_04_employee_815.
*
*
*    DATA(lo_obj) = NEW zcl_lab_32_internal_empl_815( ).
*    APPEND lo_obj TO lt_objects_if.
*
*    DATA(lo_obj1) = NEW zcl_lab_33_expatriate_empl_815( ).
*    APPEND lo_obj1 TO lt_objects_if.
*
*    LOOP AT lt_objects_if INTO ls_objects_if.
*      out->write( ls_objects_if->get_employees_count( ) ).
*    ENDLOOP.

*    DATA: lo_students TYPE REF TO zcl_lab_34_student_815,
*          lo_college  TYPE REF TO zcl_lab_35_college_815.

***  CREO UNA INSTANCIA DE ESTUDIANTE
*    lo_students = NEW zcl_lab_34_student_815( ).
*    lo_students->set_name( iv_name = 'Nadia Correa' ).
*
*** creo la instancia de college yle paso el estidiante
*   lo_college = new #( ).
*   lo_college->set_enroll_student( ir_enroll = lo_students  ).
*
***mostramos el resultado
*
*  out->write( lo_college->get_enroll_student( )->get_name( ) ).


  ENDMETHOD.
ENDCLASS.
