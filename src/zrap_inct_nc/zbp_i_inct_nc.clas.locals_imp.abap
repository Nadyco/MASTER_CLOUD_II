CLASS lhc_Incidents DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

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

    METHODS Createfirstinsident FOR DETERMINE ON SAVE
       keys FOR Incidents~Createfirstinsident.

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
  ENDMETHOD.

  METHOD SetInitIncident.
  ENDMETHOD.

  METHOD Createfirstinsident.
  ENDMETHOD.

  METHOD ValidateFuturedate.
  ENDMETHOD.

  METHOD ValidateStatus.
  ENDMETHOD.

ENDCLASS.
