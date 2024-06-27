import '/flutter_flow/flutter_flow_util.dart';
import 'client_food_component_widget.dart' show ClientFoodComponentWidget;
import 'package:flutter/material.dart';

class ClientFoodComponentModel
    extends FlutterFlowModel<ClientFoodComponentWidget> {
  ///  Local state fields for this component.

  int? price = 0;

  int? count = 1;

  bool personsFirldOpen = true;

  bool countFieldOpen = true;

  int? persons = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for count widget.
  FocusNode? countFocusNode;
  TextEditingController? countTextController;
  String? Function(BuildContext, String?)? countTextControllerValidator;
  // State field(s) for persons widget.
  FocusNode? personsFocusNode;
  TextEditingController? personsTextController;
  String? Function(BuildContext, String?)? personsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    countFocusNode?.dispose();
    countTextController?.dispose();

    personsFocusNode?.dispose();
    personsTextController?.dispose();
  }
}
