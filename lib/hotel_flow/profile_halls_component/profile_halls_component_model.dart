import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_halls_component_widget.dart' show ProfileHallsComponentWidget;
import 'package:flutter/material.dart';

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
