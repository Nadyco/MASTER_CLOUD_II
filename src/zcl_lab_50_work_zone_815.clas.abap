CLASS zcl_lab_50_work_zone_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_lab_51_wz_friend_815.

  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: work_zonte TYPE ty_work_zone.
    DATA: o_helper TYPE REF TO lcl_helper.

    METHODS: set_work_zone IMPORTING is_wzone TYPE ty_work_zone.

ENDCLASS.

CLASS zcl_lab_50_work_zone_815 IMPLEMENTATION.
  METHOD set_work_zone.
    me->work_zonte = is_wzone.
  ENDMETHOD.

ENDCLASS.
