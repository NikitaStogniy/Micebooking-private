import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/super_hall_seating_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'hall_full_info_widget.dart' show HallFullInfoWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HallFullInfoModel extends FlutterFlowModel<HallFullInfoWidget> {
  ///  Local state fields for this component.

  List<HotelSeatingStruct> seatings = [];
  void addToSeatings(HotelSeatingStruct item) => seatings.add(item);
  void removeFromSeatings(HotelSeatingStruct item) => seatings.remove(item);
  void removeAtIndexFromSeatings(int index) => seatings.removeAt(index);
  void insertAtIndexInSeatings(int index, HotelSeatingStruct item) =>
      seatings.insert(index, item);
  void updateSeatingsAtIndex(
          int index, Function(HotelSeatingStruct) updateFn) =>
      seatings[index] = updateFn(seatings[index]);

  ///  State fields for stateful widgets in this component.

  // Models for super_hall_seating_comp dynamic component.
  late FlutterFlowDynamicModels<SuperHallSeatingCompModel>
      superHallSeatingCompModels;
  // Models for checkBox dynamic component.
  late FlutterFlowDynamicModels<CheckBoxModel> checkBoxModels;

  @override
  void initState(BuildContext context) {
    superHallSeatingCompModels =
        FlutterFlowDynamicModels(() => SuperHallSeatingCompModel());
    checkBoxModels = FlutterFlowDynamicModels(() => CheckBoxModel());
  }

  @override
  void dispose() {
    superHallSeatingCompModels.dispose();
    checkBoxModels.dispose();
  }
}
