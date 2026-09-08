CLASS zcl_data_gen_rap_nc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_gen_rap_nc IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.

    DELETE FROM zcustomers_nc.
    DELETE FROM zcustomers_nc_d.

    INSERT zcustomers_nc FROM (

    SELECT  FROM /dmo/travel
      FIELDS uuid( ) AS customer_uuid,
             customer_id, description,
             createdby AS local_created_by,
             createdat AS local_created_at,
             lastchangedby AS local_last_changed_by,
             lastchangedat AS local_last_changed_at
             WHERE customer_id BETWEEN 1 AND 3000
             ).

  ENDMETHOD.

ENDCLASS.
