CLASS zcl_lab_24_partner_815 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_company_capital RETURNING VALUE(rv_value) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_24_partner_815 IMPLEMENTATION.
  METHOD get_company_capital.
    DATA(lo_obj) = NEW zcl_lab_23_company_815( ).
    lo_obj->capital = 'Prueba'.
    rv_value = lo_obj->capital.
  ENDMETHOD.

ENDCLASS.
