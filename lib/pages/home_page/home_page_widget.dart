import 'package:aim_flutter/tools/network_mgr.dart';
import 'package:aim_flutter/tools/pref_mgr.dart';
import 'package:flutter/services.dart';

import '../../tools/entity/user_register_result.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // 상단 인디케이터 영역의 배경색을 하얀색으로 설정
      statusBarIconBrightness: Brightness.dark, // 상단 인디케이터 영역의 아이콘 색상을 어둡게 설정
    ));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 84.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/img_Logo.png',
                        width: 80.0,
                        height: 23.8,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '대한민국 ',
                            style: TextStyle(
                              fontFamily: 'pretendard',
                              color: Color(0xFF72787F),
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            ),
                          ),
                          TextSpan(
                            text: '100만 사용자',
                            style: TextStyle(
                              fontFamily: 'pretendard',
                              color: Color(0xFF72787F),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          TextSpan(
                            text: '가 선택한\n글로벌 투자 자문 플랫폼',
                            style: TextStyle(
                              fontFamily: 'pretendard',
                              color: Color(0xFF72787F),
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/img_SplashGroup.png',
                        width: 287.0,
                        height: 316.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(57.0, 0.0, 57.0, 100.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Map<String, dynamic> json = await NetworkManager.requestUserRegister();
                        UserRegisterResult result = UserRegisterResult.fromJson(json);
                        if (result.isSuccessful()) {
                          await SharedPreferenceManager.setUdid(result.data!.udid ?? '');
                          await SharedPreferenceManager.setAimUserId(result.data!.aimUserId ?? '');

                          context.pushNamed('PhoneAthnPage');
                        }
                      },
                      text: '시작하기',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 64.0,
                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF55C9CD),
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'pretendard',
                              color: Color(0xFFffffff),
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
