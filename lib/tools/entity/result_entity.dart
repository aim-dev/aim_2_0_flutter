
class ResultEntity {
  int? code;
  String? message;

  ResultEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? -1;
    message = json['message'] ?? '';
  }
}