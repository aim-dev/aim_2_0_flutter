import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../dialog/phone_athn_agree_bottom_sheet/phone_athn_agree_bottom_sheet_widget.dart';
import '../dialog/phone_athn_helper_bottom_sheet/phone_athn_helper_bottom_sheet_widget.dart';
import '../dialog/telecom_choice_bottom_sheet/telecom_choice_bottom_sheet_widget.dart';


class HelperUI {

  static Key uniqueKey() {
    return Key('${uniqueId()}');
  }

  static int uniqueId() {
    final DateTime now = DateTime.now();
    final int microseconds = now.microsecond;
    final int milliseconds = now.millisecond;
    final int seconds = now.second;
    final int minutes = now.minute;
    final int hours = now.hour;
    final int days = now.day;
    final int months = now.month;
    final int years = now.year;

    final Random random = Random();
    final int randomValue = random.nextInt(pow(2, 32).toInt()); // 32-bit int 값 생성

    final int uniqueId = microseconds + milliseconds + seconds + minutes + hours + days + months + years + randomValue;
    return uniqueId;
  }


  static bool isHigherVersion(String version1, String version2) {
    List<String> parts1 = version1.split('.'); // 첫 번째 버전 문자열을 '.'로 분할
    List<String> parts2 = version2.split('.'); // 두 번째 버전 문자열을 '.'로 분할

    for (int i = 0; i < parts1.length; i++) {
      int parsed1 = int.tryParse(parts1[i]) ?? 0; // 버전 숫자를 정수로 변환, 실패할 경우 0으로 처리
      int parsed2 = i < parts2.length ? int.tryParse(parts2[i]) ?? 0 : 0;

      if (parsed1 > parsed2) {
        return true; // 첫 번째 버전이 더 높음
      } else if (parsed1 < parsed2) {
        return false; // 두 번째 버전이 더 높음
      }
    }

    // 여기까지 도달하면 버전이 동일하거나 첫 번째 버전의 길이가 더 짧음
    return parts1.length > parts2.length;
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static void showPhoneAthnHelperBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: const BoxConstraints(
          minHeight: 404,
        ),
        isScrollControlled: true,
        builder: (c) {
          return SizedBox(
            height: 404,
            child: PhoneAthnHelperBottomSheetWidget(),
          );
        }
    );
  }

  static void showPhoneAgreeBottomSheet(BuildContext context, Function() completion) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: const BoxConstraints(
          minHeight: 400,
        ),
        isScrollControlled: true,
        builder: (c) {
          return SizedBox(
              height: 400,
              child: PhoneAthnAgreeBottomSheetWidget(completion: completion,)
          );
        }
    );
  }

  static void showTelecomBottomSheet(BuildContext context, Function(int) onSelect) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: const BoxConstraints(
          minHeight: 420,
        ),
        isScrollControlled: true,
        builder: (c) {
          return SizedBox(
              height: 420,
              child: TelecomChoiceBottomSheetWidget(onSelect: onSelect,)
          );
        }
    );
  }
}