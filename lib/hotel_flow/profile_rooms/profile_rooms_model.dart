import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/profile_rooms_component/profile_rooms_component_widget.dart';
import 'dart:math';
import 'profile_rooms_widget.dart' show ProfileRoomsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileRoomsModel extends FlutterFlowModel<ProfileRoomsWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for profile_rooms_component dynamic component.
  late FlutterFlowDynamicModels<ProfileRoomsComponentModel>
      profileRoomsComponentModels;

  @override
  void initState(BuildContext context) {
    profileRoomsComponentModels =
        FlutterFlowDynamicModels(() => ProfileRoomsComponentModel());
  }

  @override
  void dispose() {
    profileRoomsComponentModels.dispose();
  }
}
