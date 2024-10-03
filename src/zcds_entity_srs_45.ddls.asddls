@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'test view'
define root view entity zcds_entity_srs_45
  as select from /dmo/travel_m as travel
  composition [0..*] of zcds_entity_booking      as _booking
  association [1]    to /DMO/I_Agency               as _agency     on $projection.AgencyId = _agency.AgencyID
  association [1]    to /DMO/I_Customer             as _customer   on $projection.CustomerId = _customer.CustomerID
  association [1]    to I_Currency                  as _currency   on $projection.CurrencyCode = _currency.Currency
  association [1..1] to /DMO/I_Overall_Status_VH as _overallstatus on $projection.OverallStatus = _overallstatus.OverallStatus
{

      //    _association_name // Make association public


  key travel_id       as TravelId,
      agency_id       as AgencyId,

      customer_id     as CustomerId,

      begin_date      as BeginDate,
      end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price     as TotalPrice,
      currency_code   as CurrencyCode,
      description     as Description,
      overall_status  as OverallStatus,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      case overall_status
      when 'O' then 'Open'
      when 'A'  then 'Approve'
      when 'R' then 'Reject'
      when 'X' then 'Cancel'
      end             as status_text,


      case  overall_status
      when 'O' then '2'
      when 'A'  then '3'
      when 'R' then '1'
      when 'X' then '1'
      end             as criticality,

      //expose the association
      _agency,
      _customer,
      _currency,
      _overallstatus,
      _booking

}
