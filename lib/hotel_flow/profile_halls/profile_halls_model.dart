import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/profile_halls_component/profile_halls_component_widget.dart';
import 'dart:math';
import 'profile_halls_widget.dart' show ProfileHallsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
