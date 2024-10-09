import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/client_seating_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'visitors_count_model.dart';
export 'visitors_count_model.dart';

class VisitorsCountWidget extends StatefulWidget {
  const VisitorsCountWidget({
    super.key,
    int? count,
    required this.onAdd,
    required this.onRemove,
    required this.onChange,
    required this.createHallFilter,
    required this.onType,
    required this.deleteFilter,
    this.filter1,
    this.filter2,
    this.filter3,
  }) : this.count = count ?? 0;

  final int count;
  final Future Function()? onAdd;
  final Future Function()? onRemove;
  final Future Function(int? visitors, EnumSeating? seatings)? onChange;
  final Future Function(HotelSeatingStruct? filter, int? index)?
      createHallFilter;
  final Future Function(int? visitors)? onType;
  final Future Function(int? index)? deleteFilter;
  final HotelSeatingStruct? filter1;
  final HotelSeatingStruct? filter2;
  final HotelSeatingStruct? filter3;

  @override
  State<VisitorsCountWidget> createState() => _VisitorsCountWidgetState();
}

class _VisitorsCountWidgetState extends State<VisitorsCountWidget> {
  late VisitorsCountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisitorsCountModel());

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

    _model.countmobTextController ??= TextEditingController();
    _model.countmobFocusNode ??= FocusNode();

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
          constraints: BoxConstraints(
            maxWidth: 340.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Всего участников',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.fieldActive == true)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
                                width: 70.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC0C4EC),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Visibility(
                                  visible: _model.fieldActive == true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Container(
                                      width: 70.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC0C4EC),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Visibility(
                                        visible: _model.fieldActive == true,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.countmobTextController,
                                              focusNode:
                                                  _model.countmobFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.countmobTextController',
                                                Duration(milliseconds: 200),
                                                () async {
                                                  await widget.onType?.call(
                                                    int.tryParse(_model
                                                        .countmobTextController
                                                        .text),
                                                  );
                                                  _model.countDublicate =
                                                      int.tryParse(_model
                                                          .countmobTextController
                                                          .text);
                                                  _model.updatePage(() {});
                                                },
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                hintText:
                                                    'Кол-во участников...',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 8.0),
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              minLines: 1,
                                              maxLength: 5,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .countmobTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp('[0-9]'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (_model.fieldActive == false)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.fieldActive = true;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.countmobTextController?.clear();
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Container(
                                  width: 70.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC0C4EC),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 9.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.countDublicate?.toString(),
                                          '0',
                                        ),
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.onRemove?.call();
                              if (_model.countDublicate! >= 1) {
                                _model.countDublicate =
                                    _model.countDublicate! + -1;
                                safeSetState(() {});
                                _model.fieldActive = false;
                                safeSetState(() {});
                              }
                            },
                            child: Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.onAdd?.call();
                              _model.countDublicate =
                                  _model.countDublicate! + 1;
                              safeSetState(() {});
                              _model.fieldActive = false;
                              safeSetState(() {});
                            },
                            child: Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                                          fontSize: 18.0,
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
                                          fontSize: 18.0,
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
                                      'Keykq6_${seatingsColIndex.toString()}',
                                    ),
                                    seating: seatingsColItem,
                                    index: seatingsColIndex + 1,
                                    mainCount: _model.countDublicate,
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
                                      _model
                                          .removeFromSeatings(seatingsColItem);
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
                  ],
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ],
    );
  }
}
