import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nt_unlock/presentation/screens/code_screen.dart';

void main() {
  testWidgets('shows German strings', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('de'),
        supportedLocales: [Locale('en'), Locale('de')],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: CodeScreen(),
      ),
    );

    expect(find.text('Berechnen'), findsOneWidget);
  });

  testWidgets('shows English strings', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        supportedLocales: [Locale('en'), Locale('de')],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: CodeScreen(),
      ),
    );

    final foundText = find.text('Calculate');
    if (foundText.evaluate().isEmpty) {
      debugPrint('Expected "Calculate" but found:');
      final allTextWidgets = find.byType(Text);
      for (final e in allTextWidgets.evaluate()) {
        final w = e.widget as Text;
        debugPrint(' - ${w.data}');
      }
    }

    expect(find.text('Calculate'), findsOneWidget);
  });
}
