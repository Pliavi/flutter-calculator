import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';

class DotButtonAction extends ButtonActionStrategy {
  const DotButtonAction() : super('.');

  @override
  void onPressed(CalculatorController controller) {
    final operandIsDecimal = controller.buffer.contains('.');

    if (operandIsDecimal) return;

    controller.appendToDisplayAndBuffer(value!);
  }
}
