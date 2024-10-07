import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/empty_states/hall_food_room_empty/hall_food_room_empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'profile_halls_component_widget.dart' show ProfileHallsComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileHallsComponentModel
    extends FlutterFlowModel<ProfileHallsComponentWidget> {
  ///  Local state fields for this component.

  List<int> newHalls = [];
  void addToNewHalls(int item) => newHalls.add(item);
  void removeFromNewHalls(int item) => newHalls.remove(item);
  void removeAtIndexFromNewHalls(int index) => newHalls.removeAt(index);
  void insertAtIndexInNewHalls(int index, int item) =>
      newHalls.insert(index, item);
  void updateNewHallsAtIndex(int index, Function(int) updateFn) =>
      newHalls[index] = updateFn(newHalls[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  HallRow? newHallCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
