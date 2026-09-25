@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident -  proyección Entity'
@Metadata.ignorePropagatedAnnotations: true
//@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_INCT_NC
  provider contract transactional_query
  as projection on ZI_INCT_NC
{
  key IncUuid,
      IncidentId,
      Title,
      Description,
      
      @Search.ranking: #HIGH
      @Search.fuzzinessThreshold: 0.8
      @Search.defaultSearchElement: true    
      
      @ObjectModel.text.element: ['StatusText']
      Status,
      @Semantics.text: true
      _Status.StatusText as StatusText,
      
      Priority,
      CreatedDate,
      ChangedDate,
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
      _Status,
      _History : redirected to composition child ZC_INCT_H_NC
}
