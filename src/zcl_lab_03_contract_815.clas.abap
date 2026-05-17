CLASS zcl_lab_03_contract_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: lv_CNTR_TYPE  TYPE c LENGTH 2.
    METHODS: set_creation_dat IMPORTING iv_creation_date TYPE zdate.

  PROTECTED SECTION.
    DATA: lv_CREATION_DATE TYPE  zdate.

  PRIVATE SECTION.
    DATA: client TYPE string.

ENDCLASS.


CLASS zcl_lab_03_contract_815 IMPLEMENTATION.
  METHOD set_creation_dat.
    lv_CREATION_DATE = cl_abap_context_info=>get_system_date( ).
  ENDMETHOD.

ENDCLASS.
