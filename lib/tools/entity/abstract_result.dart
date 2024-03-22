

import 'package:aim_flutter/tools/entity/result_entity.dart';

class AbstractResult {

  ResultEntity? result;
  var data;

  AbstractResult.fromJson(Map<String, dynamic> json) {
    result = ResultEntity.fromJson(json['result'] ?? {});
    data = json['data'];
  }

  AbstractResult.errorResult() {
    result = ResultEntity.fromJson({});
    result?.code = -1;
    result?.message = '잠시 후 다시 이용해주세요';
  }

  bool isSuccessful() {
    return result != null && result!.code == 0;
  }
}