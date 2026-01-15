CLASS zcl_03_abap_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_abap_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
      DATA first_name TYPE /dmo/first_name.
      DATA last_name TYPE /dmo/last_name.
      first_name = 'Bruce'.
      last_name = 'Wayne'.
      DATA(fullname) = |{ first_name } { last_name }|.
      out->write( |Hello {  fullname }, how are you?| ).

  ENDMETHOD.
ENDCLASS.
