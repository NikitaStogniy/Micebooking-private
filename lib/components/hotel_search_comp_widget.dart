import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/calendar_row_widget.dart';
import '/components/city_drop_down_widget.dart';
import '/components/days_count_widget.dart';
import '/components/visitors_count_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'hotel_search_comp_model.dart';
export 'hotel_search_comp_model.dart';

class HotelSearchCompWidget extends StatefulWidget {
  const HotelSearchCompWidget({
    super.key,
    required this.onSearch,
    required this.date,
    double? duration,
    this.ciry,
    int? visitors,
    this.hallFilter1,
    this.hallFilter2,
    this.hallFilter3,
    bool? home,
  })  : duration = duration ?? 0.0,
        visitors = visitors ?? 0,
        home = home ?? false;

  final Future Function(
      DateTime? date,
      double? duration,
      CityRow? city,
      int? visitors,
      List<EnumSeating>? seatings,
      HotelSeatingStruct? hallFilter1,
      HotelSeatingStruct? hallFilter2,
      HotelSeatingStruct? hallFilter3)? onSearch;
  final DateTime? date;
  final double duration;
  final CityRow? ciry;
  final int visitors;
  final HotelSeatingStruct? hallFilter1;
  final HotelSeatingStruct? hallFilter2;
  final HotelSeatingStruct? hallFilter3;
  final bool home;

  @override
  State<HotelSearchCompWidget> createState() => _HotelSearchCompWidgetState();
}

class _HotelSearchCompWidgetState extends State<HotelSearchCompWidget> {
  late HotelSearchCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotelSearchCompModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.startDate = widget.date;
      _model.visitors = widget.visitors;
      _model.city = widget.ciry;
      _model.duration = widget.duration;
      _model.hallFilter1 = widget.hallFilter1;
      _model.hallFilter2 = widget.hallFilter2;
      _model.hallFilter3 = widget.hallFilter3;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        height: 58.0,
        constraints: const BoxConstraints(
          maxWidth: 1250.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: 459.0,
                          child: CalendarRowWidget(
                            onClick: (selectedDate) async {
                              _model.startDate = selectedDate;
                              setState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/Calendar.svg',
                                width: 32.0,
                                height: 32.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Дата начала',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  dateTimeFormat(
                                    'd/M/y',
                                    _model.startDate,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ].divide(const SizedBox(width: 16.0)),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            Expanded(
              flex: 2,
              child: Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showAlignedDialog(
                      context: context,
                      isGlobal: false,
                      avoidOverflow: true,
                      targetAnchor: const AlignmentDirectional(0.0, 2.5)
                          .resolve(Directionality.of(context)),
                      followerAnchor: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      builder: (dialogContext) {
                        return Material(
                          color: Colors.transparent,
                          child: DaysCountWidget(
                            count: _model.duration!,
                            onAdd: () async {
                              _model.duration = _model.duration! + 0.5;
                              setState(() {});
                            },
                            onRemove: () async {
                              if (_model.duration! >= 1.0) {
                                _model.duration = _model.duration! + -0.5;
                                setState(() {});
                              }
                            },
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/Duration.svg',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Длительность',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      functions.daysGen(_model.duration),
                                      '0 дней',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            Expanded(
              flex: 2,
              child: Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showAlignedDialog(
                      context: context,
                      isGlobal: false,
                      avoidOverflow: true,
                      targetAnchor: const AlignmentDirectional(0.0, 2.5)
                          .resolve(Directionality.of(context)),
                      followerAnchor: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      builder: (dialogContext) {
                        return Material(
                          color: Colors.transparent,
                          child: CityDropDownWidget(
                            cityChoosen: (item) async {
                              _model.city = item;
                              setState(() {});
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    width: 230.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/Place.svg',
                                    width: 32.0,
                                    height: 32.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Город',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        _model.city?.name,
                                        'Выбрать город',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            Expanded(
              flex: 2,
              child: Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showAlignedDialog(
                      context: context,
                      isGlobal: false,
                      avoidOverflow: true,
                      targetAnchor: const AlignmentDirectional(0.0, 3.0)
                          .resolve(Directionality.of(context)),
                      followerAnchor: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      builder: (dialogContext) {
                        return Material(
                          color: Colors.transparent,
                          child: VisitorsCountWidget(
                            count: _model.visitors!,
                            filter1: _model.hallFilter1,
                            filter2: _model.hallFilter2,
                            filter3: _model.hallFilter3,
                            onAdd: () async {
                              _model.visitors = _model.visitors! + 1;
                              setState(() {});
                            },
                            onRemove: () async {
                              if (_model.visitors != 0) {
                                _model.visitors = _model.visitors! + -1;
                                setState(() {});
                              }
                            },
                            onChange: (visitors, seatings) async {
                              _model.addToSeating(seatings!);
                              setState(() {});
                            },
                            createHallFilter: (filter, index) async {
                              if (index == 0) {
                                _model.hallFilter1 = filter;
                                setState(() {});
                              } else {
                                if (index == 1) {
                                  _model.hallFilter2 = filter;
                                  setState(() {});
                                } else {
                                  if (index == 2) {
                                    _model.hallFilter3 = filter;
                                    setState(() {});
                                  }
                                }
                              }
                            },
                            onType: (visitors) async {
                              _model.visitors = visitors;
                              setState(() {});
                            },
                            deleteFilter: (index) async {
                              if (index == 0) {
                                _model.hallFilter1 = null;
                                setState(() {});
                              } else {
                                if (index == 1) {
                                  _model.hallFilter2 = null;
                                  setState(() {});
                                } else {
                                  if (index == 2) {
                                    _model.hallFilter3 = null;
                                    setState(() {});
                                  }
                                }
                              }
                            },
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/Person.svg',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Участники',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          _model.visitors?.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if ((_model.duration! > 0.0) &&
                        (_model.city != null) &&
                        (_model.visitors! > 0) &&
                        (_model.startDate != null)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Сервис временно недоступен. Мы сообщим о начале работы на Вашу почту',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 16.0,
                            ),
                          ),
                          duration: const Duration(milliseconds: 40000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Поля не заполненны'),
                            content: const Text('Сначала заполните поля'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 32.0,
                      ),
                      Text(
                        widget.home == true ? 'НАЙТИ' : 'ОБНОВИТЬ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ].divide(const SizedBox(width: 8.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
