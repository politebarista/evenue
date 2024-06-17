abstract interface class ErrorLogger {
  Future<void> sendError(
    Object exception,
    StackTrace stackTrace, {
    bool isFatal,
  });

  Future<void> sendFlutterError(Object exception, {bool isFatal});
}
