import 'package:calculadora/controllers/calculator/calculator.controller.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    required this.controller,
  });

  final CalculatorController controller;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final theme = Theme.of(context);
    final displayColor = brightness == Brightness.dark
        ? YaruColors.inkstone
        : YaruColors.porcelain;

    return Container(
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        color: displayColor,
        border: Border(
          top: BorderSide(color: theme.dividerColor),
        ),
      ),
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
