import 'package:calculadora/screens/calculator.controller.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

ButtonStyle kButtonStyle = FilledButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);

class CalcButton extends FilledButton {
  CalcButton({
    super.key,
    required CalculatorController controller,
    required String text,
    required ButtonType type,
    Color? color,
    value = '',
  }) : super(
            onPressed: () => controller.onButtonPressed(type, value),
            child: Text(text),
            style: kButtonStyle.copyWith(
              backgroundColor: MaterialStateProperty.all<Color?>(
                color,
                // type == ButtonType.equals
                //     ? YaruColors.orange
                //     : error
                //         ? YaruColors.red
                //         : null,
              ),
            ));

  factory CalcButton.number({
    required CalculatorController controller,
    required String number,
  }) {
    // TODO: Remove this from factory to have access
    //       to the theme from the context
    final defaultBackgroundColor =
        yaruDark.filledButtonTheme.style!.backgroundColor!.resolve(
      {...MaterialState.values},
    );

    final newColor = defaultBackgroundColor?.withOpacity(0.2);

    return CalcButton(
      controller: controller,
      text: number,
      type: ButtonType.number,
      value: number,
      color: newColor,
    );
  }

  factory CalcButton.operator({
    required CalculatorController controller,
    required String text,
    required String operator,
  }) {
    return CalcButton(
      controller: controller,
      text: text,
      type: ButtonType.operator,
      value: operator,
    );
  }

  factory CalcButton.dot({required CalculatorController controller}) {
    return CalcButton(
      controller: controller,
      text: '.',
      type: ButtonType.dot,
      value: '.',
    );
  }

  factory CalcButton.equals({required CalculatorController controller}) {
    return CalcButton(
      controller: controller,
      text: '=',
      type: ButtonType.equals,
      color: yaruDark.colorScheme.primary,
    );
  }

  factory CalcButton.percentage({required CalculatorController controller}) {
    return CalcButton(
      controller: controller,
      text: '%',
      type: ButtonType.percentage,
    );
  }

  factory CalcButton.clear({
    required CalculatorController controller,
    bool error = false,
  }) {
    return CalcButton(
      controller: controller,
      text: 'AC',
      type: ButtonType.clear,
      color: error ? Colors.red : null,
    );
  }

  factory CalcButton.erase({required CalculatorController controller}) {
    return CalcButton(
      controller: controller,
      text: '⌫',
      type: ButtonType.erase,
    );
  }
}
