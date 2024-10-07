import '/components/calendar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'calendar_row_mobile_widget.dart' show CalendarRowMobileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
