import 'package:calculadora/controllers/calculator/calculator_controller.dart';
import 'package:calculadora/widgets/calculator_display.dart';
import 'package:calculadora/widgets/calculator_history_display.dart';
import 'package:calculadora/widgets/calculator_keyboard_grid.dart';
import 'package:calculadora/widgets/window_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

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
          child: Column(
            // XXX: This verticalDirection is necessary to make the WindowBar
            //      shadow appear over the CalculatorHistoryDisplay.
            //      See: https://github.com/flutter/flutter/issues/12206
            verticalDirection: VerticalDirection.up,
            children: [
              const WindowBar(),
              const Expanded(
                child: CalculatorHistoryDisplay(),
              ),
              const Divider(),
              const CalculatorDisplay(),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8.0,
                ),
                child: CalculatorKeyboardGrid(),
              ),
            ].reversed.toList(),
          ),
        );
      },
    );
  }
}
