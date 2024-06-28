import '/components/seating_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_seating_comp_copy_widget.dart' show ClientSeatingCompCopyWidget;
import 'package:flutter/material.dart';

class ClientSeatingCompCopyModel
    extends FlutterFlowModel<ClientSeatingCompCopyWidget> {
  ///  Local state fields for this component.

  int? count;

  ///  State fields for stateful widgets in this component.

  // State field(s) for count widget.
  FocusNode? countFocusNode;
  TextEditingController? countTextController;
  String? Function(BuildContext, String?)? countTextControllerValidator;
  // Model for seatingIcon component.
  late SeatingIconModel seatingIconModel;

  @override
  void initState(BuildContext context) {
    seatingIconModel = createModel(context, () => SeatingIconModel());
  }

  @override
  void dispose() {
    countFocusNode?.dispose();
    countTextController?.dispose();

    seatingIconModel.dispose();
  }
}
