import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';

class OperatorButtonAction extends ButtonActionStrategy {
  const OperatorButtonAction(super.value);

  @override
  void onPressed(CalculatorController controller) {
    controller.setBuffer("");

    if (controller.lastButtonAction is OperatorButtonAction) {
      controller.replaceDisplayFrom(-1, value!);
    } else {
      controller.appendToDisplay(value!);
    }
  }
}
