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
  FocusNode? whyusText1FocusNode1;
  TextEditingController? whyusText1TextController1;
  String? Function(BuildContext, String?)? whyusText1TextController1Validator;
  // State field(s) for Whyus_title2 widget.
  FocusNode? whyusTitle2FocusNode;
  TextEditingController? whyusTitle2TextController;
  String? Function(BuildContext, String?)? whyusTitle2TextControllerValidator;
  // State field(s) for Whyus_text1 widget.
  FocusNode? whyusText1FocusNode2;
  TextEditingController? whyusText1TextController2;
  String? Function(BuildContext, String?)? whyusText1TextController2Validator;
  // State field(s) for Whyus_title1 widget.
  FocusNode? whyusTitle1FocusNode2;
  TextEditingController? whyusTitle1TextController2;
  String? Function(BuildContext, String?)? whyusTitle1TextController2Validator;
  // State field(s) for Whyus_text1 widget.
  FocusNode? whyusText1FocusNode3;
  TextEditingController? whyusText1TextController3;
  String? Function(BuildContext, String?)? whyusText1TextController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    whyusTitle1FocusNode1?.dispose();
    whyusTitle1TextController1?.dispose();

    whyusText1FocusNode1?.dispose();
    whyusText1TextController1?.dispose();

    whyusTitle2FocusNode?.dispose();
    whyusTitle2TextController?.dispose();

    whyusText1FocusNode2?.dispose();
    whyusText1TextController2?.dispose();

    whyusTitle1FocusNode2?.dispose();
    whyusTitle1TextController2?.dispose();

    whyusText1FocusNode3?.dispose();
    whyusText1TextController3?.dispose();
  }
}
