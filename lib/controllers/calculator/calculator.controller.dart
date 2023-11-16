import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/utils/number_util.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

const maxLengthWithDecimal = 20;
const maxLength = 15;

class CalculatorController extends ChangeNotifier {
  String display = '0';
  ButtonActionStrategy lastButtonAction = const ClearButtonAction();
  String buffer = '';
  bool hasError = false;

  // TODO: Instead of using all this clear/set/append in the controller
  //       we could create value objects for display and buffer
  //       and an aggregator(or use this controller to aggregate)
  clearDisplayAndBuffer() {
    display = '0';
    buffer = '';
  }

  setDisplay(String value) => display = value;
  setBuffer(String value) => buffer = value;
  setDisplayAndBuffer(String value) {
    display = value;
    buffer = value;
  }

  appendToDisplay(String value) => display += value;
  appendToBuffer(String value) => buffer += value;
  appendToDisplayAndBuffer(String value) {
    display += value;
    buffer += value;
  }

  replaceDisplayFrom(int pos, String value) {
    return display = display.substring(0, display.length + pos) + value;
  }

  replaceBufferFrom(int pos, String value) {
    return buffer = buffer.substring(0, buffer.length + pos) + value;
  }

  replaceDisplayAndBufferFrom(int pos, String value) {
    replaceDisplayFrom(pos, value);
    replaceBufferFrom(pos, value);
  }

  void onButtonPressed(ButtonActionStrategy action) {
    if (hasError && action is! ClearButtonAction) return;

    action.onPressed(this);
    lastButtonAction = action;

    notifyListeners();
  }

  String calculate(String expression) {
    final sanitizedExpression =
        expression.replaceAll('x', '*').replaceAll('÷', '/');

    try {
      hasError = false;
      final result = sanitizedExpression.interpret();

      if (result.isInfinite) {
        throw CalculatorException('Divisão por zero');
      } else if (result.isNaN) {
        throw CalculatorException('Expressão inválida');
      }

      return NumberUtil.relativeIntDouble(result).toString();
    } on CalculatorException catch (e) {
      hasError = true;
      return e.message;
    } catch (e) {
      hasError = true;
      return 'Expressão inválida';
    }
  }
}

class CalculatorException implements Exception {
  final String message;

  CalculatorException(this.message);
}
