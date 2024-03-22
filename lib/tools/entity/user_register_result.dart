

import 'package:aim_flutter/tools/entity/abstract_result.dart';
import 'package:aim_flutter/tools/entity/result_entity.dart';

class UserRegisterResult {

  ResultEntity? result;
  DataEntity? data;

  UserRegisterResult.fromJson(Map<String, dynamic> json) {
    result = ResultEntity.fromJson(json['result'] ?? {});
    data = DataEntity.fromJson(json['data'] ?? {});
  }

  bool isSuccessful() {
    return result != null && result!.code == 0;
  }
}

class DataEntity {

  String? aimUserId;
  String? udid;

  DataEntity.fromJson(Map<String, dynamic> json) {
    aimUserId = json['aim_user_id'];
    udid = json['udid'];
  }
}