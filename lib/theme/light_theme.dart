import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_gradient_colors.dart';

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xFFF0F0F0),
  colorScheme: ThemeData.light().colorScheme.copyWith(
        surface: const Color(0xFFECECEC),
        onSurface: const Color(0xFF202020),
      ),
  textTheme: GoogleFonts.interTextTheme(
    ThemeData.light().textTheme.apply(
          bodyColor: Colors.black87,
          displayColor: Colors.black87,
        ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.black87,
  ),
  extensions: <ThemeExtension<dynamic>>[
    const AppGradientColors(
      start: Color(0xFFE0E0E0),
      end: Color(0xFFB0B0B0),
    ),
  ],
);
