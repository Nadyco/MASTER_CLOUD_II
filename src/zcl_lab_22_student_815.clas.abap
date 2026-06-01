CLASS zcl_lab_22_student_815 DEFINITION
  PUBLIC
  INHERITING FROM zcl_lab_21_classroom_815
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS assign_student.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_22_student_815 IMPLEMENTATION.
  METHOD assign_student.
    DATA(lo_obj) = NEW zcl_lab_21_classroom_815( ).
  ENDMETHOD.

ENDCLASS.
