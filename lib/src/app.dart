import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GitHub Mobile App',
          home: const SplashScreen(),
          theme: ThemeData(primarySwatch: Colors.amber),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
        );
      },
    );
  }
}
