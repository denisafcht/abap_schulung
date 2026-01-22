@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

define root view entity ZR_03_MovieTP
  as select from ZI_03_MOVIE
  
  composition [0..*] of ZR_03_RatingTP as _Ratings

{
  key MovieUUId,

      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      _Ratings
}
