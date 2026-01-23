@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking'

define view entity ZR_03_BookingTP
  as select from ZI_03_Booking

  association to parent ZR_03_TravelTP as _Travel on $projection.TravelId = _Travel.TravelId

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

      _Travel // Make association public
}
