import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/menu/menu_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'request_model.dart';
export 'request_model.dart';

class RequestWidget extends StatefulWidget {
  const RequestWidget({
    super.key,
    required this.requestWrapper,
    required this.lastRequest,
    bool? wasEdited,
    required this.startDate,
    required this.duration,
    required this.city,
    required this.visitors,
    this.hallFilter1,
    required this.hallFilter2,
    this.hallFilter3,
  }) : wasEdited = wasEdited ?? false;

  final RequestWrapperRow? requestWrapper;
  final RequestsRow? lastRequest;
  final bool wasEdited;
  final DateTime? startDate;
  final double? duration;
  final CityRow? city;
  final int? visitors;
  final HotelSeatingStruct? hallFilter1;
  final HotelSeatingStruct? hallFilter2;
  final HotelSeatingStruct? hallFilter3;

  @override
  State<RequestWidget> createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {
  late RequestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.wasEdited) {
        _model.step = 1;
        _model.requestName = widget.lastRequest!.name!;
        _model.requestId =
            widget.requestWrapper!.requestsId.toList().cast<int>();
        setState(() {});
      } else {
        _model.step = 0;
        _model.requestId =
            widget.requestWrapper!.requestsId.toList().cast<int>();
        _model.wrapperId = widget.requestWrapper?.id;
        setState(() {});
      }
    });

    _model.eventNamTextController ??= TextEditingController();
    _model.eventNamFocusNode ??= FocusNode();

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
            backgroundColor: const Color(0xFFF9F9F9),
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
        List<UsersRow> requestUsersRowList = snapshot.data!;

        final requestUsersRow =
            requestUsersRowList.isNotEmpty ? requestUsersRowList.first : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF9F9F9),
            body: Container(
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                              page: 'home',
                              clientProfile: () async {},
                              clientRequest: () async {},
                              clientFavorite: () async {},
                              searchAction: () async {},
                            ),
                          ),
                        ),
                      ),
                    if (_model.step == 0)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 1250.0,
                          ),
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Введите название вашего мероприятия: ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 60.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(999.0),
                                        ),
                                        child: TextFormField(
                                          controller:
                                              _model.eventNamTextController,
                                          focusNode: _model.eventNamFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.eventNamTextController',
                                            const Duration(milliseconds: 100),
                                            () => setState(() {}),
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Название мероприятия',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 15.0, 30.0, 15.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                              ),
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .eventNamTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        await RequestWrapperTable().delete(
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.requestWrapper?.id,
                                          ),
                                        );
                                        await RequestsTable().delete(
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.lastRequest?.id,
                                          ),
                                        );
                                        context.safePop();
                                      },
                                      text: 'Назад',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFFF0F0FA),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(99.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.request =
                                            await RequestWrapperTable().update(
                                          data: {
                                            'name': _model
                                                .eventNamTextController.text,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.requestWrapper?.id,
                                          ),
                                          returnRows: true,
                                        );
                                        await RequestsTable().update(
                                          data: {
                                            'name': _model
                                                .eventNamTextController.text,
                                          },
                                          matchingRows: (rows) => rows.in_(
                                            'id',
                                            widget.requestWrapper!.requestsId,
                                          ),
                                        );
                                        _model.requestName =
                                            _model.eventNamTextController.text;
                                        setState(() {});
                                        _model.step = _model.step + 1;
                                        setState(() {});

                                        setState(() {});
                                      },
                                      text: 'Далее',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: _model.eventNamTextController
                                                        .text ==
                                                    ''
                                            ? const Color(0xFFCCCCCC)
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(99.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (_model.step == 1)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 1250.0,
                          ),
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ваш запрос: ${_model.requestName != '' ? _model.requestName : widget.lastRequest?.name}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Отель',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 34.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Площадки',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 34.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Питание',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 34.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Проживание',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 34.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 40.0)),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: FutureBuilder<List<RequestsRow>>(
                                    future: RequestsTable().queryRows(
                                      queryFn: (q) => q.in_(
                                        'id',
                                        widget.requestWrapper!.requestsId,
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
                                      List<RequestsRow> columnRequestsRowList =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            columnRequestsRowList.length,
                                            (columnIndex) {
                                          final columnRequestsRow =
                                              columnRequestsRowList[
                                                  columnIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 40.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: FutureBuilder<
                                                          List<HotelRow>>(
                                                        future: HotelTable()
                                                            .querySingleRow(
                                                          queryFn: (q) => q.eq(
                                                            'id',
                                                            columnRequestsRow
                                                                .hotel,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<HotelRow>
                                                              columnHotelRowList =
                                                              snapshot.data!;

                                                          final columnHotelRow =
                                                              columnHotelRowList
                                                                      .isNotEmpty
                                                                  ? columnHotelRowList
                                                                      .first
                                                                  : null;

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnHotelRow
                                                                      ?.name,
                                                                  'Название отеля',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Commissioner',
                                                                      fontSize:
                                                                          24.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: FutureBuilder<
                                                          List<
                                                              RequestsHallVarRow>>(
                                                        future:
                                                            RequestsHallVarTable()
                                                                .queryRows(
                                                          queryFn: (q) => q.in_(
                                                            'id',
                                                            columnRequestsRow
                                                                .halls,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                              columnRequestsHallVarRowList =
                                                              snapshot.data!;

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: List.generate(
                                                                columnRequestsHallVarRowList
                                                                    .length,
                                                                (columnIndex) {
                                                              final columnRequestsHallVarRow =
                                                                  columnRequestsHallVarRowList[
                                                                      columnIndex];
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        '${columnRequestsHallVarRow.hallName}: ${valueOrDefault<String>(
                                                                          functions
                                                                              .daysGen(columnRequestsHallVarRow.days),
                                                                          '0',
                                                                        )} / ${formatNumber(
                                                                          columnRequestsHallVarRow
                                                                              .price,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.automatic,
                                                                        )}₽, ${valueOrDefault<String>(
                                                                          columnRequestsHallVarRow
                                                                              .seating,
                                                                          'u-shape',
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Commissioner',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: FutureBuilder<
                                                          List<
                                                              RequestsFoodVarRow>>(
                                                        future:
                                                            RequestsFoodVarTable()
                                                                .queryRows(
                                                          queryFn: (q) => q.in_(
                                                            'id',
                                                            columnRequestsRow
                                                                .food,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                              columnRequestsFoodVarRowList =
                                                              snapshot.data!;

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: List.generate(
                                                                columnRequestsFoodVarRowList
                                                                    .length,
                                                                (columnIndex) {
                                                              final columnRequestsFoodVarRow =
                                                                  columnRequestsFoodVarRowList[
                                                                      columnIndex];
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        '${columnRequestsFoodVarRow.name}: ${functions.countGen(columnRequestsFoodVarRow.count)}, ${functions.personsGen(columnRequestsFoodVarRow.personsCount?.toDouble())} - ${formatNumber(
                                                                          columnRequestsFoodVarRow
                                                                              .price,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.automatic,
                                                                        )}₽',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Commissioner',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<
                                                              List<
                                                                  RequestsRoomVarRow>>(
                                                            future:
                                                                RequestsRoomVarTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.in_(
                                                                'id',
                                                                columnRequestsRow
                                                                    .rooms,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
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
                                                              List<RequestsRoomVarRow>
                                                                  columnRequestsRoomVarRowList =
                                                                  snapshot
                                                                      .data!;

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List.generate(
                                                                    columnRequestsRoomVarRowList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnRequestsRoomVarRow =
                                                                      columnRequestsRoomVarRowList[
                                                                          columnIndex];
                                                                  return Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            '${columnRequestsRoomVarRow.roomName}: ${columnRequestsRoomVarRow.roomCount?.toString()} / ${functions.daysGen(columnRequestsRoomVarRow.days?.toDouble())} - ${formatNumber(
                                                                              columnRequestsRoomVarRow.price,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.automatic,
                                                                            )}₽',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Commissioner',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 40.0)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Итого: ${formatNumber(
                                                          columnRequestsRow
                                                              .price,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .automatic,
                                                        )}',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Commissioner',
                                                              fontSize: 30.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    80.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (Navigator.of(
                                                                        context)
                                                                    .canPop()) {
                                                                  context.pop();
                                                                }
                                                                context
                                                                    .pushNamed(
                                                                  'EditRequestPage',
                                                                  queryParameters:
                                                                      {
                                                                    'hotel':
                                                                        serializeParam(
                                                                      columnRequestsRow
                                                                          .hotel,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'request':
                                                                        serializeParam(
                                                                      columnRequestsRow,
                                                                      ParamType
                                                                          .SupabaseRow,
                                                                    ),
                                                                    'hallRequests':
                                                                        serializeParam(
                                                                      columnRequestsRow
                                                                          .halls,
                                                                      ParamType
                                                                          .int,
                                                                      isList:
                                                                          true,
                                                                    ),
                                                                    'hotelName':
                                                                        serializeParam(
                                                                      columnRequestsRow
                                                                          .hotelName,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'wrapper':
                                                                        serializeParam(
                                                                      widget
                                                                          .requestWrapper,
                                                                      ParamType
                                                                          .SupabaseRow,
                                                                    ),
                                                                    'chosenHalls':
                                                                        serializeParam(
                                                                      columnRequestsRow
                                                                          .hallsOriginalId,
                                                                      ParamType
                                                                          .int,
                                                                      isList:
                                                                          true,
                                                                    ),
                                                                    'foodRequests':
                                                                        serializeParam(
                                                                      columnRequestsRow
                                                                          .food,
                                                                      ParamType
                                                                          .int,
                                                                      isList:
                                                                          true,
                                                                    ),
                                                                    'chosenFood':
                                                                        serializeParam(
                                                                      columnRequestsRow
                                                                          .foodOriginalId,
                                                                      ParamType
                                                                          .int,
                                                                      isList:
                                                                          true,
                                                                    ),
                                                                    'roomRequests':
                                                                        serializeParam(
                                                                      columnRequestsRow
                                                                          .rooms,
                                                                      ParamType
                                                                          .int,
                                                                      isList:
                                                                          true,
                                                                    ),
                                                                    'chosenRoom':
                                                                        serializeParam(
                                                                      columnRequestsRow
                                                                          .roomOriginalId,
                                                                      ParamType
                                                                          .int,
                                                                      isList:
                                                                          true,
                                                                    ),
                                                                    'dayStart':
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
                                                                    'visitors':
                                                                        serializeParam(
                                                                      widget
                                                                          .visitors,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'city':
                                                                        serializeParam(
                                                                      widget
                                                                          .city,
                                                                      ParamType
                                                                          .SupabaseRow,
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
                                                              },
                                                              text:
                                                                  'Редактировать',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 200.0,
                                                                height: 40.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
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
                                                                            99.0),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  _model.removeFromRequestId(
                                                                      columnRequestsRow
                                                                          .id);
                                                                  setState(
                                                                      () {});
                                                                  if (_model
                                                                          .requestId.isEmpty) {
                                                                    await RequestsTable()
                                                                        .delete(
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eq(
                                                                        'id',
                                                                        columnRequestsRow
                                                                            .id,
                                                                      ),
                                                                    );

                                                                    context
                                                                        .pushNamed(
                                                                      'HotelSearchPage',
                                                                      queryParameters:
                                                                          {
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
                                                                        'user':
                                                                            serializeParam(
                                                                          requestUsersRow,
                                                                          ParamType
                                                                              .SupabaseRow,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  } else {
                                                                    await RequestsTable()
                                                                        .delete(
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eq(
                                                                        'id',
                                                                        columnRequestsRow
                                                                            .id,
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                                text: 'Удалить',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 200.0,
                                                                  height: 40.0,
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
                                                                  color: const Color(
                                                                      0x1BBE3030),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Commissioner',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              99.0),
                                                                ),
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
                                        }).divide(const SizedBox(height: 20.0)),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        await RequestWrapperTable().delete(
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.requestWrapper?.id,
                                          ),
                                        );
                                        await RequestsTable().delete(
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.lastRequest?.id,
                                          ),
                                        );
                                        context.safePop();
                                      },
                                      text: 'Назад',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFFF0F0FA),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(99.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.apiResultows =
                                            await SendemailCall.call(
                                          requestWrapper: _model.wrapperId,
                                        );

                                        if ((_model.apiResultows?.succeeded ??
                                            true)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Ваш запрос отправлен по адресу ${requestUsersRow?.email}',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Ошибка отправки запроса на почту, попробуйте ещё раз-',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    (_model.apiResultows
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.request_wrapper''',
                                                  )?.toString(),
                                                  'error',
                                                ),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }

                                        setState(() {});
                                      },
                                      text: 'Все верно, отправить КП на почту!',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(99.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
