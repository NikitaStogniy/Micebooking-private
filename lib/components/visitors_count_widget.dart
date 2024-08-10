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
  }) : count = count ?? 0;

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
      _model.countDublicate = widget.count;
      _model.seating1 = widget.filter1?.type;
      _model.seating2 = widget.filter2?.type;
      _model.seating3 = widget.filter3?.type;
      _model.addToSeatings(widget.filter1!);
      setState(() {});
      _model.addToSeatings(widget.filter2!);
      setState(() {});
      _model.addToSeatings(widget.filter3!);
      setState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          constraints: const BoxConstraints(
            maxWidth: 340.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
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
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.fieldActive == true)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
                                width: 70.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFC0C4EC),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        const Duration(milliseconds: 100),
                                        () async {
                                          await widget.onType?.call(
                                            int.tryParse(
                                                _model.textController.text),
                                          );
                                          _model.countDublicate = int.tryParse(
                                              _model.textController.text);
                                          _model.updatePage(() {});
                                        },
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText: 'Кол-во участников...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 16.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
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
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
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
                                setState(() {});
                                setState(() {
                                  _model.textController?.clear();
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Container(
                                  width: 70.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFC0C4EC),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                setState(() {});
                                _model.fieldActive = false;
                                setState(() {});
                              }
                            },
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 18.0,
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
                              setState(() {});
                              _model.fieldActive = false;
                              setState(() {});
                            },
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
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
                        if (_model.seatings.isNotEmpty)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 150.0,
                                  decoration: const BoxDecoration(),
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
                                  decoration: const BoxDecoration(),
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
                            ].divide(const SizedBox(width: 8.0)),
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
                                  updateCallback: () => setState(() {}),
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
                                      setState(() {});
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
                                      setState(() {});
                                    },
                                    onDelete: () async {
                                      _model
                                          .removeFromSeatings(seatingsColItem);
                                      setState(() {});
                                      await widget.deleteFilter?.call(
                                        seatingsColIndex,
                                      );
                                    },
                                  ),
                                );
                              }).divide(const SizedBox(height: 24.0)),
                            );
                          },
                        ),
                        if (_model.seatings.isEmpty)
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
                              setState(() {});
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
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ],
                ),
              ].divide(const SizedBox(height: 16.0)),
            ),
          ),
        ),
      ],
    );
  }
}
