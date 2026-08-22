*"* use this source file for your ABAP unit test classes
CLASS ltcl_test_inj DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
    INTERFACES if_abap_db_writer  PARTIALLY IMPLEMENTED.

  PRIVATE SECTION.
    METHODS:
      get_travel_local_test FOR TESTING RAISING cx_static_check.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA: mo_travel TYPE REF TO  zcl_lab_61_travel_815.
ENDCLASS.


CLASS ltcl_test_inj IMPLEMENTATION.

  METHOD get_travel_local_test.

    me->mo_travel->get_travel(
      EXPORTING
        iv_carrier_id =  'SQ'
        iv_conn_id    = '0002'
      RECEIVING
        rs_flight     = DATA(ls_aux)
    ).

    IF cl_abap_unit_assert=>assert_equals(
         act                  = | { ls_aux-carrier_id } { ls_aux-connection_id } |
         exp                  = ' '

       ) = abap_true.

      cl_abap_unit_assert=>fail( 'Implement get_travel failer.... zcl_lab_61_travel_815' ).
    ENDIF.
  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

  METHOD setup.

    me->mo_travel = NEW #(  ).

    TEST-INJECTION select_data.
      lv_carrier_id  = 'SQ'.
      lv_conn_id = '0002'.
      ls_flight-carrier_id  = lv_carrier_id.
      ls_flight-connection_id = lv_conn_id.
    END-TEST-INJECTION.

  ENDMETHOD.

  METHOD teardown.
    CLEAR me->mo_travel.
  ENDMETHOD.

ENDCLASS.
