import '/flutter_flow/flutter_flow_util.dart';
import 'edit_room_component_widget.dart' show EditRoomComponentWidget;
import 'package:flutter/material.dart';

class EditRoomComponentModel extends FlutterFlowModel<EditRoomComponentWidget> {
  ///  Local state fields for this component.

  double price = 0.0;

  int days = 1;

  int? rooms = 1;

  bool? roomFieldOpen = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
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