import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'super_hall_seating_comp_model.dart';
export 'super_hall_seating_comp_model.dart';

class SuperHallSeatingCompWidget extends StatefulWidget {
  const SuperHallSeatingCompWidget({
    super.key,
    required this.seating,
    required this.onChange,
    int? maxCapacity,
  }) : this.maxCapacity = maxCapacity ?? 0;

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
        Container(
          width: 200.0,
          decoration: BoxDecoration(),
          child: Text(
            () {
              if (widget!.seating?.type == EnumSeating.theatre) {
                return 'Театр';
              } else if (widget!.seating?.type == EnumSeating.klass) {
                return 'Класс';
              } else if (widget!.seating?.type == EnumSeating.communication) {
                return 'Переговорная';
              } else if (widget!.seating?.type == EnumSeating.ushape) {
                return 'U-shape';
              } else if (widget!.seating?.type == EnumSeating.oshape) {
                return 'O-shape';
              } else if (widget!.seating?.type == EnumSeating.cabare) {
                return 'Кабаре';
              } else if (widget!.seating?.type == EnumSeating.banket) {
                return 'Банкет';
              } else if (widget!.seating?.type == EnumSeating.furshet) {
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
            color: Color(0xFFF0F0FA),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.seating?.count?.toString(),
                  '0',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      color: Color(0xFF636363),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
        ),
      ].divide(SizedBox(width: 16.0)),
    );
  }
}
