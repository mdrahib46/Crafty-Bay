part of 'network_caller.dart';


class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseBody;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseBody,
    this.errorMessage = 'Something went wrong',
  });
}
