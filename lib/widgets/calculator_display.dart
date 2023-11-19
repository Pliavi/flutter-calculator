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
    final Brightness brightness = Theme.of(context).brightness;

    return Container(
      alignment: Alignment.bottomRight,
      color: brightness == Brightness.dark
          ? YaruColors.inkstone
          : YaruColors.porcelain,
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
