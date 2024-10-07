import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'seating_popup_widget.dart' show SeatingPopupWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SeatingPopupModel extends FlutterFlowModel<SeatingPopupWidget> {
  ///  Local state fields for this component.

  EnumSeating? selected = EnumSeating.klass;

  ///  State fields for stateful widgets in this component.

  // Model for checkBox component.
  late CheckBoxModel checkBoxModel1;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel2;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel3;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel4;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel5;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel6;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel7;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel8;

  @override
  void initState(BuildContext context) {
    checkBoxModel1 = createModel(context, () => CheckBoxModel());
    checkBoxModel2 = createModel(context, () => CheckBoxModel());
    checkBoxModel3 = createModel(context, () => CheckBoxModel());
    checkBoxModel4 = createModel(context, () => CheckBoxModel());
    checkBoxModel5 = createModel(context, () => CheckBoxModel());
    checkBoxModel6 = createModel(context, () => CheckBoxModel());
    checkBoxModel7 = createModel(context, () => CheckBoxModel());
    checkBoxModel8 = createModel(context, () => CheckBoxModel());
  }

  @override
  void dispose() {
    checkBoxModel1.dispose();
    checkBoxModel2.dispose();
    checkBoxModel3.dispose();
    checkBoxModel4.dispose();
    checkBoxModel5.dispose();
    checkBoxModel6.dispose();
    checkBoxModel7.dispose();
    checkBoxModel8.dispose();
  }
}
