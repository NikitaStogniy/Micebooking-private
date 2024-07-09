import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/client_hall_edit_component_widget.dart';
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
      _model.choosenHall = widget.chosenHalls!.toList().cast<int>();
      _model.listHallRequest = widget.hallRequests!.toList().cast<int>();
      _model.listFoodRequest = widget.foodRequests!.toList().cast<int>();
      _model.chosenFood = widget.chosenFood!.toList().cast<int>();
      _model.listRoomRequest = widget.roomRequests!.toList().cast<int>();
      _model.choosenRooms = widget.chosenRoom!.toList().cast<int>();
      setState(() {});
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
        List<UsersRow> editRequestPageUsersRowList = snapshot.data!;
        final editRequestPageUsersRow = editRequestPageUsersRowList.isNotEmpty
            ? editRequestPageUsersRowList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Container(
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: const BoxDecoration(),
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
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              32.0, 16.0, 32.0, 64.0),
                          child: wrapWithModel(
                            model: _model.menuModel,
                            updateCallback: () => setState(() {}),
                            child: MenuWidget(
                              isBlue: true,
                              clientProfile: () async {},
                              clientRequest: () async {},
                              clientFavorite: () async {},
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 1250.0,
                        ),
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Редактрование запроса в отель ${widget.hotelName}',
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      32.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.chosenHotels.length == 1) {
                                        _model.step = 0;
                                        _model.removeFromChosenHotels(
                                            _model.choosedHotel!);
                                        _model.chosenHotelName = null;
                                        _model.chosenFood = [];
                                        _model.choosenHall = [];
                                        _model.choosenRooms = [];
                                        _model.listHallRequest = [];
                                        _model.listFoodRequest = [];
                                        _model.listRoomRequest = [];
                                        _model.foodIsOpen = false;
                                        _model.roomsIsOpen = false;
                                        _model.foodIsSkip = false;
                                        _model.roomisSkip = false;
                                        setState(() {});
                                        _model.choosedHotel = null;
                                        setState(() {});
                                      } else {
                                        _model.step = 0;
                                        _model.removeFromChosenHotels(
                                            _model.choosedHotel!);
                                        _model.chosenHotelName = null;
                                        _model.chosenFood = [];
                                        _model.choosenHall = [];
                                        _model.choosenRooms = [];
                                        _model.listHallRequest = [];
                                        _model.listFoodRequest = [];
                                        _model.listRoomRequest = [];
                                        _model.foodIsOpen = false;
                                        _model.roomsIsOpen = false;
                                        _model.foodIsSkip = false;
                                        _model.roomisSkip = false;
                                        setState(() {});
                                        _model.choosedHotel = null;
                                        setState(() {});
                                      }
                                    },
                                    text: 'Назад',
                                    icon: const Icon(
                                      Icons.chevron_left,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 110.0,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0x002431A5),
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
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 16.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 1250.0,
                        ),
                        decoration: const BoxDecoration(),
                        alignment: const AlignmentDirectional(0.0, 0.0),
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
                            List<HotelRow> columnHotelRowList = snapshot.data!;
                            final columnHotelRow = columnHotelRowList.isNotEmpty
                                ? columnHotelRowList.first
                                : null;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                wrapWithModel(
                                  model: _model.editRequestHotelComponentModel,
                                  updateCallback: () => setState(() {}),
                                  child: EditRequestHotelComponentWidget(
                                    hotel: columnHotelRow!,
                                  ),
                                ),
                              ]
                                  .divide(const SizedBox(height: 16.0))
                                  .addToStart(const SizedBox(height: 48.0))
                                  .addToEnd(const SizedBox(height: 72.0)),
                            );
                          },
                        ),
                      ),
                    ),
                    FutureBuilder<List<HotelRow>>(
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
                        List<HotelRow> hallChooseHotelRowList = snapshot.data!;
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
                              Text(
                                'Выбор зала',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: FutureBuilder<List<HallRow>>(
                                  future: HallTable().queryRows(
                                    queryFn: (q) => q.in_(
                                      'id',
                                      hallChooseHotelRow!.hall,
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
                                            columnHallRowList[columnIndex];
                                        return FutureBuilder<
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
                                                  widget.request?.id,
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
                                                columnHallRow.id.toString(),
                                                columnIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child:
                                                  ClientHallEditComponentWidget(
                                                key: Key(
                                                  'Keyapm_${columnHallRow.id.toString()}',
                                                ),
                                                isChosen: _model.choosenHall
                                                        .contains(
                                                            columnHallRow.id) ==
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
                                                      matchingRows: (rows) =>
                                                          rows
                                                              .eq(
                                                                'hall_id',
                                                                columnHallRow
                                                                    .id,
                                                              )
                                                              .in_(
                                                                'hall_id',
                                                                widget
                                                                    .chosenHalls!,
                                                              )
                                                              .eq(
                                                                'request_id',
                                                                widget.request
                                                                    ?.id,
                                                              ),
                                                    );
                                                    _model
                                                        .removeFromChoosenHall(
                                                            columnHallRow.id);
                                                    _model.removeFromPriceHall(
                                                        price!);
                                                    setState(() {});
                                                  } else {
                                                    _model.addToChoosenHall(
                                                        columnHallRow.id);
                                                    setState(() {});
                                                    _model.newHallRequstVAr =
                                                        await RequestsHallVarTable()
                                                            .insert({
                                                      'days': days,
                                                      'hall_id': idHall,
                                                      'hall_name': nameHall,
                                                      'price': price,
                                                      'owner':
                                                          editRequestPageUsersRow
                                                              ?.id,
                                                      'request_id':
                                                          widget.request?.id,
                                                    });
                                                    _model.addToListHallRequest(
                                                        _model.newHallRequstVAr!
                                                            .id);
                                                    _model.addToPriceHall(_model
                                                        .newHallRequstVAr!
                                                        .price!);
                                                    setState(() {});
                                                  }

                                                  setState(() {});
                                                },
                                                onLoad: (price) async {
                                                  _model.addToPriceHall(price!);
                                                  setState(() {});
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      })
                                          .divide(const SizedBox(height: 16.0))
                                          .addToStart(const SizedBox(height: 24.0))
                                          .addToEnd(const SizedBox(height: 72.0)),
                                    );
                                  },
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.priceHall.isNotEmpty)
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 2.0),
                                                child: Text(
                                                  'Итоговая сумма',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
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
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                )} руб',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                            ]
                                .divide(const SizedBox(height: 48.0))
                                .addToStart(const SizedBox(height: 48.0))
                                .addToEnd(const SizedBox(height: 72.0)),
                          ),
                        );
                      },
                    ),
                    FutureBuilder<List<HotelRow>>(
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
                        List<HotelRow> foodChoseHotelRowList = snapshot.data!;
                        final foodChoseHotelRow =
                            foodChoseHotelRowList.isNotEmpty
                                ? foodChoseHotelRowList.first
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
                              Text(
                                'Варианты питания',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: FutureBuilder<List<FoodRow>>(
                                  future: FoodTable().queryRows(
                                    queryFn: (q) => q.in_(
                                      'id',
                                      foodChoseHotelRow!.food,
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
                                              FlutterFlowTheme.of(context)
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
                                            columnFoodRowList[columnIndex];
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
                                                  widget.request?.id,
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
                                                columnFoodRow.id.toString(),
                                                columnIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: EditFoodComponentWidget(
                                                key: Key(
                                                  'Keys1r_${columnFoodRow.id.toString()}',
                                                ),
                                                isChosen: _model.chosenFood
                                                        .contains(
                                                            columnFoodRow.id) ==
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
                                                    _model.removeFromChosenFood(
                                                        columnFoodRow.id);
                                                    _model.removeFromFoodPrice(
                                                        price!);
                                                    setState(() {});
                                                    await RequestsFoodVarTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows
                                                              .eq(
                                                                'food_id',
                                                                columnFoodRow
                                                                    .id,
                                                              )
                                                              .eq(
                                                                'request_id',
                                                                widget.request
                                                                    ?.id,
                                                              ),
                                                    );
                                                  } else {
                                                    _model.addToChosenFood(
                                                        columnFoodRow.id);
                                                    setState(() {});
                                                    _model.newFoodRequstVar =
                                                        await RequestsFoodVarTable()
                                                            .insert({
                                                      'price': price,
                                                      'owner':
                                                          editRequestPageUsersRow
                                                              ?.id,
                                                      'food_id': foodId,
                                                      'count': count,
                                                      'persons_count': persons,
                                                      'name': name,
                                                      'request_id':
                                                          widget.request?.id,
                                                    });
                                                    _model.addToListFoodRequest(
                                                        _model.newFoodRequstVar!
                                                            .id);
                                                    _model.addToFoodPrice(_model
                                                        .newFoodRequstVar!
                                                        .price!);
                                                    setState(() {});
                                                  }

                                                  setState(() {});
                                                },
                                                onLoad: (price) async {
                                                  _model.addToFoodPrice(price!);
                                                  setState(() {});
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      })
                                          .divide(const SizedBox(height: 16.0))
                                          .addToStart(const SizedBox(height: 24.0))
                                          .addToEnd(const SizedBox(height: 72.0)),
                                    );
                                  },
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.foodPrice.isNotEmpty)
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 2.0),
                                                child: Text(
                                                  'Итоговая сумма',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
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
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                )} руб',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                            ]
                                .divide(const SizedBox(height: 48.0))
                                .addToStart(const SizedBox(height: 48.0))
                                .addToEnd(const SizedBox(height: 72.0)),
                          ),
                        );
                      },
                    ),
                    FutureBuilder<List<HotelRow>>(
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
                        List<HotelRow> roomChooseHotelRowList = snapshot.data!;
                        final roomChooseHotelRow =
                            roomChooseHotelRowList.isNotEmpty
                                ? roomChooseHotelRowList.first
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
                              Text(
                                'Варианты проживания',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: FutureBuilder<List<RoomRow>>(
                                  future: RoomTable().queryRows(
                                    queryFn: (q) => q.in_(
                                      'id',
                                      roomChooseHotelRow!.rooms,
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
                                              FlutterFlowTheme.of(context)
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
                                            columnRoomRowList[columnIndex];
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
                                                  widget.request?.id,
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
                                                columnRoomRow.id.toString(),
                                                columnIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: EditRoomComponentWidget(
                                                key: Key(
                                                  'Keys7b_${columnRoomRow.id.toString()}',
                                                ),
                                                isChosen: _model.choosenRooms
                                                        .contains(
                                                            columnRoomRow.id) ==
                                                    true,
                                                room: columnRoomRow,
                                                request:
                                                    editRoomComponentRequestsRoomVarRow,
                                                choseAction: (roomId, roomName,
                                                    price, count, days) async {
                                                  if (_model.choosenRooms
                                                          .contains(
                                                              columnRoomRow
                                                                  .id) ==
                                                      true) {
                                                    _model
                                                        .removeFromChoosenRooms(
                                                            columnRoomRow.id);
                                                    _model.removeFromRoomPrice(
                                                        price!);
                                                    setState(() {});
                                                    await RequestsRoomVarTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows
                                                              .eq(
                                                                'room_id',
                                                                columnRoomRow
                                                                    .id,
                                                              )
                                                              .eq(
                                                                'request_id',
                                                                widget.request
                                                                    ?.id,
                                                              ),
                                                    );
                                                  } else {
                                                    _model.addToChoosenRooms(
                                                        columnRoomRow.id);
                                                    setState(() {});
                                                    _model.newRoomRequestVar =
                                                        await RequestsRoomVarTable()
                                                            .insert({
                                                      'room_id': roomId,
                                                      'days': days,
                                                      'price': price,
                                                      'room_name': roomName,
                                                      'room_count': count,
                                                      'owner':
                                                          editRequestPageUsersRow
                                                              ?.id,
                                                      'request_id':
                                                          widget.request?.id,
                                                    });
                                                    _model.addToListRoomRequest(
                                                        _model
                                                            .newRoomRequestVar!
                                                            .id);
                                                    _model
                                                        .addToRoomPrice(price!);
                                                    setState(() {});
                                                  }

                                                  setState(() {});
                                                },
                                                onLoad: (price) async {
                                                  _model.addToRoomPrice(price!);
                                                  setState(() {});
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      })
                                          .divide(const SizedBox(height: 16.0))
                                          .addToStart(const SizedBox(height: 24.0))
                                          .addToEnd(const SizedBox(height: 72.0)),
                                    );
                                  },
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.roomPrice.isNotEmpty)
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 2.0),
                                                child: Text(
                                                  'Итоговая сумма',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                '${formatNumber(
                                                  functions.sumList(_model
                                                      .roomPrice
                                                      .toList()),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                )} руб',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                            ]
                                .divide(const SizedBox(height: 48.0))
                                .addToStart(const SizedBox(height: 48.0))
                                .addToEnd(const SizedBox(height: 72.0)),
                          ),
                        );
                      },
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 1250.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.choosenHall.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'пожалуйста, выберите зал',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else {
                                      await RequestsTable().update(
                                        data: {
                                          'owner': editRequestPageUsersRow?.id,
                                          'rooms': _model.listRoomRequest,
                                          'halls': _model.listHallRequest,
                                          'food': _model.listFoodRequest,
                                          'price': (functions.sumList(
                                                  _model.priceHall.toList())!) +
                                              (functions.sumList(
                                                  _model.foodPrice.toList())!) +
                                              (functions.sumList(
                                                  _model.roomPrice.toList())!),
                                          'hall_price': functions.sumList(
                                              _model.priceHall.toList()),
                                          'food_price': functions.sumList(
                                              _model.foodPrice.toList()),
                                          'room_price': functions.sumList(
                                              _model.roomPrice.toList()),
                                          'halls_original_id':
                                              _model.choosenHall,
                                          'food_original_id': _model.chosenFood,
                                          'room_original_id':
                                              _model.choosenRooms,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.request?.id,
                                        ),
                                      );
                                      await RequestsHallVarTable().update(
                                        data: {
                                          'request_id': widget.request?.id,
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
                                            widget.wrapper,
                                            ParamType.SupabaseRow,
                                          ),
                                          'lastRequest': serializeParam(
                                            widget.request,
                                            ParamType.SupabaseRow,
                                          ),
                                          'wasEdited': serializeParam(
                                            true,
                                            ParamType.bool,
                                          ),
                                          'startDate': serializeParam(
                                            widget.dayStart,
                                            ParamType.DateTime,
                                          ),
                                          'duration': serializeParam(
                                            widget.duration,
                                            ParamType.double,
                                          ),
                                          'city': serializeParam(
                                            widget.city,
                                            ParamType.SupabaseRow,
                                          ),
                                          'visitors': serializeParam(
                                            widget.visitors,
                                            ParamType.int,
                                          ),
                                          'hallFilter1': serializeParam(
                                            widget.hallFilter1,
                                            ParamType.DataStruct,
                                          ),
                                          'hallFilter2': serializeParam(
                                            widget.hallFilter2,
                                            ParamType.DataStruct,
                                          ),
                                          'hallFilter3': serializeParam(
                                            widget.hallFilter3,
                                            ParamType.DataStruct,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Сохранить',
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        43.0, 0.0, 43.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: _model.choosenHall.isNotEmpty
                                        ? FlutterFlowTheme.of(context).primary
                                        : const Color(0x662431A5),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 16.0)),
                          ),
                        ].divide(const SizedBox(height: 32.0)),
                      ),
                    ),
                  ].addToEnd(const SizedBox(height: 72.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
