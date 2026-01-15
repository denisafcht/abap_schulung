CLASS zcl_03_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*Hello World
    DATA text TYPE string.  "Deklaration
    text = 'Hello World'. "Wertzuweisung
    out->write( text ). "Ausgabe


*Datentypen und Datenobjekte
    DATA age type i. "Ganze Zahl
    DATA salary_in_euro type p length 16 decimals 2. "Packaged Number/Festkommazahlen
    DATA first_name type c length 40. "Zeichenkette fester Länge
    DATA matriculation_number type n length 7. "Ziffernfolge/Numerische Folge
    DATA xmas type d.  "Datumsangaben
    DATA noon type t.  "Zeitangaben

    DATA flag type abap_boolean.

  ENDMETHOD.
ENDCLASS.
