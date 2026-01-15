CLASS zcl_03_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklaration interner Tabellen
    DATA connections TYPE z03_connections. " TYPE [tabellentyp]
    DATA connection  TYPE z03_connection.

    " Hinzufügen von Datensätze
    connections = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                           ( carrier_id = 'UH' airport_from_id = 'FRA' )
                           ( connection_id = '0401' airport_to_id = 'FRA' )
                           ( ) ).

    " Anfügen von Datensätze
    connection = VALUE #( carrier_id      = 'AZ'
                          connection_id   = '0017'
                          airport_from_id = 'BER'
                          airport_to_id   = 'ROM' ).
    connections = VALUE #(  BASE connections
                           ( connection ) ).
    APPEND connection TO connections.

    out->write( connections ).

    " Lesen von Datensätzen
    " Lesen von Einzelsätzen
    TRY.
        connection = connections[ 3 ]. " per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connection = connections[ connection_id = '0400' ]. " per Schlüsselkomponente
    ENDIF.

    " Lesen mehrerer Datensätze
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL. " LOOP AT connections into DATA(connection2).
      out->write( | { sy-tabix } { connection-carrier_id }| ).
    ENDLOOP.

    " Ändern von Datensätzen
    " Ändern von Einzelsätzen
    TRY.
        connections[ 1 ]-airport_from_id = 'FRA'. " per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connections[ connection_id = '0400' ]-connection_id = '0402'. " per Schlüsselkomponente
    ENDIF.

    " Ändern mehrerer Datensätze
    LOOP AT connections INTO connection. " LOOP AT connections into DATA(connection2).
      connections[ sy-tabix ]-airport_to_id = 'JFK'.
    ENDLOOP.

    " Ändern mehrerer Datensätze per Datenreferenz
    DATA connection2 TYPE REF TO z03_connection.
    LOOP AT connections REFERENCE INTO connection2. " LOOP AT connections into DATA(connection2).
      connection2->airport_from_id = 'BER'. " Referenzpfeil statt Strich!!!
    ENDLOOP.

    " Ändern mehrerer Datensätze (per Feldsymbol)
    FIELD-SYMBOLS <connection> TYPE z03_connection.
    LOOP AT connections ASSIGNING <connection>. " LOOP AT connections into DATA(connection2).
      <connection>-carrier_id = 'LH'.
    ENDLOOP.

    " Ausgabe
    out->write( connections ).

    " Sortieren
    SORT connections BY carrier_id DESCENDING
                        connection_id ASCENDING.

    " Löschen
    DELETE connections WHERE airport_from_id = 'FRA'.
    CLEAR connections.

    " Anzahl Datensätze
    out->write( lines( connections ) ).

  ENDMETHOD.
ENDCLASS.
