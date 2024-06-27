import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'hotel_filter_widget.dart' show HotelFilterWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class HotelFilterModel extends FlutterFlowModel<HotelFilterWidget> {
  ///  Local state fields for this component.

  bool showMoreService = false;

  double? minPrice = 0.0;

  double? maxPrice = 90000000.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for dis1 widget.
  bool? dis1Value;
  // State field(s) for dis1-3 widget.
  bool? dis13Value;
  // State field(s) for dis3-5 widget.
  bool? dis35Value;
  // State field(s) for dis5 widget.
  bool? dis5Value;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for minPrice widget.
  double? minPriceValue;
  // State field(s) for maxPrice widget.
  double? maxPriceValue;

  @override
  void initState(BuildContext context) {
    checkBoxModel = createModel(context, () => CheckBoxModel());
  }

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    checkBoxModel.dispose();
    expandableExpandableController3.dispose();
  }
}
