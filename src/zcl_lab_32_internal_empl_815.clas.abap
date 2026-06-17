CLASS zcl_lab_32_internal_empl_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_lab_04_employee_815 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_32_internal_empl_815 IMPLEMENTATION.


  METHOD zif_lab_04_employee_815~get_employees_count.
    rv_cant_empl = 'cantidad Interna: 10'.
  ENDMETHOD.
ENDCLASS.
