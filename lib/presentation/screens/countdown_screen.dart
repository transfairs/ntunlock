import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nt_unlock/presentation/widgets/gradient_background.dart';
import 'package:nt_unlock/presentation/widgets/app_drawer.dart';
import 'package:nt_unlock/presentation/widgets/app_logo_bar.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});

  @override
  CountdownScreenState createState() => CountdownScreenState();
}

class CountdownScreenState extends State<CountdownScreen> {
  double _timeLeft = 7.0; // Base time in seconds
  late Timer? _timer;
  bool _isRunning = false;

  void _startCountdown() {
    if (_isRunning) return;

    setState(() {
      _isRunning = true;
      _timeLeft = 7.0; // Reset to 7 seconds when starting
    });

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft -= 0.1; // Decrease by 0.1 second (100ms)
          if (_timeLeft < 0) {
            _timeLeft = 0; // Ensure the time doesn't go negative
          }
        });
      } else {
        _timer!.cancel();
        _timeLeft = 7.0;
        setState(() {
          _isRunning = false;
        });
      }
    });
  }

  @override
  void dispose() {
    if (_isRunning) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const AppLogoBar(),
      extendBodyBehindAppBar: true,
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _startCountdown,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Circular progress indicator
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: CircularProgressIndicator(
                            value: _isRunning
                                ? (_timeLeft /
                                    7) // Update progress based on remaining time
                                : 0,
                            strokeWidth: 6, // Thinner stroke width
                            backgroundColor: theme.brightness == Brightness.dark
                                ? Colors.grey[700]
                                : Color(0xFFBBDEFB),
                            valueColor: AlwaysStoppedAnimation(
                              theme.brightness == Brightness.dark
                                  ? Colors.orange
                                  : Color(0xFF5FB3E9),
                            ),
                          ),
                        ),
                        // Digital display in the center
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Seconds
                            Text(
                              _timeLeft.toStringAsFixed(
                                  1), // Display time with 1 decimal place
                              style: theme.textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 64,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Use AnimatedSwitcher to ensure smooth transition and avoid layout shifting
                  /*
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _timeLeft <= 0
                        ? Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Text(
                              localised.countdownEnd,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.red,
                              ),
                            ),
                          )
                        : const SizedBox(), // Empty placeholder when countdown isn't finished
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
