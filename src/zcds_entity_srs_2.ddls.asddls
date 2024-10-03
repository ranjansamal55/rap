@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'test'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcds_entity_srs_2
  as select from /dmo/a_travel_d
{

  key travel_id,
      customer_id,
      currency_code
}
//except
//intersect
//union 
union   all

select from /dmo/a_travel_d
{
  key travel_id,
      customer_id,
      currency_code
}
where
  currency_code = 'USD'
