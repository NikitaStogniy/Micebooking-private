import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'client_request_model.dart';
export 'client_request_model.dart';

class ClientRequestWidget extends StatefulWidget {
  const ClientRequestWidget({
    super.key,
    required this.userId,
  });

  final UsersRow? userId;

  @override
  State<ClientRequestWidget> createState() => _ClientRequestWidgetState();
}

class _ClientRequestWidgetState extends State<ClientRequestWidget> {
  late ClientRequestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientRequestModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentDate = getCurrentTimestamp;
      _model.formatedDate = functions.formatMonthYear(getCurrentTimestamp);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_model.requestOpen == false)
            FutureBuilder<List<RequestsRow>>(
              future: RequestsTable().queryRows(
                queryFn: (q) => q
                    .eq(
                      'owner',
                      valueOrDefault<int>(
                        widget!.userId?.id,
                        88,
                      ),
                    )
                    .order('created_at'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<RequestsRow> containerRequestsRowList = snapshot.data!;

                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Запросы КП',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 38,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ].divide(SizedBox(width: 24)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 90,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        '№ запроса',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 19,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Мероприятие',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Площадка',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Сумма',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 40))
                                      .addToStart(SizedBox(width: 16))
                                      .addToEnd(SizedBox(width: 16)),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final requests =
                                      containerRequestsRowList.toList();

                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(requests.length,
                                        (requestsIndex) {
                                      final requestsItem =
                                          requests[requestsIndex];
                                      return Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            valueOrDefault<int>(
                                              requestsIndex,
                                              1,
                                            ).isOdd
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 90,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                requestsItem.id.toString(),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    requestsItem.name,
                                                    'Без названия',
                                                  ),
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    requestsItem.hotelName,
                                                    'place',
                                                  ),
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      requestsItem.price,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    'price',
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 80,
                                              decoration: BoxDecoration(),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.requestOpen = true;
                                                  _model.request =
                                                      requestsItem.id;
                                                  safeSetState(() {});
                                                },
                                                child: Text(
                                                  'Открыть',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(width: 40))
                                              .addToStart(SizedBox(width: 16))
                                              .addToEnd(SizedBox(width: 16)),
                                        ),
                                      );
                                    }),
                                  );
                                },
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
          if (_model.requestOpen == true)
            FutureBuilder<List<RequestsRow>>(
              future: RequestsTable().querySingleRow(
                queryFn: (q) => q.eq(
                  'id',
                  _model.request,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<RequestsRow> containerRequestsRowList = snapshot.data!;

                final containerRequestsRow = containerRequestsRowList.isNotEmpty
                    ? containerRequestsRowList.first
                    : null;

                return Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.requestOpen = false;
                          safeSetState(() {});
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Запрос №${containerRequestsRow?.id?.toString()} в отель ${containerRequestsRow?.hotelName}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 38,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Общая информация:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  containerRequestsRow?.name,
                                  'Без названия',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                '${dateTimeFormat(
                                  "d/M/y",
                                  containerRequestsRow?.dayStart,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )}, продолжительность ${containerRequestsRow?.duration?.toString()}дн. , ${valueOrDefault<String>(
                                  functions.personsGen(containerRequestsRow
                                      ?.peopleCount
                                      ?.toDouble()),
                                  '20',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                    ),
                              ),
                            ].divide(SizedBox(width: 16)),
                          ),
                        ].divide(SizedBox(height: 16)),
                      ),
                      FutureBuilder<List<HotelRow>>(
                        future: HotelTable().querySingleRow(
                          queryFn: (q) => q.eq(
                            'id',
                            containerRequestsRow?.hotel,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
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
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FutureBuilder<List<UsersRow>>(
                                future: UsersTable().querySingleRow(
                                  queryFn: (q) => q.in_(
                                    'uid',
                                    columnHotelRow!.ownerId,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
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
                                  List<UsersRow> columnUsersRowList =
                                      snapshot.data!;

                                  final columnUsersRow =
                                      columnUsersRowList.isNotEmpty
                                          ? columnUsersRowList.first
                                          : null;

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Контакты площадки',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  fontSize: 18,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              columnUsersRow?.email,
                                              'Почта',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  fontSize: 18,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          if (columnUsersRow?.phone != null &&
                                              columnUsersRow?.phone != '')
                                            Text(
                                              valueOrDefault<String>(
                                                columnUsersRow?.phone,
                                                'Телефон',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                        ].divide(SizedBox(width: 40)),
                                      ),
                                    ].divide(SizedBox(height: 16)),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      if (containerRequestsRow?.halls?.length != 0)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Text(
                                'Залы:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Название зала',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Рассадка',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Количество дней',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 200,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Стоимость',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 8))
                                      .addToStart(SizedBox(width: 16))
                                      .addToEnd(SizedBox(width: 16)),
                                ),
                              ),
                            ),
                            FutureBuilder<List<RequestsHallVarRow>>(
                              future: RequestsHallVarTable().queryRows(
                                queryFn: (q) => q.in_(
                                  'id',
                                  containerRequestsRow!.halls,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<RequestsHallVarRow>
                                    columnRequestsHallVarRowList =
                                    snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      columnRequestsHallVarRowList.length,
                                      (columnIndex) {
                                    final columnRequestsHallVarRow =
                                        columnRequestsHallVarRowList[
                                            columnIndex];
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          columnIndex.isOdd
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  columnRequestsHallVarRow
                                                      .hallName,
                                                  'room',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  columnRequestsHallVarRow
                                                      .seating,
                                                  'Расскадка',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  columnRequestsHallVarRow.days
                                                      ?.toString(),
                                                  '1',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 200,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    columnRequestsHallVarRow
                                                        .price,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                  ),
                                                  '0',
                                                ),
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 8))
                                            .addToStart(SizedBox(width: 16))
                                            .addToEnd(SizedBox(width: 16)),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Итого:',
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 19,
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          34, 0, 16, 0),
                                      child: Text(
                                        '${formatNumber(
                                          containerRequestsRow?.hallPrice,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                        )} руб.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 19,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      if (containerRequestsRow?.food?.length != 0)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Text(
                                'Питание:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Категория питания',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Количество порций',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Количество персон',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 200,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Стоимость',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 8))
                                      .addToStart(SizedBox(width: 16))
                                      .addToEnd(SizedBox(width: 16)),
                                ),
                              ),
                            ),
                            FutureBuilder<List<RequestsFoodVarRow>>(
                              future: RequestsFoodVarTable().queryRows(
                                queryFn: (q) => q.in_(
                                  'id',
                                  containerRequestsRow!.food,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<RequestsFoodVarRow>
                                    columnRequestsFoodVarRowList =
                                    snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      columnRequestsFoodVarRowList.length,
                                      (columnIndex) {
                                    final columnRequestsFoodVarRow =
                                        columnRequestsFoodVarRowList[
                                            columnIndex];
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          columnIndex.isOdd
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  columnRequestsFoodVarRow.name,
                                                  'room',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  columnRequestsFoodVarRow.count
                                                      ?.toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  columnRequestsFoodVarRow
                                                      .personsCount
                                                      ?.toString(),
                                                  '1',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 200,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    columnRequestsFoodVarRow
                                                        .price,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                  ),
                                                  '0',
                                                ),
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 8))
                                            .addToStart(SizedBox(width: 16))
                                            .addToEnd(SizedBox(width: 16)),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Итого:',
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 19,
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          34, 0, 16, 0),
                                      child: Text(
                                        '${formatNumber(
                                          containerRequestsRow?.foodPrice,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                        )} руб.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 19,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      if (containerRequestsRow?.rooms?.length != 0)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Text(
                                'Номера:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Название зала',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Количество',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Количество дней',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 200,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Стоимость',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 19,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 8))
                                      .addToStart(SizedBox(width: 16))
                                      .addToEnd(SizedBox(width: 16)),
                                ),
                              ),
                            ),
                            FutureBuilder<List<RequestsRoomVarRow>>(
                              future: RequestsRoomVarTable().queryRows(
                                queryFn: (q) => q.in_(
                                  'id',
                                  containerRequestsRow!.rooms,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<RequestsRoomVarRow>
                                    columnRequestsRoomVarRowList =
                                    snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      columnRequestsRoomVarRowList.length,
                                      (columnIndex) {
                                    final columnRequestsRoomVarRow =
                                        columnRequestsRoomVarRowList[
                                            columnIndex];
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          columnIndex.isOdd
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  columnRequestsRoomVarRow
                                                      .roomName,
                                                  'room',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  columnRequestsRoomVarRow
                                                      .roomCount
                                                      ?.toString(),
                                                  '1',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  columnRequestsRoomVarRow.days
                                                      ?.toString(),
                                                  '1',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 200,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    columnRequestsRoomVarRow
                                                        .price,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                  ),
                                                  '0',
                                                ),
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 19,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 8))
                                            .addToStart(SizedBox(width: 16))
                                            .addToEnd(SizedBox(width: 16)),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Итого:',
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 19,
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          34, 0, 16, 0),
                                      child: Text(
                                        '${containerRequestsRow?.roomPrice?.toString()} руб.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 19,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Общий итог: ',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Text(
                              '${formatNumber(
                                containerRequestsRow?.price,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                              )} руб.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    color: Color(0xFF2431A5),
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 8))
                            .addToStart(SizedBox(width: 16))
                            .addToEnd(SizedBox(width: 16)),
                      ),
                    ].divide(SizedBox(height: 40)),
                  ),
                );
              },
            ),
        ]
            .divide(SizedBox(height: 22))
            .addToStart(SizedBox(height: 20))
            .addToEnd(SizedBox(height: 72)),
      ),
    );
  }
}
