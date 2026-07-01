CLASS zcl_lab_35_college_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: lo_student  TYPE REF TO zcl_lab_34_student_815.
    METHODS:
      set_enroll_student IMPORTING ir_enroll TYPE REF TO zcl_lab_34_student_815,
      get_enroll_student RETURNING VALUE(rr_enroll) TYPE REF TO zcl_lab_34_student_815.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_35_college_815 IMPLEMENTATION.
  METHOD get_enroll_student.
    rr_enroll = me->lo_student.
  ENDMETHOD.

  METHOD set_enroll_student.
    me->lo_student = ir_enroll.
  ENDMETHOD.

ENDCLASS.
