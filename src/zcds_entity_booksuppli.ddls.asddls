@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VIEW FOR BOOKING SUPPLIMENT'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcds_entity_booksuppli as select from /DMO/I_BookSuppl_M
association to parent zcds_entity_booking as _booking on $projection.booking_id = _booking.BookingId 
                                                        and $projection.travel_id = _booking.TravelId
association [1..1] to  zcds_entity_srs_45 as _travel on $projection.travel_id = _travel.TravelId
association [1..1] to /DMO/I_Supplement as _suppliment on $projection.supplement_id = _suppliment.SupplementID
association [1..1] to /DMO/I_SupplementText as _suppletext on $projection.supplement_id = _suppletext.SupplementID 

{
    key travel_id,
    key booking_id,
    key booking_supplement_id,
    supplement_id,
    @Semantics.amount.currencyCode: 'currency_code'
    price,
    currency_code,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,
    /* Associations */
    _booking,
    _Product,
    _SupplementText,
    _travel,
    _suppliment ,
     _suppletext
}
