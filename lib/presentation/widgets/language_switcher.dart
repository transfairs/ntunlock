import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nt_unlock/core/app_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// A language option model for displaying and switching locales.
class LanguageOption {
  final Locale? locale;
  final String label;

  const LanguageOption(this.locale, this.label);
}

/// A widget allowing the user to switch the application's language.
/// It is designed to be easily extendable for additional locales.
class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final currentLocale = appState.locale;
    final localised = AppLocalizations.of(context)!;

    // Define available language options (including system default).
    final languageOptions = <LanguageOption>[
      LanguageOption(null, localised.languageSystem),
      const LanguageOption(Locale('de'), 'Deutsch'),
      const LanguageOption(Locale('en'), 'English'),
      // Add more languages here as needed, e.g.:
      // const LanguageOption(Locale('fr'), 'Français'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(localised.drawerLanguage),
        ),
        for (final option in languageOptions)
          RadioListTile<Locale?>(
            value: option.locale,
            groupValue: currentLocale,
            onChanged: (value) => appState.switchLocale(value),
            title: Text(option.label),
          ),
      ],
    );
  }
}
