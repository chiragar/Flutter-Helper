import 'dart:io';

import 'package:dio/dio.dart';
//Request Cancellation:

class ApiFailure {
  final String message;
  ApiFailure(this.message);
}

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com', // Change this to your API base URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<dynamic> getRequest(String endpoint,
      {Map<String, dynamic>? queryParams, CancelToken? cancelToken}) async {
    try {
      Response response = await _dio.get(endpoint,
          queryParameters: queryParams, cancelToken: cancelToken);
      return response;
    } on SocketException {
      return ApiFailure("No internet connection");
    } on FormatException {
      return ApiFailure("Data format error");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        return ApiFailure(e.message ?? "Response error");
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return ApiFailure("Check your internet connection");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return ApiFailure("Unable to connect to the server");
      } else {
        return ApiFailure("An error occurred, please try again");
      }
    } catch (e) {
      return ApiFailure("An error occurred, please try again");
    }
  }

  Future<dynamic> postRequest(String endpoint, dynamic data,
      {CancelToken? cancelToken}) async {
    try {
      Response response =
          await _dio.post(endpoint, data: data, cancelToken: cancelToken);
      return response;
    } on SocketException {
      return ApiFailure("No internet connection");
    } on FormatException {
      return ApiFailure("Data format error");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        return ApiFailure(e.message ?? "Response error");
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return ApiFailure("Check your internet connection");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return ApiFailure("Unable to connect to the server");
      } else {
        return ApiFailure("An error occurred, please try again");
      }
    } catch (e) {
      return ApiFailure("An error occurred, please try again");
    }
  }

  Future<dynamic> putRequest(String endpoint, dynamic data,
      {CancelToken? cancelToken}) async {
    try {
      Response response =
          await _dio.put(endpoint, data: data, cancelToken: cancelToken);
      return response;
    } on SocketException {
      return ApiFailure("No internet connection");
    } on FormatException {
      return ApiFailure("Data format error");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        return ApiFailure(e.message ?? "Response error");
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return ApiFailure("Check your internet connection");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return ApiFailure("Unable to connect to the server");
      } else {
        return ApiFailure("An error occurred, please try again");
      }
    } catch (e) {
      return ApiFailure("An error occurred, please try again");
    }
  }

  Future<dynamic> deleteRequest(String endpoint,
      {Map<String, dynamic>? queryParams, CancelToken? cancelToken}) async {
    try {
      Response response = await _dio.delete(endpoint,
          queryParameters: queryParams, cancelToken: cancelToken);
      return response;
    } on SocketException {
      return ApiFailure("No internet connection");
    } on FormatException {
      return ApiFailure("Data format error");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        return ApiFailure(e.message ?? "Response error");
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return ApiFailure("Check your internet connection");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return ApiFailure("Unable to connect to the server");
      } else {
        return ApiFailure("An error occurred, please try again");
      }
    } catch (e) {
      return ApiFailure("An error occurred, please try again");
    }
  }

  void exampleRequestCancellation() async {
    CancelToken cancelToken = CancelToken();
    _dio.get("webpath", cancelToken: cancelToken);

    // Cancel the request
    cancelToken.cancel('Request canceled');
  }
}
