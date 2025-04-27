import 'package:flutter/material.dart';

/// A row of 6 text fields for entering digits, styled according to theme.
class InputFields extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final void Function(int index, String value) onChanged;

  const InputFields({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final fill = theme.colorScheme.surface.withValues(alpha: 0.1);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: textColor.withValues(alpha: 0.3)),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          width: 42,
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            autofocus: index == 0,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontSize: 24,
              color: textColor,
            ),
            cursorColor: textColor,
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: fill,
              border: border,
              enabledBorder: border,
              focusedBorder: border.copyWith(
                borderSide: BorderSide(color: textColor),
              ),
            ),
            onChanged: (value) => onChanged(index, value),
          ),
        );
      }),
    );
  }
}
