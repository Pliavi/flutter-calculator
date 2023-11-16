import 'package:calculadora/screens/calculator.view.dart';
import 'package:calculadora/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru/yaru.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(450, 790),
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
    maximumSize: Size(450, 790),
    minimumSize: Size(450, 790),
    title: "Calculadora",
    backgroundColor: Colors.transparent,
  );
  windowManager.setAspectRatio(1 / 1.75);

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

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
