CLASS zcl_03_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING operand1      TYPE z03_decimal
                operand2      TYPE z03_decimal
      RETURNING VALUE(result) TYPE z03_decimal
      RAISING   cx_sy_zerodivide.
    CLASS-METHODS calculate_percentage
      IMPORTING percentage TYPE z03_decimal
                base TYPE z03_decimal
      Returning VALUE(percentag_value) TYPE z03_decimal.
  PROTECTED SECTION.
ENDCLASS.


CLASS zcl_03_calculator IMPLEMENTATION.
  METHOD divide.
    IF operand2 IS INITIAL.
      RAISE EXCEPTION NEW cx_sy_zerodivide( ).
    ENDIF.
    result = operand1 / operand2.
  ENDMETHOD.
  METHOD calculate_percentage.
    percentag_value = base * percentage / 100.
  ENDMETHOD.
ENDCLASS.
