@EndUserText.label: 'projection view of ZCDS_ENTITY_BOOKING'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity zpv_ZCDS_ENTITY_BOOKING as projection on zcds_entity_booking

{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _bookingstatus,
    _bookingsup: redirected to composition child zpv_ZCDS_ENTITY_BOOKSUPPLI ,
    _carrier,
    _connection,
    _customer,
    _travel : redirected to parent zpv_zcd_entity_srs_45
    
    
}
