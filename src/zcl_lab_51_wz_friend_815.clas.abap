CLASS zcl_lab_51_wz_friend_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_helper.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_lab_51_wz_friend_815 IMPLEMENTATION.
  METHOD get_helper.
*    Se instancia la clase amiga para acceder a sus componentes
    DATA(lo_components) = NEW zcl_lab_50_work_zone_815( ).

**   de esta manera llama al metodo get de la solapa local
    lo_components->o_helper->get_work_zone(
*       RECEIVING
*         rs_work_zone =
    ).
  ENDMETHOD.
ENDCLASS.
