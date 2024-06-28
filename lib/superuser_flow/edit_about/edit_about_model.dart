import '/flutter_flow/flutter_flow_util.dart';
import 'edit_about_widget.dart' show EditAboutWidget;
import 'package:flutter/material.dart';

class EditAboutModel extends FlutterFlowModel<EditAboutWidget> {
  ///  Local state fields for this component.

  String? image;

  bool isEdit = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for text1 widget.
  FocusNode? text1FocusNode;
  TextEditingController? text1TextController;
  String? Function(BuildContext, String?)? text1TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    text1FocusNode?.dispose();
    text1TextController?.dispose();
  }
}
