import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nt_unlock/app.dart';
import 'package:nt_unlock/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('enter digits and generate code', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const App(),
      ),
    );

    final agreeButton = find.textContaining(
        RegExp(r'Verstanden und Zustimmen|Understood and agree'));
    expect(agreeButton, findsOneWidget);
    await tester.tap(agreeButton);
    await tester.pumpAndSettle();

    final inputs = find.byType(TextField);
    expect(inputs, findsNWidgets(6));

    for (int i = 0; i < 6; i++) {
      await tester.enterText(inputs.at(i), i.toString());
    }

    await tester.pumpAndSettle();

    final calcBtn = find.textContaining(RegExp(r'Berechnen|Calculate'));
    expect(calcBtn, findsOneWidget);
    await tester.tap(calcBtn);
    await tester.pumpAndSettle();

    expect(find.byType(AnimatedContainer), findsNWidgets(6));

    expect(find.text('012345'), findsNothing);
  });
}
