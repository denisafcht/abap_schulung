CLASS zcl_03_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS get_travel_with_customer
      IMPORTING travel_id                   TYPE /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer
      RAISING   zcx_abap_no_data.

    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z03_travels
      RAISING   zcx_abap_no_data.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_helper IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.

  METHOD get_travel_with_customer.
      " Möglichkeit 1
*      SELECT SINGLE from /DMO/TRAVEL
*      FIELDS *
*      WHERE travel_id = @travel_id
*      INTO @DATA(travel).
*      IF sy-subrc <> 0.
*        RAISE EXCEPTION NEW zcx_abap_no_data( field = 'travel_id'
*                                              table = '/dmo/travel'
*                                              value = CONV #( travel_id ) ).
*      ENDIF.
*
*      SELECT SINGLE from /DMO/CUSTOMER
*      FIELDS *
*      WHERE customer_id = @travel-customer_id
*      INTO @DATA(customer).
*      IF sy-subrc <> 0.
*        RAISE EXCEPTION NEW zcx_abap_no_data( field = 'customer_id'
*                                              table = '/dmo/customer'
*                                              value = CONV #( travel-customer_id ) ).
*      ENDIF.
*      travel_with_customer = CORRESPONDING #( travel ).
*      travel_with_customer = CORRESPONDING #( BASE ( travel_with_customer ) customer ).

      " Möglichkeit 2

      SELECT SINGLE from /DMO/TRAVEL
        inner join /dmo/customer on /dmo/travel~customer_id = /dmo/customer~customer_id
      FIELDS *
      WHERE travel_id = @travel_id
      INTO CORRESPONDING FIELDS OF @travel_with_customer.
      IF sy-subrc <> 0.
        RAISE EXCEPTION NEW zcx_abap_no_data( field = 'travel_id'
                                              table = '/dmo/travel'
                                              value = CONV #( travel_id ) ).
      ENDIF.



*    DATA(travel) = zcl_abap_helper=>get_travel( travel_id ).
*    DATA(customer) = zcl_abap_helper=>get_customer( travel-customer_id ).
*    travel_with_customer = CORRESPONDING #( travel ).
*    travel_with_customer = CORRESPONDING #( BASE ( travel_with_customer ) customer ).

  ENDMETHOD.

  METHOD get_travels.
    SELECT FROM /dmo/travel
      FIELDS *
      WHERE customer_id = @customer_id
      INTO TABLE @travels.
    IF lines( travels ) = 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'customer_id'
                                            table = '/dmo/travel'
                                            value = CONV #( customer_id ) ).
    ENDIF.

    IF sy-subrc <> 0. "IF sy-dbcnt = 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'customer_id'
                                            table = '/dmo/travel'
                                            value = CONV #( customer_id ) ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
