CLASS zcl_lab_53_check_user_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS check_user  IMPORTING iv_uname TYPE syuname
                        RAISING   zcx_lab_52_operations_815.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_53_check_user_815 IMPLEMENTATION.
  METHOD check_user.

    IF iv_uname = 'CB9980000179'.
      RAISE EXCEPTION TYPE zcx_lab_52_operations_815
        EXPORTING
          textid = zcx_lab_52_operations_815=>zcx_no_access
*         previous =
          attr1  = |{ sy-uname }|.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
