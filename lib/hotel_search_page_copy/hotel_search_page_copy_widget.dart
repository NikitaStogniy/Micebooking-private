import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/client_food_component_widget.dart';
import '/components/client_hall_edit_component_widget.dart';
import '/components/client_optional_widget.dart';
import '/components/client_room_component_widget.dart';
import '/components/edit_request_hotel_component_widget.dart';
import '/components/footer_widget.dart';
import '/components/hall_filter_widget.dart';
import '/components/hotel_filter_widget.dart';
import '/components/hotel_search_comp_widget.dart';
import '/empty_states/search_emprty/search_emprty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/menu/menu_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'hotel_search_page_copy_model.dart';
export 'hotel_search_page_copy_model.dart';

class HotelSearchPageCopyWidget extends StatefulWidget {
  /// step
  const HotelSearchPageCopyWidget({
    super.key,
    required this.startDate,
    required this.duration,
    required this.city,
    required this.visitors,
    required this.user,
    this.request,
    this.hallFilter1,
    this.hallFilter2,
    this.hallFilter3,
    this.hotel,
    this.chosenHall,
    this.chosenFood,
    this.chosenRoom,
    this.hallRequest,
    this.foodRequest,
    this.roomRequest,
  });

  final DateTime? startDate;
  final double? duration;
  final CityRow? city;
  final int? visitors;
  final UsersRow? user;
  final RequestsRow? request;
  final HotelSeatingStruct? hallFilter1;
  final HotelSeatingStruct? hallFilter2;
  final HotelSeatingStruct? hallFilter3;
  final int? hotel;
  final List<int>? chosenHall;
  final List<int>? chosenFood;
  final List<int>? chosenRoom;
  final List<int>? hallRequest;
  final List<int>? foodRequest;
  final List<int>? roomRequest;

  @override
  State<HotelSearchPageCopyWidget> createState() =>
      _HotelSearchPageCopyWidgetState();
}

class _HotelSearchPageCopyWidgetState extends State<HotelSearchPageCopyWidget> {
  late HotelSearchPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotelSearchPageCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.choosenHall = widget.chosenHall!.toList().cast<int>();
      _model.chosenFood = widget.chosenFood!.toList().cast<int>();
      _model.choosenRooms = widget.chosenRoom!.toList().cast<int>();
      _model.listHallRequest = widget.hallRequest!.toList().cast<int>();
      _model.listFoodRequest = widget.foodRequest!.toList().cast<int>();
      _model.listRoomRequest = widget.roomRequest!.toList().cast<int>();
      setState(() {});
      if ((widget.hallFilter1?.type == EnumSeating.theatre) ||
          (widget.hallFilter2?.type == EnumSeating.theatre) ||
          (widget.hallFilter3?.type == EnumSeating.theatre)) {
        _model.theaterMin = valueOrDefault<int>(
          () {
            if (widget.hallFilter1?.type == EnumSeating.theatre) {
              return widget.hallFilter1?.count;
            } else if (widget.hallFilter2?.type == EnumSeating.theatre) {
              return widget.hallFilter2?.count;
            } else if (widget.hallFilter3?.type == EnumSeating.theatre) {
              return widget.hallFilter3?.count;
            } else {
              return 0;
            }
          }(),
          0,
        );
        setState(() {});
      }
      if ((widget.hallFilter1?.type == EnumSeating.klass) ||
          (widget.hallFilter2?.type == EnumSeating.klass) ||
          (widget.hallFilter3?.type == EnumSeating.klass)) {
        _model.classMin = valueOrDefault<int>(
          () {
            if (widget.hallFilter1?.type == EnumSeating.klass) {
              return widget.hallFilter1?.count;
            } else if (widget.hallFilter2?.type == EnumSeating.klass) {
              return widget.hallFilter2?.count;
            } else if (widget.hallFilter3?.type == EnumSeating.klass) {
              return widget.hallFilter3?.count;
            } else {
              return 0;
            }
          }(),
          0,
        );
        setState(() {});
      }
      if ((widget.hallFilter1?.type == EnumSeating.communication) ||
          (widget.hallFilter2?.type == EnumSeating.communication) ||
          (widget.hallFilter3?.type == EnumSeating.communication)) {
        _model.comMin = valueOrDefault<int>(
          () {
            if (widget.hallFilter1?.type == EnumSeating.communication) {
              return widget.hallFilter1?.count;
            } else if (widget.hallFilter2?.type == EnumSeating.communication) {
              return widget.hallFilter2?.count;
            } else if (widget.hallFilter3?.type == EnumSeating.communication) {
              return widget.hallFilter3?.count;
            } else {
              return 0;
            }
          }(),
          0,
        );
        setState(() {});
      }
      if ((widget.hallFilter1?.type == EnumSeating.ushape) ||
          (widget.hallFilter2?.type == EnumSeating.ushape) ||
          (widget.hallFilter3?.type == EnumSeating.ushape)) {
        _model.uShapeMin = valueOrDefault<int>(
          () {
            if (widget.hallFilter1?.type == EnumSeating.ushape) {
              return widget.hallFilter1?.count;
            } else if (widget.hallFilter2?.type == EnumSeating.ushape) {
              return widget.hallFilter2?.count;
            } else if (widget.hallFilter3?.type == EnumSeating.ushape) {
              return widget.hallFilter3?.count;
            } else {
              return 0;
            }
          }(),
          0,
        );
        setState(() {});
      }
      if ((widget.hallFilter1?.type == EnumSeating.oshape) ||
          (widget.hallFilter2?.type == EnumSeating.oshape) ||
          (widget.hallFilter3?.type == EnumSeating.oshape)) {
        _model.oShapeMin = valueOrDefault<int>(
          () {
            if (widget.hallFilter1?.type == EnumSeating.oshape) {
              return widget.hallFilter1?.count;
            } else if (widget.hallFilter2?.type == EnumSeating.oshape) {
              return widget.hallFilter2?.count;
            } else if (widget.hallFilter3?.type == EnumSeating.oshape) {
              return widget.hallFilter3?.count;
            } else {
              return 0;
            }
          }(),
          0,
        );
        setState(() {});
      }
      if ((widget.hallFilter1?.type == EnumSeating.cabare) ||
          (widget.hallFilter2?.type == EnumSeating.cabare) ||
          (widget.hallFilter3?.type == EnumSeating.cabare)) {
        _model.cabareMin = valueOrDefault<int>(
          () {
            if (widget.hallFilter1?.type == EnumSeating.cabare) {
              return widget.hallFilter1?.count;
            } else if (widget.hallFilter2?.type == EnumSeating.cabare) {
              return widget.hallFilter2?.count;
            } else if (widget.hallFilter3?.type == EnumSeating.cabare) {
              return widget.hallFilter3?.count;
            } else {
              return 0;
            }
          }(),
          0,
        );
        setState(() {});
      }
      if ((widget.hallFilter1?.type == EnumSeating.banket) ||
          (widget.hallFilter2?.type == EnumSeating.banket) ||
          (widget.hallFilter3?.type == EnumSeating.banket)) {
        _model.banketMin = valueOrDefault<int>(
          () {
            if (widget.hallFilter1?.type == EnumSeating.banket) {
              return widget.hallFilter1?.count;
            } else if (widget.hallFilter2?.type == EnumSeating.banket) {
              return widget.hallFilter2?.count;
            } else if (widget.hallFilter3?.type == EnumSeating.banket) {
              return widget.hallFilter3?.count;
            } else {
              return 0;
            }
          }(),
          0,
        );
        setState(() {});
      }
      if ((widget.hallFilter1?.type == EnumSeating.furshet) ||
          (widget.hallFilter2?.type == EnumSeating.furshet) ||
          (widget.hallFilter3?.type == EnumSeating.furshet)) {
        _model.furshetMin = valueOrDefault<int>(
          () {
            if (widget.hallFilter1?.type == EnumSeating.furshet) {
              return widget.hallFilter1?.count;
            } else if (widget.hallFilter2?.type == EnumSeating.furshet) {
              return widget.hallFilter2?.count;
            } else if (widget.hallFilter3?.type == EnumSeating.furshet) {
              return widget.hallFilter3?.count;
            } else {
              return 0;
            }
          }(),
          0,
        );
        setState(() {});
      }
      _model.filteredHalls = await HallTable().queryRows(
        queryFn: (q) => q
            .gte(
              'seating_theater',
              _model.theaterMin,
            )
            .gte(
              'seating_class',
              _model.classMin,
            )
            .gte(
              'seating_communication',
              _model.comMin,
            )
            .gte(
              'seating_ushape',
              _model.uShapeMin,
            )
            .gte(
              'seating_oshape',
              _model.oShapeMin,
            )
            .gte(
              'seating_kabare',
              _model.cabareMin,
            )
            .gte(
              'seating_banket',
              _model.banketMin,
            )
            .gte(
              'seating_furshet',
              _model.furshetMin,
            ),
      );
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
    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'uid',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRow> hotelSearchPageCopyUsersRowList = snapshot.data!;

        final hotelSearchPageCopyUsersRow =
            hotelSearchPageCopyUsersRowList.isNotEmpty
                ? hotelSearchPageCopyUsersRowList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.sizeOf(context).height * 1.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      image: Image.asset(
                        'assets/images/Vector.png',
                      ).image,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width > 1000.0
                                        ? 32.0
                                        : 16.0,
                                    0.0,
                                  ),
                                  16.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width > 1000.0
                                        ? 32.0
                                        : 16.0,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width > 1000.0
                                        ? 64.0
                                        : 24.0,
                                    0.0,
                                  )),
                              child: wrapWithModel(
                                model: _model.menuModel,
                                updateCallback: () => setState(() {}),
                                child: MenuWidget(
                                  isBlue: true,
                                  page: 'home',
                                  search: true,
                                  clientProfile: () async {},
                                  clientRequest: () async {},
                                  clientFavorite: () async {},
                                  searchAction: () async {
                                    await showDialog(
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
                                            onTap: () =>
                                                FocusScope.of(dialogContext)
                                                    .unfocus(),
                                            child: SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.8,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              child: HotelSearchCompWidget(
                                                date: widget.startDate!,
                                                duration: widget.duration!,
                                                ciry: widget.city,
                                                visitors: widget.visitors!,
                                                hallFilter1:
                                                    widget.hallFilter1,
                                                hallFilter2:
                                                    widget.hallFilter2,
                                                hallFilter3:
                                                    widget.hallFilter3,
                                                home: true,
                                                onSearch: (date,
                                                    duration,
                                                    city,
                                                    visitors,
                                                    seatings,
                                                    hallFilter1,
                                                    hallFilter2,
                                                    hallFilter3) async {
                                                  _model.step = 0;
                                                  setState(() {});

                                                  context.goNamed(
                                                    'HotelSearchPageCopy',
                                                    queryParameters: {
                                                      'startDate':
                                                          serializeParam(
                                                        widget.startDate,
                                                        ParamType.DateTime,
                                                      ),
                                                      'duration':
                                                          serializeParam(
                                                        duration,
                                                        ParamType.double,
                                                      ),
                                                      'city': serializeParam(
                                                        city,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                      'visitors':
                                                          serializeParam(
                                                        visitors,
                                                        ParamType.int,
                                                      ),
                                                      'user': serializeParam(
                                                        hotelSearchPageCopyUsersRow,
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
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (_model.step == 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width > 1000.0
                                      ? 0.0
                                      : 16.0,
                                  0.0,
                                ),
                                16.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width > 1000.0
                                      ? 0.0
                                      : 16.0,
                                  0.0,
                                ),
                                0.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 1250.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showAlignedDialog(
                                          context: context,
                                          isGlobal: false,
                                          avoidOverflow: false,
                                          targetAnchor: const AlignmentDirectional(
                                                  0.0, 8.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(dialogContext)
                                                        .unfocus(),
                                                child: SizedBox(
                                                  height: 500.0,
                                                  child: HotelFilterWidget(
                                                    chosenServices: _model
                                                        .hotelFilterServices,
                                                    starsList:
                                                        _model.hotelFilterStars,
                                                    initialMinPrice:
                                                        valueOrDefault<double>(
                                                      _model.filterMinPrice,
                                                      1.0,
                                                    ),
                                                    initialMaxPrice:
                                                        valueOrDefault<double>(
                                                      _model.filterMaxPrice,
                                                      100000.0,
                                                    ),
                                                    addStar: (star) async {
                                                      if (_model
                                                              .hotelFilterStars
                                                              .contains(star) ==
                                                          true) {
                                                        _model
                                                            .removeFromHotelFilterStars(
                                                                star!);
                                                        setState(() {});
                                                      } else {
                                                        _model
                                                            .addToHotelFilterStars(
                                                                star!);
                                                        setState(() {});
                                                      }
                                                    },
                                                    addDistance:
                                                        (min, max) async {
                                                      if ((_model.hotelFilterMinDistance ==
                                                              min) &&
                                                          (_model.hotelFilterMaxDistance ==
                                                              max)) {
                                                        _model.hotelFilterMaxDistance =
                                                            100000;
                                                        _model.hotelFilterMinDistance =
                                                            0;
                                                        setState(() {});
                                                      } else {
                                                        _model.hotelFilterMaxDistance =
                                                            max;
                                                        _model.hotelFilterMinDistance =
                                                            min;
                                                        setState(() {});
                                                      }
                                                    },
                                                    choseService: (id) async {
                                                      if (_model
                                                              .hotelFilterServices
                                                              .contains(id) ==
                                                          true) {
                                                        _model
                                                            .removeFromHotelFilterServices(
                                                                id!);
                                                        setState(() {});
                                                      } else {
                                                        _model
                                                            .addToHotelFilterServices(
                                                                id!);
                                                        setState(() {});
                                                      }
                                                    },
                                                    updatePrice: (minPrice,
                                                        maxPrice) async {
                                                      _model.rooms =
                                                          await RoomTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .gte(
                                                              'price',
                                                              minPrice,
                                                            )
                                                            .lte(
                                                              'price',
                                                              maxPrice,
                                                            ),
                                                      );
                                                      _model.filteredRooms =
                                                          _model.rooms!
                                                              .map((e) => e.id)
                                                              .toList()
                                                              .cast<int>();
                                                      _model.filterMinPrice =
                                                          minPrice;
                                                      _model.filterMaxPrice =
                                                          maxPrice;
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 300.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF0F0FA),
                                          borderRadius:
                                              BorderRadius.circular(23.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .settings_input_component_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Фильтр по отелям',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  if (_model.hallFilterOpen ==
                                                      false)
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  if (_model.hallFilterOpen ==
                                                      true)
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_up_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showAlignedDialog(
                                            context: context,
                                            isGlobal: false,
                                            avoidOverflow: false,
                                            targetAnchor: const AlignmentDirectional(
                                                    0.0, 8.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                const AlignmentDirectional(0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          dialogContext)
                                                      .unfocus(),
                                                  child: HallFilterWidget(
                                                    maxCapacity: _model
                                                        .hallFilterMaxCapacity,
                                                    chosenSittings: _model
                                                        .hallFilterChosenSeatings,
                                                    hallfilter1:
                                                        widget.hallFilter1,
                                                    hallfilter2:
                                                        widget.hallFilter2,
                                                    hallfilter3:
                                                        widget.hallFilter3,
                                                    addCapacity: (maxCapacity,
                                                        minCapacity) async {
                                                      _model.hallFilterMaxCapacity =
                                                          maxCapacity;
                                                      _model.hallFilterMinCapacity =
                                                          minCapacity;
                                                      setState(() {});
                                                    },
                                                    addSeating:
                                                        (seating) async {
                                                      if (_model
                                                              .hallFilterChosenSeatings
                                                              .contains(
                                                                  seating) ==
                                                          true) {
                                                        _model
                                                            .removeFromHallFilterChosenSeatings(
                                                                seating!);
                                                        setState(() {});
                                                      } else {
                                                        _model
                                                            .addToHallFilterChosenSeatings(
                                                                seating!);
                                                        setState(() {});
                                                      }
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 300.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF0F0FA),
                                            borderRadius:
                                                BorderRadius.circular(23.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 20.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons
                                                            .settings_input_component_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Фильтр по залам',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                    if (_model.hallFilterOpen ==
                                                        false)
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    if (_model.hallFilterOpen ==
                                                        true)
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_up_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.hotelFilterStars = [];
                                      _model.hotelFilterMinDistance = 0;
                                      _model.hotelFilterMaxDistance = 100000;
                                      _model.filterMaxPrice = 100000.0;
                                      _model.filterMinPrice = 1.0;
                                      setState(() {});
                                      _model.deleteFiltersRooms =
                                          await RoomTable().queryRows(
                                        queryFn: (q) => q.gte(
                                          'price',
                                          _model.filterMinPrice,
                                        ),
                                      );
                                      _model.filteredRooms = _model
                                          .deleteFiltersRooms!
                                          .map((e) => e.id)
                                          .toList()
                                          .cast<int>();
                                      setState(() {});

                                      setState(() {});
                                    },
                                    text: 'Сбросить фильтры',
                                    options: FFButtonOptions(
                                      width: 180.0,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0x16BE3030),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 10.0)),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width > 1000.0
                                    ? 0.0
                                    : 16.0,
                                0.0,
                              ),
                              16.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width > 1000.0
                                    ? 0.0
                                    : 16.0,
                                0.0,
                              ),
                              0.0),
                          child: Container(
                            constraints: const BoxConstraints(
                              maxWidth: 1250.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Text(
                                    () {
                                      if (_model.step == 0) {
                                        return 'Подходящие площадки в городе ${valueOrDefault<String>(
                                          widget.city?.name,
                                          'City name',
                                        )}';
                                      } else if (_model.step == 1) {
                                        return 'Выбор зала';
                                      } else if (_model.step == 2) {
                                        return 'Выбор питания';
                                      } else if (_model.step == 3) {
                                        return 'Выбор номера';
                                      } else {
                                        return 'Заголовок';
                                      }
                                    }(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  1000.0
                                              ? 0.0
                                              : 16.0,
                                          0.0,
                                        ),
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  1000.0
                                              ? 0.0
                                              : 16.0,
                                          0.0,
                                        ),
                                        0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (_model.step > 0)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              context.safePop();
                                            },
                                            text: 'Назад',
                                            icon: const Icon(
                                              Icons.chevron_left,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 110.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0x002431A5),
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
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                      ].divide(const SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width > 1000.0
                                    ? 0.0
                                    : 16.0,
                                0.0,
                              ),
                              16.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width > 1000.0
                                    ? 0.0
                                    : 16.0,
                                0.0,
                              ),
                              0.0),
                          child: Container(
                            constraints: const BoxConstraints(
                              maxWidth: 1250.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Text(
                                    () {
                                      if (_model.step == 0) {
                                        return 'Подходящие площадки в городе ${valueOrDefault<String>(
                                          widget.city?.name,
                                          'City name',
                                        )}';
                                      } else if (_model.step == 1) {
                                        return 'Выбор зала';
                                      } else if (_model.step == 2) {
                                        return 'Выбор питания';
                                      } else if (_model.step == 3) {
                                        return 'Выбор номера';
                                      } else {
                                        return 'Заголовок';
                                      }
                                    }(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  1000.0
                                              ? 0.0
                                              : 16.0,
                                          0.0,
                                        ),
                                        24.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  1000.0
                                              ? 0.0
                                              : 16.0,
                                          0.0,
                                        ),
                                        0.0),
                                    child: FutureBuilder<List<HotelRow>>(
                                      future: HotelTable().querySingleRow(
                                        queryFn: (q) => q.eq(
                                          'id',
                                          widget.hotel,
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
                                        List<HotelRow> rowHotelRowList =
                                            snapshot.data!;

                                        final rowHotelRow =
                                            rowHotelRowList.isNotEmpty
                                                ? rowHotelRowList.first
                                                : null;

                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Редактирование запроса в отель ${rowHotelRow?.name}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 30.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 16.0)),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width > 1000.0
                                    ? 0.0
                                    : 16.0,
                                0.0,
                              ),
                              32.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width > 1000.0
                                    ? 0.0
                                    : 16.0,
                                0.0,
                              ),
                              56.0),
                          child: FutureBuilder<List<HotelRow>>(
                            future: HotelTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id',
                                widget.hotel,
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
                              List<HotelRow> containerHotelRowList =
                                  snapshot.data!;

                              final containerHotelRow =
                                  containerHotelRowList.isNotEmpty
                                      ? containerHotelRowList.first
                                      : null;

                              return Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 1250.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.editRequestHotelComponentModel,
                                  updateCallback: () => setState(() {}),
                                  child: EditRequestHotelComponentWidget(
                                    hotel: containerHotelRow!,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 56.0),
                          child: FutureBuilder<List<HotelRow>>(
                            future: HotelTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id',
                                widget.hotel,
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
                              List<HotelRow> hallChooseHotelRowList =
                                  snapshot.data!;

                              final hallChooseHotelRow =
                                  hallChooseHotelRowList.isNotEmpty
                                      ? hallChooseHotelRowList.first
                                      : null;

                              return Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 1250.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width >
                                                    1000.0
                                                ? 0.0
                                                : 16.0,
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width >
                                                    1000.0
                                                ? 0.0
                                                : 16.0,
                                            0.0,
                                          ),
                                          0.0),
                                      child: Text(
                                        'Подходящие залы в отеле под Ваше мероприятие:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 32.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<List<HallRow>>(
                                              future: HallTable().queryRows(
                                                queryFn: (q) => q
                                                    .in_(
                                                      'id',
                                                      hallChooseHotelRow!.hall,
                                                    )
                                                    .order('name',
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<HallRow>
                                                    columnHallRowList =
                                                    snapshot.data!;

                                                if (columnHallRowList.isEmpty) {
                                                  return const SearchEmprtyWidget();
                                                }

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      columnHallRowList.length,
                                                      (columnIndex) {
                                                    final columnHallRow =
                                                        columnHallRowList[
                                                            columnIndex];
                                                    return FutureBuilder<
                                                        List<
                                                            RequestsHallVarRow>>(
                                                      future:
                                                          RequestsHallVarTable()
                                                              .querySingleRow(
                                                        queryFn: (q) => q
                                                            .eq(
                                                              'hall_id',
                                                              columnHallRow.id,
                                                            )
                                                            .eq(
                                                              'request_id',
                                                              widget
                                                                  .request?.id,
                                                            ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<RequestsHallVarRow>
                                                            clientHallEditComponentRequestsHallVarRowList =
                                                            snapshot.data!;

                                                        final clientHallEditComponentRequestsHallVarRow =
                                                            clientHallEditComponentRequestsHallVarRowList
                                                                    .isNotEmpty
                                                                ? clientHallEditComponentRequestsHallVarRowList
                                                                    .first
                                                                : null;

                                                        return wrapWithModel(
                                                          model: _model
                                                              .clientHallEditComponentModels
                                                              .getModel(
                                                            columnHallRow.id
                                                                .toString(),
                                                            columnIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              ClientHallEditComponentWidget(
                                                            key: Key(
                                                              'Key8pm_${columnHallRow.id.toString()}',
                                                            ),
                                                            isChosen: _model
                                                                .choosenHall
                                                                .contains(
                                                                    columnHallRow
                                                                        .id),
                                                            hall: columnHallRow,
                                                            request:
                                                                clientHallEditComponentRequestsHallVarRow,
                                                            chooseAction: (idHall,
                                                                days,
                                                                price,
                                                                nameHall,
                                                                seating) async {
                                                              if (_model
                                                                      .choosenHall
                                                                      .contains(
                                                                          columnHallRow
                                                                              .id) ==
                                                                  true) {
                                                                await RequestsHallVarTable()
                                                                    .delete(
                                                                  matchingRows:
                                                                      (rows) => rows
                                                                          .eq(
                                                                            'hall_id',
                                                                            columnHallRow.id,
                                                                          )
                                                                          .in_(
                                                                            'hall_id',
                                                                            _model.choosenHall,
                                                                          )
                                                                          .eq(
                                                                            'request_id',
                                                                            widget.request?.id,
                                                                          ),
                                                                );
                                                                _model.removeFromChoosenHall(
                                                                    columnHallRow
                                                                        .id);
                                                                _model
                                                                    .removeFromPriceHall(
                                                                        price!);
                                                                setState(() {});
                                                              } else {
                                                                _model.addToChoosenHall(
                                                                    columnHallRow
                                                                        .id);
                                                                setState(() {});
                                                                _model.newHallRequstVAr =
                                                                    await RequestsHallVarTable()
                                                                        .insert({
                                                                  'days': days,
                                                                  'hall_id':
                                                                      idHall,
                                                                  'hall_name':
                                                                      nameHall,
                                                                  'price':
                                                                      price,
                                                                  'owner':
                                                                      hotelSearchPageCopyUsersRow
                                                                          ?.id,
                                                                  'request_id':
                                                                      widget
                                                                          .request
                                                                          ?.id,
                                                                });
                                                                _model.addToListHallRequest(
                                                                    _model
                                                                        .newHallRequstVAr!
                                                                        .id);
                                                                _model
                                                                    .addToPriceHall(
                                                                        price!);
                                                                setState(() {});
                                                              }

                                                              setState(() {});
                                                            },
                                                            onLoad:
                                                                (price) async {
                                                              _model
                                                                  .addToPriceHall(
                                                                      price!);
                                                              setState(() {});
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }).divide(
                                                      const SizedBox(height: 40.0)),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                        context)
                                                                    .width >
                                                                1000.0
                                                            ? 0.0
                                                            : 16.0,
                                                        0.0,
                                                      ),
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                        context)
                                                                    .width >
                                                                1000.0
                                                            ? 0.0
                                                            : 16.0,
                                                        0.0,
                                                      ),
                                                      0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if ((_model.filteredHalls!
                                                              .where((e) =>
                                                                  hallChooseHotelRow!
                                                                      .hall
                                                                      .contains(
                                                                          e.id))
                                                              .toList()
                                                              .length -
                                                          2) >
                                                      0)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (_model
                                                                .showMoreHalls ==
                                                            false)
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.showMoreHalls =
                                                                  true;
                                                              setState(() {});
                                                            },
                                                            child: Text(
                                                              'Показать ешё ${(_model.filteredHalls!.where((e) => hallChooseHotelRow!.hall.contains(e.id)).toList().length - 2).toString()} зал(ов)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Commissioner',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (_model
                                                                .showMoreHalls ==
                                                            true)
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.showMoreHalls =
                                                                  false;
                                                              setState(() {});
                                                            },
                                                            child: Text(
                                                              'Показать меньше',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Commissioner',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  if (_model.priceHall.isNotEmpty)
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                child: Text(
                                                                  'Итоговая сумма',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Commissioner',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                '${formatNumber(
                                                                  functions.sumList(_model
                                                                      .priceHall
                                                                      .toList()),
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .automatic,
                                                                )} руб',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Commissioner',
                                                                      fontSize:
                                                                          34.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (_model.priceHall.isNotEmpty)
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Text(
                                                            'Итоговая сумма:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${formatNumber(
                                                            functions.sumList(
                                                                _model.priceHall
                                                                    .toList()),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                          )} руб',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                fontSize: 25.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          constraints:
                                                              const BoxConstraints(
                                                            maxWidth: 500.0,
                                                          ),
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Visibility(
                                                            visible: (_model
                                                                        .filteredHalls!
                                                                        .where((e) => hallChooseHotelRow!
                                                                            .hall
                                                                            .contains(e.id))
                                                                        .toList()
                                                                        .length -
                                                                    2) >
                                                                0,
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                        .showMoreHalls ==
                                                                    true) {
                                                                  _model.showMoreHalls =
                                                                      false;
                                                                  setState(
                                                                      () {});
                                                                } else {
                                                                  _model.showMoreHalls =
                                                                      true;
                                                                  setState(
                                                                      () {});
                                                                }
                                                              },
                                                              text: _model.showMoreHalls ==
                                                                      false
                                                                  ? 'Показать ешё ${(_model.filteredHalls!.where((e) => hallChooseHotelRow!.hall.contains(e.id)).toList().length - 2).toString()} зал(ов)'
                                                                  : 'Показать меньше',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 56.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: _model
                                                                            .showMoreHalls ==
                                                                        false
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Colors
                                                                        .transparent,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Commissioner',
                                                                      color: _model.showMoreHalls ==
                                                                              false
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondaryBackground
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 40.0)),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 0.0))
                                      .addToStart(const SizedBox(height: 0.0))
                                      .addToEnd(const SizedBox(height: 0.0)),
                                ),
                              );
                            },
                          ),
                        ),
                        if (_model.foodIsOpen && (_model.step == 1))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 56.0),
                            child: FutureBuilder<List<HotelRow>>(
                              future: HotelTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'id',
                                  _model.choosedHotel,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<HotelRow> foodChoseHotelRowList =
                                    snapshot.data!;

                                final foodChoseHotelRow =
                                    foodChoseHotelRowList.isNotEmpty
                                        ? foodChoseHotelRowList.first
                                        : null;

                                return Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 1250.0,
                                  ),
                                  decoration: const BoxDecoration(),
                                  child: Visibility(
                                    visible: (foodChoseHotelRow?.food != null &&
                                            (foodChoseHotelRow?.food)!
                                                .isNotEmpty) ==
                                        true,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                                  .width >
                                                              1000.0
                                                          ? 0.0
                                                          : 16.0,
                                                      0.0,
                                                    ),
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                                  .width >
                                                              1000.0
                                                          ? 0.0
                                                          : 16.0,
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: Text(
                                              'Варианты питания',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(),
                                            child: FutureBuilder<List<FoodRow>>(
                                              future: FoodTable().queryRows(
                                                queryFn: (q) => q
                                                    .in_(
                                                      'id',
                                                      foodChoseHotelRow!.food,
                                                    )
                                                    .order('price',
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<FoodRow>
                                                    columnFoodRowList =
                                                    snapshot.data!;

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      columnFoodRowList.length,
                                                      (columnIndex) {
                                                    final columnFoodRow =
                                                        columnFoodRowList[
                                                            columnIndex];
                                                    return wrapWithModel(
                                                      model: _model
                                                          .clientFoodComponentModels
                                                          .getModel(
                                                        columnFoodRow.id
                                                            .toString(),
                                                        columnIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          ClientFoodComponentWidget(
                                                        key: Key(
                                                          'Key7id_${columnFoodRow.id.toString()}',
                                                        ),
                                                        isChosen: _model
                                                                .chosenFood
                                                                .contains(
                                                                    columnFoodRow
                                                                        .id) ==
                                                            true,
                                                        food: columnFoodRow,
                                                        chooseAction: (foodId,
                                                            name,
                                                            count,
                                                            persons,
                                                            price) async {
                                                          if (_model.chosenFood
                                                                  .contains(
                                                                      columnFoodRow
                                                                          .id) ==
                                                              true) {
                                                            await RequestsFoodVarTable()
                                                                .delete(
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'food_id',
                                                                        columnFoodRow
                                                                            .id,
                                                                      )
                                                                      .eq(
                                                                        'request_id',
                                                                        _model.lastRequestId ?? 0,
                                                                      )
                                                                      .eq(
                                                                        'owner',
                                                                        hotelSearchPageCopyUsersRow
                                                                            ?.id,
                                                                      ),
                                                            );
                                                            _model
                                                                .removeFromChosenFood(
                                                                    columnFoodRow
                                                                        .id);
                                                            _model
                                                                .removeFromFoodPrice(
                                                                    price!);
                                                            setState(() {});
                                                          } else {
                                                            _model
                                                                .addToChosenFood(
                                                                    columnFoodRow
                                                                        .id);
                                                            setState(() {});
                                                            _model.foodRequest =
                                                                await RequestsFoodVarTable()
                                                                    .insert({
                                                              'food_id': foodId,
                                                              'count': count,
                                                              'price': price,
                                                              'name': name,
                                                              'owner':
                                                                  hotelSearchPageCopyUsersRow
                                                                      ?.id,
                                                              'persons_count':
                                                                  persons,
                                                            });
                                                            _model.addToListFoodRequest(
                                                                _model
                                                                    .foodRequest!
                                                                    .id);
                                                            _model
                                                                .addToFoodPrice(
                                                                    price!);
                                                            setState(() {});
                                                          }

                                                          setState(() {});
                                                        },
                                                      ),
                                                    );
                                                  }).divide(
                                                      const SizedBox(height: 16.0)),
                                                );
                                              },
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if ((_model.foodPrice.isNotEmpty) &&
                                                        responsiveVisibility(
                                                          context: context,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                      Padding(
                                                        padding: EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(context)
                                                                              .width >
                                                                          1000.0
                                                                      ? 0.0
                                                                      : 16.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(context)
                                                                              .width >
                                                                          1000.0
                                                                      ? 0.0
                                                                      : 16.0,
                                                                  0.0,
                                                                ),
                                                                0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Text(
                                                                    'Итоговая сумма',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Commissioner',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${formatNumber(
                                                                    functions.sumList(_model
                                                                        .foodPrice
                                                                        .toList()),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .automatic,
                                                                  )} руб',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Commissioner',
                                                                        fontSize:
                                                                            25.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    if ((_model.foodPrice.isNotEmpty) &&
                                                        responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                        ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                child: Text(
                                                                  'Итоговая сумма',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Commissioner',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                '${formatNumber(
                                                                  functions.sumList(_model
                                                                      .foodPrice
                                                                      .toList()),
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .automatic,
                                                                )} руб',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Commissioner',
                                                                      fontSize:
                                                                          34.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(height: 32.0)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        if (_model.roomsIsOpen && (_model.step == 1))
                          FutureBuilder<List<HotelRow>>(
                            future: HotelTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id',
                                _model.choosedHotel,
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
                              List<HotelRow> roomChooseHotelRowList =
                                  snapshot.data!;

                              final roomChooseHotelRow =
                                  roomChooseHotelRowList.isNotEmpty
                                      ? roomChooseHotelRowList.first
                                      : null;

                              return Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 1250.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 48.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width >
                                                      1000.0
                                                  ? 0.0
                                                  : 16.0,
                                              0.0,
                                            ),
                                            0.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width >
                                                      1000.0
                                                  ? 0.0
                                                  : 16.0,
                                              0.0,
                                            ),
                                            0.0),
                                        child: Text(
                                          'Варианты проживания',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                                .width >
                                                            1000.0
                                                        ? 0.0
                                                        : 16.0,
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                                .width >
                                                            1000.0
                                                        ? 0.0
                                                        : 16.0,
                                                    0.0,
                                                  ),
                                                  0.0),
                                          child: FutureBuilder<List<RoomRow>>(
                                            future: RoomTable().queryRows(
                                              queryFn: (q) => q
                                                  .in_(
                                                    'id',
                                                    roomChooseHotelRow!.rooms,
                                                  )
                                                  .lte(
                                                    'price',
                                                    _model.filterMaxPrice,
                                                  )
                                                  .gte(
                                                    'price',
                                                    _model.filterMinPrice,
                                                  )
                                                  .order('price',
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<RoomRow> columnRoomRowList =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    columnRoomRowList.length,
                                                    (columnIndex) {
                                                  final columnRoomRow =
                                                      columnRoomRowList[
                                                          columnIndex];
                                                  return wrapWithModel(
                                                    model: _model
                                                        .clientRoomComponentModels
                                                        .getModel(
                                                      columnRoomRow.id
                                                          .toString(),
                                                      columnIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        ClientRoomComponentWidget(
                                                      key: Key(
                                                        'Keywta_${columnRoomRow.id.toString()}',
                                                      ),
                                                      isChosen: _model
                                                              .choosenRooms
                                                              .contains(
                                                                  columnRoomRow
                                                                      .id) ==
                                                          true,
                                                      room: columnRoomRow,
                                                      choseAction: (roomId,
                                                          roomName,
                                                          price,
                                                          count,
                                                          days) async {
                                                        if (_model.choosenRooms
                                                                .contains(
                                                                    columnRoomRow
                                                                        .id) ==
                                                            true) {
                                                          _model
                                                              .removeFromChoosenRooms(
                                                                  columnRoomRow
                                                                      .id);
                                                          _model
                                                              .removeFromRoomPrice(
                                                                  price!);
                                                          setState(() {});
                                                          await RequestsRoomVarTable()
                                                              .delete(
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eq(
                                                                      'room_id',
                                                                      columnRoomRow
                                                                          .id,
                                                                    )
                                                                    .eq(
                                                                      'request_id',
                                                                      _model
                                                                              .lastRequestId ?? 0,
                                                                    )
                                                                    .eq(
                                                                      'owner',
                                                                      hotelSearchPageCopyUsersRow
                                                                          ?.id,
                                                                    ),
                                                          );
                                                        } else {
                                                          _model
                                                              .addToChoosenRooms(
                                                                  columnRoomRow
                                                                      .id);
                                                          _model.addToRoomPrice(
                                                              price!);
                                                          setState(() {});
                                                          _model.roomRequest =
                                                              await RequestsRoomVarTable()
                                                                  .insert({
                                                            'price': price,
                                                            'owner':
                                                                hotelSearchPageCopyUsersRow
                                                                    ?.id,
                                                            'room_id': roomId,
                                                            'days': days,
                                                            'room_name':
                                                                roomName,
                                                            'room_count': count,
                                                          });
                                                          _model.addToListRoomRequest(
                                                              _model
                                                                  .roomRequest!
                                                                  .id);
                                                          setState(() {});
                                                        }

                                                        setState(() {});
                                                      },
                                                    ),
                                                  );
                                                }).divide(
                                                    const SizedBox(height: 32.0)),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if ((_model.roomPrice.isNotEmpty) &&
                                              responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                              ))
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Text(
                                                          'Итоговая сумма',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${formatNumber(
                                                          functions.sumList(
                                                              _model.roomPrice
                                                                  .toList()),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .automatic,
                                                        )} руб',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Commissioner',
                                                              fontSize: 34.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if ((_model.roomPrice.isNotEmpty) &&
                                              responsiveVisibility(
                                                context: context,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        valueOrDefault<double>(
                                                          MediaQuery.sizeOf(
                                                                          context)
                                                                      .width >
                                                                  1000.0
                                                              ? 0.0
                                                              : 16.0,
                                                          0.0,
                                                        ),
                                                        0.0,
                                                        valueOrDefault<double>(
                                                          MediaQuery.sizeOf(
                                                                          context)
                                                                      .width >
                                                                  1000.0
                                                              ? 0.0
                                                              : 16.0,
                                                          0.0,
                                                        ),
                                                        0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Text(
                                                            'Итоговая сумма',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${formatNumber(
                                                            functions.sumList(
                                                                _model.roomPrice
                                                                    .toList()),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                          )} руб',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                fontSize: 25.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 32.0)),
                                  ),
                                ),
                              );
                            },
                          ),
                        if (_model.step == 1)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: FutureBuilder<List<HotelRow>>(
                              future: HotelTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'id',
                                  _model.choosedHotel,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<HotelRow> containerHotelRowList =
                                    snapshot.data!;

                                final containerHotelRow =
                                    containerHotelRowList.isNotEmpty
                                        ? containerHotelRowList.first
                                        : null;

                                return Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 1250.0,
                                  ),
                                  decoration: const BoxDecoration(),
                                  child: Column(
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
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (!_model.foodIsOpen &&
                                                    (containerHotelRow!
                                                        .food.isNotEmpty))
                                                  Expanded(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .clientOptionalModel1,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          ClientOptionalWidget(
                                                        isRoom: false,
                                                        isSkipped:
                                                            _model.foodIsSkip,
                                                        show: (isRoom) async {
                                                          _model.foodIsOpen =
                                                              true;
                                                          setState(() {});
                                                        },
                                                        skip: (isRoom) async {
                                                          if (_model
                                                              .foodIsSkip) {
                                                            _model.foodIsSkip =
                                                                false;
                                                            setState(() {});
                                                          } else {
                                                            _model.foodIsSkip =
                                                                true;
                                                            setState(() {});
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                if (!_model.roomsIsOpen &&
                                                    (containerHotelRow!
                                                        .rooms.isNotEmpty))
                                                  Expanded(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .clientOptionalModel2,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          ClientOptionalWidget(
                                                        isRoom: true,
                                                        isSkipped:
                                                            _model.roomisSkip,
                                                        show: (isRoom) async {
                                                          _model.roomsIsOpen =
                                                              true;
                                                          setState(() {});
                                                        },
                                                        skip: (isRoom) async {
                                                          if (_model
                                                              .roomisSkip) {
                                                            _model.roomisSkip =
                                                                false;
                                                            setState(() {});
                                                          } else {
                                                            _model.roomisSkip =
                                                                true;
                                                            setState(() {});
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                              ].divide(const SizedBox(width: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (_model.choosenHall.isEmpty) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'пожалуйста, выберите зал',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      } else {
                                                        _model.requestWr =
                                                            await RequestsTable()
                                                                .insert({
                                                          'owner':
                                                              hotelSearchPageCopyUsersRow
                                                                  ?.id,
                                                          'rooms': _model
                                                              .listRoomRequest,
                                                          'halls': _model
                                                              .listHallRequest,
                                                          'hotel': _model
                                                              .choosedHotel,
                                                          'day_start':
                                                              supaSerialize<
                                                                      DateTime>(
                                                                  widget
                                                                      .startDate),
                                                          'food': _model
                                                              .listFoodRequest,
                                                          'people_count':
                                                              widget.visitors,
                                                          'day_end': supaSerialize<
                                                                  DateTime>(
                                                              functions.countDuration(
                                                                  widget
                                                                      .startDate
                                                                      ?.toString(),
                                                                  widget
                                                                      .duration)),
                                                          'hotel_name': _model
                                                              .chosenHotelName,
                                                          'price': (functions
                                                                  .sumList(_model
                                                                      .priceHall
                                                                      .toList())!) +
                                                              (functions.sumList(
                                                                  _model
                                                                      .foodPrice
                                                                      .toList())!) +
                                                              (functions.sumList(
                                                                  _model
                                                                      .roomPrice
                                                                      .toList())!),
                                                          'hall_price': functions
                                                              .sumList(_model
                                                                  .priceHall
                                                                  .toList()),
                                                          'food_price': functions
                                                              .sumList(_model
                                                                  .foodPrice
                                                                  .toList()),
                                                          'room_price': functions
                                                              .sumList(_model
                                                                  .roomPrice
                                                                  .toList()),
                                                          'halls_original_id':
                                                              _model
                                                                  .choosenHall,
                                                          'inProgress': false,
                                                          'Complete': false,
                                                          'food_original_id':
                                                              _model.chosenFood,
                                                          'room_original_id':
                                                              _model
                                                                  .choosenRooms,
                                                          'monthYear': functions
                                                              .formatMonthYear(
                                                                  getCurrentTimestamp),
                                                          'client_network':
                                                              hotelSearchPageCopyUsersRow
                                                                  ?.network,
                                                          'duration':
                                                              widget.duration,
                                                        });
                                                        await RequestsHallVarTable()
                                                            .update(
                                                          data: {
                                                            'request_id': _model
                                                                .requestWr?.id,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .eq(
                                                                    'owner',
                                                                    hotelSearchPageCopyUsersRow
                                                                        ?.id,
                                                                  )
                                                                  .in_(
                                                                    'id',
                                                                    _model
                                                                        .listHallRequest,
                                                                  ),
                                                        );
                                                        await RequestsFoodVarTable()
                                                            .update(
                                                          data: {
                                                            'request_id': _model
                                                                .requestWr?.id,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .in_(
                                                                    'id',
                                                                    _model
                                                                        .listFoodRequest,
                                                                  )
                                                                  .eq(
                                                                    'owner',
                                                                    hotelSearchPageCopyUsersRow
                                                                        ?.id,
                                                                  ),
                                                        );
                                                        await RequestsRoomVarTable()
                                                            .update(
                                                          data: {
                                                            'request_id': _model
                                                                .requestWr?.id,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .in_(
                                                                    'id',
                                                                    _model
                                                                        .listRoomRequest,
                                                                  )
                                                                  .eq(
                                                                    'owner',
                                                                    hotelSearchPageCopyUsersRow
                                                                        ?.id,
                                                                  ),
                                                        );
                                                        _model.addToRequestList(
                                                            _model.requestWr!);
                                                        _model.lastRequestId =
                                                            _model
                                                                .requestWr?.id;
                                                        setState(() {});
                                                        _model.requestWrapper =
                                                            await RequestWrapperTable()
                                                                .insert({
                                                          'requests_id': _model
                                                              .requestList
                                                              .map((e) => e.id)
                                                              .toList(),
                                                          'owner':
                                                              hotelSearchPageCopyUsersRow
                                                                  ?.id,
                                                        });
                                                        await UsersTable()
                                                            .update(
                                                          data: {
                                                            'last_request':
                                                                supaSerialize<
                                                                        DateTime>(
                                                                    getCurrentTimestamp),
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            hotelSearchPageCopyUsersRow
                                                                ?.id,
                                                          ),
                                                        );

                                                        context.pushNamed(
                                                          'Request',
                                                          queryParameters: {
                                                            'requestWrapper':
                                                                serializeParam(
                                                              _model
                                                                  .requestWrapper,
                                                              ParamType
                                                                  .SupabaseRow,
                                                            ),
                                                            'lastRequest':
                                                                serializeParam(
                                                              _model.requestWr,
                                                              ParamType
                                                                  .SupabaseRow,
                                                            ),
                                                            'wasEdited':
                                                                serializeParam(
                                                              false,
                                                              ParamType.bool,
                                                            ),
                                                            'startDate':
                                                                serializeParam(
                                                              widget.startDate,
                                                              ParamType
                                                                  .DateTime,
                                                            ),
                                                            'duration':
                                                                serializeParam(
                                                              widget.duration,
                                                              ParamType.double,
                                                            ),
                                                            'city':
                                                                serializeParam(
                                                              widget.city,
                                                              ParamType
                                                                  .SupabaseRow,
                                                            ),
                                                            'visitors':
                                                                serializeParam(
                                                              widget.visitors,
                                                              ParamType.int,
                                                            ),
                                                            'hallFilter1':
                                                                serializeParam(
                                                              widget
                                                                  .hallFilter1,
                                                              ParamType
                                                                  .DataStruct,
                                                            ),
                                                            'hallFilter2':
                                                                serializeParam(
                                                              widget
                                                                  .hallFilter2,
                                                              ParamType
                                                                  .DataStruct,
                                                            ),
                                                            'hallFilter3':
                                                                serializeParam(
                                                              widget
                                                                  .hallFilter3,
                                                              ParamType
                                                                  .DataStruct,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }

                                                      setState(() {});
                                                    },
                                                    text: 'Получить КП',
                                                    options: FFButtonOptions(
                                                      height: 50.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  43.0,
                                                                  0.0,
                                                                  43.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: _model.choosenHall.isNotEmpty
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : const Color(0x662431A5),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (_model.choosenHall.isEmpty) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'пожалуйста, выберите зал',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      } else {
                                                        _model.request =
                                                            await RequestsTable()
                                                                .insert({
                                                          'owner':
                                                              hotelSearchPageCopyUsersRow
                                                                  ?.id,
                                                          'rooms': _model
                                                              .listRoomRequest,
                                                          'halls': _model
                                                              .listHallRequest,
                                                          'hotel': _model
                                                              .choosedHotel,
                                                          'day_start':
                                                              supaSerialize<
                                                                      DateTime>(
                                                                  widget
                                                                      .startDate),
                                                          'food': _model
                                                              .listFoodRequest,
                                                          'people_count':
                                                              widget.visitors,
                                                          'day_end': supaSerialize<
                                                                  DateTime>(
                                                              functions.countDuration(
                                                                  widget
                                                                      .startDate
                                                                      ?.toString(),
                                                                  widget
                                                                      .duration)),
                                                          'hotel_name': _model
                                                              .chosenHotelName,
                                                          'price': (functions
                                                                  .sumList(_model
                                                                      .priceHall
                                                                      .toList())!) +
                                                              (functions.sumList(
                                                                  _model
                                                                      .foodPrice
                                                                      .toList())!) +
                                                              (functions.sumList(
                                                                  _model
                                                                      .roomPrice
                                                                      .toList())!),
                                                          'hall_price': functions
                                                              .sumList(_model
                                                                  .priceHall
                                                                  .toList()),
                                                          'food_price': functions
                                                              .sumList(_model
                                                                  .foodPrice
                                                                  .toList()),
                                                          'room_price': functions
                                                              .sumList(_model
                                                                  .foodPrice
                                                                  .toList()),
                                                          'monthYear': functions
                                                              .formatMonthYear(
                                                                  getCurrentTimestamp),
                                                          'client_network':
                                                              hotelSearchPageCopyUsersRow
                                                                  ?.network,
                                                          'duration':
                                                              widget.duration,
                                                        });
                                                        await RequestsHallVarTable()
                                                            .update(
                                                          data: {
                                                            'request_id': _model
                                                                .requestWr?.id,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .eq(
                                                                    'owner',
                                                                    hotelSearchPageCopyUsersRow
                                                                        ?.id,
                                                                  )
                                                                  .eq(
                                                                    'request_id',
                                                                    0,
                                                                  )
                                                                  .in_(
                                                                    'hall_id',
                                                                    _model
                                                                        .choosenHall,
                                                                  ),
                                                        );
                                                        await RequestsFoodVarTable()
                                                            .update(
                                                          data: {
                                                            'request_id': _model
                                                                .requestWr?.id,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .in_(
                                                                    'food_id',
                                                                    _model
                                                                        .chosenFood,
                                                                  )
                                                                  .eq(
                                                                    'request_id',
                                                                    0,
                                                                  )
                                                                  .eq(
                                                                    'owner',
                                                                    hotelSearchPageCopyUsersRow
                                                                        ?.id,
                                                                  ),
                                                        );
                                                        await RequestsRoomVarTable()
                                                            .update(
                                                          data: {
                                                            'request_id': _model
                                                                .requestWr?.id,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .in_(
                                                                    'room_id',
                                                                    _model
                                                                        .choosenRooms,
                                                                  )
                                                                  .eq(
                                                                    'request_id',
                                                                    0,
                                                                  )
                                                                  .eq(
                                                                    'owner',
                                                                    hotelSearchPageCopyUsersRow
                                                                        ?.id,
                                                                  ),
                                                        );
                                                        await UsersTable()
                                                            .update(
                                                          data: {
                                                            'last_request':
                                                                supaSerialize<
                                                                        DateTime>(
                                                                    getCurrentTimestamp),
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            hotelSearchPageCopyUsersRow
                                                                ?.id,
                                                          ),
                                                        );
                                                        _model.addToRequestList(
                                                            _model.request!);
                                                        setState(() {});
                                                        _model.step = 0;
                                                        _model.chosenHotelName =
                                                            null;
                                                        _model.chosenFood = [];
                                                        _model.choosenHall = [];
                                                        _model.choosenRooms =
                                                            [];
                                                        _model.listHallRequest =
                                                            [];
                                                        _model.listFoodRequest =
                                                            [];
                                                        _model.listRoomRequest =
                                                            [];
                                                        _model.foodIsOpen =
                                                            false;
                                                        _model.roomsIsOpen =
                                                            false;
                                                        _model.foodIsSkip =
                                                            false;
                                                        _model.roomisSkip =
                                                            false;
                                                        _model.choosedHotel =
                                                            null;
                                                        setState(() {});
                                                      }

                                                      setState(() {});
                                                    },
                                                    text:
                                                        'Продолжить выбор отелей',
                                                    options: FFButtonOptions(
                                                      height: 50.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  43.0,
                                                                  0.0,
                                                                  43.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: _model.choosenHall.isNotEmpty
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : const Color(0x662431A5),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 16.0)),
                                            ),
                                          ].divide(const SizedBox(height: 32.0)),
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (!_model.foodIsOpen &&
                                                  (containerHotelRow!
                                                      .food.isNotEmpty))
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Варианты питания',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 25.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        12.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                _model.foodIsOpen =
                                                                    true;
                                                                setState(() {});
                                                              },
                                                              text: 'Выбрать',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 56.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Commissioner',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                  .foodIsSkip) {
                                                                _model.foodIsSkip =
                                                                    false;
                                                                setState(() {});
                                                              } else {
                                                                _model.foodIsSkip =
                                                                    true;
                                                                setState(() {});
                                                              }
                                                            },
                                                            text: _model
                                                                    .foodIsSkip
                                                                ? 'Выбор пропущен'
                                                                : 'Пропустить выбор',
                                                            options:
                                                                FFButtonOptions(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 56.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: _model
                                                                      .foodIsSkip
                                                                  ? const Color(
                                                                      0xFF24A541)
                                                                  : Colors
                                                                      .transparent,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Commissioner',
                                                                        color: _model.foodIsSkip
                                                                            ? const Color(0xFFFAFAFA)
                                                                            : FlutterFlowTheme.of(context).primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if (!_model.roomsIsOpen &&
                                                  (containerHotelRow!
                                                      .rooms.isNotEmpty))
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 40.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Варианты проживания',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      25.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    24.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  _model.roomsIsOpen =
                                                                      true;
                                                                  setState(
                                                                      () {});
                                                                },
                                                                text: 'Выбрать',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 56.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Commissioner',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                    .roomisSkip) {
                                                                  _model.roomisSkip =
                                                                      false;
                                                                  setState(
                                                                      () {});
                                                                } else {
                                                                  _model.roomisSkip =
                                                                      true;
                                                                  setState(
                                                                      () {});
                                                                }
                                                              },
                                                              text: _model
                                                                      .roomisSkip
                                                                  ? 'Выбор пропущен'
                                                                  : 'Пропустить выбор',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 56.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: _model
                                                                        .roomisSkip
                                                                    ? const Color(
                                                                        0xFF24A541)
                                                                    : Colors
                                                                        .transparent,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Commissioner',
                                                                      color: _model
                                                                              .roomisSkip
                                                                          ? const Color(
                                                                              0xFFFAFAFA)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 48.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                      .choosenHall.isEmpty) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'пожалуйста, выберите зал',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              } else {
                                                                _model.requestWrMob =
                                                                    await RequestsTable()
                                                                        .insert({
                                                                  'owner':
                                                                      hotelSearchPageCopyUsersRow
                                                                          ?.id,
                                                                  'rooms': _model
                                                                      .listRoomRequest,
                                                                  'halls': _model
                                                                      .listHallRequest,
                                                                  'hotel': _model
                                                                      .choosedHotel,
                                                                  'day_start': supaSerialize<
                                                                          DateTime>(
                                                                      widget
                                                                          .startDate),
                                                                  'food': _model
                                                                      .listFoodRequest,
                                                                  'people_count':
                                                                      widget
                                                                          .visitors,
                                                                  'day_end': supaSerialize<
                                                                          DateTime>(
                                                                      functions.countDuration(
                                                                          widget
                                                                              .startDate
                                                                              ?.toString(),
                                                                          widget
                                                                              .duration)),
                                                                  'hotel_name':
                                                                      _model
                                                                          .chosenHotelName,
                                                                  'price': (functions.sumList(_model.priceHall.toList())!) +
                                                                      (functions.sumList(_model
                                                                          .foodPrice
                                                                          .toList())!) +
                                                                      (functions.sumList(_model
                                                                          .roomPrice
                                                                          .toList())!),
                                                                  'hall_price':
                                                                      functions.sumList(_model
                                                                          .priceHall
                                                                          .toList()),
                                                                  'food_price':
                                                                      functions.sumList(_model
                                                                          .foodPrice
                                                                          .toList()),
                                                                  'room_price':
                                                                      functions.sumList(_model
                                                                          .roomPrice
                                                                          .toList()),
                                                                  'halls_original_id':
                                                                      _model
                                                                          .choosenHall,
                                                                  'inProgress':
                                                                      false,
                                                                  'Complete':
                                                                      false,
                                                                  'food_original_id':
                                                                      _model
                                                                          .chosenFood,
                                                                  'room_original_id':
                                                                      _model
                                                                          .choosenRooms,
                                                                  'monthYear': functions
                                                                      .formatMonthYear(
                                                                          getCurrentTimestamp),
                                                                  'client_network':
                                                                      hotelSearchPageCopyUsersRow
                                                                          ?.network,
                                                                  'duration':
                                                                      widget
                                                                          .duration,
                                                                });
                                                                await RequestsHallVarTable()
                                                                    .update(
                                                                  data: {
                                                                    'request_id':
                                                                        _model
                                                                            .requestWrMob
                                                                            ?.id,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) => rows
                                                                          .eq(
                                                                            'owner',
                                                                            hotelSearchPageCopyUsersRow?.id,
                                                                          )
                                                                          .in_(
                                                                            'id',
                                                                            _model.listHallRequest,
                                                                          ),
                                                                );
                                                                await RequestsFoodVarTable()
                                                                    .update(
                                                                  data: {
                                                                    'request_id':
                                                                        _model
                                                                            .requestWrMob
                                                                            ?.id,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) => rows
                                                                          .in_(
                                                                            'id',
                                                                            _model.listFoodRequest,
                                                                          )
                                                                          .eq(
                                                                            'owner',
                                                                            hotelSearchPageCopyUsersRow?.id,
                                                                          ),
                                                                );
                                                                await RequestsRoomVarTable()
                                                                    .update(
                                                                  data: {
                                                                    'request_id':
                                                                        _model
                                                                            .requestWrMob
                                                                            ?.id,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) => rows
                                                                          .in_(
                                                                            'id',
                                                                            _model.listRoomRequest,
                                                                          )
                                                                          .eq(
                                                                            'owner',
                                                                            hotelSearchPageCopyUsersRow?.id,
                                                                          ),
                                                                );
                                                                _model.addToRequestList(
                                                                    _model
                                                                        .requestWrMob!);
                                                                _model.lastRequestId =
                                                                    _model
                                                                        .requestWrMob
                                                                        ?.id;
                                                                setState(() {});
                                                                _model.requestWrapperMob =
                                                                    await RequestWrapperTable()
                                                                        .insert({
                                                                  'requests_id': _model
                                                                      .requestList
                                                                      .map((e) =>
                                                                          e.id)
                                                                      .toList(),
                                                                  'owner':
                                                                      hotelSearchPageCopyUsersRow
                                                                          ?.id,
                                                                });
                                                                await UsersTable()
                                                                    .update(
                                                                  data: {
                                                                    'last_request':
                                                                        supaSerialize<DateTime>(
                                                                            getCurrentTimestamp),
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eq(
                                                                    'id',
                                                                    hotelSearchPageCopyUsersRow
                                                                        ?.id,
                                                                  ),
                                                                );

                                                                context
                                                                    .pushNamed(
                                                                  'Request',
                                                                  queryParameters:
                                                                      {
                                                                    'requestWrapper':
                                                                        serializeParam(
                                                                      _model
                                                                          .requestWrapperMob,
                                                                      ParamType
                                                                          .SupabaseRow,
                                                                    ),
                                                                    'lastRequest':
                                                                        serializeParam(
                                                                      _model
                                                                          .requestWrMob,
                                                                      ParamType
                                                                          .SupabaseRow,
                                                                    ),
                                                                    'wasEdited':
                                                                        serializeParam(
                                                                      false,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'startDate':
                                                                        serializeParam(
                                                                      widget
                                                                          .startDate,
                                                                      ParamType
                                                                          .DateTime,
                                                                    ),
                                                                    'duration':
                                                                        serializeParam(
                                                                      widget
                                                                          .duration,
                                                                      ParamType
                                                                          .double,
                                                                    ),
                                                                    'city':
                                                                        serializeParam(
                                                                      widget
                                                                          .city,
                                                                      ParamType
                                                                          .SupabaseRow,
                                                                    ),
                                                                    'visitors':
                                                                        serializeParam(
                                                                      widget
                                                                          .visitors,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'hallFilter1':
                                                                        serializeParam(
                                                                      widget
                                                                          .hallFilter1,
                                                                      ParamType
                                                                          .DataStruct,
                                                                    ),
                                                                    'hallFilter2':
                                                                        serializeParam(
                                                                      widget
                                                                          .hallFilter2,
                                                                      ParamType
                                                                          .DataStruct,
                                                                    ),
                                                                    'hallFilter3':
                                                                        serializeParam(
                                                                      widget
                                                                          .hallFilter3,
                                                                      ParamType
                                                                          .DataStruct,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }

                                                              setState(() {});
                                                            },
                                                            text: 'Получить КП',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          43.0,
                                                                          0.0,
                                                                          43.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: _model
                                                                          .choosenHall.isNotEmpty
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0x662431A5),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Commissioner',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
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
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                      .choosenHall.isEmpty) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Пожалуйста, выберите зал',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              } else {
                                                                _model.requestMob =
                                                                    await RequestsTable()
                                                                        .insert({
                                                                  'owner':
                                                                      hotelSearchPageCopyUsersRow
                                                                          ?.id,
                                                                  'rooms': _model
                                                                      .listRoomRequest,
                                                                  'halls': _model
                                                                      .listHallRequest,
                                                                  'hotel': _model
                                                                      .choosedHotel,
                                                                  'day_start': supaSerialize<
                                                                          DateTime>(
                                                                      widget
                                                                          .startDate),
                                                                  'food': _model
                                                                      .listFoodRequest,
                                                                  'people_count':
                                                                      widget
                                                                          .visitors,
                                                                  'day_end': supaSerialize<
                                                                          DateTime>(
                                                                      functions.countDuration(
                                                                          widget
                                                                              .startDate
                                                                              ?.toString(),
                                                                          widget
                                                                              .duration)),
                                                                  'hotel_name':
                                                                      _model
                                                                          .chosenHotelName,
                                                                  'price': (functions.sumList(_model.priceHall.toList())!) +
                                                                      (functions.sumList(_model
                                                                          .foodPrice
                                                                          .toList())!) +
                                                                      (functions.sumList(_model
                                                                          .roomPrice
                                                                          .toList())!),
                                                                  'hall_price':
                                                                      functions.sumList(_model
                                                                          .priceHall
                                                                          .toList()),
                                                                  'food_price':
                                                                      functions.sumList(_model
                                                                          .foodPrice
                                                                          .toList()),
                                                                  'room_price':
                                                                      functions.sumList(_model
                                                                          .foodPrice
                                                                          .toList()),
                                                                  'monthYear': functions
                                                                      .formatMonthYear(
                                                                          getCurrentTimestamp),
                                                                  'client_network':
                                                                      hotelSearchPageCopyUsersRow
                                                                          ?.network,
                                                                  'duration':
                                                                      widget
                                                                          .duration,
                                                                });
                                                                await RequestsHallVarTable()
                                                                    .update(
                                                                  data: {
                                                                    'request_id':
                                                                        _model
                                                                            .requestWr
                                                                            ?.id,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) => rows
                                                                          .eq(
                                                                            'owner',
                                                                            hotelSearchPageCopyUsersRow?.id,
                                                                          )
                                                                          .eq(
                                                                            'request_id',
                                                                            0,
                                                                          )
                                                                          .in_(
                                                                            'hall_id',
                                                                            _model.choosenHall,
                                                                          ),
                                                                );
                                                                await RequestsFoodVarTable()
                                                                    .update(
                                                                  data: {
                                                                    'request_id':
                                                                        _model
                                                                            .requestWr
                                                                            ?.id,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) => rows
                                                                          .in_(
                                                                            'food_id',
                                                                            _model.chosenFood,
                                                                          )
                                                                          .eq(
                                                                            'request_id',
                                                                            0,
                                                                          )
                                                                          .eq(
                                                                            'owner',
                                                                            hotelSearchPageCopyUsersRow?.id,
                                                                          ),
                                                                );
                                                                await RequestsRoomVarTable()
                                                                    .update(
                                                                  data: {
                                                                    'request_id':
                                                                        _model
                                                                            .requestWr
                                                                            ?.id,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) => rows
                                                                          .in_(
                                                                            'room_id',
                                                                            _model.choosenRooms,
                                                                          )
                                                                          .eq(
                                                                            'request_id',
                                                                            0,
                                                                          )
                                                                          .eq(
                                                                            'owner',
                                                                            hotelSearchPageCopyUsersRow?.id,
                                                                          ),
                                                                );
                                                                await UsersTable()
                                                                    .update(
                                                                  data: {
                                                                    'last_request':
                                                                        supaSerialize<DateTime>(
                                                                            getCurrentTimestamp),
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eq(
                                                                    'id',
                                                                    hotelSearchPageCopyUsersRow
                                                                        ?.id,
                                                                  ),
                                                                );
                                                                _model.addToRequestList(
                                                                    _model
                                                                        .requestMob!);
                                                                setState(() {});
                                                                _model.step = 0;
                                                                _model.chosenHotelName =
                                                                    null;
                                                                _model.chosenFood =
                                                                    [];
                                                                _model.choosenHall =
                                                                    [];
                                                                _model.choosenRooms =
                                                                    [];
                                                                _model.listHallRequest =
                                                                    [];
                                                                _model.listFoodRequest =
                                                                    [];
                                                                _model.listRoomRequest =
                                                                    [];
                                                                _model.foodIsOpen =
                                                                    false;
                                                                _model.roomsIsOpen =
                                                                    false;
                                                                _model.foodIsSkip =
                                                                    false;
                                                                _model.roomisSkip =
                                                                    false;
                                                                _model.choosedHotel =
                                                                    null;
                                                                setState(() {});
                                                              }

                                                              setState(() {});
                                                            },
                                                            text:
                                                                'Продолжить выбор отелей',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          43.0,
                                                                          0.0,
                                                                          43.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: _model
                                                                          .choosenHall.isNotEmpty
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0x662431A5),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Commissioner',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 32.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 56.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.footerModel,
                            updateCallback: () => setState(() {}),
                            child: const FooterWidget(),
                          ),
                        ),
                      ].addToEnd(const SizedBox(height: 0.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}