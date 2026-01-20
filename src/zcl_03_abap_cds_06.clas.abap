CLASS zcl_03_abap_cds_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_abap_cds_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM z03_CUSTOMERKPIS( P_City = 'Mannheim' )
      FIELDS CustomerID, CustomerName, TotalRevenue
      ORDER BY TotalRevenue DESCENDING
      INTO TABLE @DATA(customers).
    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
