class AppHttpResponse {
  AppHttpResponse({
    required this.data,
    required this.httpStatus,
  });

  final Map<String, dynamic> data;
  final int httpStatus;

  factory AppHttpResponse.fromJson({
    required Map<String, dynamic> map,
    required int httpStatus,
  }) {
    return AppHttpResponse(
      data: map,
      httpStatus: httpStatus,
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'data': data,
    };
  }
}
