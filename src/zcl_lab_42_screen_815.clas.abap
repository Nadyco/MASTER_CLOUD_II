CLASS zcl_lab_42_screen_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: screen_type  TYPE string.

    EVENTS touch_screen  EXPORTING VALUE(ev_POSH) TYPE i
                                   VALUE(ev_posv) TYPE i.


    METHODS constructor
      IMPORTING
        iv_screen_type TYPE string.

    METHODS element_selected.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_42_screen_815 IMPLEMENTATION.

  METHOD constructor.

    me->screen_type = iv_screen_type.

  ENDMETHOD.

  METHOD element_selected.

    RAISE EVENT touch_screen
      EXPORTING
        ev_posh =  '10'
        ev_posv =  '20'.

  ENDMETHOD.

ENDCLASS.
