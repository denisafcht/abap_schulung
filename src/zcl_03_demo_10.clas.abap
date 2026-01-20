CLASS zcl_03_demo_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_demo_10 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM Z03_Demo08
      FIELDS CarrierId, ConnectionId, \_Carrier-Name
      INTO TABLE @DATA(connections).

    out->write( connections ).
  ENDMETHOD.
ENDCLASS.
