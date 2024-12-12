class ApiResponse<T> {
  bool success;
  String message;
  T? data;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return ApiResponse<T>(
      success: json['status'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) {
    return {
      'success': success,
      'message': message,
      'data': toJsonT(data),
    };
  }
}