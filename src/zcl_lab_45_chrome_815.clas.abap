CLASS zcl_lab_45_chrome_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS on_close_window
      FOR EVENT close_window OF zif_lab_05_browser_815
      IMPORTING sender.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_45_chrome_815 IMPLEMENTATION.
  METHOD on_close_window.

  ENDMETHOD.

ENDCLASS.
