CLASS zcl_lab_06_elements_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "Declaracion de TYPES
    TYPES: BEGIN OF ty_elem_objects,
             class     TYPE string,
             instance  TYPE string,
             reference TYPE string,
           END OF ty_elem_objects.

    CONSTANTS: BEGIN OF cs_constants,
                 c_blanco  TYPE c LENGTH 20 VALUE 'Blanco',
                 c_celeste TYPE c LENGTH 20 VALUE 'Celeste',
                 c_dorado  TYPE c LENGTH 20 VALUE 'Dorado',
               END OF cs_constants.

    CONSTANTS: c_bandera TYPE c LENGTH 20 VALUE 'Bandera'.


    METHODS:
      set_object  IMPORTING iv_object TYPE ty_elem_objects.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_06_elements_815 IMPLEMENTATION.

  METHOD set_object.

  ENDMETHOD.

ENDCLASS.
