class MapperException<From, To> implements Exception {
  String message;

  MapperException(this.message);

  @override
  String toString() {
    return "Erro ao mapear ${From} para ${To}, erro: ${message}";
  }
}
