import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator_controller.dart';
import 'package:calculadora/widgets/calculator_button_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';

class CalculatorKeyboardGrid extends StatelessWidget {
  const CalculatorKeyboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CalculatorController>();
    final CalculatorButtonFactory buttonFactory = CalculatorButtonFactory(
      context: context,
    );

    final clearButtonText = controller.display == "0" ? 'AC' : 'C';
    final clearButtonColor = controller.hasError ? YaruColors.red : null;

    return StaggeredGrid.count(
      crossAxisCount: 4,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: [
        // clear, erase, percentage, divide
        _ButtonTile(
          buttonFactory.normal(
            const ClearButtonAction(),
            clearButtonText,
            clearButtonColor,
          ),
        ),
        _ButtonTile(buttonFactory.normal(const EraseButtonAction(), '⌫')),
        _ButtonTile(buttonFactory.normal(const PercentageButtonAction(), '%')),
        _ButtonTile(buttonFactory.operator('/', '÷')),
        // 7, 8, 9, multiply
        _ButtonTile(buttonFactory.number('7')),
        _ButtonTile(buttonFactory.number('8')),
        _ButtonTile(buttonFactory.number('9')),
        _ButtonTile(buttonFactory.operator('*', '×')),
        // 4, 5, 6, minus
        _ButtonTile(buttonFactory.number('4')),
        _ButtonTile(buttonFactory.number('5')),
        _ButtonTile(buttonFactory.number('6')),
        _ButtonTile(buttonFactory.operator('-')),
        // 1, 2, 3, plus
        _ButtonTile(buttonFactory.number('1')),
        _ButtonTile(buttonFactory.number('2')),
        _ButtonTile(buttonFactory.number('3')),
        _ButtonTile(buttonFactory.operator('+')),
        //  0, dot, equals
        _ButtonTile(buttonFactory.number('0'), crossAxisSpan: 2),
        _ButtonTile(buttonFactory.normal(const DotButtonAction(), '.')),
        _ButtonTile(buttonFactory.equals()),
      ],
    );
  }
}

class _ButtonTile extends StatelessWidget {
  const _ButtonTile(
    this.child, {
    this.crossAxisSpan = 1,
    // ignore: unused_element
    this.mainAxisSpan = 1,
  });

  final Widget child;
  final int crossAxisSpan;
  final int mainAxisSpan;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.extent(
      mainAxisExtent: 64,
      crossAxisCellCount: crossAxisSpan,
      child: child,
    );
  }
}
