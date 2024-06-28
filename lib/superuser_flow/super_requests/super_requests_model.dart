import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/profile_requests_component/profile_requests_component_widget.dart';
import 'super_requests_widget.dart' show SuperRequestsWidget;
import 'package:flutter/material.dart';

class SuperRequestsModel extends FlutterFlowModel<SuperRequestsWidget> {
  ///  Local state fields for this component.

  bool requestOpen = false;

  RequestsRow? request;

  ///  State fields for stateful widgets in this component.

  // Model for profile_requests_component component.
  late ProfileRequestsComponentModel profileRequestsComponentModel;

  @override
  void initState(BuildContext context) {
    profileRequestsComponentModel =
        createModel(context, () => ProfileRequestsComponentModel());
  }

  @override
  void dispose() {
    profileRequestsComponentModel.dispose();
  }
}
