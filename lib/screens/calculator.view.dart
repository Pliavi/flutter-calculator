import 'package:calculadora/controllers/calculator/calculator.controller.dart';
import 'package:calculadora/widgets/calculator_display.dart';
import 'package:calculadora/widgets/calculator_history_display.dart';
import 'package:calculadora/widgets/calculator_keyboard_grid.dart';
import 'package:calculadora/widgets/window_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorController(),
      builder: (context, child) {
        final Brightness brightness = Theme.of(context).brightness;
        final windowBorderColor = brightness == Brightness.dark
            ? YaruColors.coolGrey
            : Colors.transparent;

        return Material(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            side: BorderSide(color: windowBorderColor),
          ),
          clipBehavior: Clip.antiAlias,
          child: const Column(
            children: [
              WindowBar(),
              Expanded(
                child: CalculatorHistoryDisplay(),
              ),
              Divider(),
              CalculatorDisplay(),
              Divider(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CalculatorKeyboardGrid(),
              ),
            ],
          ),
        );
      },
    );
  }
}
