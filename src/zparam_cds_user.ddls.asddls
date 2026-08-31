@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Modelado de datos'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPARAM_CDS_USER
  with parameters
    pflight_date : abap.dats
  as select from /dmo/booking
{
  key travel_id   as TravelId,
  key booking_id  as BookingId,
      customer_id as CustomerId,
      flight_date as FlightDate

}
where
  flight_date = $parameters.pflight_date;
