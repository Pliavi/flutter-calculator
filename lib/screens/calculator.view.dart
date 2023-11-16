import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';
import 'package:calculadora/widgets/calculator_button.dart';
import 'package:calculadora/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:window_manager/window_manager.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = CalculatorController();
    final CButtonFactory bcf = CButtonFactory(
      controller: controller,
      context: context,
    );

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Material(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(46),
              child: GestureDetector(
                onTapDown: (details) {
                  windowManager.startDragging();
                },
                child: AppBar(
                  title: const Text('Calculadora'),
                  centerTitle: true,
                  elevation: 4,
                  shadowColor: Colors.black26,
                  actions: [
                    IconButton(
                      onPressed: () {
                        ThemeSwitcherProvider.of(context)
                            .themeSwitcher
                            .nextVariant();
                      },
                      icon: const Icon(Icons.style),
                    ),
                    const SizedBox(width: 8),
                    IconButton.filled(
                      onPressed: () {
                        windowManager.close();
                      },
                      icon: const Icon(Icons.close),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
            body: Column(
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
                        child: bcf.normal(const ClearButtonAction(), 'C'),
                      ),
                      _StaggeredTile(
                        child: bcf.normal(const EraseButtonAction(), '⌫'),
                      ),
                      _StaggeredTile(
                        child: bcf.normal(const PercentageButtonAction(), '%'),
                      ),
                      _StaggeredTile(
                        child: bcf.operator('/', '÷'),
                      ),
                      // 7, 8, 9, multiply
                      _StaggeredTile(
                        child: bcf.number('7'),
                      ),
                      _StaggeredTile(
                        child: bcf.number('8'),
                      ),
                      _StaggeredTile(
                        child: bcf.number('9'),
                      ),
                      _StaggeredTile(
                        child: bcf.operator('*', '×'),
                      ),
                      // 4, 5, 6, minus
                      _StaggeredTile(
                        child: bcf.number('4'),
                      ),
                      _StaggeredTile(
                        child: bcf.number('5'),
                      ),
                      _StaggeredTile(
                        child: bcf.number('6'),
                      ),
                      _StaggeredTile(
                        child: bcf.operator('-'),
                      ),
                      // 1, 2, 3, plus
                      _StaggeredTile(
                        child: bcf.number('1'),
                      ),
                      _StaggeredTile(
                        child: bcf.number('2'),
                      ),
                      _StaggeredTile(
                        child: bcf.number('3'),
                      ),
                      _StaggeredTile(
                        child: bcf.operator('+'),
                      ),
                      //  0, dot, equals
                      _StaggeredTile(
                        crossAxisSpan: 2,
                        child: bcf.number('0'),
                      ),
                      _StaggeredTile(
                        child: bcf.normal(const DotButtonAction(), '.'),
                      ),
                      _StaggeredTile(
                        child: bcf.equals(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
