import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class CalculatorButtonFactory {
  const CalculatorButtonFactory({
    required this.context,
  });

  final BuildContext context;

  Widget normal(
    ButtonActionStrategy action,
    String text, [
    Color? backgroundColor,
  ]) {
    return CalculatorButton(
      action: action,
      text: text,
      backgroundColor: backgroundColor,
    );
  }

  Widget number(String number) {
    final theme = Theme.of(context);

    final filledButtonStyleDark = theme.filledButtonTheme.style?.copyWith(
      backgroundColor: MaterialStatePropertyAll(
        YaruColors.inkstone.adjust(lightness: 0.1),
      ),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
    );

    final filledButtonStyle = theme.filledButtonTheme.style?.copyWith(
      backgroundColor: MaterialStatePropertyAll(
        YaruColors.porcelain.adjust(lightness: -0.2),
      ),
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
      child: CalculatorButton(
        action: NumberButtonAction(number),
        text: number,
      ),
    );
  }

  Widget operator(String operator, [String? text]) {
    return CalculatorButton(
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
      child: const CalculatorButton(
        action: EqualsButtonAction(),
        text: '=',
      ),
    );
  }
}
