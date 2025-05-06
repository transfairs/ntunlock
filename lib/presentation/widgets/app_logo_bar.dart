import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLogoBar extends StatelessWidget implements PreferredSizeWidget {
  const AppLogoBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final localised = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(localised.title),
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      elevation: 0,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
