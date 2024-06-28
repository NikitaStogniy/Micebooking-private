import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/profile_halls_component/profile_halls_component_widget.dart';
import 'profile_halls_widget.dart' show ProfileHallsWidget;
import 'package:flutter/material.dart';

class ProfileHallsModel extends FlutterFlowModel<ProfileHallsWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for profile_halls_component dynamic component.
  late FlutterFlowDynamicModels<ProfileHallsComponentModel>
      profileHallsComponentModels;

  @override
  void initState(BuildContext context) {
    profileHallsComponentModels =
        FlutterFlowDynamicModels(() => ProfileHallsComponentModel());
  }

  @override
  void dispose() {
    profileHallsComponentModels.dispose();
  }
}
