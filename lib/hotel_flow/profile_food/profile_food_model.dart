import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/profile_food_component/profile_food_component_widget.dart';
import 'dart:math';
import 'profile_food_widget.dart' show ProfileFoodWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
