CLASS zcl_lab_43_navigation_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     data: posh type i,
           posv type i,
           sender_type tyPE string.

    METHODS on_touch_screen  FOR EVENT touch_screen OF zcl_lab_42_screen_815
      IMPORTING ev_posh
                ev_posv
                sender.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_43_navigation_815 IMPLEMENTATION.
  METHOD on_touch_screen.
    me->posh = ev_posh.
    me->posv = ev_posh.
    me->sender_type = sender->screen_type.
  ENDMETHOD.

ENDCLASS.
