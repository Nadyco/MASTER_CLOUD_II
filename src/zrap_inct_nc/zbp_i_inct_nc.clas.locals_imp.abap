CLASS lhc_Incidents DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS: BEGIN OF lc_status,
                 open        TYPE zed_status_nc VALUE 'OP',
                 in_progress TYPE zed_status_nc VALUE 'IP',
                 pending     TYPE zed_status_nc VALUE 'PE',
                 completed   TYPE zed_status_nc VALUE 'CO',
                 closed      TYPE zed_status_nc VALUE 'CL',
                 canceled    TYPE zed_status_nc VALUE 'CN',
               END OF lc_status.

    METHODS get_instance_features FOR INSTANCE FEATURES
      keys REQUEST requested_features FOR Incidents RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR Incidents RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR Incidents RESULT result.

    METHODS ChangeStatus FOR MODIFY
       keys FOR ACTION Incidents~ChangeStatus RESULT result.

    METHODS SetInitIncident FOR DETERMINE ON MODIFY
       keys FOR Incidents~SetInitIncident.

    METHODS Createfirstincident FOR DETERMINE ON SAVE
       keys FOR Incidents~Createfirstincident.

    METHODS ValidateFuturedate FOR VALIDATE ON SAVE
       keys FOR Incidents~ValidateFuturedate.

    METHODS ValidateStatus FOR VALIDATE ON SAVE
       keys FOR Incidents~ValidateStatus.

ENDCLASS.

CLASS lhc_Incidents IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ChangeStatus.
**  leo los datos de los registros
*    READ ENTITIES OF zi_inct_nc IN LOCAL MODE
*     ENTITY Incidents
*       FIELDS ( IncidentId Status )
*       WITH CORRESPONDING #( keys )
*     RESULT DATA(lt_incidents).
*
** Recorro los datos
*    LOOP AT lt_incidents ASSIGNING FIELD-SYMBOL(<lfs_incident>).
*
**   tengo la estructura key con el %param para la clave actual
*      DATA(ls_key) = keys[ KEY id  %tky = <lfs_incident>-%tky ].
*
*      " Actualiza el status del Incident
*      MODIFY ENTITIES OF zi_inct_nc IN LOCAL MODE
*        ENTITY Incidents
*          UPDATE FIELDS ( Status )
*          WITH VALUE #( ( %tky = <lfs_incident>-%tky
*                          Status = ls_key-%param-New_Status ) ).
*
*      " Crea el registro de historial
*      MODIFY ENTITIES OF zi_inct_nc IN LOCAL MODE
*        ENTITY Incidents
*          CREATE BY \_History
*          FIELDS ( PreviousStatus NewStatus Text )
*          WITH VALUE #( ( %tky            = <lfs_incident>-%tky
*                           %target = VALUE #( ( %cid = 'H1'
*                                                 PreviousStatus = <lfs_incident>-Status
*                                                 NewStatus      = ls_key-%param-New_Status
*                                                 Text           = ls_key-%param-description ) ) ) ).
*
*    ENDLOOP.
*
*    " Devolver el self (necesario por contrato de la acción)
*    result = VALUE #( FOR key IN keys ( %tky = key-%tky ) ).


  ENDMETHOD.

  METHOD SetInitIncident.

*   recupero el valor maximo de incident en la tabla
    SELECT FROM zdt_inct_nc
      FIELDS  MAX( incident_id )
      WHERE incident_id IS NOT NULL
      INTO @DATA(lv_New_id).

    IF lv_new_id = 0.
      lv_new_id = 1.
    ELSE.
      lv_new_id = lv_new_id + 1.
    ENDIF.


    MODIFY ENTITIES OF zi_inct_nc IN LOCAL MODE
     ENTITY Incidents
       UPDATE FIELDS ( IncidentId Status CreatedDate )
       WITH VALUE #( FOR key IN keys
                      ( %tky         = key-%tky
                        IncidentId   = lv_new_id
                        Status       = lc_status-open
                        CreatedDate  = cl_abap_context_info=>get_system_date( )
                         ) )
     REPORTED DATA(ls_reported).

  ENDMETHOD.

  METHOD Createfirstincident.

    DATA: lt_association_entity  TYPE TABLE FOR CREATE zi_inct_nc\_History.

**  leo los datos de los registros
    READ ENTITIES OF zi_inct_nc IN LOCAL MODE
     ENTITY Incidents
      ALL FIELDS WITH CORRESPONDING #( keys )
     RESULT DATA(lt_incidents).
*
** Recorro los datos
    LOOP AT lt_incidents ASSIGNING FIELD-SYMBOL(<lfs_incident>).
**   Por cada registro busco el numero de hisid para el mismo incidente
      SELECT FROM zdt_inct_h_nc
      FIELDS  MAX( his_id )
      WHERE inc_uuid = @<lfs_incident>-IncUuid
      INTO @DATA(lv_his_id).

      IF lv_his_id = 0.
        lv_his_id = 1.
      ELSE.
        lv_his_id = lv_his_id + 1.
      ENDIF.


      APPEND VALUE #( %tky = <lfs_incident>-%tky
                       %target = VALUE #( (
                                             HisID = lv_his_id
                                             PreviousStatus = ' '
                                             NewStatus = <lfs_incident>-Status
                                             Text = 'First Incident' ) )
                                              ) TO lt_association_entity.

*

    ENDLOOP.

    MODIFY ENTITIES OF zi_inct_nc IN LOCAL MODE
      ENTITY Incidents
        CREATE BY \_History
        FIELDS ( HisId PreviousStatus NewStatus Text )
        AUTO FILL CID
        WITH lt_association_entity.

*       REPORTED DATA(ls_reported).
  ENDMETHOD.

  METHOD ValidateFuturedate.
  ENDMETHOD.

  METHOD ValidateStatus.
  ENDMETHOD.

ENDCLASS.
