abstract class ApiConsumer {
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? headers,
  });
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
  });
  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
  });
  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? headers,
  });
}
