@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Modelado de datos'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDATA_MODELING_USER
  as select from /dmo/customer
{
  key customer_id                      as customerid,
      first_name                       as firstname,
      last_name                        as lastname,
      $session.system_date             as fecha_sys,
      $session.client                  as cliente,
      $session.user                    as CUSTOMER_ID_USER,
      cast( customer_id as abap.int8 ) as CUSTID_conv,
      
      case country_code
      when 'US' then 'United States'
      when 'DE' then 'Germany'
      else 'Other Country'
      end                              as country
}
