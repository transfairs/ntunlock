import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisclaimerDialog extends StatefulWidget {
  final Widget child;

  const DisclaimerDialog({super.key, required this.child});

  @override
  DisclaimerDialogState createState() => DisclaimerDialogState();
}

class DisclaimerDialogState extends State<DisclaimerDialog> {
  bool _hasAgreed = false;

  @override
  void initState() {
    super.initState();
    _checkAgreementStatus();
  }

  _checkAgreementStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _hasAgreed = prefs.getBool('agreed_to_disclaimer') ?? false;
    });
  }

  _storeAgreement() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('agreed_to_disclaimer', true);
  }

  @override
  Widget build(BuildContext context) {
    final localised = AppLocalizations.of(context)!;

    return _hasAgreed
        ? widget.child
        : Scaffold(
            body: Center(
              child: AlertDialog(
                title: Text(localised.disclaimer),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localised.disclaimerBody,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _storeAgreement();
                      setState(() {
                        _hasAgreed = true;
                      });
                    },
                    child: Text(localised.agree),
                  ),
                ],
              ),
            ),
          );
  }
}
