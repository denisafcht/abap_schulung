CLASS zcl_03_vehicle DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS acelerate IMPORTING !value TYPE i
                      RAISING   zcx_03_value_too_high.

    METHODS break IMPORTING !value TYPE i
                  RAISING   zcx_03_value_too_high.

    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.

    METHODS to_string RETURNING VALUE(string) TYPE string.

    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_03_vehicle IMPLEMENTATION.

  METHOD acelerate.
    if speed_in_kmh + value > 300.
      raise EXCEPTION new zcx_03_value_too_high( value = value ).
    endif.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD break.
    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_03_value_too_high( value = value ).
    ENDIF.
    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.

    number_of_vehicles += 1.
  ENDMETHOD.

  METHOD to_string.
      string = |{ make } { model } ({ speed_in_kmh }km/h)|.
  ENDMETHOD.
ENDCLASS.
