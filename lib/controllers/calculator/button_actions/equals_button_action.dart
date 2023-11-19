import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';

class EqualsButtonAction extends ButtonActionStrategy {
  const EqualsButtonAction();

  @override
  void onPressed(CalculatorController controller) {
    final result = controller.calculate(controller.display);

    controller.setDisplayAndBuffer(result);
    controller.history.add(result);
  }
}
