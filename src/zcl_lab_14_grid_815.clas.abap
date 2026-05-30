CLASS zcl_lab_14_grid_815 DEFINITION
  PUBLIC
  INHERITING FROM zcl_lab_13_view_815
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_view_type TYPE string
                                  iv_box       TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_14_grid_815 IMPLEMENTATION.
  METHOD constructor.

    super->constructor( iv_view_type = iv_view_type ).
    me->box = iv_box.

  ENDMETHOD.

ENDCLASS.
