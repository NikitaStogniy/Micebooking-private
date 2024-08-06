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
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // State field(s) for countmob widget.
  FocusNode? countmobFocusNode;
  TextEditingController? countmobTextController;
  String? Function(BuildContext, String?)? countmobTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    countmobFocusNode?.dispose();
    countmobTextController?.dispose();
  }
}
