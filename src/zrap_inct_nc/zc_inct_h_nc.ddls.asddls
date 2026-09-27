@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'History - Entity Projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_INCT_H_NC
  as projection on ZI_INCT_H_NC
{
  key HisUuid,
  key IncUuid,
      HisId,

      @EndUserText.label: 'Previous Status'
      PreviousStatus,
      @EndUserText.label: 'New Status'
      NewStatus,
      @EndUserText.label: 'Description'
      Text,

      @Semantics.user.createdBy: true
      @Consumption.filter.hidden: true
      LocalCreatedBy,

      @Semantics.systemDateTime.createdAt: true
      @Consumption.filter.hidden: true
      LocalCreatedAt,

      @Semantics.user.localInstanceLastChangedBy: true
      @Consumption.filter.hidden: true
      LocalLastChangedBy,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      @Consumption.filter.hidden: true
      LocalLastChangedAt,

      @Semantics.systemDateTime.lastChangedAt: true
      @Consumption.filter.hidden: true
      LastChangedAt,

      /* Associations */
      // Redirigimos la asociación al padre para que apunte a la PROJECTION del padre, no a la interface
      _incident : redirected to parent ZC_INCT_NC
}
