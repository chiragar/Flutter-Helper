import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

final dio = Dio();

Future<void> fetchData() async {
  try {
    final response = await dio.get('https://api.example.com/data');
    print(response.data);
  } on DioExceptionType catch (e) {
    print('Error: ${e}');
  } catch (e) {}
}

exampleFunction() async {
  dio.interceptors.add(InterceptorsWrapper(onRequest: (option, handler) {
    option.headers['Authorization'] = 'Bearrer token';
    return handler.next(option);
  }, onResponse: (response, handler) {
    print("Response: ${response.data}");
    return handler.next(response);
  }, onError: (DioException e, handler) {
    print("Error: ${e.message}");
    return handler.next(e);
  }));
}

//Request Cancellation:
exampleRequestCancellation() async {
  CancelToken cancelToken = CancelToken();
  dio.get("webpath", cancelToken: cancelToken);

  //cancel the request
  cancelToken.cancel('Request canceled');
}

//File Upload With Progress
exampleFileUpload() async {
  FormData formData = FormData.fromMap({
    'file': await MultipartFile.fromFile('./test.txt', filename: 'test.txt'),
  });

  dio.post(
    'https://api.example.com/upload',
    data: formData,
    onSendProgress: (sent, total) {
      if (kDebugMode) {
        print('Progress: ${(sent / total * 100).toStringAsFixed(0)}%');
      }
    },
  );
}

// Timeout Configuration:
// Separate settings for connection, read, and send timeouts.
// Example:

setOptions() async {
  dio.options.connectTimeout = Duration(seconds: 5); // 5 seconds
  dio.options.receiveTimeout = Duration(seconds: 3); // 3 seconds
}

// Better Error Handling:
// Categorized errors (DioExceptionType) with detailed information.
// Example:
exampleAPICall() async {
  try {
    await dio.get('https://api.example.com/data');
  } on DioExceptionType catch (e) {
    if (e.runtimeType == DioExceptionType.connectionTimeout) {
      print('Connection Timeout!');
    } else if (e.runtimeType == DioExceptionType.badResponse) {
      print('Response Error: ${e}');
    }
  }
}

// When to Use dio?
// Complex apps requiring:
// Global headers or interceptors.
// Token management for authentication.
// File uploads or downloads.
// Retry mechanisms and cancellation support.
// Detailed error categorization.
