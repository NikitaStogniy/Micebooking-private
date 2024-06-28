import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'hall_settings_widget.dart' show HallSettingsWidget;
import 'package:flutter/material.dart';

class HallSettingsModel extends FlutterFlowModel<HallSettingsWidget> {
  ///  Local state fields for this component.

  int? editService;

  String? addNew;

  bool newCaterory = false;

  ///  State fields for stateful widgets in this component.

  Completer<List<ServiceCategoryRow>>? requestCompleter2;
  Completer<List<ServiceCategoryRow>>? requestCompleter1;
  // State field(s) for newCategory widget.
  FocusNode? newCategoryFocusNode;
  TextEditingController? newCategoryTextController;
  String? Function(BuildContext, String?)? newCategoryTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ServiceCategoryRow? newService;
  // Stores action output result for [Backend Call - Query Rows] action in super_service_elment widget.
  List<ServiceRow>? services;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newCategoryFocusNode?.dispose();
    newCategoryTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
