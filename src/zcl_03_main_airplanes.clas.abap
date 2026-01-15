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

    " Instanziierungen
    out->write( zcl_03_airplane=>number_of_airplanes ).
    try.
    airplane = NEW #( id = 'D-BUK' plane_type = 'Airbus A380-800' empty_weight_in_tons = 227 ).
    APPEND airplane TO airplanes.
    CATCH zcx_abap_initial_parameter into data(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.
    airplane = NEW #( id = 'D-AIND' plane_type = 'Airbus A320-200' empty_weight_in_tons = 0 ).
    APPEND airplane TO airplanes.
    CATCH zcx_abap_initial_parameter into data(z).
        out->write( z->get_text( ) ).
    ENDTRY.

    TRY.
    airplane = NEW #( id = 'D-AJKF' plane_type = 'Boeing 747-400F' empty_weight_in_tons = 166 ).
    APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter into data(y).
        out->write( y->get_text( ) ).
    ENDTRY.

    " Ausgabe
    LOOP AT airplanes INTO airplane.
      out->write( |{ airplane->id }  { airplane->plane_type }  { airplane->empty_weight_in_tons } | ).
    ENDLOOP.

    out->write( zcl_03_airplane=>number_of_airplanes ).


  ENDMETHOD.
ENDCLASS.
