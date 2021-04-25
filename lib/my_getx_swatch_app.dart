import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_themes.dart';

class MyGetxSwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _FirstScreen(),
    );
  }
}

class _FirstScreen extends StatelessWidget {
  String theme = "Blue";
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.surface,
        title: Text(
          "First Screen",
          style: TextStyle(color: context.theme.colorScheme.onSurface),
        ),
      ),
      body: Container(
        width: context.mediaQuerySize.width,
        height: context.mediaQuerySize.height,
        child: Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.colorScheme.primary),
            ),
            child: Text(
              theme,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            onPressed: _changeThemeSwatch,
          ),
        ),
      ),
    );
  }

  void _changeThemeSwatch() {
    print("button pressed, count == $count");
    count == 3 ? count = 0 : count++;

    //TODO: comment this if-else-statement out to break it
    if (CustomThemes.availableSwatchThemes[count].brightness ==
        Brightness.dark) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    Get.changeTheme(CustomThemes.availableSwatchThemes[count]);
    theme = count == 0
        ? "Blue"
        : count == 1
            ? "Green"
            : count == 2
                ? "Red"
                : "Yellow";
  }
}
