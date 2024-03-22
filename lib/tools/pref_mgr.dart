/*
 * ------------------------------------------------------------------------------
 * @Project       : (주)XXBLUE 프로젝트
 * @Source        : pref_mgr.dart
 * @Description   : 
 * @Author        : XXBLUE iamhyeongbae,, 2022/09/23
 * @Version       : v1.0
 * Copyright(c) 2020 XXBLUE All rights reserved
 *------------------------------------------------------------------------------
 *                  변         경         사         항                       
 *------------------------------------------------------------------------------
 *    DATE     AUTHOR                      DESCRIPTION                        
 * ----------  ------  --------------------------------------------------------- 
 * 2022/09/23  iamhyeongbae  신규생성                                     
 *------------------------------------------------------------------------------
 */

/*
 * XX 용도로 제작된 클래스이다.</br>
 * 
 * @Company : XXBLUE iamhyeongbae,, 2022/09/23
 * @Version : 1.0
 */
import 'dart:convert';

import 'package:aim_flutter/tools/utils_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // final/static property
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////å

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // normal property
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static SharedPreferences? prefs;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // getter/setter
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // constructor
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // life-cycle method
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future initialize() async {
    if( prefs == null ) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  static Future clear() async {
    await prefs!.clear();
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // public method
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////å

  /// UDID
  static Future<bool?> setUdid(String udid) async {
    return await prefs?.setString('udid', udid);
  }
  static String getUdid() {
    return prefs?.getString('udid') ?? 'kimhyeongbae';
  }

  /// AIM 유저 아이디
  static Future<bool?> setAimUserId(String aimUserId) async {
    return await prefs?.setString('aimUserId', aimUserId);
  }
  static String getAimUserId() {
    return prefs?.getString('aimUserId') ?? '';
  }


  /// AIM 유저 이름
  static Future<bool?> setAimUserName(String aimUserName) async {
    return await prefs?.setString('aimUserName', aimUserName);
  }
  static String getAimUserName() {
    return prefs?.getString('aimUserName') ?? '';
  }


  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // private method
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
}