@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'History - Entity Projection view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_INCT_H_NC
  provider contract transactional_query 
  as projection on ZI_INCT_H_NC
{
    key HisUuid,
    key IncUuid,
    HisId,
    PreviousStatus,
    NewStatus,
    Text,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _incident
}
