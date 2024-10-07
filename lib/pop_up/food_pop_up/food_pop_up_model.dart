import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'food_pop_up_widget.dart' show FoodPopUpWidget;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodPopUpModel extends FlutterFlowModel<FoodPopUpWidget> {
  ///  Local state fields for this component.

  double price = 0.0;

  double days = 0.0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
