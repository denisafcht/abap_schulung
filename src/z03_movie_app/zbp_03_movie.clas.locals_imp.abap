CLASS lhc_rating DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS DetermineRatingDate FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineRatingDate.

    METHODS DetermineUserName FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineUserName.

ENDCLASS.

CLASS lhc_rating IMPLEMENTATION.

  METHOD DetermineRatingDate.
     DATA ratings type table for update zr_03_ratingtp.

    LOOP AT keys into data(key).
      APPEND VALUE #( %tky = key-%tky RatingDate = sy-datlo ) to ratings.
    ENDLOOP.

    MODIFY ENTITIES OF zr_03_movietp in local mode
      entity rating
      update
      fields ( RatingDate )
      with ratings.
  ENDMETHOD.

  METHOD DetermineUserName.
    DATA ratings type table for update zr_03_ratingtp.

    LOOP AT keys into data(key).
      APPEND VALUE #( %tky = key-%tky UserName = sy-uname ) to ratings.
    ENDLOOP.

    MODIFY ENTITIES OF zr_03_movietp in local mode
      entity rating
      update
      fields ( Username )
      with ratings.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS ValidateGenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~ValidateGenre.
    METHODS RateMovie FOR MODIFY
      IMPORTING keys FOR ACTION Movie~RateMovie. "RESULT result.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidateGenre.
    DATA movies TYPE TABLE FOR READ RESULT zr_03_MovieTP.

    READ ENTITIES OF zr_03_movietp IN LOCAL MODE
         ENTITY Movie
         FIELDS ( Genre )
         WITH CORRESPONDING #( keys )
         RESULT Movies.
    LOOP AT movies INTO DATA(movie).

      " Validate Customer and Create Error Message "
      SELECT SINGLE FROM ddcds_customer_domain_value( p_domain_name = 'ZABAP_GENRE' )
        FIELDS @abap_true
        WHERE value_low = @movie-Genre
        INTO @DATA(exists).
      IF exists = abap_false.
        APPEND VALUE #( %tky = movie-%tky ) TO failed-movie.
        DATA(message) = NEW zcm_abap_movie( textid   = zcm_abap_movie=>no_genre_found
                                            genre    = movie-Genre
                                            severity = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky           = movie-%tky
                        %msg           = message
                        %element-Genre = if_abap_behv=>mk-on ) TO reported-movie.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD RateMovie.
    DATA ratings TYPE TABLE FOR CREATE zr_03_movietp\_RatingS.

    DATA(valid_keys) = keys.

    " Process Movie-Keys "
    LOOP AT keys INTO DATA(key).
      " Validate Rating
      IF key-%param-Rating < 1 OR key-%param-Rating > 10.
        " Create Error Message
        DATA(message) = NEW zcm_abap_movie( textid   = zcm_abap_movie=>invalid_rating
                                            rating   = key-%param-Rating
                                            severity = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky              = key-%tky
                        %msg              = message
                        %action-RateMovie = if_abap_behv=>mk-on ) TO reported-movie.
        APPEND VALUE #( %tky = key-%tky ) TO failed-movie.
        DELETE valid_keys WHERE %tky = key-%tky.
      ENDIF.
    ENDLOOP.
    " Check Movie-Keys
    IF valid_keys IS INITIAL.
      RETURN.
    ENDIF.

    LOOP AT valid_keys INTO key.
      APPEND VALUE #( %tky    = key-%key
                      %target = VALUE #( ( Rating = key-%param-Rating ) ) ) TO ratings.
    ENDLOOP.

    MODIFY ENTITIES OF ZR_03_MovieTP IN LOCAL MODE
           ENTITY Movie
           CREATE BY \_RatingS
           AUTO FILL CID
           FIELDS ( Rating )
           WITH ratings.
  ENDMETHOD.

ENDCLASS.
