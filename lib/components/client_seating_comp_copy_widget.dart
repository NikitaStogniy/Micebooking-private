import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/seating_icon_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'client_seating_comp_copy_model.dart';
export 'client_seating_comp_copy_model.dart';

class ClientSeatingCompCopyWidget extends StatefulWidget {
  const ClientSeatingCompCopyWidget({
    super.key,
    required this.seating,
    required this.onChangeSeating,
    required this.onNew,
    required this.onDelete,
    int? index,
  }) : index = index ?? 1;

  final HotelSeatingStruct? seating;
  final Future Function(EnumSeating? onChange, int? count)? onChangeSeating;
  final Future Function()? onNew;
  final Future Function()? onDelete;
  final int index;

  @override
  State<ClientSeatingCompCopyWidget> createState() =>
      _ClientSeatingCompCopyWidgetState();
}

class _ClientSeatingCompCopyWidgetState
    extends State<ClientSeatingCompCopyWidget> {
  late ClientSeatingCompCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientSeatingCompCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.count = widget.seating?.count;
      safeSetState(() {});
    });

    _model.countTextController ??=
        TextEditingController(text: widget.seating?.count.toString());
    _model.countFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: 150.0,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Зал ${widget.index.toString()}:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Commissioner',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      width: 100.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC0C4EC),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.countTextController,
                          focusNode: _model.countFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.countTextController',
                            const Duration(milliseconds: 10),
                            () async {
                              await widget.onChangeSeating?.call(
                                widget.seating?.type,
                                int.tryParse(_model.countTextController.text),
                              );
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.countTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 10.0)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: 150.0,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.onChangeSeating?.call(
                              functions.enumChange(widget.seating!.type, -1),
                              int.tryParse(_model.countTextController.text),
                            );
                          },
                          child: Icon(
                            Icons.arrow_left_sharp,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 32.0,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.seatingIconModel,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: SeatingIconWidget(
                                    type: widget.seating!.type,
                                  ),
                                ),
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
                            await widget.onChangeSeating?.call(
                              functions.enumChange(widget.seating!.type, 1),
                              int.tryParse(_model.countTextController.text),
                            );
                          },
                          child: Icon(
                            Icons.arrow_right_sharp,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 32.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          () {
                            if (widget.seating?.type == EnumSeating.theatre) {
                              return 'Театр';
                            } else if (widget.seating?.type ==
                                EnumSeating.klass) {
                              return 'Класс';
                            } else if (widget.seating?.type ==
                                EnumSeating.communication) {
                              return 'Переговорная';
                            } else if (widget.seating?.type ==
                                EnumSeating.ushape) {
                              return 'П-образная';
                            } else if (widget.seating?.type ==
                                EnumSeating.oshape) {
                              return 'О-образная';
                            } else if (widget.seating?.type ==
                                EnumSeating.cabare) {
                              return 'Кабаре';
                            } else if (widget.seating?.type ==
                                EnumSeating.banket) {
                              return 'Банкет';
                            } else if (widget.seating?.type ==
                                EnumSeating.furshet) {
                              return 'Фуршет';
                            } else {
                              return 'Ошибка';
                            }
                          }(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.onNew?.call();
                      },
                      child: Icon(
                        Icons.add_circle,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 24.0,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.onDelete?.call();
                      },
                      child: Icon(
                        Icons.highlight_off,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ].divide(const SizedBox(width: 8.0)),
    );
  }
}
