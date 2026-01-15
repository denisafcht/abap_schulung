CLASS zcl_03_main_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_main_vehicle IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklaration
    DATA vehicle  TYPE REF TO zcl_03_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_03_vehicle.

    " Instanziierungen
    vehicle = NEW #( make = 'BMW' model = 'M2' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make = 'BMW' model = 'M3' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make = 'BMW' model = 'M5' ).
    APPEND vehicle TO vehicles.

    " Ausgabe
    LOOP AT vehicles INTO vehicle.
      out->write( vehicle ).
    ENDLOOP.


    LOOP AT vehicles into vehicle.
      TRY.
          vehicle->acelerate( 30 ).
          vehicle->break( 10 ).
          vehicle->acelerate( 500 ).
        CATCH zcx_03_value_too_high into data(x).
          out->write( x->get_text( ) ).
      ENDTRY.
    ENDLOOP.

    out->write( zcl_03_vehicle=>number_of_vehicles ).



  ENDMETHOD.
ENDCLASS.
