import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nt_unlock/presentation/widgets/app_drawer.dart';
import 'package:nt_unlock/presentation/widgets/app_logo_bar.dart';
import 'package:nt_unlock/presentation/widgets/instruction_step.dart';
import 'package:nt_unlock/presentation/widgets/gradient_background.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localised = AppLocalizations.of(context)!;

    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppLogoBar(title: localised.instructionsTitle),
        extendBodyBehindAppBar: true,
        body: GradientBackground(
            child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView(
                      padding: const EdgeInsets.only(top: kToolbarHeight + 32),
                      children: [
                        InstructionStep(
                          number: 1,
                          content: localised.instruction1,
                        ),
                        InstructionStep(
                          number: 2,
                          content: localised.instruction2,
                        ),
                        InstructionStep(
                          number: 3,
                          content: localised.instruction3,
                        ),
                        InstructionStep(
                          number: 4,
                          content: localised.instruction4,
                        ),
                        InstructionStep(
                          number: 5,
                          content: localised.instruction5,
                        ),
                        InstructionStep(
                          number: 6,
                          content: localised.instruction6,
                        ),
                        InstructionStep(
                          number: 7,
                          content: localised.instruction7,
                        ),
                        InstructionStep(
                          number: 8,
                          content: localised.instruction8,
                        ),
                        InstructionStep(
                          number: 9,
                          content: localised.instruction9,
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
