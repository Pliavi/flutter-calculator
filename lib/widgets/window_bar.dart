import 'package:calculadora/widgets/theme_switcher_button.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru/yaru.dart';

class WindowBar extends StatelessWidget {
  const WindowBar({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final theme = Theme.of(context);

    final appBarBottomBorder = brightness == Brightness.dark
        ? const Border(
            bottom: BorderSide(
              color: YaruColors.darkJet,
              width: 1,
            ),
          )
        : null;

    final titleTextStyle = theme.appBarTheme.titleTextStyle?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );

    return GestureDetector(
      onTapDown: (details) => windowManager.startDragging(),
      child: AppBar(
        shape: appBarBottomBorder,
        title: const Text('Calculadora'),
        centerTitle: true,
        elevation: 4,
        titleTextStyle: titleTextStyle,
        shadowColor: Colors.black26,
        actions: [
          const ThemeSwitcherButton(),
          const SizedBox(width: 8),
          SizedBox.square(
            dimension: 24,
            child: IconButton.filled(
              iconSize: 16,
              color: Colors.white,
              onPressed: () => windowManager.close(),
              icon: const Icon(Icons.close),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
