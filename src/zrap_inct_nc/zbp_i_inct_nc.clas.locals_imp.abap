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

    METHODS ValidatePriority FOR VALIDATE ON SAVE
       keys FOR Incidents~ValidatePriority.
    METHODS validateemptyfields FOR VALIDATE ON SAVE
       keys FOR Incidents~validateemptyfields.

ENDCLASS.

CLASS lhc_Incidents IMPLEMENTATION.

  METHOD get_instance_features.

*   leo los datos de los registros
    READ ENTITIES OF zi_inct_nc IN LOCAL MODE
     ENTITY Incidents
     FIELDS ( Status )
     WITH CORRESPONDING #( keys )
     RESULT DATA(Incidents)
     FAILED failed.


    DATA(lv_inc_uuid) = keys[ 1 ]-IncUuid.
**  lv_count tendra la cantidad de registros de historial para el incidente
    SELECT FROM zdt_inct_h_nc
      FIELDS COUNT( his_id )
      WHERE inc_uuid = @lv_inc_uuid
      INTO @DATA(lv_count).

    result = VALUE #( FOR incident  IN Incidents
                          ( %tky = incident-%tky
                          "Cuando el estado es completo, closed o canceled se dehabilita el boton y no tiene
                          "Historial creado es decir primer registro
                           %action-ChangeStatus = COND #( WHEN incident-Status = lc_status-canceled OR
                                                               incident-Status = lc_status-closed OR
                                                               incident-Status = lc_status-completed OR
                                                               lv_count IS INITIAL
                                                                THEN if_abap_behv=>fc-o-disabled
                                                                ELSE if_abap_behv=>fc-o-enabled )




                     ) ).



  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ChangeStatus.

    DATA: lt_new_history  TYPE TABLE FOR CREATE zi_inct_nc\_History.
    DATA: lt_upd_inc      TYPE TABLE FOR UPDATE zi_inct_nc.

    DATA(lv_current_user) = cl_abap_context_info=>get_user_technical_name( ).

    "----------------------------------------------------------------
    " 1. Leer datos actuales de los incidentes (Status)
    "----------------------------------------------------------------
**  leo los datos de los registros
    READ ENTITIES OF zi_inct_nc IN LOCAL MODE
     ENTITY Incidents
       FIELDS ( IncidentId Status )
       WITH CORRESPONDING #( keys )
     RESULT DATA(lt_incidents).

** Recorro los datos
    LOOP AT lt_incidents ASSIGNING FIELD-SYMBOL(<lfs_incident>).

      DATA(lv_error) = abap_false.

**   tengo la estructura key con el %param para la clave actual
      DATA(ls_key) = keys[ KEY id  %tky = <lfs_incident>-%tky ].


**   Valido los estados
      "----------------------------------------------------------------
      " 2. Si New_Status esta vacio da error y salgo
      "----------------------------------------------------------------
      IF ls_key-%param-New_Status IS INITIAL.

        "el cambio de estado no puede estar vacio
        APPEND VALUE #( %tky = <lfs_incident>-%tky ) TO failed-incidents.

        APPEND VALUE #( %tky = <lfs_incident>-%tky
                        %msg = NEW zcl_msg_rap_nc( textid   = zcl_msg_rap_nc=>empty_status
                                                   severity = if_abap_behv_message=>severity-error
                                                 )

                        %op-%action-changestatus = if_abap_behv=>mk-on
                ) TO reported-incidents.

        lv_error = abap_true.
        EXIT.

      ELSEIF ls_key-%param-New_Status = lc_status-in_progress.
        "----------------------------------------------------------------
        " 3. Si ingreso status IP, valida que haya ingresado responsable
        "----------------------------------------------------------------
        IF ls_key-%param-Responsable IS INITIAL.
          " Responsable es Obligatorio
          APPEND VALUE #( %tky = <lfs_incident>-%tky ) TO failed-incidents.

          APPEND VALUE #( %tky = <lfs_incident>-%tky
                          %msg = NEW zcl_msg_rap_nc( textid   = zcl_msg_rap_nc=>empty_Responsable
                                           severity = if_abap_behv_message=>severity-error )

                          %op-%action-changestatus = if_abap_behv=>mk-on
                        ) TO reported-incidents.


          lv_error = abap_true.

          EXIT.
        ELSEIF ls_key-%param-Responsable <> lv_current_user.
          "----------------------------------------------------------------
          " 4. Si Ingreso responsable y el status IP, valida que sea el
          "    Administrador
          "----------------------------------------------------------------
          "solo el Administrador Tiene permiso de cambiar a este estado
          APPEND VALUE #( %tky = <lfs_incident>-%tky ) TO failed-incidents.
          APPEND VALUE #( %tky = <lfs_incident>-%tky
                          %msg = NEW zcl_msg_rap_nc( textid   = zcl_msg_rap_nc=>error_Responsable
                                                     responsable =  CONV zed_responsable_nc( lv_current_user )
                                                     severity = if_abap_behv_message=>severity-error )
                          %op-%action-changestatus = if_abap_behv=>mk-on
               ) TO reported-incidents.

          lv_error = abap_true.
          EXIT.
        ENDIF.


      ELSEIF <lfs_incident>-Status = lc_status-pending.
        "----------------------------------------------------------------
        " 5. Si esta en estado PE, no se puede pasar a CO(Completed),
        "    CL -(Closed) , CN()Cancel
        "----------------------------------------------------------------
        IF ls_key-%param-New_Status = lc_status-canceled OR
           ls_key-%param-New_Status = lc_status-completed OR
           ls_key-%param-New_Status = lc_status-closed.

          APPEND VALUE #( %tky = <lfs_incident>-%tky ) TO failed-incidents.

          APPEND VALUE #( %tky = <lfs_incident>-%tky
                          %msg = NEW zcl_msg_rap_nc( textid   = zcl_msg_rap_nc=>error_status
                                                     severity = if_abap_behv_message=>severity-error )

                          %op-%action-changestatus = if_abap_behv=>mk-on
                         ) TO reported-incidents.


          lv_error = abap_true.
*         pasar al proximo registro si lo hubiera
          CONTINUE.
        ENDIF.
**   - si esta en CO,CL o CN, no se puede cambiar a ningun estado mas
        "esto no se da nunca porque se deshabilito el boton changestatus en esos estados
      ENDIF.


      CHECK lv_error = abap_false.

      "----------------------------------------------------------------
      " 6. Agrego a la tabla el incidente a actualizar
      "--------------------------------------------------------------
      APPEND VALUE #(  %tky = <lfs_incident>-%tky
                       Status = ls_key-%param-New_Status
                       ChangedDate = cl_abap_context_info=>get_system_date( )  ) TO lt_upd_inc.


      "----------------------------------------------------------------
      " 7. Calcular el próximo HisId para este incidente puntual
      "----------------------------------------------------------------
***   Recupero el proximo index de hisid para el incidente a tratar
***   Por cada registro busco el numero de hisid para el mismo incidente
      SELECT FROM zdt_inct_h_nc
      FIELDS  MAX( his_id )
      WHERE inc_uuid = @<lfs_incident>-IncUuid
      INTO @DATA(lv_last_hisid).

      IF lv_last_hisid = 0.
        lv_last_hisid = 1.
      ELSE.
        lv_last_hisid = lv_last_hisid + 1.
      ENDIF.

      "----------------------------------------------------------------
      " 8. Crear el registro de historial
      "----------------------------------------------------------------
      APPEND VALUE #( %tky = <lfs_incident>-%tky
                      %target = VALUE #( (  %cid           = |H_{ sy-tabix }|
                                            HisID          = lv_last_hisid
                                            PreviousStatus = <lfs_incident>-Status
                                            NewStatus      = ls_key-%param-New_Status
                                            Text           = ls_key-%param-description
                                            %control = VALUE #(
                                                                HisID = if_abap_behv=>mk-on
                                                                PreviousStatus = if_abap_behv=>mk-on
                                                                NewStatus = if_abap_behv=>mk-on
                                                                Text = if_abap_behv=>mk-on  )
                                         ) )

                       ) TO lt_new_history.

    ENDLOOP.

    CHECK NOT lt_upd_inc[] IS INITIAL.

**  Modifico los registros de incidentes
    MODIFY ENTITIES OF zi_inct_nc IN LOCAL MODE
    ENTITY Incidents
    UPDATE FIELDS ( Status ChangedDate )
    WITH lt_upd_inc.

*   " Crea el registro de historial
    MODIFY ENTITIES OF zi_inct_nc IN LOCAL MODE
    ENTITY Incidents
      CREATE BY \_History
      FIELDS ( HisID PreviousStatus NewStatus Text )
      AUTO FILL CID
    WITH lt_new_history
     REPORTED DATA(ls_reported)
     FAILED failed.

    "----------------------------------------------------------------
    " 9. Releer los incidentes actualizados para armar el result
    "----------------------------------------------------------------
**  leo los datos de los registros ya actualizados
    READ ENTITIES OF zi_inct_nc IN LOCAL MODE
    ENTITY Incidents
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(Incidents)
    FAILED failed.


    " Devolver el self (necesario por contrato de la acción)
    result = VALUE #( FOR incident IN Incidents ( %tky   = Incident-%tky
                                                  %param = Incident ) ).


  ENDMETHOD.

  METHOD SetInitIncident.

    "----------------------------------------------------------------
    " 1. Leer el indice maximo de Incident_ID
    "----------------------------------------------------------------
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

    "----------------------------------------------------------------
    " 1. Actualizo los  incidentes
    "----------------------------------------------------------------
    MODIFY ENTITIES OF zi_inct_nc IN LOCAL MODE
     ENTITY Incidents
       UPDATE FIELDS ( IncidentId Status CreatedDate ChangedDate )
       WITH VALUE #( FOR key IN keys
                      ( %tky         = key-%tky
                        IncidentId   = lv_new_id
                        Status       = lc_status-open
                        CreatedDate  = cl_abap_context_info=>get_system_date( )
                        ChangedDate  = cl_abap_context_info=>get_system_date( )
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
    ENDLOOP.

    MODIFY ENTITIES OF zi_inct_nc IN LOCAL MODE
      ENTITY Incidents
        CREATE BY \_History
        FIELDS ( HisId PreviousStatus NewStatus Text )
        AUTO FILL CID
        WITH lt_association_entity
       REPORTED DATA(ls_reported).

  ENDMETHOD.



  METHOD ValidateFuturedate.

**  leo los datos de los registros
    READ ENTITIES OF zi_inct_nc IN LOCAL MODE
     ENTITY Incidents
      FIELDS ( CreatedDate ChangedDate )
      WITH CORRESPONDING #( keys )
     RESULT DATA(data).
*
** Recorro los datos
    LOOP AT data INTO DATA(incident).

      IF incident-CreatedDate IS INITIAL.
*      si la fecha de creacion esta vacia
        APPEND VALUE #( %tky = incident-%tky ) TO failed-incidents.
        APPEND VALUE #( %tky = incident-%tky
                        %state_area = 'VALIDATE_DATES'
                        %msg = NEW zcl_msg_rap_nc( textid   = zcl_msg_rap_nc=>empty_creation_date
                                                  severity = if_abap_behv_message=>severity-error )
                        %element-CreatedDate = if_abap_behv=>mk-on

                       ) TO reported-incidents.

      ELSEIF incident-CreatedDate GT cl_abap_context_info=>get_system_date( ).
        " si a fecha de creacion es mayor que la fecha del dia

        APPEND VALUE #( %tky = incident-%tky ) TO failed-incidents.

        APPEND VALUE #( %tky = incident-%tky
                        %state_area = 'VALIDATE_DATES'
                        %msg = NEW zcl_msg_rap_nc( textid   = zcl_msg_rap_nc=>future_date
                                                   lv_datum = cl_abap_context_info=>get_system_date( )
                                                   severity = if_abap_behv_message=>severity-error
                                                 )
                         %element-CreatedDate = if_abap_behv=>mk-on

                        ) TO reported-incidents.

      ELSEIF incident-ChangedDate LT incident-CreatedDate.
        "la fecha de cambio debe ser mayor o igual a la fecha de creacion
        APPEND VALUE #( %tky = incident-%tky ) TO failed-incidents.

        APPEND VALUE #( %tky = incident-%tky
                        %state_area = 'VALIDATE_DATES'
                        %msg = NEW zcl_msg_rap_nc( textid   = zcl_msg_rap_nc=>error_changedate
                                                   severity = if_abap_behv_message=>severity-error )
                         %element-CreatedDate = if_abap_behv=>mk-on

                        ) TO reported-incidents.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD ValidatePriority.

***  leo los datos de los registros
    READ ENTITIES OF zi_inct_nc IN LOCAL MODE
    ENTITY Incidents
    FIELDS (  Priority )
    WITH CORRESPONDING #( keys )
    RESULT DATA(incidents).

    LOOP AT incidents INTO DATA(incident).

      IF incident-Priority IS INITIAL.
        " si el campo esta vacio
        APPEND VALUE #( %tky = incident-%tky ) TO failed-incidents.

        APPEND VALUE #( %tky = incident-%tky
                        %state_area = 'VALIDATE_PRIORITY'
                        %msg = NEW zcl_msg_rap_nc( textid   = zcl_msg_rap_nc=>empty_Priority
                                                   severity = if_abap_behv_message=>severity-error )
                        %element-priority = if_abap_behv=>mk-on
                      ) TO reported-incidents.

      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD validateemptyfields.

***  leo los datos de los registros
    READ ENTITIES OF zi_inct_nc IN LOCAL MODE
    ENTITY Incidents
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(incidents).


    LOOP AT incidents INTO DATA(incident).

      IF incident-Title IS INITIAL .
        "si el campo title esta vacio
        APPEND VALUE #( %tky = incident-%tky ) TO failed-incidents.

        APPEND VALUE #( %tky = incident-%tky
                        %state_area = 'VALIDATE_EMPTY_FIELD'
                        %msg = NEW zcl_msg_rap_nc( textid   = zcl_msg_rap_nc=>empty_title
                                                   severity = if_abap_behv_message=>severity-error )
                         %element-title = if_abap_behv=>mk-on

                        ) TO reported-incidents.
      ENDIF.

      IF incident-Description IS INITIAL.

        " si el campo descripcion esta vacio
        APPEND VALUE #( %tky = incident-%tky ) TO failed-incidents.

        APPEND VALUE #(  %tky = incident-%tky
                         %state_area = 'VALIDATE_EMPTY_FIELD'
                         %msg = NEW zcl_msg_rap_nc( textid   = zcl_msg_rap_nc=>empty_Desc
                                                    severity = if_abap_behv_message=>severity-error )

                         %element-Description = if_abap_behv=>mk-on

                       ) TO reported-incidents.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
