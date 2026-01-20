@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aufgabe 3 Travel with Customer'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z03_TravelWithCustomer as select from Z03_Customer as c
inner join Z03_Travel as t on c.CustomerId = t.CustomerId
{
  key t.TravelId,
  t.AgencyId,
  t.BeginDate,
  t.EndDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  t.BookingFee,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  t.TotalPrice,
  t.CurrencyCode,
  t.Description,
  t.Status,
  c.CustomerId,
  c.FirstName,
  c.LastName,
  c.Title,
  c.Street,
  c.PostalCode,
  c.City
}
where c.CountryCode = 'DE'
