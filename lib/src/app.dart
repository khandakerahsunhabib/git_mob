import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/screens/splash_screen.dart';
import 'settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GitMob',
          home: const SplashScreen(),
          theme: ThemeData(primarySwatch: Colors.amber),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
        );
      },
    );
  }
}
