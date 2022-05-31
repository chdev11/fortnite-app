abstract class IClient {
  Future<dynamic> get(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? header,
      String? query});
  Future<dynamic> post(String path,
      {required Map<String, dynamic>? data,
      Map<String, dynamic>? header,
      String? query});
  Future<dynamic> put(String path,
      {required Map<String, dynamic>? data,
      Map<String, dynamic>? header,
      String? query});
  Future<dynamic> delete(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? header,
      String? query});
}
