CLASS zcl_03_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_demo_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "ABAP 1 Initierte Sprache index fängt bei 1 an
    WHILE sy-index <= 10.
      out->write( sy-index ).
    ENDWHILE.

    do 10 TIMES.
      out->write( sy-index ).
    enddo.

    do.
      out->write( sy-index ).
      if sy-index = 10.
        exit.
      endif.
    enddo.

  ENDMETHOD.
ENDCLASS.
