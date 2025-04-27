import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nt_unlock/presentation/widgets/gradient_background.dart';
import 'package:nt_unlock/theme/light_theme.dart';

void main() {
  testWidgets('GradientBackground renders with fallback', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GradientBackground(child: Text('Fallback Test')),
      ),
    );

    expect(find.text('Fallback Test'), findsOneWidget);
  });

  testWidgets('GradientBackground renders with AppGradientColors extension',
      (tester) async {
    final theme = lightTheme;

    await tester.pumpWidget(
      MaterialApp(
        theme: theme,
        home: const GradientBackground(child: Text('With Extension')),
      ),
    );

    expect(find.text('With Extension'), findsOneWidget);
  });
}
