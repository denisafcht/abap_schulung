CLASS zcl_03_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_03_partner.

    DATA name      TYPE string        READ-ONLY.
    DATA airplanes TYPE z03_airplanes READ-ONLY.

    METHODS constructor             IMPORTING !name        TYPE string.
    METHODS add_airplane            IMPORTING airplane     TYPE REF TO zcl_03_airplane.
    METHODS get_biggest_cargo_plane RETURNING VALUE(cargo) TYPE REF TO zcl_03_cargo_plane.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_carrier IMPLEMENTATION.
  METHOD add_airplane.
    append airplane to airplanes.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA biggest_cargo TYPE i.

    LOOP AT airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF zcl_03_cargo_plane.
        IF airplane->get_total_weight_in_tons( ) > biggest_cargo.
          biggest_cargo = airplane->get_total_weight_in_tons( ).
          cargo = CAST #( airplane ).
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_03_partner~to_string.
    string = 'Ich bin die Fluggesellschaft'.
  ENDMETHOD.

ENDCLASS.
