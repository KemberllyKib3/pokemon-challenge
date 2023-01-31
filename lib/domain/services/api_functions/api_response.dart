class ApiResponse {
  final int statusCode;
  final dynamic data;

  ApiResponse({
    required this.statusCode,
    required this.data,
  });
}

class ApiException implements Exception {
  final int code;
  final String message;

  ApiException({
    required this.code,
    required this.message,
  });
}
