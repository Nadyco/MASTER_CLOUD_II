CLASS zcl_lab_62_context_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.

    DATA: mv_tyme TYPE zsyst_uzeit.

    METHODS constructor.
    CLASS-METHODS: get_instances RETURNING VALUE(ro_instances) TYPE REF TO zcl_lab_62_context_815.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: mo_instance TYPE REF TO zcl_lab_62_context_815.
ENDCLASS.



CLASS zcl_lab_62_context_815 IMPLEMENTATION.

  METHOD constructor.
    me->mv_tyme = cl_abap_context_info=>get_system_time( ).
  ENDMETHOD.

  METHOD get_instances.
    IF mo_instance IS NOT BOUND.
      mo_instance = NEW #(  ).
    ENDIF.

    ro_instances = mo_instance.
  ENDMETHOD.

ENDCLASS.
