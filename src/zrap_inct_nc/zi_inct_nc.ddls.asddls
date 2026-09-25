@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_INCT_NC
  as select from zdt_inct_nc 
   composition [0..*] of ZI_INCT_H_NC as _History
   
   association [1..1] to ZI_STATUS_VH_NC as _Status    on _Status.StatusCode = $projection.Status
  
{
  key inc_uuid                                             as IncUuid,
      incident_id                                          as IncidentId,
      title                                                as Title,
      description                                          as Description,   
      status                                               as Status, 
      cast ( priority as zed_priority_nc preserving type ) as Priority,      
      created_date                                         as CreatedDate,
      changed_date                                         as ChangedDate,
      @Semantics.user.createdBy: true
      local_created_by                                     as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at                                     as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by                                as LocalLastChangedBy,
      
      //Local Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true   
      local_last_changed_at                                as LocalLastChangedAt,
      //Total ETAG
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                                      as LastChangedAt,
      _Status,
      _History // Make association public
}
