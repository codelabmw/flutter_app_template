import '../../models/api_response.dart';

abstract interface class RestApiService {
  /// Performs a GET HTTP request.
  Future<ApiResponse> get(String path, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});

  /// Performs a POST HTTP request.
  Future<ApiResponse> post(String path,
      {dynamic data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});

  /// Performs a PUT HTTP request.
  Future<ApiResponse> put(String path,
      {dynamic data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});

  /// Performs a PATCH HTTP request.
  Future<ApiResponse> patch(String path,
      {dynamic data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});

  /// Performs a DELETE HTTP request.
  Future<ApiResponse> delete(String path, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});
}
