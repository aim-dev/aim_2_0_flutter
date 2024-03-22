import '../../../tools/network_mgr.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'telecom_choice_bottom_sheet_model.dart';
export 'telecom_choice_bottom_sheet_model.dart';

class TelecomChoiceBottomSheetWidget extends StatefulWidget {
  const TelecomChoiceBottomSheetWidget({Key? key, this.onSelect}) : super(key: key);

  final Function(int)? onSelect;

  @override
  _TelecomChoiceBottomSheetWidgetState createState() => _TelecomChoiceBottomSheetWidgetState();
}

class _TelecomChoiceBottomSheetWidgetState extends State<TelecomChoiceBottomSheetWidget> {
  late TelecomChoiceBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelecomChoiceBottomSheetModel());

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
      width: double.infinity,
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
            // ++ 제목
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 56.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Text(
                      '통신사 선택',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ++ SKT
            InkWell(
              onTap: () {
                widget.onSelect!(0);
                context.pop();
              },
              child: Container(
                width: double.infinity,
                height: 56.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F8),
                ),
                child: Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'SKT',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ++ KT
            InkWell(
              onTap: () {
                widget.onSelect!(1);
                context.pop();
              },
              child: Container(
                width: double.infinity,
                height: 56.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'KT',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ++ LG U+
            InkWell(
              onTap: () {
                widget.onSelect!(2);
                context.pop();
              },
              child: Container(
                width: double.infinity,
                height: 56.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'LG U+',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ++ SKT 알뜰폰
            InkWell(
              onTap: () {
                widget.onSelect!(3);
                context.pop();
              },
              child: Container(
                width: double.infinity,
                height: 56.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'SKT 알뜰폰',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ++ KT 알뜰폰
            InkWell(
              onTap: () {
                widget.onSelect!(4);
                context.pop();
              },
              child: Container(
                width: double.infinity,
                height: 56.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'KT 알뜰폰',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ++ LGU + 알뜰폰
            InkWell(
              onTap: () {
                widget.onSelect!(5);
                context.pop();
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Container(
                  width: double.infinity,
                  height: 56.0,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'LG U+ 알뜰폰',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'pretendard',
                          color: Color(0xFF2A323A),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
