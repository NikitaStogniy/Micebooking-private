import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/check_box/check_box_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hotel_filter_model.dart';
export 'hotel_filter_model.dart';

class HotelFilterWidget extends StatefulWidget {
  const HotelFilterWidget({
    super.key,
    this.initialStars,
    double? initialMinPrice,
    double? initialMaxPrice,
    required this.acceptChanges,
    double? initialMinDistance,
    double? initialMaxDistance,
  })  : this.initialMinPrice = initialMinPrice ?? 0.0,
        this.initialMaxPrice = initialMaxPrice ?? 10000.0,
        this.initialMinDistance = initialMinDistance ?? 0.0,
        this.initialMaxDistance = initialMaxDistance ?? 100000.0;

  final List<int>? initialStars;
  final double initialMinPrice;
  final double initialMaxPrice;
  final Future Function(List<int> stars, double minDistance, double maxDistance,
      double minPrice, double maxPrice)? acceptChanges;
  final double initialMinDistance;
  final double initialMaxDistance;

  @override
  State<HotelFilterWidget> createState() => _HotelFilterWidgetState();
}

class _HotelFilterWidgetState extends State<HotelFilterWidget> {
  late HotelFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotelFilterModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.stars = widget!.initialStars!.toList().cast<int>();
      _model.minDistance = widget!.initialMinDistance;
      _model.maxDistance = widget!.initialMaxDistance;
      _model.maxPrice = widget!.initialMaxPrice;
      _model.minPrice = widget!.initialMinPrice;
      safeSetState(() {});
    });

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
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
          maxHeight: MediaQuery.sizeOf(context).height * 0.8,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFF0F0FA),
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
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
                                  'Количество звезд ',
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.stars
                                                  .contains(valueOrDefault<int>(
                                                5,
                                                5,
                                              ))) {
                                                _model.removeFromStars(5);
                                                safeSetState(() {});
                                              } else {
                                                _model.addToStars(5);
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
                                                    if (_model.stars.contains(
                                                            valueOrDefault<int>(
                                                          5,
                                                          5,
                                                        )) ==
                                                        true) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else if (_model
                                                        .mouseRegionHovered1!) {
                                                      return Color(0x912431A5);
                                                    } else {
                                                      return Color(0x00000000);
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.stars.contains(
                                                                valueOrDefault<
                                                                    int>(
                                                              5,
                                                              5,
                                                            )) ==
                                                            true
                                                        ? Color(0x00000000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: MouseRegion(
                                                opaque: false,
                                                cursor:
                                                    SystemMouseCursors.click ??
                                                        MouseCursor.defer,
                                                child: Visibility(
                                                  visible: _model.stars
                                                          .contains(
                                                              valueOrDefault<
                                                                  int>(
                                                        5,
                                                        5,
                                                      )) ==
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
                                                          .mouseRegionHovered1 =
                                                      true);
                                                }),
                                                onExit: ((event) async {
                                                  safeSetState(() => _model
                                                          .mouseRegionHovered1 =
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.stars
                                                  .contains(valueOrDefault<int>(
                                                4,
                                                5,
                                              ))) {
                                                _model.removeFromStars(4);
                                                safeSetState(() {});
                                              } else {
                                                _model.addToStars(4);
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
                                                    if (_model.stars.contains(
                                                            valueOrDefault<int>(
                                                          4,
                                                          5,
                                                        )) ==
                                                        true) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else if (_model
                                                        .mouseRegionHovered2!) {
                                                      return Color(0x912431A5);
                                                    } else {
                                                      return Color(0x00000000);
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.stars.contains(
                                                                valueOrDefault<
                                                                    int>(
                                                              4,
                                                              5,
                                                            )) ==
                                                            true
                                                        ? Color(0x00000000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: MouseRegion(
                                                opaque: false,
                                                cursor:
                                                    SystemMouseCursors.click ??
                                                        MouseCursor.defer,
                                                child: Visibility(
                                                  visible: _model.stars
                                                          .contains(
                                                              valueOrDefault<
                                                                  int>(
                                                        4,
                                                        5,
                                                      )) ==
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.stars
                                                  .contains(valueOrDefault<int>(
                                                3,
                                                5,
                                              ))) {
                                                _model.removeFromStars(3);
                                                safeSetState(() {});
                                              } else {
                                                _model.addToStars(3);
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
                                                    if (_model.stars.contains(
                                                            valueOrDefault<int>(
                                                          3,
                                                          5,
                                                        )) ==
                                                        true) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else if (_model
                                                        .mouseRegionHovered3!) {
                                                      return Color(0x912431A5);
                                                    } else {
                                                      return Color(0x00000000);
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.stars.contains(
                                                                valueOrDefault<
                                                                    int>(
                                                              3,
                                                              5,
                                                            )) ==
                                                            true
                                                        ? Color(0x00000000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: MouseRegion(
                                                opaque: false,
                                                cursor:
                                                    SystemMouseCursors.click ??
                                                        MouseCursor.defer,
                                                child: Visibility(
                                                  visible: _model.stars
                                                          .contains(
                                                              valueOrDefault<
                                                                  int>(
                                                        3,
                                                        5,
                                                      )) ==
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFEE8B60),
                                                  size: 20.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.stars
                                                  .contains(valueOrDefault<int>(
                                                2,
                                                5,
                                              ))) {
                                                _model.removeFromStars(2);
                                                safeSetState(() {});
                                              } else {
                                                _model.addToStars(2);
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
                                                    if (_model.stars.contains(
                                                            valueOrDefault<int>(
                                                          2,
                                                          5,
                                                        )) ==
                                                        true) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else if (_model
                                                        .mouseRegionHovered4!) {
                                                      return Color(0x912431A5);
                                                    } else {
                                                      return Color(0x00000000);
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.stars.contains(
                                                                valueOrDefault<
                                                                    int>(
                                                              2,
                                                              5,
                                                            )) ==
                                                            true
                                                        ? Color(0x00000000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: MouseRegion(
                                                opaque: false,
                                                cursor:
                                                    SystemMouseCursors.click ??
                                                        MouseCursor.defer,
                                                child: Visibility(
                                                  visible: _model.stars
                                                          .contains(
                                                              valueOrDefault<
                                                                  int>(
                                                        2,
                                                        5,
                                                      )) ==
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
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: Icons.keyboard_arrow_down_rounded,
                                  collapseIcon: Icons.keyboard_arrow_up_rounded,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
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
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
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
                                  _model.expandableExpandableController2,
                              child: ExpandablePanel(
                                header: Text(
                                  'Расстояние от центра',
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
                                                    'Меньше 1 км',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if ((_model.minDistance == 0.0) &&
                                                  (_model.maxDistance == 1.0)) {
                                                _model.minDistance = 0.0;
                                                _model.maxDistance = 100000.0;
                                                safeSetState(() {});
                                              } else {
                                                _model.minDistance = 0.0;
                                                _model.maxDistance = 1.0;
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
                                                    if ((_model.minDistance ==
                                                            0.0) &&
                                                        (_model.maxDistance ==
                                                            1.0)) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else if (_model
                                                        .mouseRegionHovered5!) {
                                                      return Color(0x912431A5);
                                                    } else {
                                                      return Color(0x00000000);
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    (_model.minDistance ==
                                                                0.0) &&
                                                            (_model.maxDistance ==
                                                                1.0)
                                                        ? Color(0x00000000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: MouseRegion(
                                                opaque: false,
                                                cursor:
                                                    SystemMouseCursors.click ??
                                                        MouseCursor.defer,
                                                child: Visibility(
                                                  visible:
                                                      (_model.minDistance ==
                                                              0.0) &&
                                                          (_model.maxDistance ==
                                                              100000.0),
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
                                                          .mouseRegionHovered5 =
                                                      true);
                                                }),
                                                onExit: ((event) async {
                                                  safeSetState(() => _model
                                                          .mouseRegionHovered5 =
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
                                                  '1 - 3 км',
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
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if ((_model.minDistance == 1.0) &&
                                                  (_model.maxDistance == 3.0)) {
                                                _model.minDistance = 0.0;
                                                _model.maxDistance = 100000.0;
                                                safeSetState(() {});
                                              } else {
                                                _model.minDistance = 1.0;
                                                _model.maxDistance = 3.0;
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
                                                    if ((_model.minDistance ==
                                                            1.0) &&
                                                        (_model.maxDistance ==
                                                            3.0)) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else if (_model
                                                        .mouseRegionHovered6!) {
                                                      return Color(0x912431A5);
                                                    } else {
                                                      return Color(0x00000000);
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    (_model.minDistance ==
                                                                1.0) &&
                                                            (_model.maxDistance ==
                                                                3.0)
                                                        ? Color(0x00000000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: MouseRegion(
                                                opaque: false,
                                                cursor:
                                                    SystemMouseCursors.click ??
                                                        MouseCursor.defer,
                                                child: Visibility(
                                                  visible:
                                                      (_model.minDistance ==
                                                              1.0) &&
                                                          (_model.maxDistance ==
                                                              3.0),
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
                                                          .mouseRegionHovered6 =
                                                      true);
                                                }),
                                                onExit: ((event) async {
                                                  safeSetState(() => _model
                                                          .mouseRegionHovered6 =
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
                                                  '3 - 5 км',
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
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if ((_model.minDistance == 3.0) &&
                                                  (_model.maxDistance == 5.0)) {
                                                _model.minDistance = 0.0;
                                                _model.maxDistance = 100000.0;
                                                safeSetState(() {});
                                              } else {
                                                _model.minDistance = 3.0;
                                                _model.maxDistance = 5.0;
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
                                                    if ((_model.minDistance ==
                                                            3.0) &&
                                                        (_model.maxDistance ==
                                                            5.0)) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else if (_model
                                                        .mouseRegionHovered7!) {
                                                      return Color(0x912431A5);
                                                    } else {
                                                      return Color(0x00000000);
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    (_model.minDistance ==
                                                                3.0) &&
                                                            (_model.maxDistance ==
                                                                5.0)
                                                        ? Color(0x00000000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: MouseRegion(
                                                opaque: false,
                                                cursor:
                                                    SystemMouseCursors.click ??
                                                        MouseCursor.defer,
                                                child: Visibility(
                                                  visible:
                                                      (_model.minDistance ==
                                                              3.0) &&
                                                          (_model.maxDistance ==
                                                              5.0),
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
                                                          .mouseRegionHovered7 =
                                                      true);
                                                }),
                                                onExit: ((event) async {
                                                  safeSetState(() => _model
                                                          .mouseRegionHovered7 =
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
                                                  'Больше 5 км',
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
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if ((_model.minDistance == 5.0) &&
                                                  (_model.maxDistance ==
                                                      100000.0)) {
                                                _model.minDistance = 0.0;
                                                _model.maxDistance = 100000.0;
                                                safeSetState(() {});
                                              } else {
                                                _model.minDistance = 5.0;
                                                _model.maxDistance = 100000.0;
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
                                                    if ((_model.minDistance ==
                                                            5.0) &&
                                                        (_model.maxDistance ==
                                                            100000.0)) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else if (_model
                                                        .mouseRegionHovered8!) {
                                                      return Color(0x912431A5);
                                                    } else {
                                                      return Color(0x00000000);
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    (_model.minDistance ==
                                                                5.0) &&
                                                            (_model.maxDistance ==
                                                                100000.0)
                                                        ? Color(0x00000000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: MouseRegion(
                                                opaque: false,
                                                cursor:
                                                    SystemMouseCursors.click ??
                                                        MouseCursor.defer,
                                                child: Visibility(
                                                  visible:
                                                      (_model.minDistance ==
                                                              5.0) &&
                                                          (_model.maxDistance ==
                                                              100000.0),
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
                                                          .mouseRegionHovered8 =
                                                      true);
                                                }),
                                                onExit: ((event) async {
                                                  safeSetState(() => _model
                                                          .mouseRegionHovered8 =
                                                      false);
                                                }),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: Icons.keyboard_arrow_down_rounded,
                                  collapseIcon: Icons.keyboard_arrow_up_rounded,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Учитывать \nмои предпочтения',
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.checkBoxModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CheckBoxWidget(
                                    isChecked: false,
                                    onClick: () async {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Container(
                              width: double.infinity,
                              color: Color(0x00000000),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController3,
                                child: ExpandablePanel(
                                  header: Text(
                                    'По цене за ночь',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
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
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'От ${valueOrDefault<String>(
                                                formatNumber(
                                                  _model.minPriceValue,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              )}₽',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              'До  ${formatNumber(
                                                _model.maxPriceValue,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )}₽',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        if (((_model.minPrice != null) &&
                                                (_model.maxPrice != null)) &&
                                            (_model.minPrice! >
                                                _model.maxPrice!))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x17BE3030),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 16.0, 8.0, 16.0),
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
                                                        Icon(
                                                          Icons
                                                              .info_outline_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 16.0,
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Минимальная цена за ночь не может быть больше максимальной',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        Slider(
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          inactiveColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          min: 0.0,
                                          max: 100000.0,
                                          value: _model.minPriceValue ??=
                                              valueOrDefault<double>(
                                            _model.minPrice,
                                            0.0,
                                          ),
                                          label: _model.minPriceValue
                                              ?.toStringAsFixed(0),
                                          divisions: 1000,
                                          onChanged: (newValue) async {
                                            newValue = double.parse(
                                                newValue.toStringAsFixed(0));
                                            safeSetState(() => _model
                                                .minPriceValue = newValue);
                                            _model.minPrice =
                                                _model.minPriceValue;
                                            safeSetState(() {});
                                          },
                                        ),
                                        Slider(
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          inactiveColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          min: 1.0,
                                          max: 100000.0,
                                          value: _model.maxPriceValue ??=
                                              valueOrDefault<double>(
                                            widget!.initialMaxPrice,
                                            100000.0,
                                          ),
                                          label: _model.maxPriceValue
                                              ?.toStringAsFixed(0),
                                          divisions: 1000,
                                          onChanged: (newValue) async {
                                            newValue = double.parse(
                                                newValue.toStringAsFixed(0));
                                            safeSetState(() => _model
                                                .maxPriceValue = newValue);
                                            _model.maxPrice =
                                                _model.maxPriceValue;
                                            safeSetState(() {});
                                          },
                                        ),
                                      ],
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!functions.areListsEqualInt(
                    widget!.initialStars!.toList(), _model.stars.toList()) ||
                (widget!.initialMinPrice != _model.minPrice) ||
                (widget!.initialMaxPrice != _model.maxPrice) ||
                (widget!.initialMinDistance != _model.minDistance) ||
                (widget!.initialMaxDistance != _model.maxDistance))
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
                            await widget.acceptChanges?.call(
                              _model.stars,
                              _model.minDistance!,
                              _model.maxDistance!,
                              _model.minPrice!,
                              widget!.initialMaxPrice,
                            );
                            Navigator.pop(context);
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
