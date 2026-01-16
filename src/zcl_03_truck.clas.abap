CLASS zcl_03_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_03_vehicle
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.
    DATA is_transformed TYPE c length 1 READ-ONLY.

    METHODS constructor
      IMPORTING make          TYPE string
                model         TYPE string
                cargo_in_tons TYPE i.

    METHODS to_string REDEFINITION.

    METHODS transform.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make  = make
                        model = model ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
    string = |{ super->to_string( ) }, Frachtkapazität: { cargo_in_tons } t|.
  ENDMETHOD.

  METHOD transform.
    if is_transformed = 'X'. "is_transformed = abap_true
      is_transformed = ''. "is_transformed = abap_false.
    else.
      is_transformed = 'X'.
    endif.
  ENDMETHOD.

ENDCLASS.
