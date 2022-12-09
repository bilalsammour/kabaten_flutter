class CanceledError implements Exception {
  final String? message;

  const CanceledError({this.message});
}
