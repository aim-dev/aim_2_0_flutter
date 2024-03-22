/*
 * ------------------------------------------------------------------------------
 * @Project       : (주)XXBLUE 프로젝트
 * @Source        : utils_string.dart
 * @Description   : 
 * @Author        : XXBLUE iamhyeongbae,, 2022/05/16
 * @Version       : v1.0
 * Copyright(c) 2020 XXBLUE All rights reserved
 *------------------------------------------------------------------------------
 *                  변         경         사         항                       
 *------------------------------------------------------------------------------
 *    DATE     AUTHOR                      DESCRIPTION                        
 * ----------  ------  --------------------------------------------------------- 
 * 2022/05/16  iamhyeongbae  신규생성                                     
 *------------------------------------------------------------------------------
 */
import 'dart:async';
import 'dart:convert' as convert;
import 'dart:typed_data';

import '../flutter_flow/flutter_flow_util.dart';

/*
 * XX 용도로 제작된 클래스이다.</br>
 * 
 * @Company : XXBLUE iamhyeongbae,, 2022/05/16
 * @Version : 1.0
 */
class UtilString {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // final/static property
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // normal property
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // getter/setter
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // constructor
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // life-cycle method
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // public method
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static String formatDouble(double value, {int fractionDigits = 2}) {
    String stringValue = value.toStringAsFixed(fractionDigits);
    // if (stringValue.startsWith('0.')) {
    //   return '0$stringValue';
    // }
    return stringValue;
  }

  static bool isPasswordValid(String password) {
    // 영어 포함 여부 확인
    bool hasLetter = false;
    for (int i = 0; i < password.length; i++) {
      if (password[i].toLowerCase() != password[i].toUpperCase()) {
        hasLetter = true;
        break;
      }
    }

    // 숫자 포함 여부 확인
    bool hasDigit = false;
    for (int i = 0; i < password.length; i++) {
      if (password[i].contains(RegExp(r'[0-9]'))) {
        hasDigit = true;
        break;
      }
    }

    // 최소 길이 확인
    bool isLengthValid = password.length >= 8;

    // 조건 충족 여부 반환
    return hasLetter && hasDigit && isLengthValid;
  }

  static Map<String, dynamic> jsonStringToMap(String json) {
    return convert.jsonDecode(json) as Map<String, dynamic>;
  }

  static bool isNotEmpty(String s) {
    return s != null && '' != s;
  }

  static bool isEmpty(String s) {
    return s == null || '' == s || '' == s.trim();
  }

  static Map<String, dynamic> decodeJson(String json) {
    return convert.jsonDecode(json) as Map<String, dynamic>;
  }

  static String dateTimeFormattedString(DateTime date, String format) {
    return DateFormat(format).format(date);
  }

  static DateTime stringToDateTime(String format, String date) {
    return DateFormat(format).parse(date);
  }

  static String decimalFormat(dynamic number) {
    if( number == null ) {
      return '';
    }
    return '${NumberFormat('###,###,###,###').format(int.parse(number))}';
  }

  static String remainTimerForEndAt(String endAt, Function onTerminate) {
    DateTime end = DateFormat('yyyy-MM-dd HH:mm:ss').parse(endAt);
    DateTime now = DateTime.now();

    Duration duration = end.difference(now);

    if( duration.inDays > 4 ) {
      return '${duration.inDays}일';
    }
    else {
      if( duration.inSeconds > 0 ) {
        return duration.toString().split('.').first.padLeft(8, "0");
      }
    }
    onTerminate();
    return '00:00:00';
  }

  static String remainTimerForStartAt(String startAt, Function onTerminate) {
    DateTime start = DateFormat('yyyy-MM-dd HH:mm:ss').parse(startAt);
    DateTime now = DateTime.now();

    Duration duration = start.difference(now);

    if( duration.inDays > 2 ) {
      return '${duration.inDays}일';
    }
    else {
      if( duration.inSeconds > 0 ) {
        return duration.toString().split('.').first.padLeft(8, "0");
      }
    }
    onTerminate();
    return '00:00:00';
  }

  static String remainTime(DateTime startAt, DateTime endAt) {
    Duration duration = endAt.difference(startAt);
    return '${duration.inHours}시간';
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // private method
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
}