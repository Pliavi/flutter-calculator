import 'package:calculadora/controllers/calculator/calculator.controller.dart';
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
