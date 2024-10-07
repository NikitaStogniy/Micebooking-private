import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/client_seating_comp_copy_widget.dart';
import '/components/client_seating_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'visitors_count_filters_model.dart';
export 'visitors_count_filters_model.dart';

class VisitorsCountFiltersWidget extends StatefulWidget {
  const VisitorsCountFiltersWidget({
    super.key,
    int? count,
    required this.onAdd,
    required this.onRemove,
    required this.onChange,
    required this.createHallFilter,
    required this.onType,
    required this.deleteFilter,
    bool? home,
    this.filter1,
    this.filter2,
    this.filter3,
  })  : this.count = count ?? 0,
        this.home = home ?? false;

  final int count;
  final Future Function()? onAdd;
  final Future Function()? onRemove;
  final Future Function(int? visitors, EnumSeating? seatings)? onChange;
  final Future Function(HotelSeatingStruct? filter, int? index)?
      createHallFilter;
  final Future Function(int? visitors)? onType;
  final Future Function(int? index)? deleteFilter;
  final bool home;
  final HotelSeatingStruct? filter1;
  final HotelSeatingStruct? filter2;
  final HotelSeatingStruct? filter3;

  @override
  State<VisitorsCountFiltersWidget> createState() =>
      _VisitorsCountFiltersWidgetState();
}

class _VisitorsCountFiltersWidgetState
    extends State<VisitorsCountFiltersWidget> {
  late VisitorsCountFiltersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisitorsCountFiltersModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.countDublicate = widget!.count;
      _model.seating1 = widget!.filter1?.type;
      _model.seating2 = widget!.filter2?.type;
      _model.seating3 = widget!.filter3?.type;
      _model.addToSeatings(widget!.filter1!);
      safeSetState(() {});
      _model.addToSeatings(widget!.filter2!);
      safeSetState(() {});
      _model.addToSeatings(widget!.filter3!);
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget!.home == true)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_model.seatings.length > 0)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 150.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Участники:',
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
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 150.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Рассадка:',
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
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          Builder(
                            builder: (context) {
                              final seatingsCol =
                                  _model.seatings.toList().take(3).toList();

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(seatingsCol.length,
                                    (seatingsColIndex) {
                                  final seatingsColItem =
                                      seatingsCol[seatingsColIndex];
                                  return wrapWithModel(
                                    model:
                                        _model.clientSeatingCompModels.getModel(
                                      seatingsColIndex.toString(),
                                      seatingsColIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: ClientSeatingCompWidget(
                                      key: Key(
                                        'Keyvqs_${seatingsColIndex.toString()}',
                                      ),
                                      seating: seatingsColItem,
                                      index: seatingsColIndex + 1,
                                      onChangeSeating: (onChange, count) async {
                                        _model.updateSeatingsAtIndex(
                                          seatingsColIndex,
                                          (e) => e
                                            ..type = onChange
                                            ..count = count,
                                        );
                                        _model.seatingTest = count;
                                        _model.hall1Filter = seatingsColItem;
                                        safeSetState(() {});
                                        await widget.onChange?.call(
                                          count,
                                          onChange,
                                        );
                                        await widget.createHallFilter?.call(
                                          seatingsColItem,
                                          seatingsColIndex,
                                        );
                                      },
                                      onNew: () async {
                                        _model.addToSeatings(HotelSeatingStruct(
                                          type: EnumSeating.theatre,
                                          count: 1,
                                        ));
                                        safeSetState(() {});
                                      },
                                      onDelete: () async {
                                        _model.removeFromSeatings(
                                            seatingsColItem);
                                        safeSetState(() {});
                                        await widget.deleteFilter?.call(
                                          seatingsColIndex,
                                        );
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
                                _model.addToSeatings(HotelSeatingStruct(
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
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Добавить рассадку',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    if (widget!.home == false)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget!.filter1 != null)
                            wrapWithModel(
                              model: _model.clientSeatingCompCopyModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: ClientSeatingCompCopyWidget(
                                index: 1,
                                seating: HotelSeatingStruct(
                                  type: _model.seating1,
                                  count: widget!.filter1?.count,
                                ),
                                onChangeSeating: (onChange, count) async {
                                  await widget.onChange?.call(
                                    count,
                                    onChange,
                                  );
                                  _model.seating1 = onChange;
                                  safeSetState(() {});
                                  await widget.createHallFilter?.call(
                                    HotelSeatingStruct(
                                      type: onChange,
                                      count: count,
                                    ),
                                    0,
                                  );
                                  _model.hall1Filter = HotelSeatingStruct(
                                    type: onChange,
                                    count: count,
                                  );
                                  safeSetState(() {});
                                },
                                onNew: () async {},
                                onDelete: () async {},
                              ),
                            ),
                          if (widget!.filter2 != null)
                            wrapWithModel(
                              model: _model.clientSeatingCompCopyModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: ClientSeatingCompCopyWidget(
                                index: 2,
                                seating: HotelSeatingStruct(
                                  type: _model.seating2,
                                  count: widget!.filter2?.count,
                                ),
                                onChangeSeating: (onChange, count) async {
                                  await widget.onChange?.call(
                                    count,
                                    onChange,
                                  );
                                  _model.seating2 = onChange;
                                  safeSetState(() {});
                                  await widget.createHallFilter?.call(
                                    HotelSeatingStruct(
                                      type: onChange,
                                      count: count,
                                    ),
                                    0,
                                  );
                                  _model.hall1Filter = HotelSeatingStruct(
                                    type: onChange,
                                    count: count,
                                  );
                                  safeSetState(() {});
                                },
                                onNew: () async {},
                                onDelete: () async {},
                              ),
                            ),
                          if (widget!.filter3 != null)
                            wrapWithModel(
                              model: _model.clientSeatingCompCopyModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: ClientSeatingCompCopyWidget(
                                index: 3,
                                seating: HotelSeatingStruct(
                                  type: _model.seating3,
                                  count: widget!.filter3?.count,
                                ),
                                onChangeSeating: (onChange, count) async {
                                  await widget.onChange?.call(
                                    count,
                                    onChange,
                                  );
                                  _model.seating3 = onChange;
                                  safeSetState(() {});
                                  await widget.createHallFilter?.call(
                                    HotelSeatingStruct(
                                      type: onChange,
                                      count: count,
                                    ),
                                    0,
                                  );
                                  _model.hall1Filter = HotelSeatingStruct(
                                    type: onChange,
                                    count: count,
                                  );
                                  safeSetState(() {});
                                },
                                onNew: () async {},
                                onDelete: () async {},
                              ),
                            ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                  ],
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ],
    );
  }
}
