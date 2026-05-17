CLASS zcl_lab_01_ejec_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_ejec_815 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " creamos una instancia de la clase
    DATA(lo_obj) = NEW zcl_lab_04_person_815( ).

*    llamamos al metodo set

    lo_obj->set_age( iv_age = 46 ).

    lo_obj->get_age(
      IMPORTING
        ev_age = DATA(lv_edad) ).

    out->write( |Resultado: { lv_edad }| ).


  ENDMETHOD.
ENDCLASS.
