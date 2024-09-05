import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'why_model.dart';
export 'why_model.dart';

class WhyWidget extends StatefulWidget {
  const WhyWidget({super.key});

  @override
  State<WhyWidget> createState() => _WhyWidgetState();
}

class _WhyWidgetState extends State<WhyWidget> {
  late WhyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WhyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<CmsRow>>(
            future: CmsTable().querySingleRow(
              queryFn: (q) => q
                  .eq(
                    'type',
                    EnumCms.WHYUS.name,
                  )
                  .order('created_at'),
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

              final containerCmsRow = containerCmsRowList.isNotEmpty
                  ? containerCmsRowList.first
                  : null;

              return Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Vector.png',
                    ).image,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 1250.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.menuModel,
                                updateCallback: () => safeSetState(() {}),
                                child: MenuWidget(
                                  isBlue: true,
                                  page: 'home',
                                  clientProfile: () async {},
                                  clientRequest: () async {},
                                  clientFavorite: () async {},
                                  searchAction: () async {},
                                ),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 1250.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Почему ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: 'Micebooking?',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 34.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  containerCmsRow?.title1,
                                                  'text',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FutureBuilder<List<CmsRow>>(
                                        future: CmsTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'type',
                                                EnumCms.WHY_ELEMENT_1.name,
                                              )
                                              .order('created_at',
                                                  ascending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CmsRow> listViewCmsRowList =
                                              snapshot.data!;

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewCmsRowList.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 32.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewCmsRow =
                                                  listViewCmsRowList[
                                                      listViewIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (listViewCmsRow
                                                                  .title1 !=
                                                              null &&
                                                          listViewCmsRow
                                                                  .title1 !=
                                                              '')
                                                        Expanded(
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewCmsRow
                                                                  .title1,
                                                              'Ошибка залоговка',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewCmsRow
                                                                .text1,
                                                            'текст 1',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 16.0)),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ].divide(const SizedBox(height: 24.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  containerCmsRow?.title2,
                                                  'text',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      FutureBuilder<List<CmsRow>>(
                                        future: CmsTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'type',
                                                EnumCms.WHY_ELEMENT_2.name,
                                              )
                                              .order('created_at',
                                                  ascending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CmsRow> listViewCmsRowList =
                                              snapshot.data!;

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewCmsRowList.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 32.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewCmsRow =
                                                  listViewCmsRowList[
                                                      listViewIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (listViewCmsRow
                                                                  .title1 !=
                                                              null &&
                                                          listViewCmsRow
                                                                  .title1 !=
                                                              '')
                                                        Expanded(
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewCmsRow
                                                                  .title1,
                                                              'Ошибка залоговка',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewCmsRow
                                                                .text1,
                                                            'текст 1',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 16.0)),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ].divide(const SizedBox(height: 24.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  containerCmsRow?.title3,
                                                  'text',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      FutureBuilder<List<CmsRow>>(
                                        future: CmsTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'type',
                                                EnumCms.WHY_ELEMENT_3.name,
                                              )
                                              .order('created_at',
                                                  ascending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CmsRow> listViewCmsRowList =
                                              snapshot.data!;

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewCmsRowList.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 32.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewCmsRow =
                                                  listViewCmsRowList[
                                                      listViewIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (listViewCmsRow
                                                                  .title1 !=
                                                              null &&
                                                          listViewCmsRow
                                                                  .title1 !=
                                                              '')
                                                        Expanded(
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewCmsRow
                                                                  .title1,
                                                              'Ошибка залоговка',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewCmsRow
                                                                .text1,
                                                            'текст 1',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 16.0)),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ].divide(const SizedBox(height: 24.0)),
                                  ),
                                ]
                                    .divide(const SizedBox(height: 24.0))
                                    .addToEnd(const SizedBox(height: 70.0)),
                              ),
                            ),
                          ].divide(const SizedBox(height: 40.0)),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.footerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const FooterWidget(),
                      ),
                    ].divide(const SizedBox(height: 40.0)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
