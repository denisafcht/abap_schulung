CLASS zcl_03_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_abap_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA operand1 TYPE z03_decimal.
    DATA operand2 TYPE z03_decimal.
    DATA operator TYPE c LENGTH 1.
    DATA result   TYPE z03_decimal.

    operand1 = '5'.
    operand2 = '0'.
    operator = ''.

    TRY.
        result = SWITCH #( operator
                           WHEN '+' THEN operand1 + operand2
                           WHEN '-' THEN operand1 - operand2
                           WHEN '*' THEN operand1 * operand2
                           WHEN '/' THEN operand1 / operand2
                           WHEN '^' THEN zcl_abap_calculator=>calculate_power( base     = operand1
                                                                               exponent = CONV #( operand2 ) )
                           WHEN '%' THEN zcl_03_calculator=>calculate_percentage( percentage = operand1
                                                                                  base       = operand2 ) ).
        out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).
      CATCH zcx_abap_exponent_too_high.
        " handle exception
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
