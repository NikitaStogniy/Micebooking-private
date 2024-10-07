import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/calendar_row_mobile_widget.dart';
import '/components/calendar_row_widget.dart';
import '/components/city_drop_down_widget.dart';
import '/components/days_count_widget.dart';
import '/components/visitors_count_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'hotel_search_comp_widget.dart' show HotelSearchCompWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HotelSearchCompModel extends FlutterFlowModel<HotelSearchCompWidget> {
  ///  Local state fields for this component.

  double? duration = 0.0;

  CityRow? city;

  int? visitors = 0;

  DateTime? startDate;

  List<EnumSeating> seating = [];
  void addToSeating(EnumSeating item) => seating.add(item);
  void removeFromSeating(EnumSeating item) => seating.remove(item);
  void removeAtIndexFromSeating(int index) => seating.removeAt(index);
  void insertAtIndexInSeating(int index, EnumSeating item) =>
      seating.insert(index, item);
  void updateSeatingAtIndex(int index, Function(EnumSeating) updateFn) =>
      seating[index] = updateFn(seating[index]);

  HotelSeatingStruct? hallFilter1;
  void updateHallFilter1Struct(Function(HotelSeatingStruct) updateFn) {
    updateFn(hallFilter1 ??= HotelSeatingStruct());
  }

  HotelSeatingStruct? hallFilter2;
  void updateHallFilter2Struct(Function(HotelSeatingStruct) updateFn) {
    updateFn(hallFilter2 ??= HotelSeatingStruct());
  }

  HotelSeatingStruct? hallFilter3;
  void updateHallFilter3Struct(Function(HotelSeatingStruct) updateFn) {
    updateFn(hallFilter3 ??= HotelSeatingStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
