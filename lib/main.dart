import 'package:calculadora/config/window_manager_config.dart';
import 'package:calculadora/screens/calculator.view.dart';
import 'package:calculadora/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await const WindowManagerConfig().bootstrap();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeSwitcher = ThemeSwitcher();

    return ThemeSwitcherProvider(
      themeSwitcher: themeSwitcher,
      child: ListenableBuilder(
        listenable: themeSwitcher,
        builder: (context, child) => YaruTheme(
          data: YaruThemeData(variant: themeSwitcher.variant),
          builder: (context, yaru, child) {
            return MaterialApp(
              title: 'Calculadora',
              theme: yaru.theme,
              darkTheme: yaru.darkTheme,
              home: const Calculator(),
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
