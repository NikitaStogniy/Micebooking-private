import '/backend/supabase/supabase.dart';
import '/components/calendar_element_u_i_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'calendar_seasons_widget.dart' show CalendarSeasonsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarSeasonsModel extends FlutterFlowModel<CalendarSeasonsWidget> {
  ///  Local state fields for this component.

  DateTime? dayStart;

  DateTime? dayEnd;

  DateTime? currentMouth;

  List<DateTime> disabledDates = [];
  void addToDisabledDates(DateTime item) => disabledDates.add(item);
  void removeFromDisabledDates(DateTime item) => disabledDates.remove(item);
  void removeAtIndexFromDisabledDates(int index) =>
      disabledDates.removeAt(index);
  void insertAtIndexInDisabledDates(int index, DateTime item) =>
      disabledDates.insert(index, item);
  void updateDisabledDatesAtIndex(int index, Function(DateTime) updateFn) =>
      disabledDates[index] = updateFn(disabledDates[index]);

  List<DateTime> dateRange = [];
  void addToDateRange(DateTime item) => dateRange.add(item);
  void removeFromDateRange(DateTime item) => dateRange.remove(item);
  void removeAtIndexFromDateRange(int index) => dateRange.removeAt(index);
  void insertAtIndexInDateRange(int index, DateTime item) =>
      dateRange.insert(index, item);
  void updateDateRangeAtIndex(int index, Function(DateTime) updateFn) =>
      dateRange[index] = updateFn(dateRange[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in calendarSeasons widget.
  List<RoomSeasonElementRow>? allElemnts;
  // Models for calendar_elementUI dynamic component.
  late FlutterFlowDynamicModels<CalendarElementUIModel> calendarElementUIModels;

  @override
  void initState(BuildContext context) {
    calendarElementUIModels =
        FlutterFlowDynamicModels(() => CalendarElementUIModel());
  }

  @override
  void dispose() {
    calendarElementUIModels.dispose();
  }
}
