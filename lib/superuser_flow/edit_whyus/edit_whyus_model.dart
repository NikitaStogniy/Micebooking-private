import '/flutter_flow/flutter_flow_util.dart';
import 'edit_whyus_widget.dart' show EditWhyusWidget;
import 'package:flutter/material.dart';

class EditWhyusModel extends FlutterFlowModel<EditWhyusWidget> {
  ///  Local state fields for this component.

  String? image;

  bool isEdit = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Whyus_title1 widget.
  FocusNode? whyusTitle1FocusNode1;
  TextEditingController? whyusTitle1TextController1;
  String? Function(BuildContext, String?)? whyusTitle1TextController1Validator;
  // State field(s) for Whyus_text1 widget.
  FocusNode? whyusText1FocusNode;
  TextEditingController? whyusText1TextController;
  String? Function(BuildContext, String?)? whyusText1TextControllerValidator;
  // State field(s) for Whyus_title2 widget.
  FocusNode? whyusTitle2FocusNode;
  TextEditingController? whyusTitle2TextController;
  String? Function(BuildContext, String?)? whyusTitle2TextControllerValidator;
  // State field(s) for Whyus_text2 widget.
  FocusNode? whyusText2FocusNode;
  TextEditingController? whyusText2TextController;
  String? Function(BuildContext, String?)? whyusText2TextControllerValidator;
  // State field(s) for Whyus_title1 widget.
  FocusNode? whyusTitle1FocusNode2;
  TextEditingController? whyusTitle1TextController2;
  String? Function(BuildContext, String?)? whyusTitle1TextController2Validator;
  // State field(s) for Whyus_text3 widget.
  FocusNode? whyusText3FocusNode;
  TextEditingController? whyusText3TextController;
  String? Function(BuildContext, String?)? whyusText3TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    whyusTitle1FocusNode1?.dispose();
    whyusTitle1TextController1?.dispose();

    whyusText1FocusNode?.dispose();
    whyusText1TextController?.dispose();

    whyusTitle2FocusNode?.dispose();
    whyusTitle2TextController?.dispose();

    whyusText2FocusNode?.dispose();
    whyusText2TextController?.dispose();

    whyusTitle1FocusNode2?.dispose();
    whyusTitle1TextController2?.dispose();

    whyusText3FocusNode?.dispose();
    whyusText3TextController?.dispose();
  }
}
