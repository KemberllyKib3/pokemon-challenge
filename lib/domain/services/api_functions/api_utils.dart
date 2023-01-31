import 'package:pokemon_challenge/domain/services/api_functions/api_response.dart';

class ApiUtils {
  static void _handleError(dynamic data) {
    if (data?['msg'] != null && data['msg'].toString().isNotEmpty) {
      throw ApiException(
        code: int.parse(data['erro'].toString()),
        message: data['msg'].toString(),
      );
    }
  }

  static Future<T> handleResponse<T, K>(
    ApiResponse response,
    Function(K) callbackSuccess,
  ) async {
    if (!response.statusCode.toString().startsWith('2')) {
      _handleError(response.data);
    }

    return await callbackSuccess(response.data as K) as T;
  }

  static Future<List<T>> handleResponseList<T, K>(
    ApiResponse response,
    Function(K) callbackSuccess,
  ) async {
    if (response.statusCode == 204) {
      return <T>[];
    }

    return await callbackSuccess(response.data as K) as List<T>;
  }
}
