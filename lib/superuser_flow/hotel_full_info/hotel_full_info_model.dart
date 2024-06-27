import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'hotel_full_info_widget.dart' show HotelFullInfoWidget;
import 'package:flutter/material.dart';

class HotelFullInfoModel extends FlutterFlowModel<HotelFullInfoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar_edit widget.
  double? ratingBarEditValue;
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
