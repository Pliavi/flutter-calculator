import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class CButton extends StatelessWidget {
  const CButton({
    super.key,
    required this.controller,
    required this.action,
    required this.text,
  });

  final CalculatorController controller;
  final ButtonActionStrategy action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => controller.onButtonPressed(action),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CButtonFactory {
  const CButtonFactory({required this.controller, required this.context});

  final CalculatorController controller;
  final BuildContext context;

  Widget normal(ButtonActionStrategy action, String text) {
    return CButton(
      controller: controller,
      action: action,
      text: text,
    );
  }

  Widget number(String number) {
    final theme = Theme.of(context);

    final filledButtonStyleDark = theme.filledButtonTheme.style?.copyWith(
      backgroundColor: MaterialStatePropertyAll(YaruColors.inkstone.adjust(
        lightness: 0.1,
      )),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
    );

    final filledButtonStyle = theme.filledButtonTheme.style?.copyWith(
      backgroundColor: MaterialStatePropertyAll(YaruColors.porcelain.adjust(
        lightness: -0.2,
      )),
      foregroundColor: const MaterialStatePropertyAll(YaruColors.textGrey),
    );

    return Theme(
      data: theme.copyWith(
        filledButtonTheme: FilledButtonThemeData(
          style: theme.brightness == Brightness.dark
              ? filledButtonStyleDark
              : filledButtonStyle,
        ),
      ),
      child: CButton(
        controller: controller,
        action: NumberButtonAction(number),
        text: number,
      ),
    );
  }

  Widget operator(String operator, [String? text]) {
    return CButton(
      controller: controller,
      action: OperatorButtonAction(operator),
      text: text ?? operator,
    );
  }

  Widget equals() {
    final theme = Theme.of(context);

    final filledButtonStyle = theme.filledButtonTheme.style?.copyWith(
      backgroundColor: MaterialStatePropertyAll(theme.primaryColor),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
    );

    return Theme(
      data: theme.copyWith(
        filledButtonTheme: FilledButtonThemeData(style: filledButtonStyle),
      ),
      child: CButton(
        controller: controller,
        action: const EqualsButtonAction(),
        text: '=',
      ),
    );
  }
}
