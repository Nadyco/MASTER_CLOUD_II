@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Asociación - Parent Child'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_CUST_BOOK_NNC
  as select from /dmo/booking
  association to parent ZCDS_CUSTOMER_ROOT_NNC as _customer 
  on _customer.CustomerId = $projection.CustomerId
    
{

  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      _customer

}
