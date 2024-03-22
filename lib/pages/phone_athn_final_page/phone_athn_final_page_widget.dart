import 'dart:async';

import 'package:flutter_svg/svg.dart';

import '../../../tools/helper_native_bridge.dart';
import '../../tools/helper_ui.dart';
import '../../tools/utils_string.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'phone_athn_final_page_model.dart';
export 'phone_athn_final_page_model.dart';

class PhoneAthnFinalPageWidget extends StatefulWidget {
  const PhoneAthnFinalPageWidget({Key? key, this.birthday, this.gender, this.name, this.phone, this.telecomCode, this.sequenceNumber, this.isDiPurpose, this.queryParams}) : super(key: key);

  final String? birthday;
  final String? gender;
  final String? name;
  final String? phone;
  final String? telecomCode;
  final String? sequenceNumber;
  final bool? isDiPurpose;
  final String? queryParams;

  @override
  _PhoneAthnFinalPageWidgetState createState() => _PhoneAthnFinalPageWidgetState();
}

class _PhoneAthnFinalPageWidgetState extends State<PhoneAthnFinalPageWidget> {
  late PhoneAthnFinalPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int remainingSeconds = 300;
  String? sequenceNumber;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneAthnFinalPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    this.sequenceNumber = widget.sequenceNumber!;

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    print('  ++ Uri.base : ${Uri.base.toString()}');

    startCountdown();
  }

  @override
  void dispose() {
    _model.dispose();
    timer.cancel(); // 위젯이 dispose 될 때 타이머 중지
    super.dispose();
  }

  void startCountdown() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel(); // 타이머 중지
        // 여기에 만료 시 동작 추가
        print('Countdown expired!');
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secondsLeft = seconds % 60;
    return '$minutes:${secondsLeft.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // ++ 헤더
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: SvgPicture.asset(
                            'assets/images/ic_back_black.svg',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.00, -1.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: Text(
                      '인증번호를 입력해주세요',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'pretendard',
                            color: Color(0xFF2A323A),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 0),
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xFF48C9CF),
                        width: 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 7, 0, 0),
                          child: Text(
                            '인증번호',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'pretendard',
                                  color: Color(0xFF474E57),
                                  fontSize: 12,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(16, 25, 0, 0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'pretendard',
                                  color: Color(0xFF2A323A),
                                  fontSize: 16,
                                  useGoogleFonts: false,
                                ),
                            keyboardType: TextInputType.number,
                            cursorColor: Color(0xFF48C9CF),
                            validator: _model.textControllerValidator.asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                            child: FFButtonWidget(
                              onPressed: () async {},
                              text: '재전송',
                              options: FFButtonOptions(
                                height: 30,
                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFFEDEFF1),
                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      fontFamily: 'pretendard',
                                      color: Color(0xFF2A323A),
                                      fontSize: 14,
                                      useGoogleFonts: false,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                elevation: 0.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 89, 0),
                            child: Text(
                              formatTime(remainingSeconds),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    color: Color(0xFF48C9CF),
                                    fontSize: 12,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),

                // ++ 인증 문자가 오지 않나요?
                InkWell(
                  onTap: () {
                    HelperUI.showPhoneAthnHelperBottomSheet(context);
                  },
                  child: Container(
                    width: 163,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDEFF1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Text(
                        '인증 문자가 오지 않나요?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'pretendard',
                              color: Color(0xFF474E57),
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 16),
                    child: FFButtonWidget(
                      onPressed: () async {
                        String smsCode = _model.textController.text.trim();
                        if (UtilString.isEmpty(smsCode)) {
                          return;
                        }
                        await Future.delayed(const Duration(milliseconds: 1000));
                        context.pushNamed('MainPage');
                      },
                      text: '확인',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xFF48C9CF),
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'pretendard',
                              color: Colors.white,
                              useGoogleFonts: false,
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
