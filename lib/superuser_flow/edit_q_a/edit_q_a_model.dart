import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/qa_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'edit_q_a_widget.dart' show EditQAWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditQAModel extends FlutterFlowModel<EditQAWidget> {
  ///  Local state fields for this component.

  String? image;

  bool isEdit = false;

  bool newQA = false;

  ///  State fields for stateful widgets in this component.

  // Models for qa_element dynamic component.
  late FlutterFlowDynamicModels<QaElementModel> qaElementModels;
  Completer<List<CmsRow>>? requestCompleter;
  // State field(s) for newTitle widget.
  FocusNode? newTitleFocusNode;
  TextEditingController? newTitleTextController;
  String? Function(BuildContext, String?)? newTitleTextControllerValidator;
  // State field(s) for newText widget.
  FocusNode? newTextFocusNode;
  TextEditingController? newTextTextController;
  String? Function(BuildContext, String?)? newTextTextControllerValidator;

  @override
  void initState(BuildContext context) {
    qaElementModels = FlutterFlowDynamicModels(() => QaElementModel());
  }

  @override
  void dispose() {
    qaElementModels.dispose();
    newTitleFocusNode?.dispose();
    newTitleTextController?.dispose();

    newTextFocusNode?.dispose();
    newTextTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
