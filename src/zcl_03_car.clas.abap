CLASS zcl_03_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_03_vehicle
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA seats type i READ-ONLY.

  METHODS constructor
    IMPORTING
      make TYPE string
      model TYPE string
      seats TYPE i.
  METHODS to_string REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_car IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make = make model = model ).
    me->seats = seats.
  ENDMETHOD.

  method to_string.
    string = |{ super->to_string( ) }, { seats } Sitzplätze|.
  endmethod.
ENDCLASS.
