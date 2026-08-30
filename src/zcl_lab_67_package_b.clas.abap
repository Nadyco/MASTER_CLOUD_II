CLASS zcl_lab_67_package_b DEFINITION INHERITING FROM zcl_lab_66_travel_815
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: lv_type TYPE string.
  PROTECTED SECTION.
    METHODS:
      transport_oneway REDEFINITION,
      day_one REDEFINITION,
      day_two REDEFINITION,
      day_three REDEFINITION,
      transport_return REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_67_package_b IMPLEMENTATION.
  METHOD day_one.
    me->lv_type = 'day one B'.
  ENDMETHOD.

  METHOD day_three.
    me->lv_type = 'day three B'.
  ENDMETHOD.

  METHOD day_two.
    me->lv_type = 'day two B'.
  ENDMETHOD.

  METHOD transport_oneway.
    me->lv_type = 'Transport day one B'.
  ENDMETHOD.

  METHOD transport_return.
    me->lv_type = 'transport_return B'.
  ENDMETHOD.

ENDCLASS.
