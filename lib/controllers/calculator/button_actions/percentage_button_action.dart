import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';

class PercentageButtonAction extends ButtonActionStrategy {
  const PercentageButtonAction();

  @override
  void onPressed(CalculatorController controller) {
    final operandBuffer = controller.buffer;
    final displayLength = controller.display.length;

    if (operandBuffer.isNotEmpty) {
      final percent = controller.calculate('$operandBuffer/100');

      final percentLength = percent.length;
      final replaceRange = displayLength - percentLength;

      if (percentLength > displayLength && replaceRange > 0) {
        // display = display.substring(0, replaceRange) + percent;
        controller.replaceBufferFrom(replaceRange, percent);
      } else {
        controller.setDisplay(percent);
      }

      controller.setBuffer(percent);
    }
  }
}
