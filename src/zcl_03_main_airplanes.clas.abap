CLASS zcl_03_main_airplanes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA airplane  TYPE REF TO zcl_03_airplane.
    DATA airplanes TYPE TABLE OF REF TO zcl_03_airplane.
    DATA carrier   TYPE REF TO zcl_03_carrier.

    carrier = NEW zcl_03_carrier( name = 'Lufthansa' ).

    " Instanziierungen
    out->write( zcl_03_airplane=>number_of_airplanes ).
    TRY.
        airplane = NEW zcl_03_passenger_plane( id                   = 'D-BUK'
                                               plane_type           = 'Airbus A380-800'
                                               empty_weight_in_tons = 227
                                               number_of_seats      = 200 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_03_cargo_plane( id                   = 'D-AIND'
                                           plane_type           = 'Airbus A320-200'
                                           empty_weight_in_tons = 129
                                           cargo_in_tons        = 38 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(z).
        out->write( z->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_03_passenger_plane( id                   = 'D-AJKF'
                                               plane_type           = 'Boeing 747-400F'
                                               empty_weight_in_tons = 166
                                               number_of_seats      = 120 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(y).
        out->write( y->get_text( ) ).
    ENDTRY.

    " Ausgabe
    LOOP AT airplanes INTO airplane.
      out->write(
          |{ airplane->id }  { airplane->plane_type }  { airplane->empty_weight_in_tons }  { airplane->get_total_weight_in_tons( ) }| ).
    ENDLOOP.
    out->write( carrier ).
    out->write( carrier->get_biggest_cargo_plane(  ) ).

    out->write( zcl_03_airplane=>number_of_airplanes ).
  ENDMETHOD.
ENDCLASS.
