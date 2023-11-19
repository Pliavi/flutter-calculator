import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowManagerConfig {
  const WindowManagerConfig();

  bootstrap() async {
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

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
