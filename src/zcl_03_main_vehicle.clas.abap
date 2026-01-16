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
    DATA truck    TYPE REF TO zcl_03_truck.

    " Instanziierungen
    vehicle = NEW zcl_03_car( make  = 'Porsche'
                              model = '911'
                              seats = 2 ). " Upcast
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_03_truck( make          = 'MAN'
                                model         = 'TGX'
                                cargo_in_tons = 40 ).
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_03_car( make  = 'Audi'
                              model = 'S3'
                              seats = 5 ).
    APPEND vehicle TO vehicles.

    " Ausgabe

    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->acelerate( 30 ).
          vehicle->break( 10 ).
          vehicle->acelerate( 100 ).
        CATCH zcx_03_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).
      ENDTRY.
      IF vehicle IS INSTANCE OF zcl_03_truck.
        truck = CAST #( vehicle ).
        truck->transform( ).
        out->write( |{ COND #( WHEN truck->is_transformed = 'X'
                                THEN 'Der LKW hat sich in einem Autobot transformiert.'
                                ELSE 'Der Autobot hat sich in einem LKW transformiert.' ) }| ).
      ENDIF.
      out->write( vehicle->to_string( ) ). " (Dynamische) Polymorphie
    ENDLOOP.

    out->write( zcl_03_vehicle=>number_of_vehicles ).
  ENDMETHOD.
ENDCLASS.
