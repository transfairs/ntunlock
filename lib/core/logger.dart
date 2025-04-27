import 'package:logger/logger.dart';

/// Logger configuration using the logger package.
/// It sets up the logger with a filter, a printer for pretty logs, and console output.
final Logger logger = Logger(
  filter:
      DevelopmentFilter(), // Filter to limit log output to development builds.
  printer: PrettyPrinter(), // Pretty format for console logs.
  output: ConsoleOutput(), // Log output to the console.
);
