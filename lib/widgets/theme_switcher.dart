import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class ThemeSwitcher extends ChangeNotifier {
  final List<YaruVariant> availableVariants = [
    YaruVariant.viridian,
    YaruVariant.ubuntuCinnamonBrown,
    YaruVariant.magenta,
    YaruVariant.purple,
    YaruVariant.lubuntuBlue,
  ];

  final List<String> variantNames = [
    'Green',
    'Orange',
    'Magenta',
    'Purple',
    'Blue',
  ];

  YaruVariant _variant = YaruVariant.viridian;
  YaruVariant get variant => _variant;

  set variant(YaruVariant variant) {
    _variant = variant;

    notifyListeners();
  }
}

class ThemeSwitcherProvider extends InheritedWidget {
  const ThemeSwitcherProvider({
    super.key,
    required this.themeSwitcher,
    required Widget child,
  }) : super(child: child);

  final ThemeSwitcher themeSwitcher;

  static ThemeSwitcherProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcherProvider>()!;
  }

  @override
  bool updateShouldNotify(ThemeSwitcherProvider oldWidget) {
    return oldWidget.themeSwitcher != themeSwitcher;
  }
}
