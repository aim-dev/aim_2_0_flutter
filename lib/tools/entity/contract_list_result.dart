

import 'package:aim_flutter/tools/entity/abstract_result.dart';
import 'package:aim_flutter/tools/entity/result_entity.dart';

class ContractListResult {

  ResultEntity? result;
  List<ContractEntity> data = [];

  ContractListResult.fromJson(Map<String, dynamic> json) {
    result = ResultEntity.fromJson(json['result'] ?? {});
    List<dynamic> contracts = json['data'] ?? [];
    for( Map<String, dynamic> it in contracts ) {
      data.add(ContractEntity.fromJson(it));
    }
  }

  bool isSuccessful() {
    return result != null && result!.code == 0;
  }
}

class ContractEntity {
  int? id;
  String? portfolioType;
  String? contractType;
  String? contractAmountKrw;
  String? advisor_remuneration;
  bool? is_withdraw_finished;
  String? virtual_account_bank_code;
  String? virtual_account_bank_name;
  String? virtual_account_no;
  String? virtual_account_owner_name;

  ContractEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    portfolioType = json['portfolio_type'] ?? '';
    contractType = json['contract_type'] ?? '';
    contractAmountKrw = json['contract_amount_krw'] ?? '';
    advisor_remuneration = json['advisor_remuneration'] ?? '';
    is_withdraw_finished = json['is_withdraw_finished'] ?? false;
    virtual_account_bank_code = json['virtual_account_bank_code'] ?? '';
    virtual_account_bank_name = json['virtual_account_bank_name'] ?? '';
    virtual_account_no = json['virtual_account_no'] ?? '';
    virtual_account_owner_name = json['virtual_account_owner_name'] ?? '';
  }
}