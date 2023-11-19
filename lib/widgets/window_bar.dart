import 'package:calculadora/widgets/theme_switcher_button.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru/yaru.dart';

class WindowBar extends StatefulWidget implements PreferredSizeWidget {
  const WindowBar({
    super.key,
  });

  @override
  State<WindowBar> createState() => _WindowBarState();

  @override
  Size get preferredSize => const Size.fromHeight(46);
}

class _WindowBarState extends State<WindowBar> {
  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: (details) => windowManager.startDragging(),
      child: AppBar(
        shape: brightness == Brightness.dark
            ? const Border(
                bottom: BorderSide(
                  color: YaruColors.darkJet,
                  width: 1,
                ),
              )
            : null,
        title: const Text('Calculadora'),
        centerTitle: true,
        elevation: 4,
        titleTextStyle: theme.appBarTheme.titleTextStyle?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
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
