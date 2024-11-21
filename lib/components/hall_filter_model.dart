import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/client_seating_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'hall_filter_widget.dart' show HallFilterWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HallFilterModel extends FlutterFlowModel<HallFilterWidget> {
  ///  Local state fields for this component.

  int? maxCapacity = 100000;

  List<HotelSeatingStruct> seatings = [];
  void addToSeatings(HotelSeatingStruct item) => seatings.add(item);
  void removeFromSeatings(HotelSeatingStruct item) => seatings.remove(item);
  void removeAtIndexFromSeatings(int index) => seatings.removeAt(index);
  void insertAtIndexInSeatings(int index, HotelSeatingStruct item) =>
      seatings.insert(index, item);
  void updateSeatingsAtIndex(
          int index, Function(HotelSeatingStruct) updateFn) =>
      seatings[index] = updateFn(seatings[index]);

  int? minCapacity = 0;

  int? visitors;

  List<HotelSeatingStruct> hidenSeatings = [];
  void addToHidenSeatings(HotelSeatingStruct item) => hidenSeatings.add(item);
  void removeFromHidenSeatings(HotelSeatingStruct item) =>
      hidenSeatings.remove(item);
  void removeAtIndexFromHidenSeatings(int index) =>
      hidenSeatings.removeAt(index);
  void insertAtIndexInHidenSeatings(int index, HotelSeatingStruct item) =>
      hidenSeatings.insert(index, item);
  void updateHidenSeatingsAtIndex(
          int index, Function(HotelSeatingStruct) updateFn) =>
      hidenSeatings[index] = updateFn(hidenSeatings[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // Models for ClientSeating_comp dynamic component.
  late FlutterFlowDynamicModels<ClientSeatingCompModel>
      clientSeatingCompModels1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // Models for ClientSeating_comp dynamic component.
  late FlutterFlowDynamicModels<ClientSeatingCompModel>
      clientSeatingCompModels2;

  @override
  void initState(BuildContext context) {
    clientSeatingCompModels1 =
        FlutterFlowDynamicModels(() => ClientSeatingCompModel());
    clientSeatingCompModels2 =
        FlutterFlowDynamicModels(() => ClientSeatingCompModel());
  }

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    clientSeatingCompModels1.dispose();
    expandableExpandableController3.dispose();
    clientSeatingCompModels2.dispose();
  }
}
