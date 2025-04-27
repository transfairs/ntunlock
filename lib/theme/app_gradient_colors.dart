import 'package:flutter/material.dart';

@immutable
class AppGradientColors extends ThemeExtension<AppGradientColors> {
  final Color start;
  final Color end;

  const AppGradientColors({required this.start, required this.end});

  @override
  AppGradientColors copyWith({Color? start, Color? end}) {
    return AppGradientColors(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  @override
  AppGradientColors lerp(ThemeExtension<AppGradientColors>? other, double t) {
    if (other is! AppGradientColors) return this;
    return AppGradientColors(
      start: Color.lerp(start, other.start, t)!,
      end: Color.lerp(end, other.end, t)!,
    );
  }
}
