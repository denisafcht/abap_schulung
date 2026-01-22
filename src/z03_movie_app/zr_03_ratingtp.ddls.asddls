@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'


define view entity ZR_03_RatingTP
  as select from ZI_03_Rating
association to parent ZR_03_MovieTP as _Movie
  on $projection.MovieUUID = _Movie.MovieUUId
{
  key RatingUUID,
  MovieUUID,
  UserName,
  Rating,
  RatingDate,
  _Movie // Make association public
}
