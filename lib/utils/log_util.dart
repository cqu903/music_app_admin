// ignore_for_file: lines_longer_than_80_chars, cascade_invocations

// Singleton (factory)
import 'package:simple_logger/simple_logger.dart';

SimpleLogger logger() {
  final logger = SimpleLogger();
  logger.setLevel(
    Level.INFO,
    // Includes  caller info, but this is expensive.
    includeCallerInfo: true,
  );
  return logger;
}
