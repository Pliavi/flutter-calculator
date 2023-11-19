import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator_controller.dart';
import 'package:flutter/material.dart';

class EqualsButtonAction extends ButtonActionStrategy {
  const EqualsButtonAction();

  @override
  void onPressed(CalculatorController controller) {
    if (controller.display == '0') return;

    final result = controller.calculate(controller.display);

    if (!controller.hasError) {
      controller.history[UniqueKey()] = "${controller.display} = $result";
    }

    controller.setDisplayAndBuffer(result);
  }
}
