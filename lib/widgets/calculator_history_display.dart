import 'package:calculadora/controllers/calculator/button_actions/history_entry_button_action.dart';
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
      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: controller.history.length,
        itemBuilder: (context, index) {
          final key = controller.history.keys.elementAt(index);
          final historyEntry = controller.history[key]!;

          return Dismissible(
            key: key,
            direction: DismissDirection.startToEnd,
            onDismissed: (_) => controller.removeFromHistory(key),
            background: const _DismissibleBackground(),
            child: _EntryButton(controller: controller, text: historyEntry),
          );
        },
      ),
    );
  }
}

class _DismissibleBackground extends StatelessWidget {
  const _DismissibleBackground();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: double.infinity,
      color: theme.primaryColor,
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: screenSize.width * 0.4,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 16,
            ),
            SizedBox(width: 8),
            Text(
              'Remover',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EntryButton extends StatelessWidget {
  const _EntryButton({
    required this.controller,
    required this.text,
  });

  final CalculatorController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () => controller.onButtonPressed(
          HistoryEntryButtonAction(text),
        ),
        style: TextButton.styleFrom(
          alignment: Alignment.centerRight,
          foregroundColor: theme.textTheme.bodyMedium?.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
