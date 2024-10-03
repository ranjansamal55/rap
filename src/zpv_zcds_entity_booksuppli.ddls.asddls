@EndUserText.label: 'projection view of ZCDS_ENTITY_BOOKSUPPLI'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity zpv_ZCDS_ENTITY_BOOKSUPPLI
  as projection on zcds_entity_booksuppli
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      price,
      currency_code,
      last_changed_at,
      /* Associations */
      _booking : redirected to parent zpv_ZCDS_ENTITY_BOOKING,
      _Product,
      _SupplementText,
      _suppletext,
      _suppliment,
      _travel  : redirected to zpv_zcd_entity_srs_45
}
