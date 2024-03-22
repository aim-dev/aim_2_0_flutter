/*
 * ------------------------------------------------------------------------------
 * @Project       : (주)XXBLUE 프로젝트
 * @Source        : ENVIRONMENTS.dart
 * @Description   : 
 * @Author        : XXBLUE iamhyeongbae,, 2022/08/09
 * @Version       : v1.0
 * Copyright(c) 2020 XXBLUE All rights reserved
 *------------------------------------------------------------------------------
 *                  변         경         사         항                       
 *------------------------------------------------------------------------------
 *    DATE     AUTHOR                      DESCRIPTION                        
 * ----------  ------  --------------------------------------------------------- 
 * 2022/08/09  iamhyeongbae  신규생성                                     
 *------------------------------------------------------------------------------
 */

/*
 * XX 용도로 제작된 클래스이다.</br>
 * 
 * @Company : XXBLUE iamhyeongbae,, 2022/08/09
 * @Version : 1.0
 */
import 'package:flutter/material.dart';


class ENVIRONMENTS {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // final/static property
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const int PRD             =  0;//상용
  static const int DEV             =  10;//개발
  static const int SERVER_TYPE     = DEV;

  static const String API_URL_NEO = SERVER_TYPE != PRD ? "https://stage-v2.getaim.co" : "https://neo.getaim.co";
  static const String API_URL_TITAN = SERVER_TYPE != PRD ? "https://stage-v2.getaim.co/aim-api/global" : "https://neo.getaim.co/aim-api/global";


  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // normal property
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // getter/setter
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static bool isDev() {
    return SERVER_TYPE == DEV;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // constructor
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // life-cycle method
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // public method
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // private method
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
}