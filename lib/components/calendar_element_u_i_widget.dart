import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_element_u_i_model.dart';
export 'calendar_element_u_i_model.dart';

class CalendarElementUIWidget extends StatefulWidget {
  const CalendarElementUIWidget({
    super.key,
    required this.text,
    this.dayStart,
    this.dayEnd,
    this.currentDate,
  });

  final String? text;
  final DateTime? dayStart;
  final DateTime? dayEnd;
  final DateTime? currentDate;

  @override
  State<CalendarElementUIWidget> createState() =>
      _CalendarElementUIWidgetState();
}

class _CalendarElementUIWidgetState extends State<CalendarElementUIWidget> {
  late CalendarElementUIModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarElementUIModel());

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
      decoration: BoxDecoration(
        color: _model.mouseRegionHovered! &&
                (widget!.dayStart != widget!.currentDate) &&
                (widget!.dayEnd != widget!.currentDate)
            ? Color(0xFFF0F0FA)
            : Color(0x00000000),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(valueOrDefault<double>(
            _model.mouseRegionHovered! &&
                    (widget!.dayStart != widget!.currentDate) &&
                    (widget!.dayEnd != widget!.currentDate)
                ? 8.0
                : 0.0,
            0.0,
          )),
          bottomRight: Radius.circular(valueOrDefault<double>(
            _model.mouseRegionHovered! &&
                    (widget!.dayStart != widget!.currentDate) &&
                    (widget!.dayEnd != widget!.currentDate)
                ? 8.0
                : 0.0,
            0.0,
          )),
          topLeft: Radius.circular(valueOrDefault<double>(
            _model.mouseRegionHovered! &&
                    (widget!.dayStart != widget!.currentDate) &&
                    (widget!.dayEnd != widget!.currentDate)
                ? 8.0
                : 0.0,
            0.0,
          )),
          topRight: Radius.circular(valueOrDefault<double>(
            _model.mouseRegionHovered! &&
                    (widget!.dayStart != widget!.currentDate) &&
                    (widget!.dayEnd != widget!.currentDate)
                ? 8.0
                : 0.0,
            0.0,
          )),
        ),
      ),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget!.text,
              'd',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Commissioner',
                  color: () {
                    if ((widget!.dayStart == null) &&
                        (widget!.dayEnd == null)) {
                      return Color(0xFF121212);
                    } else if ((widget!.dayStart == widget!.currentDate) ||
                        (widget!.dayEnd == widget!.currentDate)) {
                      return FlutterFlowTheme.of(context).secondaryBackground;
                    } else {
                      return Color(0xFF121212);
                    }
                  }(),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
        }),
      ),
    );
  }
}
