import '/components/calendar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calendar_row_mobile_widget.dart' show CalendarRowMobileWidget;
import 'package:flutter/material.dart';

class CalendarRowMobileModel extends FlutterFlowModel<CalendarRowMobileWidget> {
  ///  Local state fields for this component.

  DateTime? firstMonth;

  ///  State fields for stateful widgets in this component.

  // Model for calendarMobile component.
  late CalendarMobileModel calendarMobileModel;

  @override
  void initState(BuildContext context) {
    calendarMobileModel = createModel(context, () => CalendarMobileModel());
  }

  @override
  void dispose() {
    calendarMobileModel.dispose();
  }
}
