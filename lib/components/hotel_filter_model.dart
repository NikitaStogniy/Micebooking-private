import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/check_box/check_box_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'hotel_filter_widget.dart' show HotelFilterWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HotelFilterModel extends FlutterFlowModel<HotelFilterWidget> {
  ///  Local state fields for this component.

  double? minPrice = 0.0;

  double? maxPrice = 100000.0;

  List<int> stars = [];
  void addToStars(int item) => stars.add(item);
  void removeFromStars(int item) => stars.remove(item);
  void removeAtIndexFromStars(int index) => stars.removeAt(index);
  void insertAtIndexInStars(int index, int item) => stars.insert(index, item);
  void updateStarsAtIndex(int index, Function(int) updateFn) =>
      stars[index] = updateFn(stars[index]);

  double? minDistance = 0.0;

  double? maxDistance = 100000.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered5 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered6 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered7 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered8 = false;
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
