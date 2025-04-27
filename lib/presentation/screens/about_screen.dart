import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nt_unlock/presentation/widgets/app_drawer.dart';
import 'package:nt_unlock/presentation/widgets/app_logo_bar.dart';
import 'package:nt_unlock/presentation/widgets/gradient_background.dart';
import 'package:nt_unlock/presentation/widgets/text_card.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Displays information about the app, including dynamic version from pubspec.
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _version = '${info.version} (build ${info.buildNumber})';
    });
  }

  @override
  Widget build(BuildContext context) {
    final localised = AppLocalizations.of(context)!;
    final fullText = _version.isEmpty
        ? localised.aboutBody
        : 'Version: $_version\n\n${localised.aboutBody}';

    final acknowledgementsText = localised.aboutAcknowledgementsBody;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const AppLogoBar(),
      extendBodyBehindAppBar: true,
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80),
            child: TextCard(
              showLogo: true,
              text: '$fullText\n\n$acknowledgementsText',
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}
