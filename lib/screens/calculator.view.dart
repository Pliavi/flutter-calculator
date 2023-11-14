import 'package:calculadora/screens/calculator.controller.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = CalculatorController();

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.white,
                child: Text(
                  controller.display,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                primary: true,
                crossAxisCount: 4,
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  // Clear, erase, percent, divide
                  CalcButton(
                    controller: controller,
                    text: 'C',
                    type: ButtonType.clear,
                    focus: controller.onError,
                  ),
                  CalcButton(
                    controller: controller,
                    text: '⌫',
                    type: ButtonType.erase,
                  ),
                  CalcButton(
                    controller: controller,
                    text: '%',
                    type: ButtonType.percentage,
                    value: '%',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '÷',
                    type: ButtonType.operator,
                    value: '÷',
                  ),
                  // 7, 8, 9, multiply
                  CalcButton(
                    controller: controller,
                    text: '7',
                    type: ButtonType.number,
                    value: '7',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '8',
                    type: ButtonType.number,
                    value: '8',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '9',
                    type: ButtonType.number,
                    value: '9',
                  ),
                  CalcButton(
                    controller: controller,
                    text: 'x',
                    type: ButtonType.operator,
                    value: 'x',
                  ),
                  // 4, 5, 6, minus
                  CalcButton(
                    controller: controller,
                    text: '4',
                    type: ButtonType.number,
                    value: '4',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '5',
                    type: ButtonType.number,
                    value: '5',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '6',
                    type: ButtonType.number,
                    value: '6',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '-',
                    type: ButtonType.operator,
                    value: '-',
                  ),
                  // 1, 2, 3, plus
                  CalcButton(
                    controller: controller,
                    text: '1',
                    type: ButtonType.number,
                    value: '1',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '2',
                    type: ButtonType.number,
                    value: '2',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '3',
                    type: ButtonType.number,
                    value: '3',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '+',
                    type: ButtonType.operator,
                    value: '+',
                  ),
                  // empty space, 0, dot, equals
                  Container(),
                  CalcButton(
                    controller: controller,
                    text: '0',
                    type: ButtonType.number,
                    value: '0',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '.',
                    type: ButtonType.dot,
                    value: '.',
                  ),
                  CalcButton(
                    controller: controller,
                    text: '=',
                    type: ButtonType.equals,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class CalcButton extends FilledButton {
  CalcButton({
    super.key,
    required CalculatorController controller,
    required String text,
    required ButtonType type,
    bool focus = false,
    value = '',
  }) : super(
          onPressed: () => controller.onButtonPressed(type, value),
          child: Text(text),
          style: FilledButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: focus
                ? Colors.red
                : type == ButtonType.number
                    ? Colors.blueGrey
                    : null,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        );
}
