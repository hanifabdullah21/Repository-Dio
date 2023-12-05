class ResponseModel {
  bool? success = false;
  String? message;
  dynamic error;
  dynamic data;

  ResponseModel({
    this.success = false,
    this.message,
    this.error,
    this.data,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    error = json['error'];
    data = json['result'] ?? json['data'];
  }

  Map<String, dynamic> toJson(ResponseModel model) => <String, dynamic>{
        'success': model.success,
        'message': model.message,
        'error': model.error,
        'result': model.data,
        'data': model.data,
      };
}
