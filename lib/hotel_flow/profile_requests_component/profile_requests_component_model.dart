import '/backend/supabase/supabase.dart';
import '/empty_states/hotel_request_emprty/hotel_request_emprty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'profile_requests_component_widget.dart'
    show ProfileRequestsComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileRequestsComponentModel
    extends FlutterFlowModel<ProfileRequestsComponentWidget> {
  ///  Local state fields for this component.

  DateTime? currentDate;

  String formatedDate = 'Июнь 2024';

  bool completeOnly = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  Map<RequestsRow, bool> checkboxValueMap2 = {};
  List<RequestsRow> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
