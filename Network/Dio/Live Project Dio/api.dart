import 'package:dio/dio.dart';

import 'dio_client.dart';

abstract class API {
  Future<Response<dynamic>> get(
    String path,
    ApiAuthType authType, {
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParameters,
  });

  Future<Response<dynamic>> post(
    String path,
    ApiAuthType authType, {
    Map<String, dynamic> headers,
    dynamic body,
  });

  Future<Response<dynamic>> patch(
    String path,
    ApiAuthType authType, {
    Map<String, dynamic> headers,
    dynamic body,
  });

  Future<Response<dynamic>> download(String path, String savePath);

  Future<Response<dynamic>> put(
    String path,
    ApiAuthType authType, {
    Map<String, dynamic> headers,
    dynamic body,
  });

  Future<Response<dynamic>> delete(
    String path,
    ApiAuthType authType, {
    Map<String, dynamic> Headers,
    Map<String, dynamic> queryParameters,
    dynamic body,
  });
}
