import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'package:nt_unlock/core/app_state.dart';

/// Entry point of the application.
///
/// This function initializes and launches the app.
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const App(),
    ),
  );
}
