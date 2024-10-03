@EndUserText.label: 'projection view of zcd_entity_srs_45'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define  root view entity zpv_zcd_entity_srs_45 as projection on zcds_entity_srs_45
{

 @ObjectModel.text.element: [ 'Description' ]
    key TravelId,
    @ObjectModel.text.element: [ 'Agency_Name' ]
    @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Agency' , entity.element: 'AgencyId' }]
    AgencyId,
    @Semantics.text: true
    _agency.Name  as Agency_Name,
    @ObjectModel.text.element: [ 'Customer_Name' ]
     @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Customer' , entity.element: 'CustomerId' }]
    CustomerId,
    @Semantics.text: true
    _customer.FirstName as Customer_Name,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
     @Semantics.text: true
    Description,
    @ObjectModel.text.element: [ 'status_text' ]
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    @Semantics.text: true
    status_text,
    criticality,
    /* Associations */
    _agency,
    _booking:redirected to composition child zpv_ZCDS_ENTITY_BOOKING,
    _currency,
    _customer,
    _overallstatus
    
    
}
