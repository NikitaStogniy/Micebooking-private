import '/backend/schema/structs/index.dart';
import '/components/visitors_count_filters_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'hall_filter_widget.dart' show HallFilterWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HallFilterModel extends FlutterFlowModel<HallFilterWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for dis1 widget.
  bool? dis1Value;
  // State field(s) for dis1-3 widget.
  bool? dis13Value;
  // State field(s) for dis3-5 widget.
  bool? dis35Value;
  // State field(s) for dis5 widget.
  bool? dis5Value;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // Model for VisitorsCountFilters component.
  late VisitorsCountFiltersModel visitorsCountFiltersModel;

  @override
  void initState(BuildContext context) {
    visitorsCountFiltersModel =
        createModel(context, () => VisitorsCountFiltersModel());
  }

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    visitorsCountFiltersModel.dispose();
  }
}
