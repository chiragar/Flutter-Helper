import 'package:dio/dio.dart';

void main() {
  // Create a Dio instance
  Dio dio = Dio();

  // Add interceptors to Dio
  dio.interceptors.add(InterceptorsWrapper(
    // Intercept requests before they are sent
    onRequest: (options, handler) {
      print('Requesting: ${options.method} ${options.uri}');
      // Modify the request here (e.g., adding headers)
      options.headers['Authorization'] = 'Bearer YOUR_ACCESS_TOKEN';
      return handler.next(options); // Continue the request
    },

    // Intercept responses before they are returned to the caller
    onResponse: (response, handler) {
      print('Response received: ${response.statusCode}');
      print('Data: ${response.data}');
      // You can manipulate the response here, e.g., log or modify data
      return handler.next(response); // Continue with the response
    },

    // Intercept errors before they are thrown
    onError: (DioError e, handler) {
      print('Error occurred: ${e.message}');
      if (e.response != null) {
        print('Error response: ${e.response?.data}');
      }
      return handler.next(e); // Continue with the error
    },
  ));

  // Test each type of request: GET, POST, PUT, DELETE
  testRequests(dio);
}

void testRequests(Dio dio) async {
  // Test GET Request
  await getRequest(dio);

  // Test POST Request
  await postRequest(dio);

  // Test PUT Request
  await putRequest(dio);

  // Test DELETE Request
  await deleteRequest(dio);
}

// GET Request
Future<void> getRequest(Dio dio) async {
  try {
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    print('GET Response: ${response.data}');
  } catch (e) {
    print('GET Error: $e');
  }
}

// POST Request
Future<void> postRequest(Dio dio) async {
  try {
    Response response = await dio.post(
      'https://jsonplaceholder.typicode.com/posts',
      data: {'title': 'foo', 'body': 'bar', 'userId': 1},
    );
    print('POST Response: ${response.data}');
  } catch (e) {
    print('POST Error: $e');
  }
}

// PUT Request
Future<void> putRequest(Dio dio) async {
  try {
    Response response = await dio.put(
      'https://jsonplaceholder.typicode.com/posts/1',
      data: {'id': 1, 'title': 'Updated Title', 'body': 'Updated Body'},
    );
    print('PUT Response: ${response.data}');
  } catch (e) {
    print('PUT Error: $e');
  }
}

// DELETE Request
Future<void> deleteRequest(Dio dio) async {
  try {
    Response response =
        await dio.delete('https://jsonplaceholder.typicode.com/posts/1');
    print('DELETE Response: ${response.data}');
  } catch (e) {
    print('DELETE Error: $e');
  }
}
