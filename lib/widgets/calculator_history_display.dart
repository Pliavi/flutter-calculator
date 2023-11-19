import 'package:calculadora/controllers/calculator/calculator.controller.dart';
import 'package:flutter/material.dart';

class CalculatorHistoryDisplay extends StatelessWidget {
  const CalculatorHistoryDisplay({
    super.key,
    required ScrollController scrollController,
    required this.controller,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final CalculatorController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      alignment: Alignment.bottomRight,
      color: theme.cardColor,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: controller.history.length,
        separatorBuilder: (context, index) => const Divider(
          height: 16,
        ),
        itemBuilder: (context, index) {
          return Text(
            controller.history[index],
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }
}
