import '/flutter_flow/flutter_flow_util.dart';
import 'profile_hotels_widget.dart' show ProfileHotelsWidget;
import 'package:flutter/material.dart';

class ProfileHotelsModel extends FlutterFlowModel<ProfileHotelsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
