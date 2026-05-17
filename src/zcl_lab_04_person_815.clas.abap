CLASS zcl_lab_04_person_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      set_age IMPORTING iv_age TYPE i,
      get_age EXPORTING ev_age TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: lv_AGE TYPE i.

ENDCLASS.



CLASS zcl_lab_04_person_815 IMPLEMENTATION.

  METHOD get_age.
    ev_age = lv_age.
  ENDMETHOD.

  METHOD set_age.
    lv_age = iv_age.
  ENDMETHOD.

ENDCLASS.
