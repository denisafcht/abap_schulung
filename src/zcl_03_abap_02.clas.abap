CLASS zcl_03_abap_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_abap_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA customer_id TYPE /dmo/customer-customer_id.
    DATA first_name TYPE /dmo/customer-first_name.
    DATA last_name TYPE /dmo/customer-last_name.
    DATA city TYPE /dmo/customer-city.
    DATA country TYPE /dmo/customer-country_code.

    customer_id = '19286'.
    first_name = 'Bruce'.
    last_name = 'Wayne'.
    city = 'Gotham'.
    country = 'US'.
    DATA(fullname) = |{ first_name } { last_name }|.
    out->write( condense( |{ customer_id ALPHA = OUT }| ) && |, { fullname }, { city } ({ country })| ).

  ENDMETHOD.
ENDCLASS.
