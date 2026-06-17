CLASS zcl_lab_33_expatriate_empl_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_lab_04_employee_815 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_33_expatriate_empl_815 IMPLEMENTATION.


  METHOD zif_lab_04_employee_815~get_employees_count.
    rv_cant_empl = 'Cantidad Expatriados: 8'.
  ENDMETHOD.
ENDCLASS.
