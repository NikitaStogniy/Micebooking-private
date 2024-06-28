import '/components/qa_element_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_q_a_widget.dart' show EditQAWidget;
import 'package:flutter/material.dart';

class EditQAModel extends FlutterFlowModel<EditQAWidget> {
  ///  Local state fields for this component.

  String? image;

  bool isEdit = false;

  bool newQA = false;

  ///  State fields for stateful widgets in this component.

  // Models for qa_element dynamic component.
  late FlutterFlowDynamicModels<QaElementModel> qaElementModels;
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
}
