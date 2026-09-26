@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Priority - Value Help'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_PRIORITY_VH_NC as select from zdt_priority_nc
{
    key priority_code as PriorityCode,
    priority_description as PriorityText
}
