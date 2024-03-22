import '../../tools/helper_ui.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'phone_athn_page_model.dart';
export 'phone_athn_page_model.dart';

class PhoneAthnPageWidget extends StatefulWidget {
  const PhoneAthnPageWidget({Key? key, this.purpose}) : super(key: key);

  final String? purpose; // onboarding, new_million_dollar_account

  @override
  _PhoneAthnPageWidgetState createState() => _PhoneAthnPageWidgetState();
}

class _PhoneAthnPageWidgetState extends State<PhoneAthnPageWidget> {
  late PhoneAthnPageModel _model;

  bool isAgree = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneAthnPageModel());
    _model.initState(context);

    _model.textControllerPhoneNumber ??= TextEditingController();
    _model.textFieldFocusNodePhoneNumber ??= FocusNode();

    _model.textControllerTelecom ??= TextEditingController();
    _model.textFieldFocusNodeTelecom ??= FocusNode();
    _model.textFieldFocusNodeTelecom!.unfocus();

    _model.textControllerBirthDay ??= TextEditingController();
    _model.textFieldFocusNodeBirthDay ??= FocusNode();

    _model.textControllerGenderNum ??= TextEditingController();
    _model.textFieldFocusNodeGenderNum ??= FocusNode();

    _model.textControllerName ??= TextEditingController();
    _model.textFieldFocusNodeName ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          // _model.textControllerPhoneNumber?.text = '01043222384';
          // _model.textControllerBirthDay?.text = '791017';
          // _model.textControllerGenderNum?.text = '1';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  bool isValidPhoneNumber(String phoneNumber) {
    // 휴대폰 번호 정규식 (010-1234-5678 또는 01012345678 형식)
    RegExp regex = RegExp(r'^01(?:0|1|[6-9])\d{8}$');

    return regex.hasMatch(phoneNumber);
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
                  height: 50.0,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: SvgPicture.asset(
                            'assets/images/ic_back_black.svg',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ++ 컨텐츠
                Expanded(
                  child: Stack(
                    children: [
                      // ++ 컨텐츠
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // ++ 제목
                            Align(
                              alignment: AlignmentDirectional(-1.00, -1.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 32.0),
                                child: Text(
                                  _model.subject(),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'pretendard',
                                        color: Color(0xFF2A323A),
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),

                            // ++ 휴대폰 번호
                            Visibility(
                              visible: _model.step >= 4,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 24.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: _model.step == 4 ? Color(0xFF48C9CF) : Color(0xFFDFE2E7),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 7.0, 0.0, 0.0),
                                        child: Text(
                                          '휴대폰 번호',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'pretendard',
                                                color: Color(0xFF474E57),
                                                fontSize: 12.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                        child: TextFormField(
                                          controller: _model.textControllerPhoneNumber,
                                          focusNode: _model.textFieldFocusNodePhoneNumber,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder: InputBorder.none,
                                            contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 0.0, 0.0),
                                            suffixIcon: Icon(
                                              Icons.cancel,
                                              color: Color(0xFFC5CBD2),
                                              size: 20.0,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'pretendard',
                                                color: Color(0xFF2A323A),
                                                fontSize: 16.0,
                                                useGoogleFonts: false,
                                              ),
                                          keyboardType: TextInputType.number,
                                          cursorColor: Color(0xFF48C9CF),
                                          validator: _model.textController1Validator.asValidator(context),
                                          onChanged: (text) {
                                            if (isValidPhoneNumber(text) && !isAgree) {
                                              _model.textControllerPhoneNumber!.selection = TextSelection.fromPosition(TextPosition(offset: _model.textControllerPhoneNumber!.text.length));
                                              HelperUI.showPhoneAgreeBottomSheet(context, () async {

                                                await Future.delayed(const Duration(milliseconds: 1000));
                                                Navigator.pop(context);
                                                _model.goSmsVerifyPage();
                                              });
                                              return;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // ++ 통신사
                            Visibility(
                              visible: _model.step >= 3,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 24.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: _model.step == 3 ? Color(0xFF48C9CF) : Color(0xFFDFE2E7),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 7.0, 0.0, 0.0),
                                        child: Text(
                                          '통신사',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'pretendard',
                                                color: Color(0xFF474E57),
                                                fontSize: 12.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                        child: Stack(
                                          children: [
                                            TextFormField(
                                              controller: _model.textControllerTelecom,
                                              focusNode: _model.textFieldFocusNodeTelecom,
                                              autofocus: false,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder: InputBorder.none,
                                                contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 0.0, 0.0),
                                              ),
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'pretendard',
                                                    color: Color(0xFF2A323A),
                                                    fontSize: 16.0,
                                                    useGoogleFonts: false,
                                                  ),
                                              cursorColor: Color(0xFF48C9CF),
                                              validator: _model.textController2Validator.asValidator(context),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                HelperUI.showTelecomBottomSheet(context, (seq) {
                                                  // 0: SKT, 1: KT, 2: LG U+, 3: SKT 알뜰폰, 4: KT 알뜰폰, 5: LG U+ 알뜰폰
                                                  setState(() {
                                                    switch (seq) {
                                                      case 0:
                                                        _model.textControllerTelecom.text = 'SKT';
                                                        break;
                                                      case 1:
                                                        _model.textControllerTelecom.text = 'KT';
                                                        break;
                                                      case 2:
                                                        _model.textControllerTelecom.text = 'LG U+';
                                                        break;
                                                      case 3:
                                                        _model.textControllerTelecom.text = 'SKT 알뜰폰';
                                                        break;
                                                      case 4:
                                                        _model.textControllerTelecom.text = 'KT 알뜰폰';
                                                        break;
                                                      case 5:
                                                        _model.textControllerTelecom.text = 'LG U+ 알뜰폰';
                                                        break;
                                                    }
                                                  });
                                                });
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // ++ 생년월일
                            Visibility(
                              visible: _model.step >= 2,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastOutSlowIn,
                                opacity: _model.step >= 2 ? 1 : 0,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 24.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: _model.step == 2 ? Color(0xFF48C9CF) : Color(0xFFDFE2E7),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 7.0, 0.0, 0.0),
                                          child: Text(
                                            '생년월일 및 성별',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'pretendard',
                                                  color: Color(0xFF474E57),
                                                  fontSize: 12.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                height: 56.0,
                                                decoration: BoxDecoration(),
                                                child: TextFormField(
                                                  controller: _model.textControllerBirthDay,
                                                  focusNode: _model.textFieldFocusNodeBirthDay,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                    enabledBorder: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    focusedErrorBorder: InputBorder.none,
                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 0.0, 0.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: 'pretendard',
                                                        color: Color(0xFF2A323A),
                                                        fontSize: 16.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  keyboardType: TextInputType.number,
                                                  cursorColor: Color(0xFF48C9CF),
                                                  validator: _model.textController3Validator.asValidator(context),
                                                  onChanged: (text) {
                                                    if (text.length == 6) {
                                                      _model.textFieldFocusNodeGenderNum!.requestFocus();
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 20.0, 8.0, 0.0),
                                              child: Text(
                                                '-',
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontFamily: 'pretendard',
                                                      color: Color(0xFF2A323A),
                                                      fontSize: 16.0,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 24.0,
                                                    height: 56.0,
                                                    decoration: BoxDecoration(),
                                                    child: TextFormField(
                                                      controller: _model.textControllerGenderNum,
                                                      focusNode: _model.textFieldFocusNodeGenderNum,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                        enabledBorder: InputBorder.none,
                                                        focusedBorder: InputBorder.none,
                                                        errorBorder: InputBorder.none,
                                                        focusedErrorBorder: InputBorder.none,
                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 0.0, 0.0),
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'pretendard',
                                                            color: Color(0xFF2A323A),
                                                            fontSize: 16.0,
                                                            useGoogleFonts: false,
                                                          ),
                                                      keyboardType: TextInputType.number,
                                                      cursorColor: Color(0xFF48C9CF),
                                                      validator: _model.textController4Validator.asValidator(context),
                                                      onChanged: (text) {
                                                        if (text.length == 1) {
                                                          setState(() {
                                                            _model.step = 3;
                                                            HelperUI.showTelecomBottomSheet(context, (seq) {
                                                              // 0: SKT, 1: KT, 2: LG U+, 3: SKT 알뜰폰, 4: KT 알뜰폰, 5: LG U+ 알뜰폰
                                                              setState(() {
                                                                switch (seq) {
                                                                  case 0:
                                                                    _model.textControllerTelecom.text = 'SKT';
                                                                    break;
                                                                  case 1:
                                                                    _model.textControllerTelecom.text = 'KT';
                                                                    break;
                                                                  case 2:
                                                                    _model.textControllerTelecom.text = 'LG U+';
                                                                    break;
                                                                  case 3:
                                                                    _model.textControllerTelecom.text = 'SKT 알뜰폰';
                                                                    break;
                                                                  case 4:
                                                                    _model.textControllerTelecom.text = 'KT 알뜰폰';
                                                                    break;
                                                                  case 5:
                                                                    _model.textControllerTelecom.text = 'LG U+ 알뜰폰';
                                                                    break;
                                                                }
                                                                _model.step = 4;
                                                                _model.textFieldFocusNodePhoneNumber!.requestFocus();
                                                              });
                                                            });
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 0.0, 0.0),
                                                    child: Text(
                                                      '●  ●  ●  ●  ●  ●',
                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // ++ 이름
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: _model.step == 1 ? Color(0xFF48C9CF) : Color(0xFFDFE2E7),
                                    width: 1.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 7.0, 0.0, 0.0),
                                      child: Text(
                                        '이름',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'pretendard',
                                              color: Color(0xFF474E57),
                                              fontSize: 12.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1.00, 0.00),
                                      child: TextFormField(
                                        controller: _model.textControllerName,
                                        focusNode: _model.textFieldFocusNodeName,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'pretendard',
                                              color: Color(0xFF2A323A),
                                              fontSize: 16.0,
                                              useGoogleFonts: false,
                                            ),
                                        cursorColor: Color(0xFF48C9CF),
                                        validator: _model.textController5Validator.asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ++ 확인 버튼
                      Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20.0, 36.0, 20.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              print('  ++ step : ${_model.step}');
                              switch (_model.step) {
                                case 1:
                                  if (_model.textControllerName.text.isNotEmpty) {
                                    setState(() {
                                      _model.step++;
                                      _model.textFieldFocusNodeBirthDay!.requestFocus();
                                    });
                                  }
                                  break;
                                case 2:
                                  break;
                                case 3:
                                  break;
                                case 4:
                                  HelperUI.showPhoneAgreeBottomSheet(context, () async {

                                    await Future.delayed(const Duration(milliseconds: 1000));

                                    Navigator.pop(context);
                                    _model.goSmsVerifyPage();
                                  });
                                  break;
                              }
                            },
                            text: '다음',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 56.0,
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF48C9CF),
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'pretendard',
                                    color: Colors.white,
                                    useGoogleFonts: false,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ],
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
