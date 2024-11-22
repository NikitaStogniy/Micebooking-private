import '/backend/supabase/supabase.dart';
import '/components/calendar_element_u_i_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_seasons_model.dart';
export 'calendar_seasons_model.dart';

class CalendarSeasonsWidget extends StatefulWidget {
  const CalendarSeasonsWidget({
    super.key,
    required this.month,
    this.dayStart,
    this.dayEnd,
    required this.setDate,
    this.currentSeason,
    required this.hotel,
    required this.seasonId,
    bool? main,
  }) : this.main = main ?? false;

  final DateTime? month;
  final DateTime? dayStart;
  final DateTime? dayEnd;
  final Future Function(DateTime? dayStart, DateTime? dayEnd)? setDate;
  final RoomSeasonsRow? currentSeason;
  final int? hotel;
  final int? seasonId;
  final bool main;

  @override
  State<CalendarSeasonsWidget> createState() => _CalendarSeasonsWidgetState();
}

class _CalendarSeasonsWidgetState extends State<CalendarSeasonsWidget> {
  late CalendarSeasonsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarSeasonsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentMouth =
          widget!.dayStart != null ? widget!.dayStart : getCurrentTimestamp;
      _model.dayStart = widget!.dayStart != null ? widget!.dayStart : null;
      _model.dayEnd = widget!.dayEnd != null ? widget!.dayEnd : null;
      safeSetState(() {});
      _model.allElemnts = await RoomSeasonElementTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'hotel_id',
              widget!.hotel,
            )
            .neqOrNull(
              'season_id',
              widget!.seasonId,
            )
            .eqOrNull(
              'main',
              widget!.main,
            ),
      );
      _model.disabledDates = functions
          .getDisabledDates(
              _model.allElemnts!
                  .map((e) => e.dayStart)
                  .withoutNulls
                  .toList()
                  .toList(),
              _model.allElemnts!
                  .map((e) => e.dayEnd)
                  .withoutNulls
                  .toList()
                  .toList())
          .toList()
          .cast<DateTime>();
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
    return Container(
      constraints: BoxConstraints(
        maxWidth: 360.0,
        maxHeight: 500.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 24.0,
            color: Color(0x13000000),
            offset: Offset(
              0.0,
              12.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 32.0,
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 16.0,
                    ),
                    onPressed: () async {
                      _model.currentMouth =
                          functions.monthModify(_model.currentMouth, -1);
                      safeSetState(() {});
                    },
                  ),
                  Text(
                    functions.formatMonthYear(_model.currentMouth!),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Commissioner',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 32.0,
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 16.0,
                    ),
                    onPressed: () async {
                      _model.currentMouth =
                          functions.monthModify(_model.currentMouth, 1);
                      safeSetState(() {});
                    },
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ),
            Divider(
              thickness: 1.0,
              color: Color(0xFFF2F1FF),
            ),
            Container(
              height: 40.0,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 36.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'ПН',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF9291A5),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 36.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'ВТ',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF9291A5),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 36.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'СР',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF9291A5),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 36.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'ЧТ',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF9291A5),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 36.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'ПТ',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF9291A5),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 36.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'СБ',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF9291A5),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 36.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'ВС',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF9291A5),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Builder(
                builder: (context) {
                  final daysGen = functions
                          .calendarGenerator(_model.currentMouth)
                          ?.toList() ??
                      [];

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 4.0,
                      childAspectRatio: 1.0,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: daysGen.length,
                    itemBuilder: (context, daysGenIndex) {
                      final daysGenItem = daysGen[daysGenIndex];
                      return Visibility(
                        visible:
                            !(((functions.getDayOfMonth(daysGenItem) < 11) &&
                                    (daysGenIndex > 21)) ||
                                ((functions.getDayOfMonth(daysGenItem) > 20) &&
                                    (daysGenIndex < 7))),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.disabledDates.contains(daysGenItem)) {
                              return;
                            }

                            if (_model.dayStart != null) {
                              if (_model.dayStart == daysGenItem) {
                                _model.dayStart = _model.dayEnd;
                                _model.dayEnd = null;
                                safeSetState(() {});
                                return;
                              } else {
                                if (_model.dayEnd == daysGenItem) {
                                  _model.dayEnd = null;
                                  safeSetState(() {});
                                  return;
                                } else {
                                  if (_model.dayStart! < daysGenItem) {
                                    // создаем список дат с текущими параметрами
                                    _model.dateRange = functions
                                        .getDatesRange(
                                            _model.dayStart!, daysGenItem)
                                        .toList()
                                        .cast<DateTime>();
                                    safeSetState(() {});
                                    if (functions.checkForCommonElements(
                                        _model.disabledDates.toList(),
                                        _model.dateRange.toList())) {
                                      // не содержит, создаем последний день
                                      _model.dayEnd = daysGenItem;
                                      safeSetState(() {});
                                    } else {
                                      // содержит, проверка окончена
                                      _model.dateRange = [];
                                      safeSetState(() {});
                                      // алерт об ошибке
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Даты сезона пересекаются с другим сезоном. Пожалуйлста, измените даты',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                      return;
                                    }
                                  } else {
                                    // создаем список дат с текущими параметрами
                                    _model.dateRange = functions
                                        .getDatesRange(
                                            daysGenItem, _model.dayStart!)
                                        .toList()
                                        .cast<DateTime>();
                                    safeSetState(() {});
                                    if (functions.checkForCommonElements(
                                        _model.disabledDates.toList(),
                                        _model.dateRange.toList())) {
                                      _model.dayEnd = _model.dayStart;
                                      _model.dayStart = daysGenItem;
                                      safeSetState(() {});
                                    } else {
                                      _model.dateRange = [];
                                      safeSetState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Даты сезона пересекаются с другим сезоном. Пожалуйлста, измените даты',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                      return;
                                    }
                                  }
                                }
                              }
                            } else {
                              if (_model.dayEnd == daysGenItem) {
                                _model.dayEnd = null;
                                safeSetState(() {});
                                return;
                              } else {
                                // создаем 1 день
                                _model.dayStart = daysGenItem;
                                safeSetState(() {});
                              }
                            }

                            await widget.setDate?.call(
                              _model.dayStart,
                              _model.dayEnd,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: () {
                                if (_model.disabledDates
                                    .contains(daysGenItem)) {
                                  return FlutterFlowTheme.of(context)
                                      .disabledButtonColor;
                                } else if ((_model.dayStart == null) ||
                                    (_model.dayEnd == null)) {
                                  return Colors.transparent;
                                } else if ((daysGenItem >= _model.dayStart!) &&
                                    (daysGenItem <= _model.dayEnd!) &&
                                    !_model.disabledDates
                                        .contains(daysGenItem)) {
                                  return Color(0xFFF0F0FA);
                                } else {
                                  return Colors.transparent;
                                }
                              }(),
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(valueOrDefault<double>(
                                  _model.dayStart == daysGenItem ? 40.0 : 0.0,
                                  0.0,
                                )),
                                bottomRight:
                                    Radius.circular(valueOrDefault<double>(
                                  _model.dayEnd == daysGenItem ? 40.0 : 0.0,
                                  0.0,
                                )),
                                topLeft: Radius.circular(valueOrDefault<double>(
                                  _model.dayStart == daysGenItem ? 40.0 : 0.0,
                                  0.0,
                                )),
                                topRight:
                                    Radius.circular(valueOrDefault<double>(
                                  _model.dayEnd == daysGenItem ? 40.0 : 0.0,
                                  0.0,
                                )),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: () {
                                  if ((_model.dayStart == null) &&
                                      (_model.dayEnd == null)) {
                                    return Colors.transparent;
                                  } else if ((_model.dayStart == daysGenItem) ||
                                      (_model.dayEnd == daysGenItem)) {
                                    return FlutterFlowTheme.of(context).primary;
                                  } else {
                                    return Colors.transparent;
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              child: wrapWithModel(
                                model: _model.calendarElementUIModels.getModel(
                                  daysGenItem.toString(),
                                  daysGenIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: CalendarElementUIWidget(
                                  key: Key(
                                    'Key86g_${daysGenItem.toString()}',
                                  ),
                                  text: dateTimeFormat(
                                    "d",
                                    daysGenItem,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  dayStart: _model.dayStart,
                                  dayEnd: _model.dayEnd,
                                  currentDate: daysGenItem,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ].addToStart(SizedBox(height: 30.0)).addToEnd(SizedBox(height: 30.0)),
        ),
      ),
    );
  }
}
