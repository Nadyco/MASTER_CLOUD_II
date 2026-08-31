@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Modelado de datos'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDATA_AGGREGATION_USER
  as select from /dmo/booking
{
  key  customer_id         as CustomerId,
       @Semantics.amount.currencyCode: 'CurrencyCode'
       sum( flight_price ) as sum_price,
       currency_code       as CurrencyCode
}
group by
  customer_id,
  currency_code;
