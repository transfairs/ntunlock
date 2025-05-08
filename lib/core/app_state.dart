import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:nt_unlock/core/logger.dart';

/// A [ChangeNotifier] that manages and persists app-wide settings,
/// such as the user's preferred [Locale] and [ThemeMode].
///
/// Settings are persisted using [SharedPreferences] and are restored on initialisation.
class AppState extends ChangeNotifier {
  Locale? _locale;
  Brightness? _systemBrightness;
  ThemeMode _themeMode = ThemeMode.system;

  Locale? get locale => _locale;
  ThemeMode get themeMode => _themeMode;

  AppState() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    final langCode = prefs.getString('locale');
    if (langCode != null && langCode.isNotEmpty) {
      _locale = Locale(langCode);
    }

    final themeString = prefs.getString('themeMode');
    if (themeString != null) {
      _themeMode = _parseThemeMode(themeString);
    }

    notifyListeners();
  }

  /// Sets the system brightness if it hasn't been initialised yet.
  ///
  /// This is used to derive a default theme mode if the user hasn't chosen one.
  void initSystemBrightness(Brightness brightness) {
    _systemBrightness ??= brightness;
  }

  Future<void> switchLocale(Locale? newLocale) async {
    _locale = newLocale;
    final prefs = await SharedPreferences.getInstance();
    if (newLocale != null) {
      await prefs.setString('locale', newLocale.languageCode);
    } else {
      await prefs.remove('locale');
    }
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _systemBrightness = _systemBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
    _themeMode =
        _systemBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', _themeMode.name);
    notifyListeners();
  }

  ThemeMode _parseThemeMode(String value) {
    switch (value) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  void reset() {
    _locale = null;
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
}
