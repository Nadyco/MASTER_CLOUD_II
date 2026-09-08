CLASS zcl_custom_detail_nnc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_custom_detail_nnc IMPLEMENTATION.


  METHOD if_rap_query_provider~select.


    IF io_request->is_data_requested( ).

      DATA(lv_top)  = io_request->get_paging( )->get_page_size( ).
      DATA(lv_stop) = io_request->get_paging( )->get_offset( ).

      SELECT FROM /dmo/customer
      FIELDS customer_id, phone_number, email_address
      ORDER BY customer_id
        INTO TABLE @DATA(lt_resultado)
        OFFSET @lv_stop
        UP TO @lv_top ROWS.

      IF sy-subrc = 0.
        io_response->set_total_number_of_records( iv_total_number_of_records =  lines( lt_resultado ) ).
*        CATCH cx_rap_query_response_set_twic.

      ENDIF.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
