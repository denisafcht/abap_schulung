@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

define root view entity ZR_03_TravelTP
  as select from ZI_03_TRAVEL
  
  association [1..1] to ZI_03_CustomerText as _CustomerText on $projection.CustomerId = _CustomerText.CustomerId

  composition [0..*] of ZR_03_BookingTP as _Bookings

{
  key TravelId,

      AgencyId,
      
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Transient Data */
      case Status  when 'X' then 1
                   when 'P' then 2
                   when 'B' then 3
                   else 0
                   end as StatusCriticality,
                   
      _CustomerText.CustomerName as CustomerName,
      /* Associations */
      _Bookings
}
