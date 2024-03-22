

import 'package:aim_flutter/tools/entity/abstract_result.dart';
import 'package:aim_flutter/tools/entity/result_entity.dart';

class ContractCheckWithdrawResult {

  ResultEntity? result;
  DataEntity? data;

  ContractCheckWithdrawResult.fromJson(Map<String, dynamic> json) {
    result = ResultEntity.fromJson(json['result'] ?? {});
    data = DataEntity.fromJson(json['data'] ?? {});
  }

  bool isSuccessful() {
    return result != null && result!.code == 0;
  }
}

class DataEntity {

  int? id;
  bool? isWithdrawFinished;

  DataEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isWithdrawFinished = json['is_withdraw_finished'];
  }
}