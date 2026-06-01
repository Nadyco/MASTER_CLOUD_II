CLASS zcl_lab_25_collaborator_815 DEFINITION
  PUBLIC
  INHERITING FROM zcl_lab_24_partner_815
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_capital RETURNING VALUE(rv_value) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_25_collaborator_815 IMPLEMENTATION.
  METHOD get_capital.
    rv_value = me->get_company_capital( ).
  ENDMETHOD.

ENDCLASS.
