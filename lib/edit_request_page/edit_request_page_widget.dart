import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/client_hall_edit_component_widget.dart';
import '/components/client_optional_widget.dart';
import '/components/edit_food_component_widget.dart';
import '/components/edit_request_hotel_component_widget.dart';
import '/components/edit_room_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/menu/menu_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_request_page_model.dart';
export 'edit_request_page_model.dart';

class EditRequestPageWidget extends StatefulWidget {
  const EditRequestPageWidget({
    super.key,
    required this.hotel,
    required this.request,
    required this.hallRequests,
    required this.hotelName,
    required this.wrapper,
    this.chosenHalls,
    required this.foodRequests,
    required this.chosenFood,
    required this.roomRequests,
    required this.chosenRoom,
    required this.dayStart,
    required this.duration,
    required this.visitors,
    required this.city,
    this.hallFilter1,
    this.hallFilter2,
    this.hallFilter3,
  });

  final int? hotel;
  final RequestsRow? request;
  final List<int>? hallRequests;
  final String? hotelName;
  final RequestWrapperRow? wrapper;
  final List<int>? chosenHalls;
  final List<int>? foodRequests;
  final List<int>? chosenFood;
  final List<int>? roomRequests;
  final List<int>? chosenRoom;
  final DateTime? dayStart;
  final double? duration;
  final int? visitors;
  final CityRow? city;
  final HotelSeatingStruct? hallFilter1;
  final HotelSeatingStruct? hallFilter2;
  final HotelSeatingStruct? hallFilter3;

  @override
  State<EditRequestPageWidget> createState() => _EditRequestPageWidgetState();
}

class _EditRequestPageWidgetState extends State<EditRequestPageWidget> {
  late EditRequestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditRequestPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.choosenHall = widget!.chosenHalls!.toList().cast<int>();
      _model.listHallRequest = widget!.hallRequests!.toList().cast<int>();
      _model.listFoodRequest = widget!.foodRequests!.toList().cast<int>();
      _model.chosenFood = widget!.chosenFood!.toList().cast<int>();
      _model.listRoomRequest = widget!.roomRequests!.toList().cast<int>();
      _model.choosenRooms = widget!.chosenRoom!.toList().cast<int>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        List<UsersRow> editRequestPageUsersRowList = snapshot.data!;

        final editRequestPageUsersRow = editRequestPageUsersRowList.isNotEmpty
            ? editRequestPageUsersRowList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: FutureBuilder<List<HotelRow>>(
              future: HotelTable().querySingleRow(
                queryFn: (q) => q.eq(
                  'id',
                  widget!.hotel,
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
                List<HotelRow> containerHotelRowList = snapshot.data!;

                final containerHotelRow = containerHotelRowList.isNotEmpty
                    ? containerHotelRowList.first
                    : null;

                return Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    image: DecorationImage(
                      fit: BoxFit.cover,
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
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ))
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 16.0, 32.0, 64.0),
                              child: wrapWithModel(
                                model: _model.menuModel,
                                updateCallback: () => safeSetState(() {}),
                                child: MenuWidget(
                                  isBlue: true,
                                  clientProfile: () async {},
                                  clientRequest: () async {},
                                  clientFavorite: () async {},
                                  searchAction: () async {},
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 1250.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Редактрование запроса в отель ${widget!.hotelName}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.safePop();
                                        },
                                        text: 'Назад',
                                        icon: Icon(
                                          Icons.chevron_left,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 110.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0x002431A5),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 56.0),
                          child: FutureBuilder<List<HotelRow>>(
                            future: HotelTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id',
                                widget!.hotel,
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
                              List<HotelRow> hotelChooseHotelRowList =
                                  snapshot.data!;

                              final hotelChooseHotelRow =
                                  hotelChooseHotelRowList.isNotEmpty
                                      ? hotelChooseHotelRowList.first
                                      : null;

                              return Container(
                                constraints: BoxConstraints(
                                  maxWidth: 1250.0,
                                ),
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.editRequestHotelComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: EditRequestHotelComponentWidget(
                                    hotel: hotelChooseHotelRow!,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 56.0),
                          child: FutureBuilder<List<HotelRow>>(
                            future: HotelTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id',
                                widget!.hotel,
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
                                constraints: BoxConstraints(
                                  maxWidth: 1250.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Подходящие залы в отеле под Ваше мероприятие:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: FutureBuilder<List<HallRow>>(
                                        future: HallTable().queryRows(
                                          queryFn: (q) => q
                                              .in_(
                                                'id',
                                                hallChooseHotelRow!.hall,
                                              )
                                              .order('name', ascending: true),
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
                                          List<HallRow> columnHallRowList =
                                              snapshot.data!;

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                columnHallRowList.length,
                                                (columnIndex) {
                                              final columnHallRow =
                                                  columnHallRowList[
                                                      columnIndex];
                                              return Visibility(
                                                visible: (columnIndex < 2) ||
                                                    _model.showMorehalls,
                                                child: FutureBuilder<
                                                    List<RequestsHallVarRow>>(
                                                  future: RequestsHallVarTable()
                                                      .querySingleRow(
                                                    queryFn: (q) => q
                                                        .eq(
                                                          'hall_id',
                                                          columnHallRow.id,
                                                        )
                                                        .eq(
                                                          'request_id',
                                                          widget!.request?.id,
                                                        ),
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
                                                          safeSetState(() {}),
                                                      child:
                                                          ClientHallEditComponentWidget(
                                                        key: Key(
                                                          'Keyapm_${columnHallRow.id.toString()}',
                                                        ),
                                                        isChosen: _model
                                                                .choosenHall
                                                                .contains(
                                                                    columnHallRow
                                                                        .id) ==
                                                            true,
                                                        hall: columnHallRow,
                                                        request:
                                                            clientHallEditComponentRequestsHallVarRow,
                                                        chooseAction: (idHall,
                                                            days,
                                                            price,
                                                            nameHall,
                                                            seating) async {
                                                          if (_model.choosenHall
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
                                                                        columnHallRow
                                                                            .id,
                                                                      )
                                                                      .in_(
                                                                        'hall_id',
                                                                        widget!
                                                                            .chosenHalls!,
                                                                      )
                                                                      .eq(
                                                                        'request_id',
                                                                        widget!
                                                                            .request
                                                                            ?.id,
                                                                      ),
                                                            );
                                                            _model
                                                                .removeFromChoosenHall(
                                                                    columnHallRow
                                                                        .id);
                                                            _model
                                                                .removeFromPriceHall(
                                                                    price!);
                                                            safeSetState(() {});
                                                          } else {
                                                            _model
                                                                .addToChoosenHall(
                                                                    columnHallRow
                                                                        .id);
                                                            safeSetState(() {});
                                                            _model.newHallRequstVAr =
                                                                await RequestsHallVarTable()
                                                                    .insert({
                                                              'days': days,
                                                              'hall_id': idHall,
                                                              'hall_name':
                                                                  nameHall,
                                                              'price': price,
                                                              'owner':
                                                                  editRequestPageUsersRow
                                                                      ?.id,
                                                              'request_id':
                                                                  widget!
                                                                      .request
                                                                      ?.id,
                                                              'seating':
                                                                  seating,
                                                            });
                                                            _model.addToListHallRequest(
                                                                _model
                                                                    .newHallRequstVAr!
                                                                    .id);
                                                            _model.addToPriceHall(
                                                                _model
                                                                    .newHallRequstVAr!
                                                                    .price!);
                                                            safeSetState(() {});
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        onLoad: (price) async {
                                                          _model.addToPriceHall(
                                                              price!);
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }).divide(
                                              SizedBox(height: 40.0),
                                              filterFn: (columnIndex) {
                                                final columnHallRow =
                                                    columnHallRowList[
                                                        columnIndex];
                                                return (columnIndex < 2) ||
                                                    _model.showMorehalls;
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((hallChooseHotelRow!.hall.length -
                                                2) >
                                            0)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (_model.showMorehalls == false)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.showMorehalls = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Text(
                                                    'Показать ешё ${(hallChooseHotelRow!.hall.length - 2).toString()} зал(ов)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                              FontWeight.bold,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                  ),
                                                ),
                                              if (_model.showMorehalls)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.showMorehalls =
                                                        false;
                                                    safeSetState(() {});
                                                  },
                                                  child: Text(
                                                    'Показать меньше',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                              FontWeight.bold,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        if (_model.priceHall.length != 0)
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
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Text(
                                                        'Итоговая сумма',
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
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${formatNumber(
                                                        functions.sumList(_model
                                                            .priceHall
                                                            .toList()),
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                      )} руб',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            fontSize: 34.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 48.0)),
                                ),
                              );
                            },
                          ),
                        ),
                        if ((containerHotelRow?.food?.length != 0) &&
                            (_model.foodIsOpen &&
                                (widget!.chosenFood?.length.toString() != '0')))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 56.0),
                            child: FutureBuilder<List<HotelRow>>(
                              future: HotelTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'id',
                                  widget!.hotel,
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
                                List<HotelRow> foodChosesHotelRowList =
                                    snapshot.data!;

                                final foodChosesHotelRow =
                                    foodChosesHotelRowList.isNotEmpty
                                        ? foodChosesHotelRowList.first
                                        : null;

                                return Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 1250.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Варианты питания',
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
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: FutureBuilder<List<FoodRow>>(
                                          future: FoodTable().queryRows(
                                            queryFn: (q) => q.in_(
                                              'id',
                                              foodChosesHotelRow!.food,
                                            ),
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
                                            List<FoodRow> columnFoodRowList =
                                                snapshot.data!;

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  columnFoodRowList.length,
                                                  (columnIndex) {
                                                final columnFoodRow =
                                                    columnFoodRowList[
                                                        columnIndex];
                                                return FutureBuilder<
                                                    List<RequestsFoodVarRow>>(
                                                  future: RequestsFoodVarTable()
                                                      .querySingleRow(
                                                    queryFn: (q) => q
                                                        .eq(
                                                          'food_id',
                                                          columnFoodRow.id,
                                                        )
                                                        .eq(
                                                          'request_id',
                                                          widget!.request?.id,
                                                        ),
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
                                                    List<RequestsFoodVarRow>
                                                        editFoodComponentRequestsFoodVarRowList =
                                                        snapshot.data!;

                                                    final editFoodComponentRequestsFoodVarRow =
                                                        editFoodComponentRequestsFoodVarRowList
                                                                .isNotEmpty
                                                            ? editFoodComponentRequestsFoodVarRowList
                                                                .first
                                                            : null;

                                                    return wrapWithModel(
                                                      model: _model
                                                          .editFoodComponentModels
                                                          .getModel(
                                                        columnFoodRow.id
                                                            .toString(),
                                                        columnIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          EditFoodComponentWidget(
                                                        key: Key(
                                                          'Keys1r_${columnFoodRow.id.toString()}',
                                                        ),
                                                        isChosen: _model
                                                                .chosenFood
                                                                .contains(
                                                                    columnFoodRow
                                                                        .id) ==
                                                            true,
                                                        food: columnFoodRow,
                                                        request:
                                                            editFoodComponentRequestsFoodVarRow,
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
                                                            _model
                                                                .removeFromChosenFood(
                                                                    columnFoodRow
                                                                        .id);
                                                            _model
                                                                .removeFromFoodPrice(
                                                                    price!);
                                                            safeSetState(() {});
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
                                                                        widget!
                                                                            .request
                                                                            ?.id,
                                                                      ),
                                                            );
                                                          } else {
                                                            _model
                                                                .addToChosenFood(
                                                                    columnFoodRow
                                                                        .id);
                                                            safeSetState(() {});
                                                            _model.newFoodRequstVar =
                                                                await RequestsFoodVarTable()
                                                                    .insert({
                                                              'price': price,
                                                              'owner':
                                                                  editRequestPageUsersRow
                                                                      ?.id,
                                                              'food_id': foodId,
                                                              'count': count,
                                                              'persons_count':
                                                                  persons,
                                                              'name': name,
                                                              'request_id':
                                                                  widget!
                                                                      .request
                                                                      ?.id,
                                                            });
                                                            _model.addToListFoodRequest(
                                                                _model
                                                                    .newFoodRequstVar!
                                                                    .id);
                                                            _model.addToFoodPrice(
                                                                _model
                                                                    .newFoodRequstVar!
                                                                    .price!);
                                                            safeSetState(() {});
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        onLoad: (price) async {
                                                          _model.addToFoodPrice(
                                                              price!);
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              }).divide(SizedBox(height: 40.0)),
                                            );
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.foodPrice.length != 0)
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
                                                            EdgeInsetsDirectional
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
                                                              _model.foodPrice
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
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 48.0)),
                                  ),
                                );
                              },
                            ),
                          ),
                        if ((containerHotelRow?.rooms?.length != 0) &&
                            (_model.roomsIsOpen &&
                                (widget!.chosenRoom?.length != 0)))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 56.0),
                            child: FutureBuilder<List<HotelRow>>(
                              future: HotelTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'id',
                                  widget!.hotel,
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
                                List<HotelRow> roomChoosesHotelRowList =
                                    snapshot.data!;

                                final roomChoosesHotelRow =
                                    roomChoosesHotelRowList.isNotEmpty
                                        ? roomChoosesHotelRowList.first
                                        : null;

                                return Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 1250.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
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
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: FutureBuilder<List<RoomRow>>(
                                          future: RoomTable().queryRows(
                                            queryFn: (q) => q.in_(
                                              'id',
                                              roomChoosesHotelRow!.rooms,
                                            ),
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
                                                return FutureBuilder<
                                                    List<RequestsRoomVarRow>>(
                                                  future: RequestsRoomVarTable()
                                                      .querySingleRow(
                                                    queryFn: (q) => q
                                                        .eq(
                                                          'room_id',
                                                          columnRoomRow.id,
                                                        )
                                                        .eq(
                                                          'request_id',
                                                          widget!.request?.id,
                                                        ),
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
                                                    List<RequestsRoomVarRow>
                                                        editRoomComponentRequestsRoomVarRowList =
                                                        snapshot.data!;

                                                    final editRoomComponentRequestsRoomVarRow =
                                                        editRoomComponentRequestsRoomVarRowList
                                                                .isNotEmpty
                                                            ? editRoomComponentRequestsRoomVarRowList
                                                                .first
                                                            : null;

                                                    return wrapWithModel(
                                                      model: _model
                                                          .editRoomComponentModels
                                                          .getModel(
                                                        columnRoomRow.id
                                                            .toString(),
                                                        columnIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          EditRoomComponentWidget(
                                                        key: Key(
                                                          'Keys7b_${columnRoomRow.id.toString()}',
                                                        ),
                                                        isChosen: _model
                                                                .choosenRooms
                                                                .contains(
                                                                    columnRoomRow
                                                                        .id) ==
                                                            true,
                                                        room: columnRoomRow,
                                                        request:
                                                            editRoomComponentRequestsRoomVarRow,
                                                        choseAction: (roomId,
                                                            roomName,
                                                            price,
                                                            count,
                                                            days) async {
                                                          if (_model
                                                                  .choosenRooms
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
                                                            safeSetState(() {});
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
                                                                        widget!
                                                                            .request
                                                                            ?.id,
                                                                      ),
                                                            );
                                                          } else {
                                                            _model
                                                                .addToChoosenRooms(
                                                                    columnRoomRow
                                                                        .id);
                                                            safeSetState(() {});
                                                            _model.newRoomRequestVar =
                                                                await RequestsRoomVarTable()
                                                                    .insert({
                                                              'room_id': roomId,
                                                              'days': days,
                                                              'price': price,
                                                              'room_name':
                                                                  roomName,
                                                              'room_count':
                                                                  count,
                                                              'owner':
                                                                  editRequestPageUsersRow
                                                                      ?.id,
                                                              'request_id':
                                                                  widget!
                                                                      .request
                                                                      ?.id,
                                                            });
                                                            _model.addToListRoomRequest(
                                                                _model
                                                                    .newRoomRequestVar!
                                                                    .id);
                                                            _model
                                                                .addToRoomPrice(
                                                                    price!);
                                                            safeSetState(() {});
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        onLoad: (price) async {
                                                          _model.addToRoomPrice(
                                                              price!);
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              }).divide(SizedBox(height: 40.0)),
                                            );
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.roomPrice.length != 0)
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
                                                            EdgeInsetsDirectional
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
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 32.0)),
                                  ),
                                );
                              },
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 40.0),
                          child: FutureBuilder<List<HotelRow>>(
                            future: HotelTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id',
                                widget!.hotel,
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
                                constraints: BoxConstraints(
                                  maxWidth: 1250.0,
                                ),
                                decoration: BoxDecoration(),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (!_model.foodIsOpen &&
                                                  (containerHotelRow!
                                                      .food.isNotEmpty) &&
                                                  (widget!.chosenFood?.length
                                                          .toString() !=
                                                      '0'))
                                                Expanded(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .clientOptionalModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child: ClientOptionalWidget(
                                                      isRoom: false,
                                                      isSkipped:
                                                          _model.foodIsSkip,
                                                      show: (isRoom) async {
                                                        _model.foodIsOpen =
                                                            true;
                                                        safeSetState(() {});
                                                      },
                                                      skip: (isRoom) async {
                                                        if (_model.foodIsSkip) {
                                                          _model.foodIsSkip =
                                                              false;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.foodIsSkip =
                                                              true;
                                                          safeSetState(() {});
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
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child: ClientOptionalWidget(
                                                      isRoom: true,
                                                      isSkipped:
                                                          _model.roomisSkip,
                                                      show: (isRoom) async {
                                                        _model.roomsIsOpen =
                                                            true;
                                                        safeSetState(() {});
                                                      },
                                                      skip: (isRoom) async {
                                                        if (_model.roomisSkip) {
                                                          _model.roomisSkip =
                                                              false;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.roomisSkip =
                                                              true;
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ].divide(SizedBox(height: 32.0)),
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!_model.foodIsOpen &&
                                                (containerHotelRow!
                                                    .food.isNotEmpty))
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Варианты питания',
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.foodIsOpen =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: 'Выбрать',
                                                            options:
                                                                FFButtonOptions(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 56.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
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
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
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
                                                          onPressed: () async {
                                                            if (_model
                                                                .foodIsSkip) {
                                                              _model.foodIsSkip =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.foodIsSkip =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
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
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: _model
                                                                    .foodIsSkip
                                                                ? Color(
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
                                                                      color: _model
                                                                              .foodIsSkip
                                                                          ? Color(
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 40.0, 0.0, 0.0),
                                                child: Column(
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
                                                          EdgeInsetsDirectional
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
                                                                EdgeInsetsDirectional
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
                                                                safeSetState(
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
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
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
                                                                    BorderSide(
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
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.roomisSkip =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            text: _model
                                                                    .roomisSkip
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
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: _model
                                                                      .roomisSkip
                                                                  ? Color(
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
                                                                        color: _model.roomisSkip
                                                                            ? Color(0xFFFAFAFA)
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
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 1250.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.choosenHall.length == 0) {
                                          ScaffoldMessenger.of(context)
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
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        } else {
                                          await RequestsTable().update(
                                            data: {
                                              'owner':
                                                  editRequestPageUsersRow?.id,
                                              'rooms': _model.listRoomRequest,
                                              'halls': _model.listHallRequest,
                                              'food': _model.listFoodRequest,
                                              'price': (functions.sumList(_model
                                                      .priceHall
                                                      .toList())!) +
                                                  (functions.sumList(_model
                                                      .foodPrice
                                                      .toList())!) +
                                                  (functions.sumList(_model
                                                      .roomPrice
                                                      .toList())!),
                                              'hall_price': functions.sumList(
                                                  _model.priceHall.toList()),
                                              'food_price': functions.sumList(
                                                  _model.foodPrice.toList()),
                                              'room_price': functions.sumList(
                                                  _model.roomPrice.toList()),
                                              'halls_original_id':
                                                  _model.choosenHall,
                                              'food_original_id':
                                                  _model.chosenFood,
                                              'room_original_id':
                                                  _model.choosenRooms,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget!.request?.id,
                                            ),
                                          );
                                          await RequestsHallVarTable().update(
                                            data: {
                                              'request_id': widget!.request?.id,
                                            },
                                            matchingRows: (rows) => rows
                                                .eq(
                                                  'owner',
                                                  editRequestPageUsersRow?.id,
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
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'Request',
                                            queryParameters: {
                                              'requestWrapper': serializeParam(
                                                widget!.wrapper,
                                                ParamType.SupabaseRow,
                                              ),
                                              'lastRequest': serializeParam(
                                                widget!.request,
                                                ParamType.SupabaseRow,
                                              ),
                                              'wasEdited': serializeParam(
                                                true,
                                                ParamType.bool,
                                              ),
                                              'startDate': serializeParam(
                                                widget!.dayStart,
                                                ParamType.DateTime,
                                              ),
                                              'duration': serializeParam(
                                                widget!.duration,
                                                ParamType.double,
                                              ),
                                              'city': serializeParam(
                                                widget!.city,
                                                ParamType.SupabaseRow,
                                              ),
                                              'visitors': serializeParam(
                                                widget!.visitors,
                                                ParamType.int,
                                              ),
                                              'hallFilter1': serializeParam(
                                                widget!.hallFilter1,
                                                ParamType.DataStruct,
                                              ),
                                              'hallFilter2': serializeParam(
                                                widget!.hallFilter2,
                                                ParamType.DataStruct,
                                              ),
                                              'hallFilter3': serializeParam(
                                                widget!.hallFilter3,
                                                ParamType.DataStruct,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Сохранить',
                                      options: FFButtonOptions(
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            43.0, 0.0, 43.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: _model.choosenHall.length != 0
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Color(0x662431A5),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ].divide(SizedBox(height: 32.0)),
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 72.0)),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
