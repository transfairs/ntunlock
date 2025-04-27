import 'package:flutter/material.dart';
import 'package:nt_unlock/presentation/widgets/clickable_links.dart';

/// A themed text container with optional logo and scrollable content.
class TextCard extends StatelessWidget {
  final String text;
  final bool showLogo;
  final String? title;
  final TextAlign textAlign;

  const TextCard({
    super.key,
    required this.text,
    this.showLogo = false,
    this.title,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;
    final surface = theme.colorScheme.surface;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final logoPath =
        isDark ? 'assets/icon/logo-dark.png' : 'assets/icon/logo.png';

    return Container(
      constraints: const BoxConstraints(maxHeight: 600),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: surface.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showLogo)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Image.asset(
                logoPath,
                height: 96,
              ),
            ),
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                title!,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          Flexible(
            child: SingleChildScrollView(
              child: ClickableLinks(
                text: text,
                textAlign: textAlign,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: onSurface,
                  height: 1.6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
