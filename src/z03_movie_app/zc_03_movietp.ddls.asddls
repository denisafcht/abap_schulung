@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_03_MovieTP
  provider contract transactional_query
  as projection on ZR_03_MovieTP

{
  key MovieUUId,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_03_GenreVH', element: 'Genre' } } ]
      @ObjectModel.text.element: [ 'GenreText' ]
      Genre,

      PublishingYear,
      RuntimeInMin,
      ImageUrl,

      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /* Transient Data */
      _AverageRating.AverageRating            as AverageRating,
      _AverageRating.AverageRatingCriticality as AverageRatingCriticality,
      _GenreText.GenreText                    as GenreText,
      _Ratings : redirected to composition child ZC_03_RatingTP
}
