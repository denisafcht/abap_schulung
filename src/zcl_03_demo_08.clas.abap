CLASS zcl_03_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_demo_08 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA carrier_id    TYPE /dmo/carrier_id    VALUE 'LH'.
    DATA connection_id TYPE /dmo/connection_id VALUE '0400'.
    " SELECT [Spalten] FROM [Datenbankquelle] WHERE [Bedingung]

    DATA connection    TYPE /dmo/connection.
    DATA connections   TYPE TABLE OF /dmo/connection.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA connection3   TYPE z03_connection.

    " Lesen von Einzelsätzen
    SELECT SINGLE FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection.

    out->write( connection ).

    " Lesen mehrerer Datensätze
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @connections.

    " Lesen mehrerer Datensätze (per Select-Schelife)
    CLEAR connections.
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO @connection.
      APPEND connection TO connections.
    ENDSELECT.

    out->write( connections ).

    " Definition der Zielvariablen (Option 1: Inkunedeklaration
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @DATA(connection2).

    " Definition der Zielvariablen (Option 2: Angabe passender Felder)
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection3.

    " Definition der Zielvariable (Option 3: Kopieren namensgleicher Felder
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO CORRESPONDING FIELDS OF @connection.

    out->write( connection2 ).

    " Definition von Tabellen-Joins
    SELECT
      FROM /dmo/connection
             INNER JOIN
               /dmo/carrier ON /dmo/connection~carrier_id = /dmo/carrier~carrier_id
      FIELDS /dmo/connection~carrier_id,
             /dmo/connection~connection_id,
             /dmo/carrier~name
      INTO TABLE @DATA(connections2).

    out->write( connections2 ).
  ENDMETHOD.
ENDCLASS.
