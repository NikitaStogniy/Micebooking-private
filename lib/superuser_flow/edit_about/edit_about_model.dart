import '/components/qa_element_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_about_widget.dart' show EditAboutWidget;
import 'package:flutter/material.dart';

class EditAboutModel extends FlutterFlowModel<EditAboutWidget> {
  ///  Local state fields for this component.

  String? image;

  bool isEdit = false;

  bool newElement = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for title1 widget.
  FocusNode? title1FocusNode1;
  TextEditingController? title1TextController1;
  String? Function(BuildContext, String?)? title1TextController1Validator;
  // State field(s) for title1 widget.
  FocusNode? title1FocusNode2;
  TextEditingController? title1TextController2;
  String? Function(BuildContext, String?)? title1TextController2Validator;
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
    title1FocusNode1?.dispose();
    title1TextController1?.dispose();

    title1FocusNode2?.dispose();
    title1TextController2?.dispose();

    qaElementModels.dispose();
    newTitleFocusNode?.dispose();
    newTitleTextController?.dispose();

    newTextFocusNode?.dispose();
    newTextTextController?.dispose();
  }
}
