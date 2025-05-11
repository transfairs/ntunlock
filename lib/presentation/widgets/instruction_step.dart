import 'package:flutter/material.dart';
import 'package:nt_unlock/presentation/widgets/clickable_links.dart';

class InstructionStep extends StatelessWidget {
  final int number;
  final String content;

  const InstructionStep({
    super.key,
    required this.number,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number.',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(width: 12),
          Expanded(
              child: ClickableLinks(
            text: content,
            textAlign: TextAlign.justify,
            style: theme.textTheme.bodyMedium?.copyWith(
              // color: onSurface,
              height: 1.6,
            ),
          )),
        ],
      ),
    );
  }
}
