import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_gradient_colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: const Color(0xFFF1F3F5),
  textTheme: GoogleFonts.interTextTheme(
    Typography.material2021().black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.black,
  ),
  extensions: const [
    AppGradientColors(
      start: Color(0xFFE3F2FD),
      end: Color(0xFFBBDEFB),
    ),
  ],
);
