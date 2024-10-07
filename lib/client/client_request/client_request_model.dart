import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'client_request_widget.dart' show ClientRequestWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientRequestModel extends FlutterFlowModel<ClientRequestWidget> {
  ///  Local state fields for this component.

  bool requestOpen = false;

  int? request;

  DateTime? currentDate;

  String? formatedDate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
