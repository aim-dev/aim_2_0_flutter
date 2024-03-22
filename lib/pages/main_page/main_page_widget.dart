import 'package:aim_flutter/tools/entity/contract_approve_result.dart';
import 'package:aim_flutter/tools/entity/contract_check_withdraw_result.dart';
import 'package:aim_flutter/tools/helper_ui.dart';
import 'package:aim_flutter/tools/network_mgr.dart';
import 'package:aim_flutter/tools/pref_mgr.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../tools/entity/contract_list_result.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  FlipCardController theEssentialCardController = FlipCardController();
  FlipCardController thePensionCardController = FlipCardController();

  bool hasInvestment = false;
  bool hasPension = false;

  ContractApproveResult? theContractApproveInvestment;
  ContractListResult? theContractListResult;

  int theTouchedIndex = -1;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // 상단 인디케이터 영역의 배경색을 하얀색으로 설정
      statusBarIconBrightness: Brightness.dark, // 상단 인디케이터 영역의 아이콘 색상을 어둡게 설정
    ));

    _loadContents();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void _loadContents() async {
    Map<String, dynamic> json = await NetworkManager.requestContractList();
    theContractListResult = ContractListResult.fromJson(json);
    // hasInvestment = theContractListResult!.data.isNotEmpty;
    setState(() {});
  }

  Widget _buildEssentialCardFront() {
    if (hasInvestment) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // ++ AIM Signature
          Align(
            alignment: AlignmentDirectional(-1, -1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 32, 0, 0),
              child: Text(
                'AIM Signature',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'pretendard',
                  color: Color(0xFF48C9CF),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
              ),
            ),
          ),

          // ++ AIMer님, 140일째 AIMing
          Align(
            alignment: AlignmentDirectional(-1, -1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 0),
              child: Text(
                '${SharedPreferenceManager.getAimUserName()}님, 140일째 AIMing',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'pretendard',
                  color: Color(0xFF2A323A),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  useGoogleFonts: false,
                ),
              ),
            ),
          ),

          // ++ 관리 기간
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 20, 24, 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Text(
                      '관리 기간',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Text(
                      '2024.02.28 ~ 2025.02.28',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ++ 평가 가치
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Text(
                      '평가 가치',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Text(
                      '3,000,000 원',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ++ 수익률
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Text(
                      '수익률',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFF2A323A),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Text(
                      '31.02 %',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: Color(0xFFFF0000),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ++ 그래프
          Align(
            alignment: AlignmentDirectional(-1, -1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.only(right: 120),
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback: (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  theTouchedIndex = -1;
                                  return;
                                }
                                theTouchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              });
                            },
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width - 150),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Indicator(
                          color: Colors.blue,
                          text: '선진시장 주식',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Colors.amber,
                          text: '신흥시장 채권',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Colors.deepPurpleAccent,
                          text: '신흥시장 채권',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Colors.green,
                          text: '미화현금',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Spacer(),

          // ++ 추가 계약 하기 버튼
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
            child: FFButtonWidget(
              onPressed: () async {
                Map<String, dynamic> json = await NetworkManager.requestContractApprove('investment', 'add', '5000000');
                ContractApproveResult result = ContractApproveResult.fromJson(json);
                if( result != null && result.isSuccessful() ) {
                  setState(() {
                    theContractApproveInvestment = result;
                    theEssentialCardController.toggleCard();
                  });
                  return;
                }
                HelperUI.showToast(result.result!.message!);
              },
              text: '추가 계약 하기',
              options: FFButtonOptions(
                width: double.infinity,
                height: 56.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF48C9CF),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'pretendard',
                  color: Colors.white,
                  useGoogleFonts: false,
                ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(-1.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 0.0, 0.0),
            child: Text(
              'AIM Signature',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'pretendard',
                color: Color(0xFF48C9CF),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                useGoogleFonts: false,
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 0.0),
            child: Text(
              '연 1.0%',
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
        Align(
          alignment: AlignmentDirectional(-1.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 23.0, 24.0, 0.0),
            child: Text(
              '상위 1% 글로벌 투자자 노하우를 담은 AIM의 Signature 전략',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'pretendard',
                color: Color(0xFF474E57),
                fontSize: 16.0,
                useGoogleFonts: false,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/img_check_gray.png',
                    width: 20.0,
                    height: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        '77개국 12,700여개 글로벌 우량 자산',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'pretendard',
                          color: Color(0xFF474E57),
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/img_check_gray.png',
                    width: 20.0,
                    height: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        '개인 맞춤형 포트폴리오 제공',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'pretendard',
                          color: Color(0xFF474E57),
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/img_check_gray.png',
                    width: 20.0,
                    height: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        '장기 분산 투자 전략을 통한 안전한 수익 제공',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'pretendard',
                          color: Color(0xFF474E57),
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/img_check_gray.png',
                    width: 20.0,
                    height: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        '본인 명의 증권계좌로 안정적인 자금관리',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'pretendard',
                          color: Color(0xFF474E57),
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/img_check_gray.png',
                    width: 20.0,
                    height: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        '연간 3.5%의 배당금 기대하며, 적금 이자 보다 높은 수익 제공',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'pretendard',
                          color: Color(0xFF474E57),
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
          child: FFButtonWidget(
            onPressed: () async {

              Map<String, dynamic> json = await NetworkManager.requestContractApprove('investment', 'initial', '5000000');
              ContractApproveResult result = ContractApproveResult.fromJson(json);
              if( result != null && result.isSuccessful() ) {
                theContractApproveInvestment = result;
                theEssentialCardController.toggleCard();
                setState(() {});
                return;
              }
              HelperUI.showToast(result.result!.message!);
            },
            text: 'AIM Signature 시작하기',
            options: FFButtonOptions(
              width: double.infinity,
              height: 56.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0xFF48C9CF),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'pretendard',
                color: Colors.white,
                useGoogleFonts: false,
              ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == theTouchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.amber,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.deepPurpleAccent,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // ++ 헤더
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/img_aim_logo.png',
                                width: 49.0,
                                height: 14.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/img_inbox.png',
                                width: 20.0,
                                height: 17.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ++ AIMer 님 환영합니다!
                    // ++ 프리미엄 자산관리를 시작해보세요
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                        child: Text(
                          '${SharedPreferenceManager.getAimUserName()} 님 환영합니다!\n프리미엄 자산관리를 시작해보세요',
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

                    // ++ 나에게 맞는 프로그램으로 자산관리를 시작 할 수 있어요.
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                        child: Text(
                          '나에게 맞는 프로그램으로 자산관리를 시작 할 수 있어요.',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'pretendard',
                                color: Color(0xFF474E57),
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),

                    // ++ 뷰페이저 & 인디케이터
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 500.0,
                          child: Stack(
                            children: [

                              // ++ 뷰페이져
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                child: PageView(
                                  controller: _model.pageViewController ??= PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    // ++ Investment
                                    FlipCard(
                                      controller: theEssentialCardController,
                                      fill: Fill.fillBack,
                                      direction: FlipDirection.HORIZONTAL,
                                      flipOnTouch: false,
                                      speed: 400,

                                      // ++ 앞면
                                      front: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color: Color(0xFF48C9CF),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: _buildEssentialCardFront(),
                                        ),
                                      ),

                                      // ++ 뒷면
                                      back: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xA348C9CF),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16.0),
                                              bottomRight: Radius.circular(12.0),
                                              topLeft: Radius.circular(16.0),
                                              topRight: Radius.circular(16.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(1, -1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 0),
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      size: 24,
                                                    ),
                                                    onPressed: () {
                                                      theEssentialCardController.toggleCard();
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                                                child: Text(
                                                  '관리금액 이체하기',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: 'pretendard',
                                                        fontSize: 20.0,
                                                        fontWeight: FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                child: Text(
                                                  '자금 이체를 위한 입금 전용 계좌정보입니다',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: 'pretendard',
                                                        fontSize: 16.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 24.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment: AlignmentDirectional(-1.0, -1.0),
                                                        child: Text(
                                                          '이체 계좌 은행명',
                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: AlignmentDirectional(-1.0, -1.0),
                                                        child: Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                          child: Text(
                                                            theContractApproveInvestment != null && theContractApproveInvestment!.isSuccessful() ? theContractApproveInvestment!.data!.virtualAccountBankName ?? '' : '',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  fontFamily: 'pretendard',
                                                                  fontSize: 16.0,
                                                                  fontWeight: FontWeight.bold,
                                                                  useGoogleFonts: false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                        child: Container(
                                                          width: double.infinity,
                                                          height: 1.0,
                                                          decoration: BoxDecoration(
                                                            color: Color(0x6257636C),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Stack(
                                                    children: [
                                                      Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                            child: Text(
                                                              '계좌번호',
                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                              child: Text(
                                                                theContractApproveInvestment != null && theContractApproveInvestment!.isSuccessful() ? theContractApproveInvestment!.data!.virtualAccountNo ?? '' : '',
                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      fontFamily: 'pretendard',
                                                                      fontSize: 16.0,
                                                                      fontWeight: FontWeight.bold,
                                                                      useGoogleFonts: false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                            child: Container(
                                                              width: double.infinity,
                                                              height: 1.0,
                                                              decoration: BoxDecoration(
                                                                color: Color(0x6257636C),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                        child: Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              print('Button pressed ...');
                                                            },
                                                            text: '계좌번호 복사',
                                                            options: FFButtonOptions(
                                                              height: 30.0,
                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                              color: Colors.white,
                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                    fontFamily: 'pretendard',
                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                    fontSize: 14.0,
                                                                    fontWeight: FontWeight.normal,
                                                                    useGoogleFonts: false,
                                                                  ),
                                                              elevation: 0.0,
                                                              borderSide: BorderSide(
                                                                color: Color(0x8D57636C),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius: BorderRadius.circular(8.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment: AlignmentDirectional(-1.0, -1.0),
                                                        child: Text(
                                                          '예금주',
                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: AlignmentDirectional(-1.0, -1.0),
                                                        child: Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                          child: Text(
                                                            theContractApproveInvestment != null && theContractApproveInvestment!.isSuccessful() ? theContractApproveInvestment!.data!.virtualAccountOwnerName ?? '' : '',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  fontFamily: 'pretendard',
                                                                  fontSize: 16.0,
                                                                  fontWeight: FontWeight.bold,
                                                                  useGoogleFonts: false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                        child: Container(
                                                          width: double.infinity,
                                                          height: 1.0,
                                                          decoration: BoxDecoration(
                                                            color: Color(0x6257636C),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    Map<String, dynamic> json = await NetworkManager.requestContractCheckWithdraw(theContractApproveInvestment!.data!.id!.toString());
                                                    ContractCheckWithdrawResult r = ContractCheckWithdrawResult.fromJson(json);
                                                    if( r != null && r.isSuccessful() ) {
                                                      if( r.data!.isWithdrawFinished! == false ) {
                                                        HelperUI.showToast('입금 확인 중 입니다. 잠시만 기다려 주세요.');
                                                        return;
                                                      }

                                                      HelperUI.showToast('축하합니다. 계약이 생성 되었습니다.');

                                                      setState(() {
                                                        hasInvestment = true;
                                                        theEssentialCardController.toggleCard();
                                                        setState(() {});
                                                      });

                                                      // https://stage-v2.getaim.co/contract/withdraw/?contract_id=13

                                                      return;
                                                    }
                                                  },
                                                  text: '이체 결과 확인 하기',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 56.0,
                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: Color(0xFF48C9CF),
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                          fontFamily: 'pretendard',
                                                          color: Colors.white,
                                                          useGoogleFonts: false,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(12.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    // ++ Pension
                                    // FlipCard(
                                    //   controller: thePensionCardController,
                                    //   flipOnTouch: false,
                                    //   fill: Fill.fillBack,
                                    //   direction: FlipDirection.HORIZONTAL,
                                    //   speed: 400,
                                    //   front: Padding(
                                    //     padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                                    //     child: Container(
                                    //       width: 100.0,
                                    //       height: 100.0,
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.white,
                                    //         borderRadius: BorderRadius.circular(16.0),
                                    //         border: Border.all(
                                    //           color: Color(0xFF48C9CF),
                                    //           width: 1.0,
                                    //         ),
                                    //       ),
                                    //       child: Column(
                                    //         mainAxisSize: MainAxisSize.max,
                                    //         children: [
                                    //           Align(
                                    //             alignment: AlignmentDirectional(-1.0, -1.0),
                                    //             child: Padding(
                                    //               padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 0.0, 0.0),
                                    //               child: Text(
                                    //                 'AIM TAOS',
                                    //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                       fontFamily: 'pretendard',
                                    //                       color: Color(0xFF5B7EFE),
                                    //                       fontSize: 24.0,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       useGoogleFonts: false,
                                    //                     ),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Align(
                                    //             alignment: AlignmentDirectional(-1.0, -1.0),
                                    //             child: Padding(
                                    //               padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 0.0),
                                    //               child: Text(
                                    //                 '연 1.2%',
                                    //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                       fontFamily: 'pretendard',
                                    //                       color: Color(0xFF2A323A),
                                    //                       fontSize: 18.0,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       useGoogleFonts: false,
                                    //                     ),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Align(
                                    //             alignment: AlignmentDirectional(-1.0, -1.0),
                                    //             child: Padding(
                                    //               padding: EdgeInsetsDirectional.fromSTEB(24.0, 21.0, 24.0, 0.0),
                                    //               child: Text(
                                    //                 '투자와 절세를 한번에 하는 혁신적인 1:1 맞춤 절세 솔루션',
                                    //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                       fontFamily: 'pretendard',
                                    //                       color: Color(0xFF474E57),
                                    //                       fontSize: 16.0,
                                    //                       useGoogleFonts: false,
                                    //                     ),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                                    //             child: Container(
                                    //               width: double.infinity,
                                    //               decoration: BoxDecoration(),
                                    //               child: Row(
                                    //                 mainAxisSize: MainAxisSize.max,
                                    //                 children: [
                                    //                   ClipRRect(
                                    //                     borderRadius: BorderRadius.circular(0.0),
                                    //                     child: Image.asset(
                                    //                       'assets/images/img_check_gray.png',
                                    //                       width: 20.0,
                                    //                       height: 20.0,
                                    //                       fit: BoxFit.cover,
                                    //                     ),
                                    //                   ),
                                    //                   Expanded(
                                    //                     child: Padding(
                                    //                       padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                    //                       child: Container(
                                    //                         decoration: BoxDecoration(),
                                    //                         child: Text(
                                    //                           'Tax Aware Optimmization Strategy',
                                    //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                                 fontFamily: 'pretendard',
                                    //                                 color: Color(0xFF474E57),
                                    //                                 fontSize: 15.0,
                                    //                                 fontWeight: FontWeight.normal,
                                    //                                 useGoogleFonts: false,
                                    //                               ),
                                    //                         ),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                                    //             child: Container(
                                    //               width: double.infinity,
                                    //               decoration: BoxDecoration(),
                                    //               child: Row(
                                    //                 mainAxisSize: MainAxisSize.max,
                                    //                 children: [
                                    //                   ClipRRect(
                                    //                     borderRadius: BorderRadius.circular(0.0),
                                    //                     child: Image.asset(
                                    //                       'assets/images/img_check_gray.png',
                                    //                       width: 20.0,
                                    //                       height: 20.0,
                                    //                       fit: BoxFit.cover,
                                    //                     ),
                                    //                   ),
                                    //                   Expanded(
                                    //                     child: Padding(
                                    //                       padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                    //                       child: Container(
                                    //                         decoration: BoxDecoration(),
                                    //                         child: Text(
                                    //                           '업계 최초 1:1 맞춤 절세 솔루션',
                                    //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                                 fontFamily: 'pretendard',
                                    //                                 color: Color(0xFF474E57),
                                    //                                 fontSize: 15.0,
                                    //                                 fontWeight: FontWeight.normal,
                                    //                                 useGoogleFonts: false,
                                    //                               ),
                                    //                         ),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                                    //             child: Container(
                                    //               width: double.infinity,
                                    //               decoration: BoxDecoration(),
                                    //               child: Row(
                                    //                 mainAxisSize: MainAxisSize.max,
                                    //                 children: [
                                    //                   ClipRRect(
                                    //                     borderRadius: BorderRadius.circular(0.0),
                                    //                     child: Image.asset(
                                    //                       'assets/images/img_check_gray.png',
                                    //                       width: 20.0,
                                    //                       height: 20.0,
                                    //                       fit: BoxFit.cover,
                                    //                     ),
                                    //                   ),
                                    //                   Expanded(
                                    //                     child: Padding(
                                    //                       padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                    //                       child: Container(
                                    //                         decoration: BoxDecoration(),
                                    //                         child: Text(
                                    //                           '세후 수익 극대화를 목표로, 포트폴리오 리밸런싱과 위험 요인 차단을 동시에 실현',
                                    //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                                 fontFamily: 'pretendard',
                                    //                                 color: Color(0xFF474E57),
                                    //                                 fontSize: 15.0,
                                    //                                 fontWeight: FontWeight.normal,
                                    //                                 useGoogleFonts: false,
                                    //                               ),
                                    //                         ),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                                    //             child: Container(
                                    //               width: double.infinity,
                                    //               decoration: BoxDecoration(),
                                    //               child: Row(
                                    //                 mainAxisSize: MainAxisSize.max,
                                    //                 children: [
                                    //                   ClipRRect(
                                    //                     borderRadius: BorderRadius.circular(0.0),
                                    //                     child: Image.asset(
                                    //                       'assets/images/img_check_gray.png',
                                    //                       width: 20.0,
                                    //                       height: 20.0,
                                    //                       fit: BoxFit.cover,
                                    //                     ),
                                    //                   ),
                                    //                   Expanded(
                                    //                     child: Padding(
                                    //                       padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                    //                       child: Container(
                                    //                         decoration: BoxDecoration(),
                                    //                         child: Text(
                                    //                           '세후 수익 극대화를 목표로, 포트폴리오 \n리밸런싱과 위험 요인 차단을 동시에 실현',
                                    //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                                 fontFamily: 'pretendard',
                                    //                                 color: Color(0xFF474E57),
                                    //                                 fontSize: 15.0,
                                    //                                 fontWeight: FontWeight.normal,
                                    //                                 useGoogleFonts: false,
                                    //                               ),
                                    //                         ),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                                    //             child: Container(
                                    //               width: double.infinity,
                                    //               decoration: BoxDecoration(),
                                    //               child: Row(
                                    //                 mainAxisSize: MainAxisSize.max,
                                    //                 children: [
                                    //                   ClipRRect(
                                    //                     borderRadius: BorderRadius.circular(0.0),
                                    //                     child: Image.asset(
                                    //                       'assets/images/img_check_gray.png',
                                    //                       width: 20.0,
                                    //                       height: 20.0,
                                    //                       fit: BoxFit.cover,
                                    //                     ),
                                    //                   ),
                                    //                   Expanded(
                                    //                     child: Padding(
                                    //                       padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                    //                       child: Container(
                                    //                         decoration: BoxDecoration(),
                                    //                         child: Text(
                                    //                           '연간 3.5%의 배당금 기대하며, 적금 이자 보다 높은 수익 제공',
                                    //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                                 fontFamily: 'pretendard',
                                    //                                 color: Color(0xFF474E57),
                                    //                                 fontSize: 15.0,
                                    //                                 fontWeight: FontWeight.normal,
                                    //                                 useGoogleFonts: false,
                                    //                               ),
                                    //                         ),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Spacer(),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                                    //             child: FFButtonWidget(
                                    //               onPressed: () {
                                    //                 thePensionCardController.toggleCard();
                                    //                 setState(() {});
                                    //               },
                                    //               text: 'AIM TAOS 시작하기',
                                    //               options: FFButtonOptions(
                                    //                 width: double.infinity,
                                    //                 height: 56.0,
                                    //                 padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                    //                 iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    //                 color: Color(0xFF48C9CF),
                                    //                 textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                    //                       fontFamily: 'pretendard',
                                    //                       color: Colors.white,
                                    //                       useGoogleFonts: false,
                                    //                     ),
                                    //                 elevation: 3.0,
                                    //                 borderSide: BorderSide(
                                    //                   color: Colors.transparent,
                                    //                   width: 0.0,
                                    //                 ),
                                    //                 borderRadius: BorderRadius.circular(12.0),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   back: Padding(
                                    //     padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                                    //     child: Container(
                                    //       width: 100.0,
                                    //       height: 100.0,
                                    //       decoration: BoxDecoration(
                                    //         color: Color(0xFF5B7EFE),
                                    //         borderRadius: BorderRadius.only(
                                    //           bottomLeft: Radius.circular(16.0),
                                    //           bottomRight: Radius.circular(12.0),
                                    //           topLeft: Radius.circular(16.0),
                                    //           topRight: Radius.circular(16.0),
                                    //         ),
                                    //       ),
                                    //       child: Column(
                                    //         mainAxisSize: MainAxisSize.max,
                                    //         children: [
                                    //           Align(
                                    //             alignment: AlignmentDirectional(1, -1),
                                    //             child: Padding(
                                    //               padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 0),
                                    //               child: IconButton(
                                    //                 icon: Icon(
                                    //                   Icons.close,
                                    //                   color: FlutterFlowTheme.of(context).primaryText,
                                    //                   size: 24,
                                    //                 ),
                                    //                 onPressed: () {
                                    //                   thePensionCardController.toggleCard();
                                    //                   setState(() {});
                                    //                 },
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                                    //             child: Text(
                                    //               '관리금액 이체하기',
                                    //               style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                     fontFamily: 'pretendard',
                                    //                     fontSize: 20.0,
                                    //                     fontWeight: FontWeight.bold,
                                    //                     useGoogleFonts: false,
                                    //                   ),
                                    //             ),
                                    //           ),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                    //             child: Text(
                                    //               '자금 이체를 위한 입금 전용 계좌정보입니다',
                                    //               style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                     fontFamily: 'pretendard',
                                    //                     fontSize: 16.0,
                                    //                     useGoogleFonts: false,
                                    //                   ),
                                    //             ),
                                    //           ),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 24.0, 0.0),
                                    //             child: Container(
                                    //               width: double.infinity,
                                    //               decoration: BoxDecoration(),
                                    //               child: Column(
                                    //                 mainAxisSize: MainAxisSize.max,
                                    //                 children: [
                                    //                   Align(
                                    //                     alignment: AlignmentDirectional(-1.0, -1.0),
                                    //                     child: Text(
                                    //                       '이체 계좌 은행명',
                                    //                       style: FlutterFlowTheme.of(context).bodyMedium,
                                    //                     ),
                                    //                   ),
                                    //                   Align(
                                    //                     alignment: AlignmentDirectional(-1.0, -1.0),
                                    //                     child: Padding(
                                    //                       padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                    //                       child: Text(
                                    //                         '기업은행',
                                    //                         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                               fontFamily: 'pretendard',
                                    //                               fontSize: 16.0,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               useGoogleFonts: false,
                                    //                             ),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                   Padding(
                                    //                     padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                    //                     child: Container(
                                    //                       width: double.infinity,
                                    //                       height: 1.0,
                                    //                       decoration: BoxDecoration(
                                    //                         color: Color(0x6257636C),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                                    //             child: Container(
                                    //               width: double.infinity,
                                    //               decoration: BoxDecoration(),
                                    //               child: Stack(
                                    //                 children: [
                                    //                   Column(
                                    //                     mainAxisSize: MainAxisSize.max,
                                    //                     children: [
                                    //                       Align(
                                    //                         alignment: AlignmentDirectional(-1.0, -1.0),
                                    //                         child: Text(
                                    //                           '계좌번호',
                                    //                           style: FlutterFlowTheme.of(context).bodyMedium,
                                    //                         ),
                                    //                       ),
                                    //                       Align(
                                    //                         alignment: AlignmentDirectional(-1.0, -1.0),
                                    //                         child: Padding(
                                    //                           padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                    //                           child: Text(
                                    //                             '4312949832481',
                                    //                             style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                                   fontFamily: 'pretendard',
                                    //                                   fontSize: 16.0,
                                    //                                   fontWeight: FontWeight.bold,
                                    //                                   useGoogleFonts: false,
                                    //                                 ),
                                    //                           ),
                                    //                         ),
                                    //                       ),
                                    //                       Padding(
                                    //                         padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                    //                         child: Container(
                                    //                           width: double.infinity,
                                    //                           height: 1.0,
                                    //                           decoration: BoxDecoration(
                                    //                             color: Color(0x6257636C),
                                    //                           ),
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                   Align(
                                    //                     alignment: AlignmentDirectional(1.0, 0.0),
                                    //                     child: Padding(
                                    //                       padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                    //                       child: FFButtonWidget(
                                    //                         onPressed: () {
                                    //                           print('Button pressed ...');
                                    //                         },
                                    //                         text: '계좌번호 복사',
                                    //                         options: FFButtonOptions(
                                    //                           height: 30.0,
                                    //                           padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                    //                           iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    //                           color: Colors.white,
                                    //                           textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                    //                                 fontFamily: 'pretendard',
                                    //                                 color: FlutterFlowTheme.of(context).secondaryText,
                                    //                                 fontSize: 14.0,
                                    //                                 fontWeight: FontWeight.normal,
                                    //                                 useGoogleFonts: false,
                                    //                               ),
                                    //                           elevation: 0.0,
                                    //                           borderSide: BorderSide(
                                    //                             color: Color(0x8D57636C),
                                    //                             width: 1.0,
                                    //                           ),
                                    //                           borderRadius: BorderRadius.circular(8.0),
                                    //                         ),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                                    //             child: Container(
                                    //               width: double.infinity,
                                    //               decoration: BoxDecoration(),
                                    //               child: Column(
                                    //                 mainAxisSize: MainAxisSize.max,
                                    //                 children: [
                                    //                   Align(
                                    //                     alignment: AlignmentDirectional(-1.0, -1.0),
                                    //                     child: Text(
                                    //                       '예금주',
                                    //                       style: FlutterFlowTheme.of(context).bodyMedium,
                                    //                     ),
                                    //                   ),
                                    //                   Align(
                                    //                     alignment: AlignmentDirectional(-1.0, -1.0),
                                    //                     child: Padding(
                                    //                       padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                    //                       child: Text(
                                    //                         'AIM_당나귀',
                                    //                         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                               fontFamily: 'pretendard',
                                    //                               fontSize: 16.0,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               useGoogleFonts: false,
                                    //                             ),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                   Padding(
                                    //                     padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                    //                     child: Container(
                                    //                       width: double.infinity,
                                    //                       height: 1.0,
                                    //                       decoration: BoxDecoration(
                                    //                         color: Color(0x6257636C),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Spacer(),
                                    //           Padding(
                                    //             padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                                    //             child: FFButtonWidget(
                                    //               onPressed: () {
                                    //                 print('Button pressed ...');
                                    //               },
                                    //               text: '이체 결과 확인 하기',
                                    //               options: FFButtonOptions(
                                    //                 width: double.infinity,
                                    //                 height: 56.0,
                                    //                 padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                    //                 iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    //                 color: Color(0xFF48C9CF),
                                    //                 textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                    //                       fontFamily: 'pretendard',
                                    //                       color: Colors.white,
                                    //                       useGoogleFonts: false,
                                    //                     ),
                                    //                 elevation: 3.0,
                                    //                 borderSide: BorderSide(
                                    //                   color: Colors.transparent,
                                    //                   width: 0.0,
                                    //                 ),
                                    //                 borderRadius: BorderRadius.circular(12.0),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),

                              // ++ 인디케이터
                              Align(
                                alignment: AlignmentDirectional(-1.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                                  child: smooth_page_indicator.SmoothPageIndicator(
                                    controller: _model.pageViewController ??= PageController(initialPage: 0),
                                    count: 1,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await _model.pageViewController!.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: smooth_page_indicator.ExpandingDotsEffect(
                                      expansionFactor: 3.0,
                                      spacing: 8.0,
                                      radius: 16.0,
                                      dotWidth: 16.0,
                                      dotHeight: 8.0,
                                      dotColor: FlutterFlowTheme.of(context).accent1,
                                      activeDotColor: Color(0xFF48C9CF),
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: FlutterFlowTheme.of(context).titleSmall.override(
            fontFamily: 'pretendard',
            color: FlutterFlowTheme.of(context).secondaryText,
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            useGoogleFonts: false,
          ),
        )
      ],
    );
  }
}