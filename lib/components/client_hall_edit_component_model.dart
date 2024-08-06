import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'client_hall_edit_component_widget.dart'
    show ClientHallEditComponentWidget;
import 'package:flutter/material.dart';

class ClientHallEditComponentModel
    extends FlutterFlowModel<ClientHallEditComponentWidget> {
  ///  Local state fields for this component.

  double price = 0.0;

  double days = 1.0;

  String? seating;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
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
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel9;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel10;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel11;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel12;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel13;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel14;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel15;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel16;

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
    checkBoxModel9 = createModel(context, () => CheckBoxModel());
    checkBoxModel10 = createModel(context, () => CheckBoxModel());
    checkBoxModel11 = createModel(context, () => CheckBoxModel());
    checkBoxModel12 = createModel(context, () => CheckBoxModel());
    checkBoxModel13 = createModel(context, () => CheckBoxModel());
    checkBoxModel14 = createModel(context, () => CheckBoxModel());
    checkBoxModel15 = createModel(context, () => CheckBoxModel());
    checkBoxModel16 = createModel(context, () => CheckBoxModel());
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
    checkBoxModel9.dispose();
    checkBoxModel10.dispose();
    checkBoxModel11.dispose();
    checkBoxModel12.dispose();
    checkBoxModel13.dispose();
    checkBoxModel14.dispose();
    checkBoxModel15.dispose();
    checkBoxModel16.dispose();
  }
}
