import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nt_unlock/theme/app_theme.dart';
import 'package:nt_unlock/theme/theme_provider.dart';
import 'package:nt_unlock/presentation/screens/countdown_screen.dart';
import 'package:nt_unlock/presentation/screens/code_screen.dart';
import 'package:nt_unlock/presentation/screens/about_screen.dart';
import 'package:nt_unlock/presentation/screens/instructions_screen.dart';
import 'package:nt_unlock/presentation/widgets/disclaimer_dialog.dart';
import 'package:provider/provider.dart';

/// Root widget of the application.
///
/// Sets up localisation, theming and routing for the app.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NTUnlock',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeProvider.themeMode,
          // locale: Locale('en'),
          supportedLocales: const [
            Locale('en'),
            Locale('de'),
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale != null) {
              for (final supported in supportedLocales) {
                if (supported.languageCode == locale.languageCode) {
                  return supported;
                }
              }
            }
            return supportedLocales.first;
          },
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          /*
          initialRoute: '/',
          routes: {
            '/': (context) => const CodeScreen(),
            '/about': (context) => const AboutScreen(),
            '/instructions': (context) => const InstructionsScreen(),
            '/countdown': (context) => const CountdownScreen(),
          },
          */
          home: DisclaimerDialog(
            child: Builder(
              builder: (context) {
                return Navigator(
                  onGenerateRoute: (settings) {
                    switch (settings.name) {
                      case '/':
                        return MaterialPageRoute(
                          builder: (_) => const CodeScreen(),
                        );
                      case '/about':
                        return MaterialPageRoute(
                          builder: (_) => const AboutScreen(),
                        );
                      case '/instructions':
                        return MaterialPageRoute(
                          builder: (_) => const InstructionsScreen(),
                        );
                      case '/countdown':
                        return MaterialPageRoute(
                          builder: (_) => const CountdownScreen(),
                        );
                      default:
                        return null;
                    }
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
