import '/components/calendar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'calendar_row_model.dart';
export 'calendar_row_model.dart';

class CalendarRowWidget extends StatefulWidget {
  const CalendarRowWidget({
    super.key,
    required this.onClick,
    bool? chosen,
  }) : chosen = chosen ?? false;

  final Future Function(DateTime selectedDate)? onClick;
  final bool chosen;

  @override
  State<CalendarRowWidget> createState() => _CalendarRowWidgetState();
}

class _CalendarRowWidgetState extends State<CalendarRowWidget> {
  late CalendarRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarRowModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.firstMonth == null) {
        _model.firstMonth = getCurrentTimestamp;
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF0F0FA),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.firstMonth =
                      functions.monthModify(_model.firstMonth, -1);
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Color(0x4C2431A5),
                  size: 48.0,
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.calendarModel1,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: CalendarWidget(
                  month: _model.firstMonth!,
                  onClick: (date) async {
                    await widget.onClick?.call(
                      date,
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Container(
                width: 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: const BoxDecoration(
                  color: Color(0xFF9B9B9B),
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.calendarModel2,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: CalendarWidget(
                  month: functions.monthModify(_model.firstMonth, 1)!,
                  onClick: (date) async {
                    await widget.onClick?.call(
                      date,
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Container(
                width: 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: const BoxDecoration(
                  color: Color(0xFF9B9B9B),
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.calendarModel3,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: CalendarWidget(
                  month: functions.monthModify(_model.firstMonth, 2)!,
                  onClick: (date) async {
                    await widget.onClick?.call(
                      date,
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.firstMonth =
                      functions.monthModify(_model.firstMonth, 1);
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0x4C2431A5),
                  size: 48.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
