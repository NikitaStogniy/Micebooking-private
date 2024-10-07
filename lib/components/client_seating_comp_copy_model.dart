import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/seating_icon_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'client_seating_comp_copy_widget.dart' show ClientSeatingCompCopyWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
