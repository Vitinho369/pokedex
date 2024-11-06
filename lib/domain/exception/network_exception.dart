class NetworkException implements Exception {
  final int statusCode;
  String? message;

  NetworkException({required this.statusCode, this.message});

  @override
  String toString() =>
      'Erro de rede: codigo de status $statusCode, erro: $message';
}
