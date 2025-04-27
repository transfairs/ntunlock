import 'package:flutter/material.dart';
import 'package:nt_unlock/theme/app_gradient_colors.dart';

/// A reusable background with a diagonal blue-grey gradient.
///
/// Wrap any child widget with this to apply the gradient styling.
class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final extension = Theme.of(context).extension<AppGradientColors>();
    final gradient = extension ??
        const AppGradientColors(
          start: Color(0xFF888888),
          end: Color(0xFF444444),
        );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradient.start, gradient.end],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
