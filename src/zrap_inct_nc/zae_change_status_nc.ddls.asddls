@EndUserText.label: 'Change Status'
define abstract entity ZAE_CHANGE_STATUS_NC
{
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_STATUS_VH_NC',
                                                 element: 'StatusCode'
                                                },

                                        useForValidation: true
                                   }]
  @EndUserText.label: 'New Status'
  new_status  : zed_status_nc;
  @EndUserText.label: 'Description'
  description : abap.char(80);

}
