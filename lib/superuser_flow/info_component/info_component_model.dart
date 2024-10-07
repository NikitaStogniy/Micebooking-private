import '/backend/schema/structs/index.dart';
import '/components/drop_down_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'info_component_widget.dart' show InfoComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfoComponentModel extends FlutterFlowModel<InfoComponentWidget> {
  ///  Local state fields for this component.

  int? initialCat;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for DropDownComponent component.
  late DropDownComponentModel dropDownComponentModel;
  // State field(s) for Text widget.
  FocusNode? textFocusNode1;
  TextEditingController? textTextController1;
  String? Function(BuildContext, String?)? textTextController1Validator;
  // State field(s) for Text widget.
  FocusNode? textFocusNode2;
  TextEditingController? textTextController2;
  String? Function(BuildContext, String?)? textTextController2Validator;
  // State field(s) for Text widget.
  FocusNode? textFocusNode3;
  TextEditingController? textTextController3;
  String? Function(BuildContext, String?)? textTextController3Validator;

  @override
  void initState(BuildContext context) {
    dropDownComponentModel =
        createModel(context, () => DropDownComponentModel());
  }

  @override
  void dispose() {
    dropDownComponentModel.dispose();
    textFocusNode1?.dispose();
    textTextController1?.dispose();

    textFocusNode2?.dispose();
    textTextController2?.dispose();

    textFocusNode3?.dispose();
    textTextController3?.dispose();
  }
}
