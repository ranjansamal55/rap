@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking cds entity'
define  view entity zcds_entity_booking
  as select from /dmo/booking_m
  //composition of target_data_source_name as _association_name
  composition [0..*] of  zcds_entity_booksuppli as _bookingsup
  association to parent zcds_entity_srs_45 as _travel on $projection.TravelId =  _travel.TravelId
  association [1..1] to /DMO/I_Customer          as _customer      on  $projection.CustomerId = /dmo/booking_m.customer_id
  association [1..1] to /DMO/I_Carrier           as _carrier       on  $projection.CarrierId = _carrier.AirlineID
  association [1..1] to /DMO/I_Connection        as _connection    on  $projection.CarrierId    = _connection.AirlineID
                                                                   and $projection.ConnectionId = _connection.ConnectionID
  association [1..1] to /DMO/I_Booking_Status_VH as _bookingstatus on  $projection.BookingStatus = _bookingstatus.BookingStatus
{

      //    _association_name // Make association public
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      // expose
      _customer,
      _carrier,
      _connection,
      _bookingstatus,
      _travel,
      _bookingsup
}
