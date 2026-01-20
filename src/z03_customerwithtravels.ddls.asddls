@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Aufgabe 7 CDS'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z03_CustomerWithTravels
  as select from Z03_Customer

  association [0..*] to Z03_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId

{
  key CustomerId,

      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,
      /* Associations */

      _Travels
}

where CountryCode = 'DE'
