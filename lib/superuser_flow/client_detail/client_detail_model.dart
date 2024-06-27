import '/flutter_flow/flutter_flow_util.dart';
import 'client_detail_widget.dart' show ClientDetailWidget;
import 'package:flutter/material.dart';

class ClientDetailModel extends FlutterFlowModel<ClientDetailWidget> {
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
