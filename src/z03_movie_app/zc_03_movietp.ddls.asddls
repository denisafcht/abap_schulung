@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_03_MovieTP
  as projection on ZR_03_MovieTP

{
  key MovieUUId,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,

      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      _Ratings : redirected to composition child ZC_03_RatingTP
}
