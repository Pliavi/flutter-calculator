import 'package:calculadora/screens/calculator.controller.dart';
import 'package:calculadora/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  color: Theme.of(context).cardColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    controller.display,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: [
                    // Clear, erase, percent, divide
                    _StaggeredTile(
                      child: CalcButton.clear(controller: controller),
                    ),
                    _StaggeredTile(
                      child: CalcButton.erase(controller: controller),
                    ),
                    _StaggeredTile(
                      child: CalcButton.percentage(controller: controller),
                    ),
                    _StaggeredTile(
                      child: CalcButton.operator(
                        controller: controller,
                        text: '÷',
                        operator: '/',
                      ),
                    ),
                    // 7, 8, 9, multiply
                    _StaggeredTile(
                      child: CalcButton.number(
                          controller: controller, number: '7'),
                    ),
                    _StaggeredTile(
                      child: CalcButton.number(
                          controller: controller, number: '8'),
                    ),
                    _StaggeredTile(
                      child: CalcButton.number(
                          controller: controller, number: '9'),
                    ),
                    _StaggeredTile(
                      child: CalcButton.operator(
                        controller: controller,
                        text: '×',
                        operator: '*',
                      ),
                    ),
                    // 4, 5, 6, minus
                    _StaggeredTile(
                      child: CalcButton.number(
                          controller: controller, number: '4'),
                    ),
                    _StaggeredTile(
                      child: CalcButton.number(
                          controller: controller, number: '5'),
                    ),
                    _StaggeredTile(
                      child: CalcButton.number(
                          controller: controller, number: '6'),
                    ),
                    _StaggeredTile(
                      child: CalcButton.operator(
                        controller: controller,
                        text: '−',
                        operator: '-',
                      ),
                    ),
                    // 1, 2, 3, plus
                    _StaggeredTile(
                      child: CalcButton.number(
                          controller: controller, number: '3'),
                    ),
                    _StaggeredTile(
                      child: CalcButton.number(
                          controller: controller, number: '2'),
                    ),
                    _StaggeredTile(
                      child: CalcButton.number(
                          controller: controller, number: '1'),
                    ),
                    _StaggeredTile(
                      child: CalcButton.operator(
                        controller: controller,
                        text: '+',
                        operator: '+',
                      ),
                    ),
                    // empty space, 0, dot, equals

                    _StaggeredTile(
                      crossAxisSpan: 2,
                      child: CalcButton.number(
                        controller: controller,
                        number: '0',
                      ),
                    ),
                    _StaggeredTile(
                      child: CalcButton.dot(controller: controller),
                    ),
                    _StaggeredTile(
                      child: CalcButton.equals(controller: controller),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StaggeredTile extends StaggeredGridTile {
  const _StaggeredTile({
    required Widget child,
    int crossAxisSpan = 1,
    int mainAxisSpan = 1,
  }) : super.count(
            crossAxisCellCount: crossAxisSpan,
            mainAxisCellCount: mainAxisSpan,
            child: child);
}
