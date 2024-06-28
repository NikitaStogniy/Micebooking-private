import '/flutter_flow/flutter_flow_util.dart';
import 'client_search_widget.dart' show ClientSearchWidget;
import 'package:flutter/material.dart';

class ClientSearchModel extends FlutterFlowModel<ClientSearchWidget> {
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
