@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Asociaciones y Expresiones'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_EXPLICIT_JOIN_USER_815
  as select from /dmo/customer as customer

  association [0..*] to /dmo/booking as _booking on _booking.customer_id = $projection.CustomerId
{
  key customer_id                  as CustomerId,
      first_name                   as FirstName,
      last_name                    as LastName,
      _booking[inner].booking_date as bookingdate

}
