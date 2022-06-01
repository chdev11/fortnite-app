import 'package:dio/dio.dart';
import 'package:fortnite_app/shared/clients/client_interface.dart';

class DioClient implements IClient {
  late Dio client;

  DioClient(
      {required String baseUrl,
      List<InterceptorsWrapper> interceptors = const []}) {
    client = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      validateStatus: (status) => status! < 500,
    ));
    if (interceptors.isNotEmpty) {
      client.interceptors.clear();
      client.interceptors.addAll(interceptors);
    }
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? data = const {},
      Map<String, dynamic>? header = const {},
      String? query}) async {
    return await client.get(path + (query ?? ""),
        options: Options(headers: header));
  }

  @override
  Future post(String path,
      {required Map<String, dynamic>? data,
      Map<String, dynamic>? header,
      String? query}) async {
    return await client.post(path + (query ?? ""),
        options: Options(headers: header), data: data);
  }

  @override
  Future put(String path,
      {required Map<String, dynamic>? data,
      Map<String, dynamic>? header,
      String? query}) async {
    return await client.put(path + (query ?? ""),
        options: Options(headers: header), data: data);
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? data = const {},
      Map<String, dynamic>? header,
      String? query}) async {
    return await client.delete(path + (query ?? ""),
        options: Options(headers: header));
  }
}
