CLASS zcl_lab44_operating_system_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_lab_05_browser_815.

    METHODS: mouse_movement RETURNING VALUE(rv_text) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab44_operating_system_815 IMPLEMENTATION.
  METHOD mouse_movement.
    rv_text = 'Raise event: mouse movement'.
*    dispara el evento
    RAISE EVENT zif_lab_05_browser_815~close_window.

  ENDMETHOD.

ENDCLASS.
