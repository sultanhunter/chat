class ApiException implements Exception {
  final int? errorCode;
  final String? errorMessage;

  ApiException({
    this.errorCode,
    this.errorMessage,
  });
}
