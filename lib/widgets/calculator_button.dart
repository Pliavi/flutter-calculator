import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.controller,
    required this.action,
    required this.text,
    this.backgroundColor,
  });

  final CalculatorController controller;
  final ButtonActionStrategy action;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: () => controller.onButtonPressed(action),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
