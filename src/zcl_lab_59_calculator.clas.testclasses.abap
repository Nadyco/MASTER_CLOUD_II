*"* use this source file for your ABAP unit test classes
CLASS ltcl_calculator_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      calculator_local_test FOR TESTING RAISING cx_static_check.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA: mo_calc TYPE REF TO zcl_lab_59_calculator.

ENDCLASS.


CLASS ltcl_calculator_test IMPLEMENTATION.

  METHOD calculator_local_test.
    DATA: lv_result_ut  TYPE i.

    mo_calc->sum_up(
      EXPORTING
        iv_val1   = 2
        iv_val2   = 3
      RECEIVING
        rv_result =  lv_result_ut ).

    IF cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_result_ut
        exp                  = 5
*        ignore_hash_sequence = abap_false
*        tol                  =
*        msg                  =
*        level                = if_abap_unit_constant=>severity-medium
*        quit                 = if_abap_unit_constant=>quit-test
*      RECEIVING
*        assertion_failed     =

    ).
      cl_abap_unit_assert=>fail( 'Implement your first test here' ).
    ENDIF.
  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

  METHOD setup.
    mo_calc = NEW #(  ).
  ENDMETHOD.

  METHOD teardown.
      CLEAR mo_calc.
  ENDMETHOD.
ENDCLASS.
