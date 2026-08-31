@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lab - CDS - Modelado de datos'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZUNIT_CONVERSION_USER
  as select from /dmo/fsa_root_a
{
  key id                                as Id,
      string_property                   as StringProperty,
    
      @Semantics.quantity.unitOfMeasure: 'Uom'
      field_with_quantity               as FieldWithQuantity,
      uom                               as Uom,
      
      @Semantics.quantity.unitOfMeasure: 'Uomconv'
      unit_conversion( quantity => field_with_quantity,
      source_unit => uom ,
      target_unit => abap.unit'W',
      client => $session.client,
      error_handling => 'SET_TO_NULL' ) as Quantity_uom,
      cast('W' as abap.unit)            as Uomconv
}
//where uom = 'A';
