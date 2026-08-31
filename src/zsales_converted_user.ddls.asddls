@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Modelado de datos'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSALES_CONVERTED_USER
  as select from /dmo/booking
{
  key travel_id                as TravelId,
  key booking_id               as BookingId,
      customer_id              as CustomerId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price             as flightprice,
      currency_code            as CurrencyCode,

      @Semantics.amount.currencyCode: 'currencycodeconv'
      currency_conversion(    amount => flight_price,
                              source_currency => currency_code,
                              target_currency => cast('USD' as abap.cuky),
                              exchange_rate_date => booking_date,
                              client =>$session.client,
                              error_handling => 'SET_TO_NULL'
                          )    as flightPRICE_USD,

      cast('USD' as abap.cuky) as currencycodeconv
}
