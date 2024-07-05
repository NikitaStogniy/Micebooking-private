import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/hotel_flow/add_or_edit_food/add_or_edit_food_widget.dart';
import '/hotel_flow/add_or_edit_hall/add_or_edit_hall_widget.dart';
import '/hotel_flow/add_or_edit_room/add_or_edit_room_widget.dart';
import '/superuser_flow/client_search/client_search_widget.dart';
import '/superuser_flow/company_requests_component/company_requests_component_widget.dart';
import '/superuser_flow/edit_about/edit_about_widget.dart';
import '/superuser_flow/edit_about_us/edit_about_us_widget.dart';
import '/superuser_flow/edit_p_p/edit_p_p_widget.dart';
import '/superuser_flow/edit_q_a/edit_q_a_widget.dart';
import '/superuser_flow/edit_whyus/edit_whyus_widget.dart';
import '/superuser_flow/food_full_info/food_full_info_widget.dart';
import '/superuser_flow/food_settings/food_settings_widget.dart';
import '/superuser_flow/hall_full_info/hall_full_info_widget.dart';
import '/superuser_flow/hall_settings/hall_settings_widget.dart';
import '/superuser_flow/hotel_detail/hotel_detail_widget.dart';
import '/superuser_flow/hotel_full_info/hotel_full_info_widget.dart';
import '/superuser_flow/hotel_search/hotel_search_widget.dart';
import '/superuser_flow/hotel_settings/hotel_settings_widget.dart';
import '/superuser_flow/room_full_info/room_full_info_widget.dart';
import '/superuser_flow/room_settings/room_settings_widget.dart';
import '/superuser_flow/super_hotel_juridical/super_hotel_juridical_widget.dart';
import '/superuser_flow/super_requests/super_requests_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 's_u_p_e_r_home_model.dart';
export 's_u_p_e_r_home_model.dart';

class SUPERHomeWidget extends StatefulWidget {
  const SUPERHomeWidget({super.key});

  @override
  State<SUPERHomeWidget> createState() => _SUPERHomeWidgetState();
}

class _SUPERHomeWidgetState extends State<SUPERHomeWidget> {
  late SUPERHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SUPERHomeModel());

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
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Vector.png',
                ).image,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(50.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 32.0, 16.0, 0.0),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/MICEBOOKING.svg',
                                  width: 140.0,
                                  height: 16.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, -0.3),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    controller: _model.columnController1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.activePage =
                                                SuperUserPage.hotel_search;
                                            _model.foodId = null;
                                            setState(() {});
                                            await _model.columnController2
                                                ?.animateTo(
                                              0,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Text(
                                            'Поиск по отелям',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: valueOrDefault<Color>(
                                                    _model.activePage ==
                                                            SuperUserPage
                                                                .hotel_search
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                  ),
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.activePage =
                                                SuperUserPage.client_search;
                                            setState(() {});
                                            await _model.columnController2
                                                ?.animateTo(
                                              0,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Text(
                                            'Поиск по клиентам',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: valueOrDefault<Color>(
                                                    _model.activePage ==
                                                            SuperUserPage
                                                                .client_search
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                  ),
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Настройки:',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.activePage =
                                                    SuperUserPage
                                                        .hotel_settings;
                                                setState(() {});
                                                await _model.columnController2
                                                    ?.animateTo(
                                                  0,
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Text(
                                                'Отели',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.activePage ==
                                                                    SuperUserPage
                                                                        .hotel_settings
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                _model.activePage =
                                                    SuperUserPage.room_settings;
                                                setState(() {});
                                                await _model.columnController2
                                                    ?.animateTo(
                                                  0,
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Text(
                                                'Номера',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.activePage ==
                                                                    SuperUserPage
                                                                        .room_settings
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                _model.activePage =
                                                    SuperUserPage.hall_settings;
                                                setState(() {});
                                                await _model.columnController2
                                                    ?.animateTo(
                                                  0,
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Text(
                                                'Залы',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.activePage ==
                                                                    SuperUserPage
                                                                        .hall_settings
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                _model.activePage =
                                                    SuperUserPage.food_settings;
                                                setState(() {});
                                                await _model.columnController2
                                                    ?.animateTo(
                                                  0,
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Text(
                                                'Питание',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.activePage ==
                                                                    SuperUserPage
                                                                        .food_settings
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 20.0)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 64.0, 0.0, 64.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Страницы:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.activePage =
                                                      SuperUserPage.cms_whyus;
                                                  setState(() {});
                                                  await _model.columnController2
                                                      ?.animateTo(
                                                    0,
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: Text(
                                                  'Почему micebooking?',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.activePage ==
                                                                      SuperUserPage
                                                                          .cms_whyus
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                  _model.activePage =
                                                      SuperUserPage.cms_about;
                                                  setState(() {});
                                                  await _model.columnController2
                                                      ?.animateTo(
                                                    0,
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: Text(
                                                  'О сервисе',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.activePage ==
                                                                      SuperUserPage
                                                                          .cms_about
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                  _model.activePage =
                                                      SuperUserPage.cms_aboutus;
                                                  setState(() {});
                                                  await _model.columnController2
                                                      ?.animateTo(
                                                    0,
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: Text(
                                                  'О нас',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.activePage ==
                                                                      SuperUserPage
                                                                          .cms_about
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                  _model.activePage =
                                                      SuperUserPage.cms_qa;
                                                  setState(() {});
                                                  await _model.columnController2
                                                      ?.animateTo(
                                                    0,
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: Text(
                                                  'Q&A',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.activePage ==
                                                                      SuperUserPage
                                                                          .cms_about
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                  _model.activePage =
                                                      SuperUserPage.PP;
                                                  setState(() {});
                                                  await _model.columnController2
                                                      ?.animateTo(
                                                    0,
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: Text(
                                                  'Политика\nконфиденциальности ',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.activePage ==
                                                                      SuperUserPage
                                                                          .cms_about
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 20.0)),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await authManager.signOut();
                                              GoRouter.of(context)
                                                  .clearRedirectLocation();

                                              context.goNamedAuth(
                                                  'HomePage', context.mounted);
                                            },
                                            text: 'Выйти',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _model.columnController2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if ((_model.activePage != SuperUserPage.hotel_search) &&
                            (_model.activePage != SuperUserPage.hotel_info) &&
                            (_model.activePage !=
                                SuperUserPage.client_search) &&
                            (_model.activePage !=
                                SuperUserPage.hotel_request) &&
                            (_model.activePage !=
                                SuperUserPage.hotel_full_info) &&
                            (_model.activePage !=
                                SuperUserPage.hall_full_info) &&
                            (_model.activePage !=
                                SuperUserPage.food_full_info) &&
                            (_model.activePage !=
                                SuperUserPage.room_full_info) &&
                            (_model.activePage != SuperUserPage.client_cp) &&
                            (_model.activePage != SuperUserPage.PP) &&
                            (_model.activePage != SuperUserPage.hotel_jur))
                          Text(
                            () {
                              if (_model.activePage ==
                                  SuperUserPage.hotel_settings) {
                                return 'Настройки для отелей:';
                              } else if (_model.activePage ==
                                  SuperUserPage.room_settings) {
                                return 'Настройки для номеров:';
                              } else if (_model.activePage ==
                                  SuperUserPage.hall_settings) {
                                return 'Настройки для залов:';
                              } else if (_model.activePage ==
                                  SuperUserPage.food_settings) {
                                return 'Настройки для питания:';
                              } else if (_model.activePage ==
                                  SuperUserPage.hotel_search) {
                                return 'Поиск:';
                              } else if (_model.activePage ==
                                  SuperUserPage.hotel_summary) {
                                return 'Название отеля, Город';
                              } else if (_model.activePage ==
                                  SuperUserPage.hotel_info) {
                                return 'Отель 1';
                              } else if (_model.activePage ==
                                  SuperUserPage.room_info) {
                                return 'Номер 1, Отель 1, Город';
                              } else if (_model.activePage ==
                                  SuperUserPage.hall_info) {
                                return 'Зал 1, Отель 1, город';
                              } else if (_model.activePage ==
                                  SuperUserPage.food_info) {
                                return 'Пакет 1, Отель 1, город';
                              } else if (_model.activePage ==
                                  SuperUserPage.hotel_commercial) {
                                return 'Название отеля, город';
                              } else if (_model.activePage ==
                                  SuperUserPage.client_search) {
                                return 'Поиск:';
                              } else if (_model.activePage ==
                                  SuperUserPage.client_commercial) {
                                return 'ИП  ФИО или ООО “Название” , ';
                              } else if (_model.activePage ==
                                  SuperUserPage.cms_about) {
                                return 'Редактирование текста страницы: о сервисе MiceBooking';
                              } else if (_model.activePage ==
                                  SuperUserPage.cms_whyus) {
                                return 'Редактирование текста страницы: Почему MiceBooking?';
                              } else if (_model.activePage ==
                                  SuperUserPage.cms_aboutus) {
                                return 'Редактирование текста страницы: о нас';
                              } else if (_model.activePage ==
                                  SuperUserPage.cms_qa) {
                                return 'Редактирование текста страницы: Часто задаваемые вопросы';
                              } else {
                                return 'Заголовок';
                              }
                            }(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 38.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 40.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_model.activePage ==
                                  SuperUserPage.hotel_settings)
                                wrapWithModel(
                                  model: _model.hotelSettingsModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: const HotelSettingsWidget(),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.room_settings)
                                wrapWithModel(
                                  model: _model.roomSettingsModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: const RoomSettingsWidget(),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.hall_settings)
                                wrapWithModel(
                                  model: _model.hallSettingsModel,
                                  updateCallback: () => setState(() {}),
                                  child: const HallSettingsWidget(),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.food_settings)
                                wrapWithModel(
                                  model: _model.foodSettingsModel,
                                  updateCallback: () => setState(() {}),
                                  child: const FoodSettingsWidget(),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.hotel_search)
                                wrapWithModel(
                                  model: _model.hotelSearchModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: HotelSearchWidget(
                                    hotelId: (id) async {
                                      _model.activePage =
                                          SuperUserPage.hotel_info;
                                      _model.hotelId = id;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage == SuperUserPage.hotel_info)
                                wrapWithModel(
                                  model: _model.hotelDetailModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: HotelDetailWidget(
                                    selectedID: _model.hotelId!,
                                    editRooms: (id) async {
                                      _model.activePage =
                                          SuperUserPage.room_info;
                                      _model.roomId = valueOrDefault<int>(
                                        id,
                                        88,
                                      );
                                      _model.hallId = valueOrDefault<int>(
                                        null,
                                        88,
                                      );
                                      _model.foodId = valueOrDefault<int>(
                                        null,
                                        88,
                                      );
                                      setState(() {});
                                    },
                                    editHall: (id) async {
                                      _model.activePage =
                                          SuperUserPage.hall_info;
                                      _model.roomId = valueOrDefault<int>(
                                        null,
                                        88,
                                      );
                                      _model.hallId = id;
                                      _model.foodId = valueOrDefault<int>(
                                        null,
                                        88,
                                      );
                                      setState(() {});
                                    },
                                    editFood: (id) async {
                                      _model.foodId = id;
                                      setState(() {});
                                      _model.activePage =
                                          SuperUserPage.food_info;
                                      _model.roomId = valueOrDefault<int>(
                                        null,
                                        88,
                                      );
                                      _model.hallId = valueOrDefault<int>(
                                        null,
                                        88,
                                      );
                                      setState(() {});
                                    },
                                    showHotel: (id) async {
                                      _model.activePage =
                                          SuperUserPage.hotel_full_info;
                                      _model.hotelId = id;
                                      setState(() {});
                                    },
                                    showCP: (id) async {
                                      _model.activePage =
                                          SuperUserPage.hotel_request;
                                      _model.hotelId = id;
                                      setState(() {});
                                    },
                                    showHall: (id) async {
                                      _model.activePage =
                                          SuperUserPage.hall_full_info;
                                      _model.hallId = id;
                                      setState(() {});
                                    },
                                    showFood: (id) async {
                                      _model.activePage =
                                          SuperUserPage.food_full_info;
                                      _model.foodId = id;
                                      setState(() {});
                                    },
                                    showRoom: (id) async {
                                      _model.activePage =
                                          SuperUserPage.room_full_info;
                                      _model.roomId = id;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.client_search)
                                wrapWithModel(
                                  model: _model.clientSearchModel,
                                  updateCallback: () => setState(() {}),
                                  child: ClientSearchWidget(
                                    userId: (id) async {
                                      _model.userId = id;
                                      _model.activePage =
                                          SuperUserPage.client_cp;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage == SuperUserPage.room_info)
                                wrapWithModel(
                                  model: _model.addOrEditRoomModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: AddOrEditRoomWidget(
                                    id: _model.roomId,
                                    hotelId: _model.hotelId!,
                                    doneCallback: () async {
                                      _model.activePage =
                                          SuperUserPage.hotel_info;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage == SuperUserPage.hall_info)
                                wrapWithModel(
                                  model: _model.addOrEditHallModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: AddOrEditHallWidget(
                                    id: _model.hallId,
                                    hotelId: _model.hotelId!,
                                    doneCallback: () async {
                                      _model.activePage =
                                          SuperUserPage.hotel_info;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage == SuperUserPage.food_info)
                                wrapWithModel(
                                  model: _model.addOrEditFoodModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: AddOrEditFoodWidget(
                                    id: _model.foodId,
                                    hotelId: _model.hotelId!,
                                    isSubmit: () async {
                                      _model.activePage =
                                          SuperUserPage.hotel_info;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage == SuperUserPage.cms_about)
                                wrapWithModel(
                                  model: _model.editAboutModel,
                                  updateCallback: () => setState(() {}),
                                  child: const EditAboutWidget(),
                                ),
                              if (_model.activePage == SuperUserPage.cms_whyus)
                                wrapWithModel(
                                  model: _model.editWhyusModel,
                                  updateCallback: () => setState(() {}),
                                  child: const EditWhyusWidget(),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.cms_aboutus)
                                wrapWithModel(
                                  model: _model.editAboutUsModel,
                                  updateCallback: () => setState(() {}),
                                  child: const EditAboutUsWidget(),
                                ),
                              if (_model.activePage == SuperUserPage.cms_qa)
                                wrapWithModel(
                                  model: _model.editQAModel,
                                  updateCallback: () => setState(() {}),
                                  child: const EditQAWidget(),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.hotel_request)
                                wrapWithModel(
                                  model: _model.superRequestsModel,
                                  updateCallback: () => setState(() {}),
                                  child: SuperRequestsWidget(
                                    hotel: _model.hotelId!,
                                    back: () async {
                                      _model.activePage =
                                          SuperUserPage.hotel_info;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.hotel_full_info)
                                wrapWithModel(
                                  model: _model.hotelFullInfoModel,
                                  updateCallback: () => setState(() {}),
                                  child: HotelFullInfoWidget(
                                    id: _model.hotelId!,
                                    goNext: (id) async {
                                      _model.activePage =
                                          SuperUserPage.hotel_jur;
                                      setState(() {});
                                    },
                                    goBack: () async {
                                      _model.activePage =
                                          SuperUserPage.hotel_info;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.hall_full_info)
                                wrapWithModel(
                                  model: _model.hallFullInfoModel,
                                  updateCallback: () => setState(() {}),
                                  child: HallFullInfoWidget(
                                    id: _model.hallId!,
                                    goNext: (id) async {},
                                    goBack: () async {
                                      _model.activePage =
                                          SuperUserPage.hotel_info;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.food_full_info)
                                wrapWithModel(
                                  model: _model.foodFullInfoModel,
                                  updateCallback: () => setState(() {}),
                                  child: FoodFullInfoWidget(
                                    id: _model.foodId!,
                                    goBack: () async {
                                      _model.activePage =
                                          SuperUserPage.hotel_info;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage ==
                                  SuperUserPage.room_full_info)
                                wrapWithModel(
                                  model: _model.roomFullInfoModel,
                                  updateCallback: () => setState(() {}),
                                  child: RoomFullInfoWidget(
                                    id: _model.roomId!,
                                    goBack: () async {
                                      _model.activePage =
                                          SuperUserPage.hotel_info;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage == SuperUserPage.client_cp)
                                wrapWithModel(
                                  model: _model.companyRequestsComponentModel,
                                  updateCallback: () => setState(() {}),
                                  child: CompanyRequestsComponentWidget(
                                    user: _model.userId!,
                                    openRequest: (request) async {},
                                    back: () async {
                                      _model.activePage =
                                          SuperUserPage.client_search;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage == SuperUserPage.hotel_jur)
                                wrapWithModel(
                                  model: _model.superHotelJuridicalModel,
                                  updateCallback: () => setState(() {}),
                                  child: SuperHotelJuridicalWidget(
                                    id: _model.hotelId!,
                                    onDone: () async {
                                      _model.activePage =
                                          SuperUserPage.hotel_full_info;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              if (_model.activePage == SuperUserPage.PP)
                                wrapWithModel(
                                  model: _model.editPPModel,
                                  updateCallback: () => setState(() {}),
                                  child: const EditPPWidget(),
                                ),
                            ],
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 44.0))
                          .addToStart(const SizedBox(height: 64.0))
                          .addToEnd(const SizedBox(height: 64.0)),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 40.0)),
            ),
          ),
        ),
      ),
    );
  }
}
