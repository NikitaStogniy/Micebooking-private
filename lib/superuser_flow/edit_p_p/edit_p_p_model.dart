import '/flutter_flow/flutter_flow_util.dart';
import 'edit_p_p_widget.dart' show EditPPWidget;
import 'package:flutter/material.dart';

class EditPPModel extends FlutterFlowModel<EditPPWidget> {
  ///  Local state fields for this component.

  String? image;

  bool isEdit = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for aboutUsText1 widget.
  FocusNode? aboutUsText1FocusNode;
  TextEditingController? aboutUsText1TextController;
  String? Function(BuildContext, String?)? aboutUsText1TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    aboutUsText1FocusNode?.dispose();
    aboutUsText1TextController?.dispose();
  }
}
