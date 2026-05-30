CLASS zcl_lab_13_view_815 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_view_type TYPE string.

  PROTECTED SECTION.
    DATA: view_type TYPE string,
          box       TYPE string.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_13_view_815 IMPLEMENTATION.
  METHOD constructor.
    me->view_type = iv_view_type.
  ENDMETHOD.

ENDCLASS.
