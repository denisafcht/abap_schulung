CLASS zcl_03_abap_cds_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_abap_cds_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM Z03_CustomerWithTravels
      FIELDS CustomerId,
             FirstName,
             LastName,
             Title,
             Street,
             PostalCode,
             City,
             \_Travels-TravelId,
             \_Travels-BeginDate,
             \_Travels-EndDate,
             \_Travels-CurrencyCode,
             \_Travels-Description,
             \_Travels-Status
      INTO TABLE @DATA(customers).
    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
