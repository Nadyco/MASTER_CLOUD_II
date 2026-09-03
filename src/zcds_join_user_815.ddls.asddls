@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Asociaciones y Expresiones'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_JOIN_USER_815
  as select from /dmo/booking as booking
    inner join   /dmo/flight  as flight 
    on flight.carrier_id = booking.carrier_id
    
{
  key booking.booking_id   as bookingid,
      flight.flight_date   as flight_date,
      @Semantics.amount.currencyCode: 'currencycode'
      flight.price         as price,
      flight.currency_code as currencycode
}
