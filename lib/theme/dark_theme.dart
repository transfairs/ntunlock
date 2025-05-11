import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_gradient_colors.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    brightness: Brightness.dark,
    surface: Colors.grey[850],
  ),
  textTheme: GoogleFonts.interTextTheme(
    Typography.material2021().white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.white,
  ),
  extensions: <ThemeExtension<dynamic>>[
    const AppGradientColors(
      start: Color(0xFF141E30),
      end: Color(0xFF243B55),
    ),
  ],
);

/*.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xFF141E30),
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        surface: Colors.grey[800],
        onSurface: Colors.white70,
      ),
  textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
);
*/
