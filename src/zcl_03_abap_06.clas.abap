CLASS zcl_03_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_abap_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.
        data(d) = zcl_AA_03_helper=>get_travel_with_customer( '200' ).
      CATCH zcx_abap_no_data.
        "handle exception
    ENDTRY.
    out->write( |Travel ID: { d-travel_id }| ).
    out->write( |Start: { d-begin_date DATE = USER }| ).
    out->write( |End: { d-end_date DATE = USER }| ).
    out->write( |Description: { d-description }| ).
    out->write( |Customer Id: { d-customer_id }| ).
    out->write( |Name: { d-first_name } { d-last_name }| ).
    out->write( |City: { d-city }| ).
    out->write( |Country: { d-country_code }| ).

  ENDMETHOD.
ENDCLASS.
