@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'History - Entity view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_INCT_H_NC
  as select from zdt_inct_h_nc
  association to parent ZI_INCT_NC as _incident 
  on _incident.IncUuid = $projection.IncUuid
{
  key his_uuid              as HisUuid,
  key inc_uuid              as IncUuid,
      his_id                as HisId,
      previous_status       as PreviousStatus,
      new_status           as NewStatus,
      text                  as Text,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      _incident // Make association public
}
