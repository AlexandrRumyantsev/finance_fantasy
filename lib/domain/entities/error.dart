class BaseError {
  BaseError({
    required this.message,
    this.stackTrace = '',
  });

  final String message;
  final String stackTrace;

  factory BaseError.unknown() => BaseError(message: 'Unknown error');
}
