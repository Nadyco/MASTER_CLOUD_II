CLASS zcl_lab_60_test_calc_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS .

  PUBLIC SECTION.
    "! @testing  zcl_lab_59_calculator
    METHODS calculator_test FOR TESTING.  "UTM _ Unit test Method
  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA: mo_calc TYPE REF TO zcl_lab_59_calculator.
ENDCLASS.



CLASS ZCL_LAB_60_TEST_CALC_815 IMPLEMENTATION.


  METHOD calculator_test.

    DATA: lv_result_ut  TYPE i.

    mo_calc->sum_up(
      EXPORTING
        iv_val1   = 2
        iv_val2   = 3
      RECEIVING
        rv_result =  lv_result_ut ).


    cl_abap_unit_assert=>assert_equals(
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


  ENDMETHOD.


  METHOD setup.
    mo_calc = NEW #(  ).
  ENDMETHOD.


  METHOD teardown.
    CLEAR mo_calc.
  ENDMETHOD.


  METHOD class_setup.

  ENDMETHOD.


  METHOD class_teardown.

  ENDMETHOD.
ENDCLASS.
