import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/hotel_flow/add_or_edit_food/add_or_edit_food_widget.dart';
import '/hotel_flow/add_or_edit_hall/add_or_edit_hall_widget.dart';
import '/hotel_flow/add_or_edit_hotel/add_or_edit_hotel_widget.dart';
import '/hotel_flow/add_or_edit_room/add_or_edit_room_widget.dart';
import '/hotel_flow/hotel_juridical/hotel_juridical_widget.dart';
import '/hotel_flow/hotels_requests/hotels_requests_widget.dart';
import '/hotel_flow/manager_info/manager_info_widget.dart';
import '/hotel_flow/profile_food/profile_food_widget.dart';
import '/hotel_flow/profile_halls/profile_halls_widget.dart';
import '/hotel_flow/profile_hotels/profile_hotels_widget.dart';
import '/hotel_flow/profile_rooms/profile_rooms_widget.dart';
import '/pop_up/hotel_pop_up/hotel_pop_up_widget.dart';
import '/superuser_flow/super_requests/super_requests_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'hotel_home_model.dart';
export 'hotel_home_model.dart';

class HotelHomeWidget extends StatefulWidget {
  const HotelHomeWidget({super.key});

  @override
  State<HotelHomeWidget> createState() => _HotelHomeWidgetState();
}

class _HotelHomeWidgetState extends State<HotelHomeWidget> {
  late HotelHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotelHomeModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
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
                          alignment: const AlignmentDirectional(0.0, -0.6),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.page = EnumHotelPage.PROFILE;
                                  _model.id = 0;
                                  setState(() {});
                                },
                                child: Text(
                                  'Профиль',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: valueOrDefault<Color>(
                                          _model.page == EnumHotelPage.PROFILE
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : const Color(0xB1FFFFFF),
                                          const Color(0xB1FFFFFF),
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
                                  _model.page = EnumHotelPage.REQUESTS;
                                  _model.id = 0;
                                  setState(() {});
                                },
                                child: Text(
                                  'Запросы',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: valueOrDefault<Color>(
                                          _model.page == EnumHotelPage.REQUESTS
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : const Color(0xB1FFFFFF),
                                          const Color(0xB1FFFFFF),
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
                                  _model.page = EnumHotelPage.HOTELS;
                                  _model.id = 0;
                                  setState(() {});
                                },
                                child: Text(
                                  'Отели',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: valueOrDefault<Color>(
                                          _model.page == EnumHotelPage.HOTELS
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : const Color(0xB1FFFFFF),
                                          const Color(0xB1FFFFFF),
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
                                  _model.page = EnumHotelPage.HALLS;
                                  _model.id = 0;
                                  setState(() {});
                                },
                                child: Text(
                                  'Залы',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: valueOrDefault<Color>(
                                          _model.page == EnumHotelPage.HALLS
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : const Color(0xB1FFFFFF),
                                          const Color(0xB1FFFFFF),
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
                                  _model.page = EnumHotelPage.FOOD;
                                  _model.id = 0;
                                  setState(() {});
                                },
                                child: Text(
                                  'Питание',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: valueOrDefault<Color>(
                                          _model.page == EnumHotelPage.FOOD
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : const Color(0xB1FFFFFF),
                                          const Color(0xB1FFFFFF),
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
                                  _model.page = EnumHotelPage.ROOMS;
                                  _model.id = 0;
                                  setState(() {});
                                },
                                child: Text(
                                  'Номера',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: valueOrDefault<Color>(
                                          _model.page == EnumHotelPage.ROOMS
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : const Color(0xB1FFFFFF),
                                          const Color(0xB1FFFFFF),
                                        ),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              if (responsiveVisibility(
                                context: context,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.page = EnumHotelPage.FOOD;
                                    _model.id = 0;
                                    setState(() {});
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.id?.toString(),
                                      'id',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: valueOrDefault<Color>(
                                            _model.page == EnumHotelPage.FOOD
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
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
                              if (responsiveVisibility(
                                context: context,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.page = EnumHotelPage.FOOD;
                                    _model.id = 0;
                                    setState(() {});
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.hotelId?.toString(),
                                      'hotelid',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: valueOrDefault<Color>(
                                            _model.page == EnumHotelPage.FOOD
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.goNamedAuth(
                                        'HomePage', context.mounted);
                                  },
                                  text: 'Выйти',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.page == EnumHotelPage.PROFILE)
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: wrapWithModel(
                                model: _model.managerInfoModel,
                                updateCallback: () => setState(() {}),
                                child: const ManagerInfoWidget(),
                              ),
                            ),
                          ),
                        if (_model.page == EnumHotelPage.HOTELS)
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Builder(
                                builder: (context) => wrapWithModel(
                                  model: _model.profileHotelsModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: ProfileHotelsWidget(
                                    editCallback: (id) async {
                                      _model.page = EnumHotelPage.EDIT_HOTELS;
                                      _model.id = valueOrDefault<int>(
                                        id,
                                        88,
                                      );
                                      setState(() {});
                                    },
                                    newCallback: () async {
                                      _model.page = EnumHotelPage.EDIT_HOTELS;
                                      _model.id = 0;
                                      setState(() {});
                                    },
                                    seeCallback: (hotel) async {
                                      await showDialog(
                                        barrierColor: const Color(0x66000000),
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.8,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                child: HotelPopUpWidget(
                                                  hotel: hotel!,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (_model.page == EnumHotelPage.EDIT_HOTELS)
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: wrapWithModel(
                                model: _model.addOrEditHotelModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: AddOrEditHotelWidget(
                                  id: valueOrDefault<int>(
                                    _model.id,
                                    88,
                                  ),
                                  doneCallback: (id) async {
                                    _model.page = EnumHotelPage.HOTEL_JURIDICAL;
                                    _model.hotelId = id;
                                    setState(() {});
                                  },
                                  goBack: () async {
                                    _model.page = EnumHotelPage.HOTELS;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (_model.page == EnumHotelPage.ROOMS)
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: wrapWithModel(
                                model: _model.profileRoomsModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: ProfileRoomsWidget(
                                  newCallback: (homeId) async {
                                    _model.page = EnumHotelPage.EDIT_ROOMS;
                                    _model.hotelId = valueOrDefault<int>(
                                      homeId,
                                      88,
                                    );
                                    _model.id = 0;
                                    setState(() {});
                                  },
                                  editCallback: (id) async {
                                    _model.page = EnumHotelPage.EDIT_ROOMS;
                                    _model.id = valueOrDefault<int>(
                                      id,
                                      88,
                                    );
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (_model.page == EnumHotelPage.EDIT_ROOMS)
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: wrapWithModel(
                                model: _model.addOrEditRoomModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: AddOrEditRoomWidget(
                                  id: valueOrDefault<int>(
                                    _model.id,
                                    88,
                                  ),
                                  hotelId: _model.hotelId!,
                                  doneCallback: () async {
                                    _model.page = EnumHotelPage.ROOMS;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (_model.page == EnumHotelPage.HALLS)
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: wrapWithModel(
                                model: _model.profileHallsModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: ProfileHallsWidget(
                                  newCallback: (hotelId) async {
                                    _model.page = EnumHotelPage.EDIT_HALLS;
                                    _model.hotelId = valueOrDefault<int>(
                                      hotelId,
                                      88,
                                    );
                                    _model.id = 0;
                                    setState(() {});
                                  },
                                  editCallback: (id) async {
                                    _model.page = EnumHotelPage.EDIT_HALLS;
                                    _model.id = valueOrDefault<int>(
                                      id,
                                      88,
                                    );
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (_model.page == EnumHotelPage.FOOD)
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: wrapWithModel(
                                model: _model.profileFoodModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: ProfileFoodWidget(
                                  newCallback: (hotelId) async {
                                    _model.page = EnumHotelPage.EDIT_FOOD;
                                    _model.hotelId = valueOrDefault<int>(
                                      hotelId,
                                      88,
                                    );
                                    _model.id = 0;
                                    setState(() {});
                                  },
                                  editCallback: (id) async {
                                    _model.page = EnumHotelPage.EDIT_FOOD;
                                    _model.id = id;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (_model.page == EnumHotelPage.EDIT_HALLS)
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: wrapWithModel(
                                model: _model.addOrEditHallModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: AddOrEditHallWidget(
                                  id: valueOrDefault<int>(
                                    _model.id,
                                    88,
                                  ),
                                  hotelId: _model.hotelId!,
                                  doneCallback: () async {
                                    _model.page = EnumHotelPage.HALLS;
                                    _model.id = null;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (_model.page == EnumHotelPage.EDIT_FOOD)
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: wrapWithModel(
                                model: _model.addOrEditFoodModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: AddOrEditFoodWidget(
                                  id: valueOrDefault<int>(
                                    _model.id,
                                    88,
                                  ),
                                  hotelId: _model.hotelId!,
                                  isSubmit: () async {
                                    _model.page = EnumHotelPage.FOOD;
                                    _model.id = null;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (_model.page == EnumHotelPage.HOTEL_JURIDICAL)
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: wrapWithModel(
                                model: _model.hotelJuridicalModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: HotelJuridicalWidget(
                                  ownerId: _model.id!,
                                  onDone: () async {
                                    _model.page = EnumHotelPage.HOTELS;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (_model.page == EnumHotelPage.REQUESTS)
                          wrapWithModel(
                            model: _model.hotelsRequestsModel,
                            updateCallback: () => setState(() {}),
                            child: HotelsRequestsWidget(
                              openAllRequests: (hotelId) async {
                                _model.page = EnumHotelPage.ALL_REQUESTS;
                                _model.hotelId = hotelId;
                                setState(() {});
                              },
                            ),
                          ),
                        if (_model.page == EnumHotelPage.ALL_REQUESTS)
                          wrapWithModel(
                            model: _model.superRequestsModel,
                            updateCallback: () => setState(() {}),
                            child: SuperRequestsWidget(
                              hotel: _model.hotelId!,
                              back: () async {
                                _model.page = EnumHotelPage.REQUESTS;
                                setState(() {});
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 48.0)),
            ),
          ),
        ),
      ),
    );
  }
}
