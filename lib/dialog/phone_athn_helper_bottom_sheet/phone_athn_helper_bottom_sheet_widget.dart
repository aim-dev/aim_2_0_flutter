import '../../../tools/network_mgr.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'phone_athn_helper_bottom_sheet_model.dart';
export 'phone_athn_helper_bottom_sheet_model.dart';

class PhoneAthnHelperBottomSheetWidget extends StatefulWidget {
  const PhoneAthnHelperBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _PhoneAthnHelperBottomSheetWidgetState createState() => _PhoneAthnHelperBottomSheetWidgetState();
}

class _PhoneAthnHelperBottomSheetWidgetState extends State<PhoneAthnHelperBottomSheetWidget> {
  late PhoneAthnHelperBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneAthnHelperBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 32, 24, 0),
              child: Container(
                width: double.infinity,
                height: 28,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Text(
                    '인증 문자가 오지 않나요?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'pretendard',
                          color: Color(0xFF2A323A),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.00, -1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                child: Text(
                  '아래 사유로 인증 문자가 거부될 수  있습니다.\n확인 후 다시 시도해주세요.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF474E57),
                        fontSize: 16,
                        useGoogleFonts: false,
                        lineHeight: 1.24,
                      ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '1',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'pretendard',
                              color: Color(0xFF48C9CF),
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                              lineHeight: 1.2,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Text(
                          '스팸차단함 확인',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'pretendard',
                                color: Color(0xFF2A323A),
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                                lineHeight: 1.2,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.00, -1.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(46, 8, 24, 0),
                    child: Text(
                      '‘스팸 차단 서비스\'로 인해 인증번호 수신이 어려울 수 있습니다. 스팸 차단함을 확인해 주세요.\n인증번호 SMS 발신 번호는 02-708-1000입니다.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'pretendard',
                            color: Color(0xFF474E57),
                            useGoogleFonts: false,
                            lineHeight: 1.2,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '2',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'pretendard',
                              color: Color(0xFF48C9CF),
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                              lineHeight: 1.2,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Text(
                          '통신사 명의도용 서비스 확인',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'pretendard',
                                color: Color(0xFF2A323A),
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                                lineHeight: 1.2,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.00, -1.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(46, 8, 24, 0),
                    child: Text(
                      '통신사 ‘명의 도용 알림 서비스\'로 인해 인증번호 수신이 어려울 수 있습니다. 이러한 경우 통신사 측에 문의해 주세요.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'pretendard',
                            color: Color(0xFF474E57),
                            useGoogleFonts: false,
                            lineHeight: 1.2,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 36, 20, 16),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: '확인',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width,
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
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
