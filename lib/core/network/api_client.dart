import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_endpoints.dart';
import '../services/storage_service.dart';
import 'network_exceptions.dart';

class ApiClient {
  static Future<Map<String, String>> _getHeaders() async {
    final token = await StorageService.getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  // GET request
  static Future<dynamic> get(String endpoint) async {
    try {
      final uri = Uri.parse('${ApiEndpoints.baseUrl}$endpoint');
      final headers = await _getHeaders();
      final response = await http.get(uri, headers: headers);
      return _processResponse(response);
    } catch (e) {
      throw NetworkException(message: e.toString());
    }
  }

  // POST request
  static Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final uri = Uri.parse('${ApiEndpoints.baseUrl}$endpoint');
      final headers = await _getHeaders();
      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(data),
      );
      return _processResponse(response);
    } catch (e) {
      throw NetworkException(message: e.toString());
    }
  }

  static dynamic _processResponse(http.Response response) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {
      body = response.body;
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    } else if (response.statusCode == 401) {
      throw NetworkException(message: 'Unauthenticated. Please login again.', statusCode: 401);
    } else if (response.statusCode == 422) {
      final message = (body is Map) ? (body['message'] ?? 'Validation error occurred.') : 'Validation error occurred.';
      throw NetworkException(message: message.toString(), statusCode: 422);
    } else {
      final message = (body is Map)
          ? (body['message'] ?? 'Server error (${response.statusCode})')
          : 'Server error (${response.statusCode})';
      throw NetworkException(
        message: message.toString(),
        statusCode: response.statusCode,
      );
    }
  }
}
