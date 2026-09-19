@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Asociaciones y Expresiones'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_PUBLIC_ASSOC_USER_815
  as select from /dmo/travel as travel

//  association [1..1] to ZCDS_AGENCY_MAX as _agencymx on _agencymx.AgencyID = $projection.AgencyId

{
  key travel.travel_id as TravelId,
      travel.agency_id as AgencyId
//      _agencymx

}
