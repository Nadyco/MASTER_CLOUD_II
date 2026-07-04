CLASS zcl_lab_36_phone_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING io_screen TYPE REF TO zcl_lab_37_screen_815.

    DATA: o_screen TYPE REF TO zcl_lab_37_screen_815.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_36_phone_815 IMPLEMENTATION.
  METHOD constructor.
    me->o_screen = io_screen.
  ENDMETHOD.

ENDCLASS.
