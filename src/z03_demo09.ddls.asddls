@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 9: Path Expressions'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z03_DEMO09
  as select from Z03_DEMO08

{
  key CarrierId,
  key ConnectionId,

      AirportFromId,
      AirportToId,
      _Carrier.name  as Name,

      /* Associations */
      _Carrier,
      _Flights
}
