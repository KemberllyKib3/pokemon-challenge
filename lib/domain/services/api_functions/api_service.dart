import 'package:dio/dio.dart';
import 'package:pokemon_challenge/domain/services/api_functions/api_response.dart';

class ApiService {
  static const String _baseUrl = 'https://pokeapi.co/api/v2/';

  Future<ApiResponse> get({String? path, String? url}) async {
    final finalUrl = Uri.parse(url ?? (_baseUrl + path!));

    try {
      final response = await Dio().get<Object>(finalUrl.toString());
      return _handleResponse(finalUrl, response);
    } catch (error) {
      if (error is DioError) {
        throw "DioError: ${error.message}";
      } else {
        throw "Error: $error";
      }
    }
  }

  ApiResponse _handleResponse(Uri url, Response response) {
    switch (response.statusCode) {
      case 200:
        return ApiResponse(
          statusCode: response.statusCode!,
          data: response.data,
        );
      case 204:
        return ApiResponse(
          statusCode: response.statusCode!,
          data: response.data,
        );
      case 400:
        throw Exception('Bad request: ${url.toString()}');
      case 401:
        throw Exception('Unauthorized: ${url.toString()}');
      case 403:
        throw Exception('Forbidden: ${url.toString()}');
      case 404:
        throw Exception('Not found: ${url.toString()}');
      case 500:
        throw Exception('Internal server error: ${url.toString()}');
      default:
        throw Exception(
            'Unexpected error occured with status code: ${response.statusCode}');
    }
  }
}
