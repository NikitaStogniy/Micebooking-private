import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/client_seating_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hall_filter_model.dart';
export 'hall_filter_model.dart';

class HallFilterWidget extends StatefulWidget {
  const HallFilterWidget({
    super.key,
    this.maxCapacity,
    this.hallfilter1,
    this.hallfilter2,
    this.hallfilter3,
    required this.confirmFilters,
    required this.visitors,
    int? minCapacity,
  }) : this.minCapacity = minCapacity ?? 1;

  final int? maxCapacity;
  final HotelSeatingStruct? hallfilter1;
  final HotelSeatingStruct? hallfilter2;
  final HotelSeatingStruct? hallfilter3;
  final Future Function(
      int? minCapacity,
      HotelSeatingStruct? firstSeating,
      HotelSeatingStruct? secondSeating,
      HotelSeatingStruct? thirdSeating,
      int? maxCapacity)? confirmFilters;
  final int? visitors;
  final int minCapacity;

  @override
  State<HallFilterWidget> createState() => _HallFilterWidgetState();
}

class _HallFilterWidgetState extends State<HallFilterWidget> {
  late HallFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HallFilterModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToHidenSeatings(widget!.hallfilter1 != null
          ? widget!.hallfilter1!
          : HotelSeatingStruct(
              type: EnumSeating.theatre,
              count: 0,
            ));
      safeSetState(() {});
      _model.addToHidenSeatings(widget!.hallfilter2 != null
          ? widget!.hallfilter2!
          : HotelSeatingStruct(
              type: EnumSeating.theatre,
              count: 0,
            ));
      safeSetState(() {});
      _model.addToHidenSeatings(widget!.hallfilter3 != null
          ? widget!.hallfilter3!
          : HotelSeatingStruct(
              type: EnumSeating.theatre,
              count: 0,
            ));
      safeSetState(() {});
      _model.addToSeatings(widget!.hallfilter1!);
      safeSetState(() {});
      _model.addToSeatings(widget!.hallfilter2!);
      safeSetState(() {});
      _model.addToSeatings(widget!.hallfilter3!);
      safeSetState(() {});
    });

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: true);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height * 0.3,
          maxWidth: 400.0,
          maxHeight: MediaQuery.sizeOf(context).height * 0.9,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFF0F0FA),
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Container(
                              width: double.infinity,
                              color: Color(0x00000000),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController1,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Вместимость',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: Color(0xB714181B),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Меньше 10 человек',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
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
                                                      if ((_model.maxCapacity ==
                                                              10) &&
                                                          (_model.minCapacity ==
                                                              1)) {
                                                        _model.maxCapacity =
                                                            100000;
                                                        _model.minCapacity = 1;
                                                        safeSetState(() {});
                                                      } else {
                                                        _model.maxCapacity = 10;
                                                        _model.minCapacity = 1;
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 24.0,
                                                        maxHeight: 24.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          () {
                                                            if ((_model.maxCapacity ==
                                                                    10) &&
                                                                (_model.minCapacity ==
                                                                    1)) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary;
                                                            } else if (_model
                                                                .mouseRegionHovered1!) {
                                                              return Color(
                                                                  0x912431A5);
                                                            } else {
                                                              return Color(
                                                                  0x00000000);
                                                            }
                                                          }(),
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        border: Border.all(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (_model.maxCapacity ==
                                                                        10) &&
                                                                    (_model.minCapacity ==
                                                                        1)
                                                                ? Color(
                                                                    0x00000000)
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                          ),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: MouseRegion(
                                                        opaque: false,
                                                        cursor:
                                                            SystemMouseCursors
                                                                    .click ??
                                                                MouseCursor
                                                                    .defer,
                                                        child: Visibility(
                                                          visible:
                                                              ((_model.maxCapacity ==
                                                                          10) &&
                                                                      (_model.minCapacity ==
                                                                          1)) ==
                                                                  true,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                        onEnter:
                                                            ((event) async {
                                                          safeSetState(() =>
                                                              _model.mouseRegionHovered1 =
                                                                  true);
                                                        }),
                                                        onExit: ((event) async {
                                                          safeSetState(() =>
                                                              _model.mouseRegionHovered1 =
                                                                  false);
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '10 - 30 человек',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if ((_model.maxCapacity ==
                                                        30) &&
                                                    (_model.minCapacity ==
                                                        10)) {
                                                  _model.maxCapacity = 100000;
                                                  _model.minCapacity = 1;
                                                  safeSetState(() {});
                                                } else {
                                                  _model.maxCapacity = 30;
                                                  _model.minCapacity = 10;
                                                  safeSetState(() {});
                                                }
                                              },
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                constraints: BoxConstraints(
                                                  maxWidth: 24.0,
                                                  maxHeight: 24.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if ((_model.maxCapacity ==
                                                              30) &&
                                                          (_model.minCapacity ==
                                                              10)) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primary;
                                                      } else if (_model
                                                          .mouseRegionHovered2!) {
                                                        return Color(
                                                            0x912431A5);
                                                      } else {
                                                        return Color(
                                                            0x00000000);
                                                      }
                                                    }(),
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  border: Border.all(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      (_model.maxCapacity ==
                                                                  30) &&
                                                              (_model.minCapacity ==
                                                                  10)
                                                          ? Color(0x00000000)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                    ),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: MouseRegion(
                                                  opaque: false,
                                                  cursor: SystemMouseCursors
                                                          .click ??
                                                      MouseCursor.defer,
                                                  child: Visibility(
                                                    visible: ((_model
                                                                    .maxCapacity ==
                                                                30) &&
                                                            (_model.minCapacity ==
                                                                10)) ==
                                                        true,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.check_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  onEnter: ((event) async {
                                                    safeSetState(() => _model
                                                            .mouseRegionHovered2 =
                                                        true);
                                                  }),
                                                  onExit: ((event) async {
                                                    safeSetState(() => _model
                                                            .mouseRegionHovered2 =
                                                        false);
                                                  }),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '30 - 100 человек',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if ((_model.maxCapacity ==
                                                        100) &&
                                                    (_model.minCapacity ==
                                                        30)) {
                                                  _model.maxCapacity = 100000;
                                                  _model.minCapacity = 1;
                                                  safeSetState(() {});
                                                } else {
                                                  _model.maxCapacity = 100;
                                                  _model.minCapacity = 30;
                                                  safeSetState(() {});
                                                }
                                              },
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                constraints: BoxConstraints(
                                                  maxWidth: 24.0,
                                                  maxHeight: 24.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if ((_model.maxCapacity ==
                                                              100) &&
                                                          (_model.minCapacity ==
                                                              30)) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primary;
                                                      } else if (_model
                                                          .mouseRegionHovered3!) {
                                                        return Color(
                                                            0x912431A5);
                                                      } else {
                                                        return Color(
                                                            0x00000000);
                                                      }
                                                    }(),
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  border: Border.all(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      (_model.maxCapacity ==
                                                                  100) &&
                                                              (_model.minCapacity ==
                                                                  30)
                                                          ? Color(0x00000000)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                    ),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: MouseRegion(
                                                  opaque: false,
                                                  cursor: SystemMouseCursors
                                                          .click ??
                                                      MouseCursor.defer,
                                                  child: Visibility(
                                                    visible: ((_model
                                                                    .maxCapacity ==
                                                                100) &&
                                                            (_model.minCapacity ==
                                                                30)) ==
                                                        true,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.check_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  onEnter: ((event) async {
                                                    safeSetState(() => _model
                                                            .mouseRegionHovered3 =
                                                        true);
                                                  }),
                                                  onExit: ((event) async {
                                                    safeSetState(() => _model
                                                            .mouseRegionHovered3 =
                                                        false);
                                                  }),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Больше 100 человек',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.minCapacity == 100) {
                                                  _model.maxCapacity = 100000;
                                                  _model.minCapacity = 1;
                                                  safeSetState(() {});
                                                } else {
                                                  _model.maxCapacity = 100000;
                                                  _model.minCapacity = 100;
                                                  safeSetState(() {});
                                                }
                                              },
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                constraints: BoxConstraints(
                                                  maxWidth: 24.0,
                                                  maxHeight: 24.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if ((_model.maxCapacity ==
                                                              100000) &&
                                                          (_model.minCapacity ==
                                                              100)) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primary;
                                                      } else if (_model
                                                          .mouseRegionHovered4!) {
                                                        return Color(
                                                            0x912431A5);
                                                      } else {
                                                        return Color(
                                                            0x00000000);
                                                      }
                                                    }(),
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  border: Border.all(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.minCapacity == 100
                                                          ? Color(0x00000000)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                    ),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: MouseRegion(
                                                  opaque: false,
                                                  cursor: SystemMouseCursors
                                                          .click ??
                                                      MouseCursor.defer,
                                                  child: Visibility(
                                                    visible: ((_model
                                                                    .maxCapacity ==
                                                                100000) &&
                                                            (_model.minCapacity ==
                                                                100)) ==
                                                        true,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.check_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  onEnter: ((event) async {
                                                    safeSetState(() => _model
                                                            .mouseRegionHovered4 =
                                                        true);
                                                  }),
                                                  onExit: ((event) async {
                                                    safeSetState(() => _model
                                                            .mouseRegionHovered4 =
                                                        false);
                                                  }),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    expandIcon:
                                        Icons.keyboard_arrow_down_rounded,
                                    collapseIcon:
                                        Icons.keyboard_arrow_up_rounded,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Container(
                              width: double.infinity,
                              color: Color(0x00000000),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController2,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Рассадка',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: Color(0xB714181B),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (_model.seatings.isNotEmpty)
                                        Builder(
                                          builder: (context) {
                                            final seatingsCol = _model.seatings
                                                .toList()
                                                .take(3)
                                                .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: List.generate(
                                                  seatingsCol.length,
                                                  (seatingsColIndex) {
                                                final seatingsColItem =
                                                    seatingsCol[
                                                        seatingsColIndex];
                                                return wrapWithModel(
                                                  model: _model
                                                      .clientSeatingCompModels1
                                                      .getModel(
                                                    seatingsColIndex.toString(),
                                                    seatingsColIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      ClientSeatingCompWidget(
                                                    key: Key(
                                                      'Keyzbi_${seatingsColIndex.toString()}',
                                                    ),
                                                    seating: seatingsColItem,
                                                    index: seatingsColIndex + 1,
                                                    mainCount: widget!.visitors,
                                                    onChangeSeating: (onChange,
                                                        count) async {
                                                      _model
                                                          .updateSeatingsAtIndex(
                                                        seatingsColIndex,
                                                        (e) => e
                                                          ..type = onChange
                                                          ..count = count,
                                                      );
                                                      safeSetState(() {});
                                                      _model
                                                          .updateHidenSeatingsAtIndex(
                                                        valueOrDefault<int>(
                                                          seatingsColIndex,
                                                          0,
                                                        ),
                                                        (e) => e
                                                          ..type =
                                                              seatingsColItem
                                                                  .type
                                                          ..count =
                                                              seatingsColItem
                                                                  .count,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    onNew: () async {
                                                      _model.addToSeatings(
                                                          HotelSeatingStruct(
                                                        type:
                                                            EnumSeating.theatre,
                                                        count: 1,
                                                      ));
                                                      safeSetState(() {});
                                                    },
                                                    onDelete: () async {
                                                      _model.removeFromSeatings(
                                                          seatingsColItem);
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                );
                                              }).divide(SizedBox(height: 24.0)),
                                            );
                                          },
                                        ),
                                      if (_model.seatings.length < 1)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.addToSeatings(
                                                HotelSeatingStruct(
                                              type: EnumSeating.theatre,
                                              count: 1,
                                            ));
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.add_circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                              Text(
                                                'Добавить рассадку',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    expandIcon:
                                        Icons.keyboard_arrow_down_rounded,
                                    collapseIcon:
                                        Icons.keyboard_arrow_up_rounded,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Container(
                              width: double.infinity,
                              color: Color(0x00000000),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController3,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Для тестов',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: Color(0xB714181B),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (_model.hidenSeatings.isNotEmpty)
                                        Builder(
                                          builder: (context) {
                                            final seatingsCol = _model
                                                .hidenSeatings
                                                .toList()
                                                .take(3)
                                                .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: List.generate(
                                                  seatingsCol.length,
                                                  (seatingsColIndex) {
                                                final seatingsColItem =
                                                    seatingsCol[
                                                        seatingsColIndex];
                                                return wrapWithModel(
                                                  model: _model
                                                      .clientSeatingCompModels2
                                                      .getModel(
                                                    seatingsColIndex.toString(),
                                                    seatingsColIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      ClientSeatingCompWidget(
                                                    key: Key(
                                                      'Keyowe_${seatingsColIndex.toString()}',
                                                    ),
                                                    seating: seatingsColItem,
                                                    index: seatingsColIndex + 1,
                                                    mainCount: widget!.visitors,
                                                    onChangeSeating: (onChange,
                                                        count) async {
                                                      _model
                                                          .updateSeatingsAtIndex(
                                                        seatingsColIndex,
                                                        (e) => e
                                                          ..type = onChange
                                                          ..count = count,
                                                      );
                                                      _model
                                                          .updateHidenSeatingsAtIndex(
                                                        seatingsColIndex,
                                                        (e) => e
                                                          ..type = onChange
                                                          ..count = count,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    onNew: () async {
                                                      _model.addToSeatings(
                                                          HotelSeatingStruct(
                                                        type:
                                                            EnumSeating.theatre,
                                                        count: 1,
                                                      ));
                                                      safeSetState(() {});
                                                    },
                                                    onDelete: () async {
                                                      _model.removeFromSeatings(
                                                          seatingsColItem);
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                );
                                              }).divide(SizedBox(height: 24.0)),
                                            );
                                          },
                                        ),
                                      if (_model.seatings.length < 1)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.addToSeatings(
                                                HotelSeatingStruct(
                                              type: EnumSeating.theatre,
                                              count: 1,
                                            ));
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.add_circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                              Text(
                                                'Добавить рассадку',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      Builder(
                                        builder: (context) {
                                          final aaaa =
                                              _model.hidenSeatings.toList();

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(aaaa.length,
                                                (aaaaIndex) {
                                              final aaaaItem = aaaa[aaaaIndex];
                                              return Text(
                                                aaaaItem.count.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                              );
                                            }).divide(SizedBox(height: 12.0)),
                                          );
                                        },
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    expandIcon:
                                        Icons.keyboard_arrow_down_rounded,
                                    collapseIcon:
                                        Icons.keyboard_arrow_up_rounded,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if ((widget!.maxCapacity != _model.maxCapacity) ||
                (((widget!.hallfilter1?.type != _model.hidenSeatings[0].type) ||
                        (widget!.hallfilter1?.count !=
                            _model.hidenSeatings[0].count)) &&
                    ((_model.hidenSeatings[0].type != EnumSeating.theatre) ||
                        (_model.hidenSeatings[0].count != 0))))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      constraints: BoxConstraints(
                        maxWidth: 400.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 8.0, 20.0, 8.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await widget.confirmFilters?.call(
                              _model.minCapacity,
                              _model.seatings.length >= 1
                                  ? _model.seatings[0]
                                  : null,
                              _model.seatings.length >= 2
                                  ? _model.seatings[1]
                                  : null,
                              _model.seatings.length >= 3
                                  ? _model.seatings[2]
                                  : null,
                              _model.maxCapacity,
                            );
                          },
                          text: 'Применить фильтры',
                          options: FFButtonOptions(
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Commissioner',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
