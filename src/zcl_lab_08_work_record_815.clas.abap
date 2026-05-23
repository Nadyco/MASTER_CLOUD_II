CLASS zcl_lab_08_work_record_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS:
      open_new_record
        IMPORTING iv_date       TYPE zdate
                  iv_first_name TYPE string
                  iv_last_name  TYPE string
                  iv_surname    TYPE string OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: v_DATE       TYPE zdate,
                v_FIRST_NAME TYPE string,
                v_LAST_NAME  TYPE string,
                v_SURNAME    TYPE string.
ENDCLASS.



CLASS zcl_lab_08_work_record_815 IMPLEMENTATION.
  METHOD open_new_record.
        v_DATE        = iv_date.
        v_FIRST_NAME  = iv_first_name.
        v_LAST_NAME   = iv_last_name.
        v_SURNAME     = iv_surname.
  ENDMETHOD.

ENDCLASS.
