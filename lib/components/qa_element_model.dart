import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'qa_element_widget.dart' show QaElementWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QaElementModel extends FlutterFlowModel<QaElementWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for aboutUsText1 widget.
  FocusNode? aboutUsText1FocusNode1;
  TextEditingController? aboutUsText1TextController1;
  String? Function(BuildContext, String?)? aboutUsText1TextController1Validator;
  // State field(s) for aboutUsText1 widget.
  FocusNode? aboutUsText1FocusNode2;
  TextEditingController? aboutUsText1TextController2;
  String? Function(BuildContext, String?)? aboutUsText1TextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    aboutUsText1FocusNode1?.dispose();
    aboutUsText1TextController1?.dispose();

    aboutUsText1FocusNode2?.dispose();
    aboutUsText1TextController2?.dispose();
  }
}
