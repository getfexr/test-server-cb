import 'dart:convert';

class ApiResponse {
  bool status;
  String message;
  Object result;

  ApiResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  factory ApiResponse.success({String? message, Map<String, dynamic>? data}) {
    return ApiResponse(
      status: true,
      message: message ?? 'success',
      result: data ?? {},
    );
  }

  factory ApiResponse.error({String? message}) {
    return ApiResponse(
      status: false,
      message: message ?? 'error',
      result: {},
    );
  }

  Map<String, Object> toMap() {
    return {
      'status': status,
      'message': message,
      'result': result,
    };
  }

  String toJson() => jsonEncode(toMap());
}