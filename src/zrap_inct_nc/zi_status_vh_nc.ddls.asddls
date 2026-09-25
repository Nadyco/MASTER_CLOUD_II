@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Value Help'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_STATUS_VH_NC 
as select from zdt_status_nc
{
    key status_code as StatusCode,
    status_description as StatusText
}
