import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/qa_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'edit_whyus_widget.dart' show EditWhyusWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditWhyusModel extends FlutterFlowModel<EditWhyusWidget> {
  ///  Local state fields for this component.

  String? image;

  bool isEdit = false;

  bool newElement1 = false;

  bool newElement2 = false;

  bool newElement3 = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Whyus_title1 widget.
  FocusNode? whyusTitle1FocusNode;
  TextEditingController? whyusTitle1TextController;
  String? Function(BuildContext, String?)? whyusTitle1TextControllerValidator;
  // Models for qa_element dynamic component.
  late FlutterFlowDynamicModels<QaElementModel> qaElementModels1;
  Completer<List<CmsRow>>? requestCompleter1;
  // State field(s) for newTitle1 widget.
  FocusNode? newTitle1FocusNode;
  TextEditingController? newTitle1TextController;
  String? Function(BuildContext, String?)? newTitle1TextControllerValidator;
  // State field(s) for newText1 widget.
  FocusNode? newText1FocusNode;
  TextEditingController? newText1TextController;
  String? Function(BuildContext, String?)? newText1TextControllerValidator;
  // State field(s) for Whyus_title2 widget.
  FocusNode? whyusTitle2FocusNode;
  TextEditingController? whyusTitle2TextController;
  String? Function(BuildContext, String?)? whyusTitle2TextControllerValidator;
  // Models for qa_element dynamic component.
  late FlutterFlowDynamicModels<QaElementModel> qaElementModels2;
  Completer<List<CmsRow>>? requestCompleter2;
  // State field(s) for newTitle2 widget.
  FocusNode? newTitle2FocusNode;
  TextEditingController? newTitle2TextController;
  String? Function(BuildContext, String?)? newTitle2TextControllerValidator;
  // State field(s) for newText2 widget.
  FocusNode? newText2FocusNode;
  TextEditingController? newText2TextController;
  String? Function(BuildContext, String?)? newText2TextControllerValidator;
  // State field(s) for Whyus_title3 widget.
  FocusNode? whyusTitle3FocusNode;
  TextEditingController? whyusTitle3TextController;
  String? Function(BuildContext, String?)? whyusTitle3TextControllerValidator;
  // Models for qa_element dynamic component.
  late FlutterFlowDynamicModels<QaElementModel> qaElementModels3;
  Completer<List<CmsRow>>? requestCompleter3;
  // State field(s) for newTitle3 widget.
  FocusNode? newTitle3FocusNode;
  TextEditingController? newTitle3TextController;
  String? Function(BuildContext, String?)? newTitle3TextControllerValidator;
  // State field(s) for newText3 widget.
  FocusNode? newText3FocusNode;
  TextEditingController? newText3TextController;
  String? Function(BuildContext, String?)? newText3TextControllerValidator;

  @override
  void initState(BuildContext context) {
    qaElementModels1 = FlutterFlowDynamicModels(() => QaElementModel());
    qaElementModels2 = FlutterFlowDynamicModels(() => QaElementModel());
    qaElementModels3 = FlutterFlowDynamicModels(() => QaElementModel());
  }

  @override
  void dispose() {
    whyusTitle1FocusNode?.dispose();
    whyusTitle1TextController?.dispose();

    qaElementModels1.dispose();
    newTitle1FocusNode?.dispose();
    newTitle1TextController?.dispose();

    newText1FocusNode?.dispose();
    newText1TextController?.dispose();

    whyusTitle2FocusNode?.dispose();
    whyusTitle2TextController?.dispose();

    qaElementModels2.dispose();
    newTitle2FocusNode?.dispose();
    newTitle2TextController?.dispose();

    newText2FocusNode?.dispose();
    newText2TextController?.dispose();

    whyusTitle3FocusNode?.dispose();
    whyusTitle3TextController?.dispose();

    qaElementModels3.dispose();
    newTitle3FocusNode?.dispose();
    newTitle3TextController?.dispose();

    newText3FocusNode?.dispose();
    newText3TextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
