import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pop_up_terms_model.dart';
export 'pop_up_terms_model.dart';

class PopUpTermsWidget extends StatefulWidget {
  const PopUpTermsWidget({super.key});

  @override
  State<PopUpTermsWidget> createState() => _PopUpTermsWidgetState();
}

class _PopUpTermsWidgetState extends State<PopUpTermsWidget> {
  late PopUpTermsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpTermsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          valueOrDefault<double>(
            MediaQuery.sizeOf(context).width > 1000.0 ? 0.0 : 16.0,
            0.0,
          ),
          0.0,
          valueOrDefault<double>(
            MediaQuery.sizeOf(context).width > 1000.0 ? 0.0 : 16.0,
            0.0,
          ),
          0.0),
      child: FutureBuilder<List<CmsRow>>(
        future: CmsTable().querySingleRow(
          queryFn: (q) => q.eq(
            'type',
            EnumCms.TERMS_OF_USE.name,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<CmsRow> containerCmsRowList = snapshot.data!;

          final containerCmsRow =
              containerCmsRowList.isNotEmpty ? containerCmsRowList.first : null;

          return Container(
            height: MediaQuery.sizeOf(context).height * 0.9,
            constraints: BoxConstraints(
              maxWidth: 1250.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(23.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width > 1000.0
                                ? 40.0
                                : 0.0,
                            0.0,
                          ),
                          32.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width > 1000.0
                                ? 40.0
                                : 0.0,
                            0.0,
                          ),
                          0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Пользовательское соглашение',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: MediaQuery.sizeOf(context).width >
                                            1000.0
                                        ? 36.0
                                        : 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width > 1000.0
                                ? 40.0
                                : 0.0,
                            0.0,
                          ),
                          32.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width > 1000.0
                                ? 40.0
                                : 0.0,
                            0.0,
                          ),
                          0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                containerCmsRow?.text1,
                                'Текст политиики',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
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
          );
        },
      ),
    );
  }
}
