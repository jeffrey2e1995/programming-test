class ApiStringResponse {
  int statusCode;
  String? error;
  dynamic data;

  ApiStringResponse({required this.statusCode, this.data, this.error});

  factory ApiStringResponse.fromJson(Map<String, dynamic> json) =>
      ApiStringResponse(
        statusCode: json['statusCode'] as int,
        data: json['data'],
        error: json['error'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'statusCode': statusCode,
        'error': error,
        'data': data,
      };
}
