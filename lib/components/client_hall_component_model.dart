import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'client_hall_component_widget.dart' show ClientHallComponentWidget;
import 'package:flutter/material.dart';

class ClientHallComponentModel
    extends FlutterFlowModel<ClientHallComponentWidget> {
  ///  Local state fields for this component.

  double price = 0.0;

  double days = 1.0;

  String? seating;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
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
