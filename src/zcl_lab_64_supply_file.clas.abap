CLASS zcl_lab_64_supply_file DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: zif_lab_06_file.

    ALIASES file_type FOR zif_lab_06_file~get_file_type.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_64_supply_file IMPLEMENTATION.

  METHOD file_type.
    rv_type = 'Supply_File'.
  ENDMETHOD.
ENDCLASS.
