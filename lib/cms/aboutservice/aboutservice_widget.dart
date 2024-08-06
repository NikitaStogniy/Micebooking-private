import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'aboutservice_model.dart';
export 'aboutservice_model.dart';

class AboutserviceWidget extends StatefulWidget {
  const AboutserviceWidget({super.key});

  @override
  State<AboutserviceWidget> createState() => _AboutserviceWidgetState();
}

class _AboutserviceWidgetState extends State<AboutserviceWidget> {
  late AboutserviceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutserviceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
                    EnumCms.ABOUT.name,
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
                        padding: const EdgeInsets.all(24.0),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 1250.0,
                          ),
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.menuModel,
                                updateCallback: () => setState(() {}),
                                child: MenuWidget(
                                  isBlue: true,
                                  page: 'home',
                                  clientProfile: () async {},
                                  clientRequest: () async {},
                                  clientFavorite: () async {},
                                  searchAction: () async {},
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'О сервисе ',
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: 'Micebooking',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  ),
                                ]
                                    .divide(const SizedBox(height: 24.0))
                                    .addToEnd(const SizedBox(height: 0.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        containerCmsRow?.text1,
                                        'text',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 90.0)),
                              ),
                            ].divide(const SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.footerModel,
                        updateCallback: () => setState(() {}),
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
