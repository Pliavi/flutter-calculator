import 'package:calculadora/controllers/calculator/button_actions/button_action.dart';
import 'package:calculadora/controllers/calculator/calculator.controller.dart';

class HistoryEntryButtonAction extends ButtonActionStrategy {
  final String historyEntry;

  const HistoryEntryButtonAction(this.historyEntry);

  @override
  void onPressed(CalculatorController controller) {
    final expression = historyEntry.split(' = ').first;
    controller.display = expression;
  }
}
