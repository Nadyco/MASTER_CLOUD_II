CLASS zcl_lab_63_work_file DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES:zif_lab_06_file.

    ALIASES file_type FOR zif_lab_06_file~get_file_type.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_63_work_file IMPLEMENTATION.

  METHOD file_type.
    rv_type = 'WORK_FILE'.
  ENDMETHOD.

ENDCLASS.
