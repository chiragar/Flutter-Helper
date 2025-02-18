import 'package:dio/dio.dart';

import 'api.dart';

enum ApiAuthType { bearer, apiKey, none }

abstract class DioClient extends API {
  final Dio _dio;

  DioClient({
    required String baseUrl,
    bool isAuthenticatorRequired = false,
    Duration timeout = const Duration(seconds: 120),
  }) : _dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
            contentType: HeaderConstants.jsonContentType,
            followRedirects: true,
            sendTimeout: timeout,
            connectTimeout: timeout,
            receiveTimeout: timeout));

  Future<String?> getJwtToken() async {
    // String authToken = await SharedPreferencesManager.getToken();
    // return authToken;
  }

  String getApiKey() {
    return Config.platformApiKey;
  }

  @override
  Future<Response<dynamic>> get(
    String path,
    ApiAuthType authType, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    ResponseType responseType = ResponseType.json,
  }) async {
    try {
      final String? token = await getJwtToken();
      final String apikey = await getApiKey();
      headers ??= {};
      if (token != null && authType == ApiAuthType.bearer) {
        headers['Authorization'] = 'Bearer $token';
      } else if (apikey != null && authType == ApiAuthType.apiKey) {
        headers['api-key'] = apikey;
        headers['organisation-id'] = Config.orgId;
      }
      final Response<dynamic> response = await _dio.get(path,
          queryParameters: queryParameters,
          options: Options(
              headers: headers,
              responseType: responseType,
              followRedirects: true));
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> post(String path, ApiAuthType authType,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      ResponseType responseType = ResponseType.json,
      dynamic body = const {}}) async {
    try {
      final String? token = await getJwtToken();

      headers ??= {};
      if (token != null && authType == ApiAuthType.bearer) {
        headers['Authorization'] = 'Bearer $token';
      } else if (authType == ApiAuthType.apiKey) {
        headers['api-key'] = getApiKey();
        headers['organisation-id'] = Config.orgId;
      }
      final Response<dynamic> response = await _dio.post(path,
          queryParameters: queryParameters,
          options: Options(
              headers: headers,
              responseType: responseType,
              followRedirects: true),
          data: body);
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> postWithoutJwt(String path,
      {dynamic body = const {}}) async {
    try {
      final Response<dynamic> response = await _dio.post(path,
          options:
              Options(responseType: ResponseType.json, followRedirects: true),
          data: body);
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> patch(String path, ApiAuthType authType,
      {Map<String, dynamic>? headers,
      ResponseType responseType = ResponseType.json,
      dynamic body = const {}}) async {
    try {
      final String? token = await getJwtToken();

      headers ??= {};
      if (token != null && authType == ApiAuthType.bearer) {
        headers['Authorization'] = 'Bearer $token';
      } else if (authType == ApiAuthType.apiKey) {
        headers['api-key'] = getApiKey();
        headers['organisation-id'] = Config.orgId;
      }
      final Response<dynamic> response = await _dio.patch(path,
          options: Options(
              headers: headers,
              responseType: responseType,
              followRedirects: true),
          data: body);
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> download(String path, String savePath) async {
    try {
      final response = await _dio.download(path, savePath);
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> put(String path, ApiAuthType authType,
      {Map<String, dynamic>? headers,
      ResponseType responseType = ResponseType.json,
      dynamic body = const {}}) async {
    try {
      final String? token = await getJwtToken();

      headers ??= {};
      if (token != null && authType == ApiAuthType.bearer) {
        headers['Authorization'] = 'Bearer $token';
      } else if (authType == ApiAuthType.apiKey) {
        headers['api-key'] = getApiKey();
        headers['organisation-id'] = Config.orgId;
      }
      final Response<dynamic> response = await _dio.put(path,
          options: Options(
              headers: headers,
              responseType: responseType,
              followRedirects: true),
          data: body);
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> delete(
    String path,
    ApiAuthType authType, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body = const {},
  }) async {
    try {
      final String? token = await getJwtToken();

      headers ??= {};
      if (token != null && authType == ApiAuthType.bearer) {
        headers['Authorization'] = 'Bearer $token';
      } else if (authType == ApiAuthType.apiKey) {
        headers['api-key'] = getApiKey();
        headers['organisation-id'] = Config.orgId;
      }
      final Response<dynamic> response = await _dio.delete(path,
          queryParameters: queryParameters,
          options: Options(
              headers: headers,
              responseType: ResponseType.json,
              followRedirects: true),
          data: body);
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }
}
