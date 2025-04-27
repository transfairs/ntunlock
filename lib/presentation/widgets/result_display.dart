import 'package:flutter/material.dart';

/// Displays the generated 6-digit code in animated boxes.
///
/// Each digit is placed in its own styled container.
class ResultDisplay extends StatelessWidget {
  final String code;

  const ResultDisplay({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: code.split('').map((digit) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 48,
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            digit,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }
}
