import 'package:calculadora/controllers/calculator/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CalculatorController>();
    final brightness = Theme.of(context).brightness;
    final displayColor = brightness == Brightness.dark
        ? YaruColors.inkstone
        : YaruColors.porcelain;

    return Container(
      alignment: Alignment.bottomRight,
      color: displayColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      // TODO: The Fittebox is necessary to avoid overflow
      //       when the display is too big.
      //       But, if the user types a lot of digits, the display
      //       will be too small.
      //       It needs a way to keep the fittebox, but in addition
      //       add some linebreaks on operator characters.
      //       NOTE: I'm copying this idea from Xiaomi's calculator.
      //       Maybe we will need 2 different displays variables
      //       One to be calculated with no breaklines
      //       and another to be displayed with all the formatting stuff
      //       It will be also greate because we can use this to show
      //       visual operators like "×" and "÷" instead of "*" and "/"
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          controller.display,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
