import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String _input = '';
  String _output = '';
  Locale? _locale; // = const Locale('en');
  ThemeMode _themeMode = ThemeMode.system;

  String get input => _input;
  String get output => _output;
  Locale? get locale => _locale;
  ThemeMode get themeMode => _themeMode;

  void setInput(String value) {
    _input = value;
    notifyListeners();
  }

  void setOutput(String value) {
    _output = value;
    notifyListeners();
  }

  void reset() {
    _input = '';
    _output = '';
    notifyListeners();
  }

  void switchLocale(Locale? newLocale) {
    _locale = newLocale;
    notifyListeners();
  }

  void toggleTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
