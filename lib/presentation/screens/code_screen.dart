import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:nt_unlock/logic/code_generator.dart';
import 'package:nt_unlock/l10n/l10n.dart';
//import 'package:nt_unlock/core/app_state.dart';
import 'package:nt_unlock/presentation/widgets/app_drawer.dart';
import 'package:nt_unlock/presentation/widgets/app_logo_bar.dart';
import 'package:nt_unlock/presentation/widgets/action_buttons.dart';
import 'package:nt_unlock/presentation/widgets/gradient_background.dart';
import 'package:nt_unlock/presentation/widgets/input_fields.dart';
import 'package:nt_unlock/presentation/widgets/result_display.dart';
//import 'package:provider/provider.dart';

/// Main screen of the application.
///
/// Displays the input interface and generated result in a stylised layout.
class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final _controllers = List.generate(6, (_) => TextEditingController());
  final _focusNodes = List.generate(6, (_) => FocusNode());
  bool _submitted = false;
  String _result = '';

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.length > 1) {
      _controllers[index].text = value[0];
    }
    setState(() {});
  }

  Future<void> _submit() async {
    final input = _controllers.map((c) => c.text).join();
    if (input.length != 6 || int.tryParse(input) == null) return;

    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 50);
    }

    final number = int.parse(input);
    final code = CodeGenerator.generateCode(number);

    setState(() {
      _result = code.toString().padLeft(6, '0');
      _submitted = true;
    });
  }

  void _reset() {
    for (final c in _controllers) {
      c.clear();
    }
    _focusNodes.first.requestFocus();
    setState(() {
      _submitted = false;
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    //final appState = context.watch<AppState>();
    final localised = AppLocalizations.of(context)!;
    final ready = _controllers.every((c) => c.text.length == 1);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final logoPath =
        isDark ? 'assets/icon/logo-dark.png' : 'assets/icon/logo.png';

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const AppLogoBar(),
      extendBodyBehindAppBar: true,
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 96),
              Image.asset(
                logoPath,
                height: 96,
              ),
              const SizedBox(height: 16),
/*    
              Text(
                localised.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                textAlign: TextAlign.center,
              ),
*/
              const SizedBox(height: 32),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: !_submitted
                    ? Column(
                        key: const ValueKey('input'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InputFields(
                            controllers: _controllers,
                            focusNodes: _focusNodes,
                            onChanged: _onChanged,
                          ),
                          const SizedBox(height: 30),
                          ActionButton(
                            label: localised.calculate,
                            onPressed: ready ? _submit : null,
                          ),
                        ],
                      )
                    : Column(
                        key: const ValueKey('result'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${localised.input} ${_controllers.map((c) => c.text).join()}',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.6)),
                          ),
                          const SizedBox(height: 24),
                          ResultDisplay(code: _result),
                          const SizedBox(height: 32),
                          ActionButton(
                            label: localised.reset,
                            onPressed: _reset,
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
