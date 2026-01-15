CLASS zcl_03_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_abap_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        data(customer) = zcl_abap_helper=>get_customer( '400' ).
      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.
    out->write( |{ 'Customer ID: ' WIDTH = 15 } { customer-customer_id WIDTH = 15 } | ).
    out->write( |{ 'First Name: ' WIDTH = 15 } { customer-first_name WIDTH = 15 } | ).
    out->write( |{ 'Last Name: ' WIDTH = 15 } { customer-last_name WIDTH = 15 } | ).
    out->write( |{ 'City: ' WIDTH = 15 } { customer-city WIDTH = 15 } | ).
    out->write( |{ 'Country Code: ' WIDTH = 15 } { customer-country_code WIDTH = 15 } | ).

  ENDMETHOD.
ENDCLASS.
