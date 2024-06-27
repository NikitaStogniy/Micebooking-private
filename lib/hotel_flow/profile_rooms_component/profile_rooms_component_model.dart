import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_rooms_component_widget.dart' show ProfileRoomsComponentWidget;
import 'package:flutter/material.dart';

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
