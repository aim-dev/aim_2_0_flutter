import '../../tools/network_mgr.dart';
import '../../tools/utils_string.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import 'terms_html_page_model.dart';
export 'terms_html_page_model.dart';

import 'package:http/http.dart' as http;

class TermsHtmlPageWidget extends StatefulWidget {
  const TermsHtmlPageWidget({Key? key, this.url}) : super(key: key);

  final String? url;

  @override
  _TermsHtmlPageWidgetState createState() => _TermsHtmlPageWidgetState();
}

class _TermsHtmlPageWidgetState extends State<TermsHtmlPageWidget> {
  late TermsHtmlPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late Future future;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsHtmlPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    future = fetchHtml();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<String> fetchHtml() async {
    String url = widget!.url!.replaceAll('http://', 'https://');
    String html = await NetworkManager.getString(url);
    // html = html.replaceAll('{username}', SharedPreferenceManager.getAimUserName());
    html = html.replaceAll('{username}', 'AIMer');
    html = html.replaceAll('{today}', UtilString.dateTimeFormattedString(DateTime.now(), 'yyyy-MM-dd'));

    return html;
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
                Container(
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(),
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF2A323A),
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                    future: future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Html(
                                    data: snapshot.data as String,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        // 로딩 중이면 로딩 표시를 합니다.
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
