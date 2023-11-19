import 'package:calculadora/controllers/calculator/calculator.controller.dart';
import 'package:calculadora/widgets/calculator_display.dart';
import 'package:calculadora/widgets/calculator_history_display.dart';
import 'package:calculadora/widgets/calculator_keyboard_grid.dart';
import 'package:calculadora/widgets/window_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
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
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: windowBorderColor),
          ),
          clipBehavior: Clip.antiAlias,
          child: const Scaffold(
            appBar: WindowBar(),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: CalculatorHistoryDisplay()),
                      CalculatorDisplay(),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CalculatorKeyboardGrid(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
