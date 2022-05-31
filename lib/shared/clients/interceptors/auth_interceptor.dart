import 'dart:developer';

import 'package:dio/dio.dart';

class AuthInterceptor implements InterceptorsWrapper {
  final String token;
  final String language;

  AuthInterceptor(this.token, this.language);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      log("ERROR[${err.response!.statusCode}] => PATH: ${err.requestOptions.path}");
    }

    handler.reject(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("REQUEST[${options.method}] => PATH: ${options.path}");

    if (language.isNotEmpty) {
      options.headers.addAll({'Authorization': token});
    }
    if (token.isNotEmpty) {
      options.queryParameters.addAll({'language': language});
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}");
    handler.next(response);
  }
}
