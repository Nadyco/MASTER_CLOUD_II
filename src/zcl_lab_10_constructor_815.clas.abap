CLASS zcl_lab_10_constructor_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA log TYPE string.

    METHODS constructor.
    CLASS-METHODS class_constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_10_constructor_815 IMPLEMENTATION.

  METHOD constructor.
    log = | { log }- Instance Constructor |.
  ENDMETHOD.

  METHOD class_constructor.
    log = | { log }- Static Constructor |.
  ENDMETHOD.

ENDCLASS.
