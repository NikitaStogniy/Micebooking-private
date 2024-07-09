import '/components/calendar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'calendar_row_mobile_model.dart';
export 'calendar_row_mobile_model.dart';

class CalendarRowMobileWidget extends StatefulWidget {
  const CalendarRowMobileWidget({
    super.key,
    required this.onClick,
  });

  final Future Function(DateTime selectedDate)? onClick;

  @override
  State<CalendarRowMobileWidget> createState() =>
      _CalendarRowMobileWidgetState();
}

class _CalendarRowMobileWidgetState extends State<CalendarRowMobileWidget> {
  late CalendarRowMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarRowMobileModel());

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
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF0F0FA),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
          child: wrapWithModel(
            model: _model.calendarMobileModel,
            updateCallback: () => setState(() {}),
            child: CalendarMobileWidget(
              month: _model.firstMonth!,
              onClick: (date) async {
                await widget.onClick?.call(
                  date,
                );
                Navigator.pop(context);
              },
              plus: () async {
                _model.firstMonth = functions.monthModify(_model.firstMonth, 1);
                setState(() {});
              },
              minus: () async {
                _model.firstMonth =
                    functions.monthModify(_model.firstMonth, -1);
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
