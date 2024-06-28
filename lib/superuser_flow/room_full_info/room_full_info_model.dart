import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'room_full_info_widget.dart' show RoomFullInfoWidget;
import 'package:flutter/material.dart';

class RoomFullInfoModel extends FlutterFlowModel<RoomFullInfoWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for checkBox dynamic component.
  late FlutterFlowDynamicModels<CheckBoxModel> checkBoxModels;

  @override
  void initState(BuildContext context) {
    checkBoxModels = FlutterFlowDynamicModels(() => CheckBoxModel());
  }

  @override
  void dispose() {
    checkBoxModels.dispose();
  }
}
