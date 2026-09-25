@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer - Consumo/Proyeccion Entity'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity Z_C_CUSTOMER_TRAVEL_NC
  provider contract transactional_query as projection on Z_R_CUSTOMER_TRAVEL_NC
{
    key CustomerUuid,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @Search.ranking: #HIGH
    @ObjectModel.text.element: [ 'LastName' ]
    CustomerId,
    _customer.LastName as Lastname,
    
    _customer.CountryCode  as country_code,
    _customer._Country._Text.CountryName  as Countryname: localized,
        Description,
//    LocalCreatedBy,
//    LocalCreatedAt,
//    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _customer
}
