import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';

class ClearButtonAction extends ButtonActionStrategy {
  const ClearButtonAction();

  @override
  void onPressed(CalculatorController controller) {
    if (controller.lastButtonAction is ClearButtonAction) {
      controller.history.clear();
    } else {
      controller.clearDisplayAndBuffer();
    }

    controller.hasError = false;
  }
}
