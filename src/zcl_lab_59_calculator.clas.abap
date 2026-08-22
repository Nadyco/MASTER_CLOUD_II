CLASS zcl_lab_59_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS sum_up  IMPORTING iv_val1          TYPE i
                              iv_val2          TYPE i
                    RETURNING VALUE(rv_result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_59_CALCULATOR IMPLEMENTATION.


  METHOD sum_up.
    rv_result = iv_val1 + iv_val2.
  ENDMETHOD.
ENDCLASS.
