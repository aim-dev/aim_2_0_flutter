

import 'package:aim_flutter/tools/entity/abstract_result.dart';
import 'package:aim_flutter/tools/entity/result_entity.dart';

class ContractApproveResult {

  ResultEntity? result;
  DataEntity? data;

  ContractApproveResult.fromJson(Map<String, dynamic> json) {
    result = ResultEntity.fromJson(json['result'] ?? {});
    data = DataEntity.fromJson(json['data'] ?? {});
  }

  bool isSuccessful() {
    return result != null && result!.code == 0;
  }
}

class DataEntity {

  int? id;
  String? portfolioType;
  String? contractType;
  String? contractAmountKrw;
  String? advisorRemuneration;
  bool? isWithdrawFinished;
  String? virtualAccountBankCode;
  String? virtualAccountBankName;
  String? virtualAccountNo;
  String? virtualAccountOwnerName;

  DataEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    portfolioType = json['portfolio_type'];
    contractType = json['contract_type'];
    contractAmountKrw = json['contract_amount_krw'];
    advisorRemuneration = json['advisor_remuneration'];
    isWithdrawFinished = json['is_withdraw_finished'];
    virtualAccountBankCode = json['virtual_account_bank_code'];
    virtualAccountBankName = json['virtual_account_bank_name'];
    virtualAccountNo = json['virtual_account_no'];
    virtualAccountOwnerName = json['virtual_account_owner_name'];
  }
}