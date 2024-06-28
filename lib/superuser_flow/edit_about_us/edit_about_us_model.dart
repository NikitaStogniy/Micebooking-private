import '/flutter_flow/flutter_flow_util.dart';
import 'edit_about_us_widget.dart' show EditAboutUsWidget;
import 'package:flutter/material.dart';

class EditAboutUsModel extends FlutterFlowModel<EditAboutUsWidget> {
  ///  Local state fields for this component.

  String? image;

  bool isEdit = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for AboutUsTitle widget.
  FocusNode? aboutUsTitleFocusNode;
  TextEditingController? aboutUsTitleTextController;
  String? Function(BuildContext, String?)? aboutUsTitleTextControllerValidator;
  // State field(s) for aboutUsText1 widget.
  FocusNode? aboutUsText1FocusNode;
  TextEditingController? aboutUsText1TextController;
  String? Function(BuildContext, String?)? aboutUsText1TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    aboutUsTitleFocusNode?.dispose();
    aboutUsTitleTextController?.dispose();

    aboutUsText1FocusNode?.dispose();
    aboutUsText1TextController?.dispose();
  }
}
