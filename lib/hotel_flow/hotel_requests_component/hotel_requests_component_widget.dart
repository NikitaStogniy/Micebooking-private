import '/backend/supabase/supabase.dart';
import '/empty_states/hotel_request_emprty/hotel_request_emprty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'hotel_requests_component_model.dart';
export 'hotel_requests_component_model.dart';

class HotelRequestsComponentWidget extends StatefulWidget {
  const HotelRequestsComponentWidget({
    super.key,
    required this.hotels,
    required this.openRequest,
    required this.openAllRequests,
  });

  final HotelRow? hotels;
  final Future Function(RequestsRow? request)? openRequest;
  final Future Function()? openAllRequests;

  @override
  State<HotelRequestsComponentWidget> createState() =>
      _HotelRequestsComponentWidgetState();
}

class _HotelRequestsComponentWidgetState
    extends State<HotelRequestsComponentWidget> {
  late HotelRequestsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotelRequestsComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RequestsRow>>(
      future: RequestsTable().queryRows(
        queryFn: (q) => q
            .eq(
              'hotel',
              widget!.hotels?.id,
            )
            .order('id'),
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

        return Container(
          decoration: BoxDecoration(),
          child: Visibility(
            visible: containerRequestsRowList.length > 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget!.hotels?.name,
                          'Оталь',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              fontSize: 38,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 24)),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (containerRequestsRowList.length > 5)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (_model.showMore) {
                                _model.showMore = false;
                                setState(() {});
                              }
                            },
                            child: Text(
                              'Последние 5 запросов',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    color: _model.showMore == false
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context).primary,
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
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
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (containerRequestsRowList.length > 0)
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 40,
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
                                  width: 80,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    'В работе',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 80,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      '№ запроса',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Дата запроса',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.233,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Организация',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Дата начала',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.233,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Прод.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.233,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Сумма',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.233,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.233,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Мероприятие прошло?',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(width: 20))
                                  .addToStart(SizedBox(width: 16))
                                  .addToEnd(SizedBox(width: 16)),
                            ),
                          ),
                        Builder(
                          builder: (context) {
                            final requests = containerRequestsRowList.toList();
                            if (requests.isEmpty) {
                              return HotelRequestEmprtyWidget();
                            }

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(requests.length,
                                  (requestsIndex) {
                                final requestsItem = requests[requestsIndex];
                                return Visibility(
                                  visible: requestsIndex < 5,
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        requestsIndex.isOdd
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
                                          width: 80,
                                          decoration: BoxDecoration(),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              child: Checkbox(
                                                value: _model.checkboxValueMap1[
                                                        requestsItem] ??=
                                                    requestsItem.inProgress ==
                                                        true,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkboxValueMap1[
                                                              requestsItem] =
                                                          newValue!);
                                                  if (newValue!) {
                                                    await RequestsTable()
                                                        .update(
                                                      data: {
                                                        'inProgress': true,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        requestsItem.id,
                                                      ),
                                                    );
                                                    _model.rebuilder = 200703;
                                                    setState(() {});
                                                  } else {
                                                    await RequestsTable()
                                                        .update(
                                                      data: {
                                                        'inProgress': false,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        requestsItem.id,
                                                      ),
                                                    );
                                                    _model.rebuilder = 200703;
                                                    setState(() {});
                                                  }
                                                },
                                                side: BorderSide(
                                                  width: 2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 80,
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              requestsItem.id.toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 100,
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                  "d/M/y",
                                                  requestsItem.createdAt,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Ошибка',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.233,
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              valueOrDefault<String>(
                                                requestsItem.clientNetwork,
                                                'Компания',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                  "d/M/y",
                                                  requestsItem.dayStart,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Ошибка',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.233,
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              valueOrDefault<String>(
                                                functions.daysGen(
                                                    valueOrDefault<double>(
                                                  requestsItem.duration,
                                                  2.0,
                                                )),
                                                'Ошибка',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.233,
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
                                                'Ошибка',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.233,
                                            decoration: BoxDecoration(),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await widget.openRequest?.call(
                                                  requestsItem,
                                                );
                                              },
                                              child: Text(
                                                'Открыть',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.233,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value:
                                                      _model.checkboxValueMap2[
                                                              requestsItem] ??=
                                                          requestsItem
                                                                  .complete ==
                                                              true,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.checkboxValueMap2[
                                                                requestsItem] =
                                                            newValue!);
                                                    if (newValue!) {
                                                      await RequestsTable()
                                                          .update(
                                                        data: {
                                                          'Complete': true,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id',
                                                          requestsItem.id,
                                                        ),
                                                      );
                                                    } else {
                                                      await RequestsTable()
                                                          .update(
                                                        data: {
                                                          'Complete': false,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id',
                                                          requestsItem.id,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  side: BorderSide(
                                                    width: 2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 20))
                                          .addToStart(SizedBox(width: 16))
                                          .addToEnd(SizedBox(width: 16)),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (containerRequestsRowList.length > 5)
                  FFButtonWidget(
                    onPressed: () async {
                      await widget.openAllRequests?.call();
                    },
                    text: _model.showMore ? 'Скрыть' : 'Показать все',
                    options: FFButtonOptions(
                      width: 300,
                      height: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Commissioner',
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 0,
                              ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
              ].divide(SizedBox(height: 22)),
            ),
          ),
        );
      },
    );
  }
}
