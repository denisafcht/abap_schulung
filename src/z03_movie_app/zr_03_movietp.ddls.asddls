@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] } */
define root view entity ZR_03_MovieTP
  as select from ZI_03_MOVIE

  association [0..1] to ZI_03_GenreText     as _GenreText     on $projection.Genre = _GenreText.Genre
  association [1..1] to ZI_03_AverageRating as _AverageRating on $projection.MovieUUId = _AverageRating.MovieUuid
  composition [0..*] of ZR_03_RatingTP      as _Ratings

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


      _GenreText,
      _Ratings,
      _AverageRating
}
