import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/footer_widget.dart';
import '/components/hotel_search_comp_widget.dart';
import '/components/login_home_pop_up_widget.dart';
import '/components/support_bottomsheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        await UsersTable().update(
          data: {
            'uid': currentUserUid,
          },
          matchingRows: (rows) => rows.eq(
            'email',
            currentUserEmail,
          ),
        );
      }
    });

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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                FutureBuilder<List<UsersRow>>(
                  future: UsersTable().querySingleRow(
                    queryFn: (q) => q.eq(
                      'uid',
                      currentUserUid,
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
                    List<UsersRow> descUsersRowList = snapshot.data!;

                    final descUsersRow = descUsersRowList.isNotEmpty
                        ? descUsersRowList.first
                        : null;

                    return Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/bg.png',
                          ).image,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.menuModel1,
                                  updateCallback: () => setState(() {}),
                                  child: MenuWidget(
                                    isBlue: false,
                                    page: 'home',
                                    clientProfile: () async {},
                                    clientRequest: () async {},
                                    clientFavorite: () async {},
                                    searchAction: () async {},
                                  ),
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                              Align(
                                alignment: const AlignmentDirectional(0.0, -0.9),
                                child: Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 1250.0,
                                  ),
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: SvgPicture.asset(
                                            'assets/images/MICEBOOKING.svg',
                                            width: 200.0,
                                            fit: BoxFit.contain,
                                            alignment: const Alignment(-1.0, 0.0),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'aboutservice');
                                                },
                                                child: Text(
                                                  'О сервисе',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed('why');
                                                },
                                                child: Text(
                                                  'Почему Micebooking',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed('AboutUs');
                                                },
                                                child: Text(
                                                  'О нас',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              if (loggedIn == false)
                                                Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showDialog(
                                                        barrierColor:
                                                            const Color(0x68121212),
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () =>
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus(),
                                                              child: SizedBox(
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.9,
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.8,
                                                                child:
                                                                    const LoginHomePopUpWidget(
                                                                  hotel: true,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      'Зарегистрировать площадку',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: const SizedBox(
                                                            height: 300.0,
                                                            child:
                                                                SupportBottomsheetWidget(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Text(
                                                  'Поддержка',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 24.0)),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (currentUserUid != '') {
                                              if (descUsersRow?.role ==
                                                  EnumRole.HOTEL.name) {
                                                context.pushNamed(
                                                  'HOTEL_HOME',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              } else {
                                                if (descUsersRow?.role ==
                                                    EnumRole.CLIENT.name) {
                                                  context.pushNamed(
                                                    'Client_home',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                } else {
                                                  if (descUsersRow?.role ==
                                                      EnumRole.SUPERUSER.name) {
                                                    context.pushNamed(
                                                      'SUPER_Home',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                }
                                              }
                                            } else {
                                              context.goNamed(
                                                'PC_LoginCopy',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            }
                                          },
                                          text: 'Личный кабинет',
                                          options: FFButtonOptions(
                                            width: 200.0,
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 40.0)),
                                    ),
                                  ),
                                ),
                              ),
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, -0.3),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width <
                                                1000.0
                                            ? 40.0
                                            : 0.0,
                                        0.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'МЕРОПРИЯТИЕ НАЧИНАЕТСЯ С БРОНИРОВАНИЯ',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width <
                                                          1000.0
                                                      ? 32.0
                                                      : 45.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 24.0),
                                        child: Text(
                                          'ПОИСК И БРОНИРОВАНИЕ ОТЕЛЕЙ ДЛЯ ПРОВЕДЕНИЯ МЕРОПРИЯТИЙ',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) => wrapWithModel(
                                          model: _model.hotelSearchCompModel1,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: HotelSearchCompWidget(
                                            duration: 0.0,
                                            visitors: 0,
                                            date: getCurrentTimestamp,
                                            hallFilter1: null,
                                            home: true,
                                            onSearch: (date,
                                                duration,
                                                city,
                                                visitors,
                                                seatings,
                                                hallFilter1,
                                                hallFilter2,
                                                hallFilter3) async {
                                              if (loggedIn) {
                                                context.pushNamed(
                                                  'HotelSearchPage',
                                                  queryParameters: {
                                                    'startDate': serializeParam(
                                                      date,
                                                      ParamType.DateTime,
                                                    ),
                                                    'duration': serializeParam(
                                                      duration,
                                                      ParamType.double,
                                                    ),
                                                    'city': serializeParam(
                                                      city,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                    'visitors': serializeParam(
                                                      visitors,
                                                      ParamType.int,
                                                    ),
                                                    'user': serializeParam(
                                                      descUsersRow,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                    'hallFilter1':
                                                        serializeParam(
                                                      hallFilter1,
                                                      ParamType.DataStruct,
                                                    ),
                                                    'hallFilter2':
                                                        serializeParam(
                                                      hallFilter2,
                                                      ParamType.DataStruct,
                                                    ),
                                                    'hallFilter3':
                                                        serializeParam(
                                                      hallFilter3,
                                                      ParamType.DataStruct,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                await showDialog(
                                                  barrierColor:
                                                      const Color(0x68121212),
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus(),
                                                        child: SizedBox(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.9,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.8,
                                                          child:
                                                              LoginHomePopUpWidget(
                                                            startDate: date,
                                                            duration: duration,
                                                            city: city,
                                                            visitors: visitors,
                                                            filter1:
                                                                hallFilter1,
                                                            filter2:
                                                                hallFilter2,
                                                            filter3:
                                                                hallFilter3,
                                                            hotel: false,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            },
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
                      ),
                    );
                  },
                ),
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                FutureBuilder<List<UsersRow>>(
                  future: UsersTable().querySingleRow(
                    queryFn: (q) => q.eq(
                      'uid',
                      currentUserUid,
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
                    List<UsersRow> mobUsersRowList = snapshot.data!;

                    final mobUsersRow = mobUsersRowList.isNotEmpty
                        ? mobUsersRowList.first
                        : null;

                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/bg.png',
                          ).image,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.menuModel2,
                                  updateCallback: () => setState(() {}),
                                  child: MenuWidget(
                                    isBlue: false,
                                    page: 'home',
                                    clientProfile: () async {},
                                    clientRequest: () async {},
                                    clientFavorite: () async {},
                                    searchAction: () async {},
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'МЕРОПРИЯТИЕ НАЧИНАЕТСЯ С БРОНИРОВАНИЯ',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize:
                                              MediaQuery.sizeOf(context).width <
                                                      1000.0
                                                  ? 32.0
                                                  : 45.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 24.0),
                                    child: Text(
                                      'ПОИСК И БРОНИРОВАНИЕ ОТЕЛЕЙ ДЛЯ ПРОВЕДЕНИЯ МЕРОПРИЯТИЙ',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width <
                                                    1000.0
                                                ? 18.0
                                                : 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: wrapWithModel(
                                        model: _model.hotelSearchCompModel2,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: HotelSearchCompWidget(
                                          duration: 0.0,
                                          visitors: 0,
                                          date: getCurrentTimestamp,
                                          hallFilter1: null,
                                          home: true,
                                          onSearch: (date,
                                              duration,
                                              city,
                                              visitors,
                                              seatings,
                                              hallFilter1,
                                              hallFilter2,
                                              hallFilter3) async {
                                            if (loggedIn) {
                                              context.pushNamed(
                                                'HotelSearchPage',
                                                queryParameters: {
                                                  'startDate': serializeParam(
                                                    date,
                                                    ParamType.DateTime,
                                                  ),
                                                  'duration': serializeParam(
                                                    duration,
                                                    ParamType.double,
                                                  ),
                                                  'city': serializeParam(
                                                    city,
                                                    ParamType.SupabaseRow,
                                                  ),
                                                  'visitors': serializeParam(
                                                    visitors,
                                                    ParamType.int,
                                                  ),
                                                  'user': serializeParam(
                                                    mobUsersRow,
                                                    ParamType.SupabaseRow,
                                                  ),
                                                  'hallFilter1': serializeParam(
                                                    hallFilter1,
                                                    ParamType.DataStruct,
                                                  ),
                                                  'hallFilter2': serializeParam(
                                                    hallFilter2,
                                                    ParamType.DataStruct,
                                                  ),
                                                  'hallFilter3': serializeParam(
                                                    hallFilter3,
                                                    ParamType.DataStruct,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              await showDialog(
                                                barrierColor: const Color(0x68121212),
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus(),
                                                      child: SizedBox(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.9,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.8,
                                                        child:
                                                            LoginHomePopUpWidget(
                                                          startDate: date,
                                                          duration: duration,
                                                          city: city,
                                                          visitors: visitors,
                                                          filter1: hallFilter1,
                                                          filter2: hallFilter2,
                                                          filter3: hallFilter3,
                                                          hotel: false,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          },
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
                    );
                  },
                ),
              wrapWithModel(
                model: _model.footerModel,
                updateCallback: () => setState(() {}),
                child: const FooterWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
