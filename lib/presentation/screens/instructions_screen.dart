import 'package:flutter/material.dart';
import 'package:nt_unlock/presentation/widgets/app_drawer.dart';
import 'package:nt_unlock/presentation/widgets/app_logo_bar.dart';
import 'package:nt_unlock/presentation/widgets/gradient_background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nt_unlock/presentation/widgets/text_card.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localised = AppLocalizations.of(context)!;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const AppLogoBar(),
      extendBodyBehindAppBar: true,
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextCard(
              text: localised.instructionsBody,
              title: localised.instructionsTitle,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}
