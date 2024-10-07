import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'hotel_full_info_widget.dart' show HotelFullInfoWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
