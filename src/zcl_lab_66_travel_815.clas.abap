CLASS zcl_lab_66_travel_815 DEFINITION ABSTRACT
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.

    METHODS:
      transport_oneway ABSTRACT,
      day_one ABSTRACT,
      day_two ABSTRACT,
      day_three ABSTRACT,
      transport_return ABSTRACT.


    METHODS travel FINAL IMPORTING iv_travel TYPE c.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_66_travel_815 IMPLEMENTATION.
  METHOD travel.

    CASE iv_travel.
      WHEN 'A'.
        me->transport_oneway( ).
        me->day_two( ).
        me->transport_return( ).

      WHEN 'B'.

        me->transport_oneway( ).
        me->day_three( ).
        me->transport_return( ).

    ENDCASE.

  ENDMETHOD.

ENDCLASS.
