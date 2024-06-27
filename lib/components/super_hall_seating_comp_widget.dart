import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'super_hall_seating_comp_model.dart';
export 'super_hall_seating_comp_model.dart';

class SuperHallSeatingCompWidget extends StatefulWidget {
  const SuperHallSeatingCompWidget({
    super.key,
    required this.seating,
    required this.onChange,
    int? maxCapacity,
  }) : maxCapacity = maxCapacity ?? 0;

  final HotelSeatingStruct? seating;
  final Future Function(int? count)? onChange;
  final int maxCapacity;

  @override
  State<SuperHallSeatingCompWidget> createState() =>
      _SuperHallSeatingCompWidgetState();
}

class _SuperHallSeatingCompWidgetState
    extends State<SuperHallSeatingCompWidget> {
  late SuperHallSeatingCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuperHallSeatingCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        Container(
          width: 200.0,
          decoration: const BoxDecoration(),
          child: Text(
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
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Container(
          width: 130.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0FA),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.seating?.count.toString(),
                  '0',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      color: const Color(0xFF636363),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
        ),
      ].divide(const SizedBox(width: 16.0)),
    );
  }
}
