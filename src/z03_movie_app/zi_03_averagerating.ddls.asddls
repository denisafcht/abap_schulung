@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text Element for AverageRating'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_03_AverageRating as select from zabap_rating_a
 
{
  movie_uuid as MovieUuid,
  @EndUserText.label: 'Average Rating'
  @EndUserText.quickInfo: 'Average Rating'
  avg(rating as abap.dec(14, 1)) as AverageRating,
  case when avg(rating as abap.dec(14, 1)) > 6.7 then 3
                   when avg(rating as abap.dec(14, 1)) >  3.4 then 2
                   when avg(rating as abap.dec(14, 1)) > 0 then 1
                   else 0
                   end as AverageRatingCriticality
}
group by
  movie_uuid

