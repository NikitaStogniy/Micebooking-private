import '/components/calendar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'calendar_row_widget.dart' show CalendarRowWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarRowModel extends FlutterFlowModel<CalendarRowWidget> {
  ///  Local state fields for this component.

  DateTime? firstMonth;

  ///  State fields for stateful widgets in this component.

  // Model for calendar component.
  late CalendarModel calendarModel1;
  // Model for calendar component.
  late CalendarModel calendarModel2;
  // Model for calendar component.
  late CalendarModel calendarModel3;

  @override
  void initState(BuildContext context) {
    calendarModel1 = createModel(context, () => CalendarModel());
    calendarModel2 = createModel(context, () => CalendarModel());
    calendarModel3 = createModel(context, () => CalendarModel());
  }

  @override
  void dispose() {
    calendarModel1.dispose();
    calendarModel2.dispose();
    calendarModel3.dispose();
  }
}
