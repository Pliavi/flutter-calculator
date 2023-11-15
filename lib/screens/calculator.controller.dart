import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

enum ButtonType {
  number,
  operator,
  equals,
  percentage,
  dot,
  clear,
  erase,
}

const maxLengthWithDecimal = 20;
const maxLengthWithoutDecimal = 15;

class CalculatorController extends ChangeNotifier {
  String _display = '0';
  ButtonType _lastButtonPressed = ButtonType.clear;
  String _numberBuffer = '';
  bool onError = false;

  get display => _display;

  void onButtonPressed(ButtonType button, [String value = '']) {
    if (onError && button != ButtonType.clear) {
      return;
    }

    switch (button) {
      case ButtonType.number:
        _onNumberPressed(value);
        _lastButtonPressed = button;
        break;
      case ButtonType.operator:
        _onOperatorPressed(value);
        _lastButtonPressed = button;
        break;
      case ButtonType.equals:
        _onEqualsPressed();
        _lastButtonPressed = ButtonType.number;
        break;
      case ButtonType.percentage:
        _onPercentagePressed();
        _lastButtonPressed = ButtonType.number;
        break;
      case ButtonType.dot:
        _onDotPressed();
        _lastButtonPressed = ButtonType.number;
        break;
      case ButtonType.clear:
        _onClearPressed();
        _lastButtonPressed = ButtonType.clear;
        break;
      case ButtonType.erase:
        _onErasePressed();
        _lastButtonPressed = ButtonType.number;
        break;
    }

    notifyListeners();
  }

  void _onNumberPressed(String value) {
    final hasDecimal = _numberBuffer.contains('.');
    final isMaxLength = hasDecimal
        ? _numberBuffer.length >= maxLengthWithDecimal
        : _numberBuffer.length >= maxLengthWithoutDecimal;

    final isBufferZero = _numberBuffer == '0';
    final isZeroPressedWithZeroBuffer = value == '0' && isBufferZero;

    if (isMaxLength || isZeroPressedWithZeroBuffer) return;

    if (_display == '0') {
      _display = value;
      _numberBuffer = value;
    } else {
      if (isBufferZero) {
        _display = _display.substring(0, _display.length - 1) + value;
      } else {
        _display += value;
      }
      _numberBuffer += value;
    }
  }

  void _onOperatorPressed(String value) {
    _numberBuffer = '';
    // NOTE: Se o último botão pressionado foi um operador
    //       substitui o operador ao invés de adicionar
    if (_lastButtonPressed == ButtonType.operator) {
      _display = _display.substring(0, _display.length - 1) + value;
    } else {
      _display += value;
    }
  }

  void _onEqualsPressed() {
    final result = _calculate(_display);
    _display = result;
    _numberBuffer = result;
  }

  void _onPercentagePressed() {
    final displayLength = _display.length;

    if (_numberBuffer.isNotEmpty) {
      final percent = _calculate('$_numberBuffer/100');

      final percentLength = percent.length;
      final replaceRange = displayLength - percentLength;

      if (percentLength > displayLength && replaceRange > 0) {
        _display = _display.substring(0, replaceRange) + percent;
      } else {
        _display = percent;
      }

      _numberBuffer = percent;
    }
  }

  void _onDotPressed() {
    if (!_numberBuffer.contains('.')) {
      _numberBuffer += '.';
      _display += '.';
    }
  }

  void _onClearPressed() {
    _display = '0';
    _numberBuffer = '';
    onError = false;
  }

  void _onErasePressed() {
    final bufferLength = _numberBuffer.length;
    final displayLength = _display.length;

    if (displayLength > 1) {
      if (bufferLength > 0) {
        _numberBuffer = _numberBuffer.substring(0, bufferLength - 1);
      }
      _display = _display.substring(0, displayLength - 1);
    } else {
      _numberBuffer = '';
      _display = '0';
    }
  }

  String _calculate(String expression) {
    final sanitizedExpression =
        expression.replaceAll('x', '*').replaceAll('÷', '/');

    try {
      onError = false;
      final result = sanitizedExpression.interpret();

      if (result.isInfinite) {
        throw CalculatorException('Divisão por zero');
      } else if (result.isNaN) {
        throw CalculatorException('Expressão inválida');
      }

      if (_isInteger(result)) {
        return result.toInt().toString();
      }

      return result.toString();
    } on CalculatorException catch (e) {
      onError = true;
      return e.message;
    } catch (e) {
      onError = true;
      return 'Expressão inválida';
    }
  }

  bool _isInteger(num number) {
    if (!number.isFinite) {
      return false;
    }

    return number == number.toInt();
  }
}

class CalculatorException implements Exception {
  final String message;

  CalculatorException(this.message);
}
