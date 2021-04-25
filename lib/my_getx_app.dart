import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_themes.dart';

class MyGetxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: CustomThemes.lightStandardTheme,
      darkTheme: CustomThemes.darkStandardTheme,
      home: _FirstScreen(),
    );
  }
}

class _FirstScreen extends StatelessWidget {
  String theme = "First Theme";
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
            onPressed: _changeTheme,
          ),
        ),
      ),
    );
  }

  void _changeTheme() {
    print("button pressed, count == $count");
    count == 3 ? count = 0 : count++;
    if (CustomThemes.availableThemes[count].brightness == Brightness.dark) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    Get.changeTheme(CustomThemes.availableThemes[count]);
    theme = count == 0
        ? "Light Standard"
        : count == 1
            ? "Dark Standard"
            : count == 2
                ? "Light Extra"
                : "Dark Extra";
  }
}
