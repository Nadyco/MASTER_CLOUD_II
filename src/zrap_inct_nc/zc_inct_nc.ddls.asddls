@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident -  proyección Entity'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_INCT_NC
  provider contract transactional_query
  as projection on ZI_INCT_NC
{
      @Search.ranking: #HIGH
  key IncUuid,

      @Search.ranking: #MEDIUM
      @Search.fuzzinessThreshold: 0.8
      @Search.defaultSearchElement: true
      IncidentId,

      @Search.ranking: #HIGH
      @Search.fuzzinessThreshold: 0.8
      @Search.defaultSearchElement: true
      Title,

      @Search.ranking: #HIGH
      @Search.fuzzinessThreshold: 0.8
      @Search.defaultSearchElement: true
      Description,

      @Search.defaultSearchElement: true
      @Search.ranking: #MEDIUM
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.text.element: [ 'StatusText' ]
      Status,
      _Status.StatusText     as StatusText,

      @Search.defaultSearchElement: true
      @Search.ranking: #MEDIUM
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.text.element: [ 'PriorityText' ]
      Priority,
      _priority.PriorityText as PriorityText,

      @Search.ranking: #HIGH
      @Search.fuzzinessThreshold: 0.8
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Create Date'
      CreatedDate,

      @Search.ranking: #HIGH
      @Search.fuzzinessThreshold: 0.8
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Change Date'
      ChangedDate,


      @Search.ranking: #HIGH
      @Semantics.user.createdBy: true
      LocalCreatedBy,

      @Search.ranking: #HIGH
      @Semantics.systemDateTime.createdAt: true
      LocalCreatedAt,

      @Search.ranking: #HIGH
      @Semantics.user.localInstanceLastChangedBy: true
      locallastchangedby,

      @Search.ranking: #HIGH
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      locallastchangedat,

      @Search.ranking: #HIGH
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat,


      /* Associations */
      _History : redirected to composition child ZC_INCT_H_NC,
      _Status,
      _priority
}
