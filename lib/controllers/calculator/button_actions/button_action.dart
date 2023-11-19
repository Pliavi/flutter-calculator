import 'package:calculadora/controllers/calculator/calculator_controller.dart';

export 'clear_button_action.dart';
export 'dot_button_action.dart';
export 'equals_button_action.dart';
export 'erase_button_action.dart';
export 'number_button_action.dart';
export 'operator_button_action.dart';
export 'percentage_button_action.dart';

abstract class ButtonActionStrategy {
  final String? value;

  const ButtonActionStrategy([this.value]);

  void onPressed(CalculatorController controller);
}
