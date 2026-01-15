CLASS zcl_03_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_abap_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.
        data(d) = zcl_03_helper=>get_travels( '200' ).
      CATCH zcx_abap_no_data.
    ENDTRY.

    DELETE d WHERE begin_date < sy-datum.

    FIELD-SYMBOLS <a> TYPE /dmo/travel.
    LOOP AT d ASSIGNING <a>. " LOOP AT connections into DATA(connection2).
      <a>-booking_fee = <a>-booking_fee * 110 / 100 .
    ENDLOOP.

    SORT d BY description DESCENDING.

    out->write( d ).

  ENDMETHOD.
ENDCLASS.
