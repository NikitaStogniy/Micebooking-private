import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hall_food_room_empty_model.dart';
export 'hall_food_room_empty_model.dart';

class HallFoodRoomEmptyWidget extends StatefulWidget {
  const HallFoodRoomEmptyWidget({
    super.key,
    required this.type,
    this.add,
  });

  final EnumType? type;
  final Future Function()? add;

  @override
  State<HallFoodRoomEmptyWidget> createState() =>
      _HallFoodRoomEmptyWidgetState();
}

class _HallFoodRoomEmptyWidgetState extends State<HallFoodRoomEmptyWidget> {
  late HallFoodRoomEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HallFoodRoomEmptyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 80.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Добавьте первый ${() {
              if (widget!.type == EnumType.HALL) {
                return ' зал';
              } else if (widget!.type == EnumType.FOOD) {
                return ' пакет еды';
              } else if (widget!.type == EnumType.ROOM) {
                return ' номер';
              } else {
                return ' класс';
              }
            }()}',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Commissioner',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
