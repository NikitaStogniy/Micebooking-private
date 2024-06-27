import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'company_requests_component_widget.dart'
    show CompanyRequestsComponentWidget;
import 'package:flutter/material.dart';

class CompanyRequestsComponentModel
    extends FlutterFlowModel<CompanyRequestsComponentWidget> {
  ///  Local state fields for this component.

  DateTime? currentDate;

  String formatedDate = 'Июнь 2024';

  bool completeOnly = false;

  int? user;

  RequestsRow? request;

  bool requestOpen = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
