import 'dart:convert';

import 'package:http/http.dart';
import 'network_response.dart';
import 'package:logger/logger.dart';

class NetworkCaller {
  final Logger _logger = Logger();
  final Map<String, String> headers;

  /// Constructor
  NetworkCaller({required this.headers});

  /// Get Request
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, headers: headers);

      final Response response = await get(uri);

      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedResponse = jsonDecode(response.body);

        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseBody: decodedResponse,
        );
      } else {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage:
              decodedResponse['message'] ?? 'Something went wrong....!',
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  /// Post Request
  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: headers, requestBody: body);

      final Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final encodedResponse = jsonDecode(response.body);

        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseBody: encodedResponse,
        );
      } else {
        final encodedResponse = jsonDecode(response.body);

        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage:
              encodedResponse['message'] ?? "Something went wrong....!",
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(
    String url, {
    Map<String, dynamic>? requestBody,
    Map<String, String>? headers,
  }) {
    _logger.d('''Url => $url,
      Headers => $headers,
      Request Body => $requestBody,
      ''');
  }

  void _logResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      _logger.i('''
      Url => ${response.request?.url}
      Headers => ${response.headers}
      Response Body => ${response.body} 
    ''');
    } else {
      _logger.e('''
      Url => ${response.request?.url}
      Headers => ${response.headers}
      Response Body => ${response.body} 
    ''');
    }
  }
}
