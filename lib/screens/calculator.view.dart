import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';
import 'package:calculadora/widgets/calculator_button_factory.dart';
import 'package:calculadora/widgets/calculator_display.dart';
import 'package:calculadora/widgets/calculator_history_display.dart';
import 'package:calculadora/widgets/calculator_keyboard_grid.dart';
import 'package:calculadora/widgets/window_bar.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final CalculatorController controller = CalculatorController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_onStateChanged);
  }

  _onStateChanged() {
    setState(() {
      final lastButton = controller.lastButtonAction;
      final isLastButtonEquals = lastButton is EqualsButtonAction;

      if (isLastButtonEquals) _scrollHistoryToBottom();
    });
  }

  _scrollHistoryToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bottom = _scrollController.position.maxScrollExtent;

      _scrollController.jumpTo(bottom);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;

    final windowBorderColor = brightness == Brightness.dark
        ? YaruColors.coolGrey
        : Colors.transparent;

    final CalculatorButtonFactory buttonFactory = CalculatorButtonFactory(
      controller: controller,
      context: context,
    );

    return Material(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(color: windowBorderColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: Scaffold(
        appBar: const WindowBar(),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: CalculatorHistoryDisplay(
                      scrollController: _scrollController,
                      controller: controller,
                    ),
                  ),
                  CalculatorDisplay(controller: controller),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CalculatorKeyboardGrid(
                buttonFactory: buttonFactory,
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
