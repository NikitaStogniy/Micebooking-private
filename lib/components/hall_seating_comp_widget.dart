import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hall_seating_comp_model.dart';
export 'hall_seating_comp_model.dart';

class HallSeatingCompWidget extends StatefulWidget {
  const HallSeatingCompWidget({
    super.key,
    required this.seating,
    required this.onChange,
    int? maxCapacity,
  }) : maxCapacity = maxCapacity ?? 0;

  final HotelSeatingStruct? seating;
  final Future Function(int? count)? onChange;
  final int maxCapacity;

  @override
  State<HallSeatingCompWidget> createState() => _HallSeatingCompWidgetState();
}

class _HallSeatingCompWidgetState extends State<HallSeatingCompWidget> {
  late HallSeatingCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HallSeatingCompModel());

    _model.seatCapacityTextController ??=
        TextEditingController(text: widget.seating?.count.toString());
    _model.seatCapacityFocusNode ??= FocusNode();

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          () {
            if (widget.seating?.type == EnumSeating.theatre) {
              return 'Театр';
            } else if (widget.seating?.type == EnumSeating.klass) {
              return 'Класс';
            } else if (widget.seating?.type == EnumSeating.communication) {
              return 'Переговорная';
            } else if (widget.seating?.type == EnumSeating.ushape) {
              return 'U-shape';
            } else if (widget.seating?.type == EnumSeating.oshape) {
              return 'O-shape';
            } else if (widget.seating?.type == EnumSeating.cabare) {
              return 'Кабаре';
            } else if (widget.seating?.type == EnumSeating.banket) {
              return 'Банкет';
            } else if (widget.seating?.type == EnumSeating.furshet) {
              return 'Фуршет';
            } else {
              return 'Ошибка';
            }
          }(),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Commissioner',
                letterSpacing: 0.0,
              ),
        ),
        SizedBox(
          width: 100.0,
          child: TextFormField(
            controller: _model.seatCapacityTextController,
            focusNode: _model.seatCapacityFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.seatCapacityTextController',
              const Duration(milliseconds: 2000),
              () async {
                await widget.onChange?.call(
                  int.tryParse(_model.seatCapacityTextController.text),
                );
              },
            ),
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              isDense: true,
              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Commissioner',
                    letterSpacing: 0.0,
                  ),
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Commissioner',
                    letterSpacing: 0.0,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
              filled: true,
              fillColor: const Color(0xFFF0F0FA),
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Commissioner',
                  letterSpacing: 0.0,
                ),
            keyboardType: TextInputType.number,
            validator:
                _model.seatCapacityTextControllerValidator.asValidator(context),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
          ),
        ),
      ].divide(const SizedBox(width: 16.0)),
    );
  }
}
