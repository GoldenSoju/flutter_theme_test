import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_themes.dart';

class MyProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeChanger(CustomThemes.darkStandardTheme)),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme,
      darkTheme: theme.getTheme,
      home: _FirstScreen(),
    );
  }
}

class _FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<_FirstScreen> {
  String theme = "First Theme";
  int count = 0;

  @override
  Widget build(BuildContext context) {
    var _themeProvider = Provider.of<ThemeChanger>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "First Screen",
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                ),
                child: Text(
                  theme,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
                onPressed: () {
                  print("button pressed, count == $count");
                  count == 3 ? count = 0 : count++;
                  _themeProvider.setTheme(CustomThemes.availableThemes[count]);
                  setState(() {
                    theme = count == 0
                        ? "Light Standard"
                        : count == 1
                            ? "Dark Standard"
                            : count == 2
                                ? "Light Extra"
                                : "Dark Extra";
                  });
                })),
      ),
    );
  }
}

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  get getTheme => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
