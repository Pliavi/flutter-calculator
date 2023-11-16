import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';

class EraseButtonAction extends ButtonActionStrategy {
  const EraseButtonAction();

  @override
  void onPressed(CalculatorController controller) {
    final display = controller.display;
    var operandBuffer = controller.buffer;

    final bufferLength = operandBuffer.length;
    final displayLength = display.length;

    if (displayLength > 1) {
      if (bufferLength > 0) {
        controller.replaceBufferFrom(-1, '');
      }
      controller.replaceDisplayFrom(-1, '');
    } else {
      controller.clearDisplayAndBuffer();
    }
  }
}
