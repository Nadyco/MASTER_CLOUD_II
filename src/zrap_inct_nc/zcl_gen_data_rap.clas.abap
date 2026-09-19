CLASS zcl_gen_data_rap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gen_data_rap IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE FROM zdt_status_nc.
    DELETE FROM zdt_priority_nc.

    INSERT zdt_priority_nc FROM TABLE @( VALUE #(
       ( client = sy-mandt  priority_code = 'H'  priority_description = 'High' )
       ( client = sy-mandt  priority_code = 'M'  priority_description = 'Medium' )
       ( client = sy-mandt  priority_code = 'L'  priority_description = 'Low' )
       ) ).

    INSERT zdt_status_nc FROM TABLE @( VALUE #(
     ( client = sy-mandt  status_code = 'OP'  status_description = 'Open' )
     ( client = sy-mandt  status_code = 'IP'  status_description = 'In Progress' )
     ( client = sy-mandt  status_code = 'PE'  status_description = 'Pending' )
     ( client = sy-mandt  status_code = 'CO'  status_description = 'Completed' )
     ( client = sy-mandt  status_code = 'CL'  status_description = 'Closed' )
     ( client = sy-mandt  status_code = 'CN'  status_description = 'Cancelled' )
        ) ).

    IF sy-subrc = 0.
      COMMIT WORK.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
