import '../../../tools/network_mgr.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'phone_athn_agree_bottom_sheet_model.dart';
export 'phone_athn_agree_bottom_sheet_model.dart';

class PhoneAthnAgreeBottomSheetWidget extends StatefulWidget {
  const PhoneAthnAgreeBottomSheetWidget({Key? key, this.completion}) : super(key: key);

  final Function? completion;

  @override
  _PhoneAthnAgreeBottomSheetWidgetState createState() => _PhoneAthnAgreeBottomSheetWidgetState();
}

class _PhoneAthnAgreeBottomSheetWidgetState extends State<PhoneAthnAgreeBottomSheetWidget> {
  late PhoneAthnAgreeBottomSheetModel _model;

  bool isAgree1st = false;
  bool isAgree2st = false;
  bool isAgree3st = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneAthnAgreeBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  bool isAllAgree() {
    return isAgree1st && isAgree2st && isAgree3st;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Text(
                        '약관을 확인해 주세요',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'pretendard',
                              color: Color(0xFF2A323A),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                ),
              ),

              // 약관 전체 동의
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 56.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isAllAgree()) {
                              isAgree1st = isAgree2st = isAgree3st = false;
                            } else {
                              isAgree1st = isAgree2st = isAgree3st = true;
                            }
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            isAllAgree() ? 'assets/images/CheckOn.png' : 'assets/images/CheckOff.png',
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '약관 전체 동의',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'pretendard',
                                color: Color(0xFF2A323A),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 필수 AIM 이용약관
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 56.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isAgree1st = !isAgree1st;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              isAgree1st ? 'assets/images/CheckOn.png' : 'assets/images/CheckOff.png',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.pushNamed('TermsHtmlPage', extra: <String, dynamic>{
                              'url': 'https://s3.ap-northeast-1.amazonaws.com/assets.getaim.co/assets/agreements/user_agreement_1.0.html',
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '[필수] AIM 이용약관',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'pretendard',
                                        color: Color(0xFF2A323A),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF8993A0),
                                size: 12.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 필수 개인정보 수집이용 동의
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 56.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isAgree2st = !isAgree2st;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              isAgree2st ? 'assets/images/CheckOn.png' : 'assets/images/CheckOff.png',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.pushNamed('TermsHtmlPage', extra: <String, dynamic>{
                              'url': 'https://s3.ap-northeast-1.amazonaws.com/assets.getaim.co/assets/agreements/privacy_agreement_3.7.html',
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '[필수] 개인정보 수집이용 동의',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'pretendard',
                                        color: Color(0xFF2A323A),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF8993A0),
                                size: 12.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 선택 개인정보 제공
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 56.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isAgree3st = !isAgree3st;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              isAgree3st ? 'assets/images/CheckOn.png' : 'assets/images/CheckOff.png',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.pushNamed('TermsHtmlPage', extra: <String, dynamic>{
                              'url': 'https://s3.ap-northeast-1.amazonaws.com/assets.getaim.co/assets/agreements/kcb_provision_of_personal_information_1.0.html',
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '[선택] 개인정보 제공',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'pretendard',
                                        color: Color(0xFF2A323A),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF8993A0),
                                size: 12.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 확인
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 36.0, 20.0, 16.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (isAgree1st && isAgree2st) {
                      widget.completion!();
                      return;
                    }
                  },
                  text: '확인',
                  options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 56.0,
                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: (isAgree1st && isAgree2st) ? Color(0xFF48C9CF) : Color(0x8048C9CF),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'pretendard',
                            color: Colors.white,
                            useGoogleFonts: false,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                      elevation: 0.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
