import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/profile_requests_component/profile_requests_component_widget.dart';
import 'profile_requests_widget.dart' show ProfileRequestsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileRequestsModel extends FlutterFlowModel<ProfileRequestsWidget> {
  ///  Local state fields for this component.

  bool requestOpen = false;

  RequestsRow? request;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for profile_requests_component dynamic component.
  late FlutterFlowDynamicModels<ProfileRequestsComponentModel>
      profileRequestsComponentModels;

  @override
  void initState(BuildContext context) {
    profileRequestsComponentModels =
        FlutterFlowDynamicModels(() => ProfileRequestsComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    profileRequestsComponentModels.dispose();
  }
}
