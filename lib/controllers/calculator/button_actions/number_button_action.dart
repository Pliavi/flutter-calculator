import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator_controller.dart';

class NumberButtonAction extends ButtonActionStrategy {
  const NumberButtonAction(super.value);

  @override
  void onPressed(CalculatorController controller) {
    final operandBuffer = controller.buffer;
    final display = controller.display;

    final hasDecimal = operandBuffer.contains('.');
    final isMaxLength = hasDecimal
        ? operandBuffer.length >= maxLengthWithDecimal
        : operandBuffer.length >= maxLength;

    final isBufferZero = operandBuffer == '0';
    final isZeroPressedWithZeroBuffer = value == '0' && isBufferZero;

    if (isMaxLength || isZeroPressedWithZeroBuffer) return;

    final isDisplayZero = display == '0';

    if (isDisplayZero) {
      controller.setDisplayAndBuffer(value!);
    } else {
      if (isBufferZero) {
        controller.replaceDisplayFrom(-1, value!);
        controller.appendToBuffer(value!);
      } else {
        controller.appendToDisplayAndBuffer(value!);
      }
    }
  }
}
