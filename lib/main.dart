import 'package:calculadora/screens/calculator.view.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru/yaru.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(450, 790),
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    maximumSize: Size(450, 790),
    minimumSize: Size(450, 790),
    title: "Calculadora",
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
    return YaruTheme(
      builder: (context, yaru, child) {
        return MaterialApp(
          title: 'Calculadora',
          theme: yaru.theme,
          darkTheme: yaru.darkTheme,
          home: const Calculator(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
