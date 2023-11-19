import 'package:calculadora/config/window_manager_config.dart';
import 'package:calculadora/providers/theme_switcher.dart';
import 'package:calculadora/screens/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider(
      create: (context) => ThemeSwitcher(),
      builder: (context, child) {
        final themeSwitcher = context.watch<ThemeSwitcher>();

        return YaruTheme(
          data: YaruThemeData(variant: themeSwitcher.variant),
          builder: (context, yaru, child) {
            return MaterialApp(
              title: 'Calculadora',
              theme: yaru.theme,
              darkTheme: yaru.darkTheme,
              home: const CalculatorView(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
