import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:nt_unlock/core/app_state.dart';
import 'package:nt_unlock/presentation/widgets/language_switcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();
    final localised = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    appState.initSystemBrightness(theme.brightness);
    final isDarkMode = theme.brightness == Brightness.dark;
    final themeText = isDarkMode
        ? AppLocalizations.of(context)!.activateLight
        : AppLocalizations.of(context)!.activateDark;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF141E30), Color(0xFF243B55)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/icon/splash.png',
                    height: 72,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    tooltip:
                        MaterialLocalizations.of(context).closeButtonTooltip,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book, color: Colors.green),
            title: Text(localised.instructionsTitle),
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/instructions'),
          ),
          ListTile(
            leading: const Icon(Icons.timer, color: Colors.orange),
            title: Text(localised.countdownTitle),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/countdown');
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.blue),
            title: Text(localised.codeScreen),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          Divider(
              color: isDarkMode
                  ? Colors.white.withValues(alpha: 0.26)
                  : Colors.black.withValues(alpha: 0.26)),
          ListTile(
              leading: Icon(Icons.language),
              title: Text(localised.drawerLanguage),
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => const LanguageSwitcher(),
                );
              }),
          ListTile(
            leading: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: isDarkMode ? Colors.yellow : Colors.indigo,
            ),
            title: Text(themeText),
            onTap: () {
              Provider.of<AppState>(context, listen: false).toggleTheme();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.teal),
            title: Text(localised.about),
            onTap: () => Navigator.pushReplacementNamed(context, '/about'),
          ),
          /*
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: Text(localised.exitApp),
            onTap: () => exit(0),
          ),
          */
        ],
      ),
    );
  }
}
