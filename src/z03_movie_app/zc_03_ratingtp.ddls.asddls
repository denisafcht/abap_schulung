@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Rating'

@Metadata.allowExtensions: true
define view entity ZC_03_RatingTP
  as projection on ZR_03_RatingTP

{
  key RatingUUID,

      MovieUUID,
      UserName,
      Rating,
      RatingDate,

      /* Associations */
      _Movie   : redirected to parent ZC_03_MovieTP
}
