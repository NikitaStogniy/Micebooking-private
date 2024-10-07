import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/empty_states/hall_food_room_empty/hall_food_room_empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'profile_rooms_component_widget.dart' show ProfileRoomsComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileRoomsComponentModel
    extends FlutterFlowModel<ProfileRoomsComponentWidget> {
  ///  Local state fields for this component.

  List<int> newRooms = [];
  void addToNewRooms(int item) => newRooms.add(item);
  void removeFromNewRooms(int item) => newRooms.remove(item);
  void removeAtIndexFromNewRooms(int index) => newRooms.removeAt(index);
  void insertAtIndexInNewRooms(int index, int item) =>
      newRooms.insert(index, item);
  void updateNewRoomsAtIndex(int index, Function(int) updateFn) =>
      newRooms[index] = updateFn(newRooms[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  RoomRow? newItemCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
