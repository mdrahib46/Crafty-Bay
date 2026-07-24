import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

part 'network_response.dart';

class NetworkCaller {
  final Logger _logger = Logger();
  final Map<String, String> Function() headers;

  final VoidCallback onUnAuthorized;

  /// Constructor
  NetworkCaller({required this.headers, required this.onUnAuthorized});

  /// Get Request
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, headers: headers());

      final Response response = await get(uri, headers: headers());

      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedResponse = jsonDecode(response.body);

        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseBody: decodedResponse,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorized();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Unauthorize',
        );
      } else {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedResponse['msg'] ?? 'Something went wrong....!',
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
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, requestBody: body, headers: headers());

      final Response response = await post(
        uri,
        headers: headers(),
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
      } else if (response.statusCode == 401) {
        onUnAuthorized();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Unauthorize',
        );
      } else {
        final encodedResponse = jsonDecode(response.body);

        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: encodedResponse['msg'] ?? "Something went wrong....!",
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

  Future<NetworkResponse> deleteRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, requestBody: body, headers: headers());

      final Response response = await delete(
        uri,
        headers: headers(),
        body: body != null ? jsonEncode(body) : null,
      );

      _logResponse(response);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        dynamic decodedResponse;

        if (response.body.isNotEmpty) {
          decodedResponse = jsonDecode(response.body);
        }

        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseBody: decodedResponse,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorized();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Unauthorize',
        );
      } else {
        dynamic decodedResponse;

        if (response.body.isNotEmpty) {
          decodedResponse = jsonDecode(response.body);
        }

        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage:
              decodedResponse?['msg'] ??
              decodedResponse?['message'] ??
              'Something went wrong....!',
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
