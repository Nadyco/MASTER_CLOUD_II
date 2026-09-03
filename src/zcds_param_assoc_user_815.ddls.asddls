@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Asociaciones y Expresiones'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_PARAM_ASSOC_USER_815
  with parameters
    p_carrierid : /dmo/carrier_id
  as select from /dmo/flight as flight

  association [0..1] to /dmo/carrier as _carrier on _carrier.carrier_id = flight.carrier_id
{
  key flight.carrier_id    as carrierid,
      flight.connection_id as CONNECTIONID,
      flight.flight_date   as FLIGHTDATE,
      _carrier.name        as name
}
