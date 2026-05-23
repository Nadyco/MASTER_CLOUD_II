CLASS zcl_lab_09_account_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      set_isban IMPORTING iv_isban TYPE string,
      get_isban EXPORTING ev_isban TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: v_isban TYPE string.
ENDCLASS.



CLASS zcl_lab_09_account_815 IMPLEMENTATION.
  METHOD get_isban.
    ev_isban = me->v_isban.
  ENDMETHOD.

  METHOD set_isban.
    me->v_isban = iv_isban .
  ENDMETHOD.

ENDCLASS.
