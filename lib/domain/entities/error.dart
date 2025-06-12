class BaseError {
  final String message;
  final String stackTrace;

  BaseError({
    required this.message,
    this.stackTrace = '',
  });
}
