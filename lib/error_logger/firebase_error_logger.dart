import 'package:evenue/error_logger/error_logger.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';

final class FirebaseErrorLogger implements ErrorLogger {
  Future<void> sendError(
    final Object exception,
    final StackTrace? stackTrace, {
    bool isFatal = false,
  }) async {
    await FirebaseCrashlytics.instance.recordError(
      exception,
      stackTrace,
      fatal: isFatal,
    );
  }

  Future<void> sendFlutterError(
    final Object exception, {
    bool isFatal = false,
  }) async {
    await FirebaseCrashlytics.instance.recordFlutterError(
      FlutterErrorDetails(exception: exception),
      fatal: isFatal,
    );
  }
}
