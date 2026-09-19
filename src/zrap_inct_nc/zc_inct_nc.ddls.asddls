@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident -  proyección Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_INCT_NC
  provider contract transactional_query
  as projection on ZI_INCT_NC
{
  key IncUuid,
      IncidentId,
      Title,
      Description,
      Status,
      Priority,
      CreatedDate,
      ChangedDate,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _History
}
