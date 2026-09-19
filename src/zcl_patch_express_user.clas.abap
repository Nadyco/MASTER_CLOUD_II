CLASS zcl_patch_express_user DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_patch_express_user IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    SELECT FROM zcds_public_assoc_user
*      FIELDS agency_id,
*             travel_id
**             \_agency-name
*     WHERE agency_id =  '070032'
*     INTO TABLE @DATA(lt_query)
*      UP TO 10 ROWS.

*    out->write( lt_query ).

  ENDMETHOD.
ENDCLASS.
