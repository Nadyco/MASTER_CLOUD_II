@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'History - Entity Projection view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_INCT_H_NC
//  provider contract transactional_query
  as projection on ZI_INCT_H_NC
{
    key HisUuid,
    key IncUuid,
    HisId,
    PreviousStatus,
    NewStatus,
    Text,
    @Semantics.user.createdBy: true
    LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    LocalCreatedAt,
    @Semantics.user.localInstanceLastChangedBy: true
    LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    LastChangedAt,
    /* Associations */
    // Redirigimos la asociación al padre para que apunte a la PROJECTION del padre, no a la interface
    _incident : redirected to parent ZC_INCT_NC
}
