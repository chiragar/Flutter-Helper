// Features of the http Package
// Lightweight: Simple API for GET, POST, PUT, DELETE requests.
// Example:

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<dynamic> getRequest(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));
      return _handleResponse(response);
    } on SocketException {
      return 'Internet Error';
    } on TimeoutException {
      return 'Timeout Error';
    } catch (e) {
      return 'Error: $e';
    }
  }

  Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return _handleResponse(response);
    } on SocketException {
      return 'Internet Error';
    } on TimeoutException {
      return 'Timeout Error';
    } catch (e) {
      return 'Error: $e';
    }
  }

  Future<dynamic> putRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return _handleResponse(response);
    } on SocketException {
      return 'Internet Error';
    } on TimeoutException {
      return 'Timeout Error';
    } catch (e) {
      return 'Error: $e';
    }
  }

  Future<dynamic> deleteRequest(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
      return _handleResponse(response);
    } on SocketException {
      return 'Internet Error';
    } on TimeoutException {
      return 'Timeout Error';
    } catch (e) {
      return 'Error: $e';
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      return 'Failed with status code: ${response.statusCode}';
    }
  }
}

// Limitations:
// Lacks advanced features like request cancellation, interceptors, or file uploads with progress.
// Manual effort required for tasks like retries, timeouts, and handling cookies.


// When to Use http?
// For simple requests with no advanced requirements.
// Example:
// Fetching data from a public API without authentication or complex configurations.