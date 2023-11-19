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
