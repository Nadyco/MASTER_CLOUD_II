@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Asociaciones y Expresiones'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_PATH_EXPRESS_USER_815
  as select from /dmo/booking

  association [0..*] to /dmo/flight as _flight on _flight.connection_id = $projection.BookingId
{
  key travel_id              as TravelId,
  key booking_id             as BookingId,
      _flight[connection_id = '0001'].seats_occupied as SEATS_OCCUPIED

}
