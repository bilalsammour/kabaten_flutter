class RequestException implements Exception {
  final int code;

  const RequestException({required this.code});
}
