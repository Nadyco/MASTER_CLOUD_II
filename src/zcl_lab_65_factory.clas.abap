CLASS zcl_lab_65_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS create_file IMPORTING iv_file            TYPE string
                        RETURNING VALUE(rv_filetype) TYPE REF TO zif_lab_06_file.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_65_factory IMPLEMENTATION.
  METHOD create_file.

    CASE iv_file.
      WHEN 'WORK'.
        rv_filetype = NEW zcl_lab_63_work_file( ).
      WHEN 'SUPPLY'.
        rv_filetype = NEW zcl_lab_64_supply_file( ).
      WHEN OTHERS.
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
