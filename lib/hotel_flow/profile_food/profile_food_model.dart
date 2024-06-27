import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/profile_food_component/profile_food_component_widget.dart';
import 'profile_food_widget.dart' show ProfileFoodWidget;
import 'package:flutter/material.dart';

class ProfileFoodModel extends FlutterFlowModel<ProfileFoodWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for profile_food_component dynamic component.
  late FlutterFlowDynamicModels<ProfileFoodComponentModel>
      profileFoodComponentModels;

  @override
  void initState(BuildContext context) {
    profileFoodComponentModels =
        FlutterFlowDynamicModels(() => ProfileFoodComponentModel());
  }

  @override
  void dispose() {
    profileFoodComponentModels.dispose();
  }
}
