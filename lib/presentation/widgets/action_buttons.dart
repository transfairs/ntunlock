import 'package:flutter/material.dart';

/// A reusable action button with label and optional disabling.
///
/// Used for both calculation and reset actions.
class ActionButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const ActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final overlayHover = isDark
        ? theme.colorScheme.onSurface.withValues(alpha: 0.05)
        : Color(0xFFBBDEFB); // theme.colorScheme.primary.withOpacity(0.08);

    final overlayPressed = isDark
        ? theme.colorScheme.onSurface.withValues(alpha: 0.1)
        : Color(0xFF5FB3E9); // theme.colorScheme.primary.withOpacity(0.12);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: theme.colorScheme.onSurface,
        backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.1),
        disabledForegroundColor:
            theme.colorScheme.onSurface.withValues(alpha: 0.3),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
          ),
        ),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return overlayHover; // theme.colorScheme.onSurface.withValues(alpha: 0.05);
            }
            if (states.contains(WidgetState.pressed)) {
              return overlayPressed; // theme.colorScheme.onSurface.withValues(alpha: 0.1);
            }
            return null;
          },
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
