import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nt_unlock/app.dart';
import 'package:nt_unlock/core/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('enters six digits and sees result', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AppState(),
        child: const App(),
      ),
    );

    final agreeButton = find.textContaining(
        RegExp(r'Verstanden und Zustimmen|Understood and agree'));
    expect(agreeButton, findsOneWidget);
    await tester.tap(agreeButton);
    await tester.pumpAndSettle();

    final fields = find.byType(TextField);
    expect(fields, findsNWidgets(6));

    for (int i = 0; i < 6; i++) {
      await tester.enterText(fields.at(i), '${(i + 1) % 10}');
    }

    await tester.pumpAndSettle();

    final button = find.textContaining(RegExp(r'Berechnen|Calculate'));
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(find.byType(Text), findsWidgets);
    expect(find.textContaining(RegExp(r'\d{6}')), findsWidgets);
  });
}
