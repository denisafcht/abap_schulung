@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'ABAP CDS 5'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z03_CustomerKPIs
with parameters
  P_City : /dmo/city
  as select from Z03_TravelWithCustomer

{
  CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,

  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum(TotalPrice) + sum(BookingFee) as TotalRevenue,

  CurrencyCode,

  avg(Duration as abap.dec(16,2))   as AverageDuration,
  count(distinct AgencyId)          as NumberOfDifferentAgencys
}
where City = $parameters.P_City
group by CustomerId,
         CustomerName,
         Street,
         PostalCode,
         City,
         CurrencyCode

having sum(TotalPrice + BookingFee) >= 5000
