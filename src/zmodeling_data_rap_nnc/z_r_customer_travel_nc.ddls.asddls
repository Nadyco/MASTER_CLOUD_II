@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_R_CUSTOMER_TRAVEL_NC as select from zcustomers_nc

 association [0..1] to /DMO/I_Customer as _customer on _customer.CustomerID =  $projection.CustomerId
{
    key customer_uuid as CustomerUuid,
    customer_id as CustomerId,
    description as Description,
    
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    
    @Semantics.user.localInstanceLastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    
    //Local Etag
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    
    //Total Etag
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    
    //Asociaciones 
    _customer // Make association public
}
