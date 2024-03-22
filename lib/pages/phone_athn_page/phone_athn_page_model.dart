
import '../../../tools/helper_ui.dart';
import '../../../tools/network_mgr.dart';
import '../../../tools/pref_mgr.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'phone_athn_page_widget.dart' show PhoneAthnPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PhoneAthnPageModel extends FlutterFlowModel<PhoneAthnPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodePhoneNumber;
  TextEditingController? textControllerPhoneNumber;
  String? Function(BuildContext, String?)? textController1Validator;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeTelecom;
  TextEditingController? textControllerTelecom;
  String? Function(BuildContext, String?)? textController2Validator;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeBirthDay;
  TextEditingController? textControllerBirthDay;
  String? Function(BuildContext, String?)? textController3Validator;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeGenderNum;
  TextEditingController? textControllerGenderNum;
  String? Function(BuildContext, String?)? textController4Validator;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeName;
  TextEditingController? textControllerName;
  String? Function(BuildContext, String?)? textController5Validator;

  /// Initialization and disposal methods.


  int step = 1; // 1: 이름, 2: 생년월일, 3: 통신사, 4: 휴대폰번호

  late BuildContext context;

  void initState(BuildContext context) {
    this.context = context;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNodePhoneNumber?.dispose();
    textControllerPhoneNumber?.dispose();

    textFieldFocusNodeTelecom?.dispose();
    textControllerTelecom?.dispose();

    textFieldFocusNodeBirthDay?.dispose();
    textControllerBirthDay?.dispose();

    textFieldFocusNodeGenderNum?.dispose();
    textControllerGenderNum?.dispose();

    textFieldFocusNodeName?.dispose();
    textControllerName?.dispose();
  }

  String subject() {
    switch(step) {
      case 1: return '이름을 입력해주세요';
      case 2: return '생년월일을 입력해주세요';
      case 3: return '통신사를 선택해주세요';
      case 4: return '휴대폰 번호를 입력해주세요';
    }
    return '이름을 입력해주세요';
  }

  void goSmsVerifyPage() async {
    String parsedDate = textControllerBirthDay.text.trim();
    String birthday = "19${parsedDate.substring(0, 2)}-${parsedDate.substring(2, 4)}-${parsedDate.substring(4)}";
    String phone = textControllerPhoneNumber.text.trim();
    String gender = textControllerGenderNum.text.trim() == '1' || textControllerGenderNum.text.trim() == '3' ? 'male' : 'female';
    String name = textControllerName.text.trim();
    String telecomCode = textControllerTelecom.text.trim();
    if( telecomCode == 'SKT' ) telecomCode = '01';
    if( telecomCode == 'KT' ) telecomCode = '02';
    if( telecomCode == 'LG U+' ) telecomCode = '03';
    if( telecomCode == 'SKT 알뜰폰' ) telecomCode = '04';
    if( telecomCode == 'KT 알뜰폰' ) telecomCode = '05';
    if( telecomCode == 'LG U+ 알뜰폰' ) telecomCode = '06';

    await SharedPreferenceManager.setAimUserName(name);

    context.pushNamed('PhoneAthnFinalPage', extra: <String, dynamic> {
      'birthday': birthday, 'gender': gender, 'name': name, 'phone': phone, 'telecomCode': telecomCode, 'sequenceNumber': 'temp1234567890', 'isDiPurpose': false
    });
  }

  void goSmsVerifyPageForDi() async {

  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
