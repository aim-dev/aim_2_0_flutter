/*
 * ------------------------------------------------------------------------------
 * @Project       : (주)XXBLUE 프로젝트
 * @Source        : NetworkManager.dart
 * @Description   :
 * @Author        : XXBLUE iamhyeongbae,, 2022/07/07
 * @Version       : v1.0
 * Copyright(c) 2020 XXBLUE All rights reserved
 *------------------------------------------------------------------------------
 *                  변         경         사         항
 *------------------------------------------------------------------------------
 *    DATE     AUTHOR                      DESCRIPTION
 * ----------  ------  ---------------------------------------------------------
 * 2022/07/07  iamhyeongbae  신규생성
 *------------------------------------------------------------------------------
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'dart:convert' as convert;
import 'dart:typed_data';
import 'package:aim_flutter/tools/entity/abstract_result.dart';
import 'package:aim_flutter/tools/helper_hardware.dart';
import 'package:aim_flutter/tools/helper_ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_device_identifier/mobile_device_identifier.dart';

import 'ENVIRONMENTS.dart';

/*
 * XX 용도로 제작된 클래스이다.</br>
 *
 * @Company :
 * @Version : 1.0
 */
class NetworkManager {

  //*************************************************

  /// [users] 회원가입
  static Future<Map<String, dynamic>> requestUserRegister() async {
    Map<String, dynamic> body = {};

    String json = await post('${ENVIRONMENTS.API_URL_NEO}/users/register/', convert.jsonEncode(body));
    return convert.jsonDecode(json) as Map<String, dynamic>;
  }

  /// [contract] 계약 생성
  static Future<Map<String, dynamic>> requestContractApprove(String portfolioType, String contractType, String contractAmountKrw) async {
    Map<String, dynamic> body = {};
    body['portfolio_type'] = portfolioType;
    body['contract_type'] = contractType;
    body['contract_amount_krw'] = contractAmountKrw;

    String json = await post('${ENVIRONMENTS.API_URL_NEO}/contract/approve/', convert.jsonEncode(body));
    return convert.jsonDecode(json) as Map<String, dynamic>;
  }

  /// [contract] 계약 입금 조회
  static Future<Map<String, dynamic>> requestContractCheckWithdraw(String contractId) async {
    Map<String, dynamic> body = {};
    body['contract_id'] = contractId;

    String json = await post('${ENVIRONMENTS.API_URL_NEO}/contract/check_withdraw/', convert.jsonEncode(body));
    return convert.jsonDecode(json) as Map<String, dynamic>;
  }

  /// [manual] 가상계좌 입금 처리
  static Future<Map<String, dynamic>> processVirtualAccountDeposit(String contractId) async {
    String json = await get('${ENVIRONMENTS.API_URL_NEO}/contract/withdraw/?contract_id=$contractId');
    return convert.jsonDecode(json) as Map<String, dynamic>;
  }

  /// [contract] 계약 리스트 조회
  static Future<Map<String, dynamic>> requestContractList() async {
    Map<String, dynamic> body = {};

    String json = await post('${ENVIRONMENTS.API_URL_NEO}/contract/list/', convert.jsonEncode(body));
    return convert.jsonDecode(json) as Map<String, dynamic>;
  }

  /// [user] 휴대폰 인증 요청
  static Future<Map<String, dynamic>> requestMemberAuth(String name, String birthday, String phone, String gender, String telecomCode, String nation) async {
    Map<String, dynamic> body = {};
    body['name'] = name;
    body['birthday'] = birthday;
    body['phone'] = phone;
    body['gender'] = gender;
    body['telecomCode'] = telecomCode;
    body['nation'] = nation;

    String json = await post('${ENVIRONMENTS.API_URL_TITAN}/v1/member/auth/request', convert.jsonEncode(body));
    return convert.jsonDecode(json) as Map<String, dynamic>;
  }

  /// [user] 휴대폰 인증 확인
  static Future<Map<String, dynamic>> requestMemberAuthConfirm(String sequenceNumber, String smsCode, String phone, String publicKey) async {
    Map<String, dynamic> body = {};
    body['sequenceNumber'] = sequenceNumber;
    body['smsCode'] = smsCode;
    body['phone'] = phone;
    body['publicKey'] = publicKey;

    String json = await post('${ENVIRONMENTS.API_URL_TITAN}/v1/member/auth/request', convert.jsonEncode(body));
    return convert.jsonDecode(json) as Map<String, dynamic>;
  }

  //*************************************************

  /// [ETC] 텔레그램 전송
  static Future<String> sendTelegram(String text) async {
    text = Uri.encodeComponent(text);
    var url = Uri.parse('https://api.telegram.org/bot1897488754:AAFzBhPN6EFfMdkC-tWfkSUinlxrqcp2n6c/sendmessage?chat_id=-472235203&parse_mode=HTML&disable_web_page_preview=true&text=$text');
    prints('  ++ url : $url');
    var response = await http.get(url);
    String json = convert.utf8.decode(response.bodyBytes);
    prints('  ++ status : ${response.statusCode}');
    prints('  ++ response : $json');
    return json;
  }

  //*************************************************

  /// [PRIVATE] get
  static Future<String> get(String path) async {
    prints('>> get()');

    var headers = await buildHeaders();
    var url = Uri.parse(path);
    prints('  ++ url : $url');
    prints('  ++ headers : $headers');
    var response = await http.get(url, headers: headers);
    String json = convert.utf8.decode(response.bodyBytes);
    prints('  ++ status : ${response.statusCode}');
    prints('  ++ response($path) : $json');

    return json;
  }

  static Future<String> getString(String path) async {
    prints('>> get()');

    var url = Uri.parse(path);
    prints('  ++ url : $url');
    var response = await http.get(url);
    String json = convert.utf8.decode(response.bodyBytes);
    prints('  ++ status : ${response.statusCode}');
    prints('  ++ response($path) : $json');

    return json;
  }

  /// [PRIVATE] post
  static Future<String> post(String path, String body) async {
    prints('>> post()');

    var headers = await buildHeaders();
    var url = Uri.parse(path);
    prints('  ++ url : $url');
    prints('  ++ headers : $headers');
    prints('  ++ body : $body');
    var response = await http.post(url, headers: headers, body: body);
    String json = convert.utf8.decode(response.bodyBytes);
    prints('  ++ status : ${response.statusCode}');
    prints('  ++ response($path) : $json');
    if( response.statusCode != 200 ) {
      return "{\"result\":{\"code\":-1,\"message\":\"잠시 후 다시 이용해주세요\"}}";
    }
    return json;
  }

  static Future<String> postNotAuth(String path, String body) async {
    prints('>> post()');

    var headers = await buildHeaders();
    headers.remove('Authorization');
    var url = Uri.parse(path);
    prints('  ++ url : $url');
    prints('  ++ headers : $headers');
    prints('  ++ body : $body');
    var response = await http.post(url, headers: headers, body: body);
    String json = convert.utf8.decode(response.bodyBytes);
    prints('  ++ status : ${response.statusCode}');
    prints('  ++ response($path) : $json');

    return json;
  }

  /// [PRIVATE] post
  static Future<String> postNoHeaders(String path, String body) async {
    prints('>> post()');

    var headers = await buildHeaders();
    var url = Uri.parse(path);

    if( !url.path.contains('aim-api/v1/analysis/submit') ) {
      prints('  ++ url : $url');
      prints('  ++ headers : $headers');
      prints('  ++ body : $body');
    }

    var response = await http.post(url, headers: headers, body: body);
    String json = convert.utf8.decode(response.bodyBytes);

    if( !url.path.contains('aim-api/v1/analysis/submit') ) {
      prints('  ++ status : ${response.statusCode}');
      prints('  ++ response($path) : $json');
    }

    return json;
  }

  /// [PRIVATE] multipart
  static Future<String> multipart(String path, File file) async {
    prints('>> multipart()');

    var headers = await buildHeaders();
    var url = Uri.parse(path);
    prints('  ++ url : $url');
    prints('  ++ headers : $headers');
    var request = http.MultipartRequest("POST", url);
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    var response = await request.send();
    var bytes = await response.stream.toBytes();
    String json = convert.utf8.decode(bytes);
    prints('  ++ status : ${response.statusCode}');
    prints('  ++ response($path) : $json');

    return json;
  }

  /// [PRIVATE] multipartBytes
  static Future<String> multipartBytes(String path, Uint8List value, String filename) async {
    prints('>> multipart()');

    var headers = await buildHeaders();
    var url = Uri.parse(path);
    prints('  ++ url : $url');
    prints('  ++ headers : $headers');
    var request = http.MultipartRequest("POST", url);
    request.headers.addAll(headers);
    request.files.add(http.MultipartFile.fromBytes('file', value, filename: filename));
    var response = await request.send();
    var bytes = await response.stream.toBytes();
    String json = convert.utf8.decode(bytes);
    prints('  ++ status : ${response.statusCode}');
    prints('  ++ response($path) : $json');

    return json;
  }

  /// [PRIVATE] buildHeaders
  static Future<Map<String, String>> buildHeaders() async {

    Map<String, String> result = {};
    result['Content-Type'] = 'application/json; charset=utf-8';
    result['udid'] = await HelperHardware.readDeviceUniqueId();
    result['os-version'] = Platform.isIOS ? 'IOS' : 'AOS';
    result['app-version'] = await HelperHardware.readAppVersion();
    result['device-model'] = await HelperHardware.readDeviceModel();

    return result;
  }

  static void prints(dynamic message) {
    final String msg = message.toString();
    const int maxLength = 800; // 안드로이드 스튜디오 로그캣 등에서 한 번에 표시할 수 있는 최대 길이를 고려

    if (msg.length <= maxLength) {
      debugPrint(msg);
    } else {
      for (int i = 0; i < msg.length; i += maxLength) {
        final int end = (i + maxLength < msg.length) ? i + maxLength : msg.length;
        debugPrint(msg.substring(i, end));
      }
    }
  }
}


