CLASS zcl_03_rental DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_03_partner.

    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_03_vehicle.

    DATA vehicles TYPE ty_vehicles READ-ONLY.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_03_vehicle.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_03_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.

  METHOD zif_03_partner~to_string.
    string = 'Ich bin die Autovermietung'.
  ENDMETHOD.

ENDCLASS.
