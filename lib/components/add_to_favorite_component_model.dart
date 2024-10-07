import '/backend/supabase/supabase.dart';
import '/components/check_box_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_to_favorite_component_widget.dart'
    show AddToFavoriteComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddToFavoriteComponentModel
    extends FlutterFlowModel<AddToFavoriteComponentWidget> {
  ///  Local state fields for this component.

  List<int> varHotels = [];
  void addToVarHotels(int item) => varHotels.add(item);
  void removeFromVarHotels(int item) => varHotels.remove(item);
  void removeAtIndexFromVarHotels(int index) => varHotels.removeAt(index);
  void insertAtIndexInVarHotels(int index, int item) =>
      varHotels.insert(index, item);
  void updateVarHotelsAtIndex(int index, Function(int) updateFn) =>
      varHotels[index] = updateFn(varHotels[index]);

  ///  State fields for stateful widgets in this component.

  // Models for checkBoxComp dynamic component.
  late FlutterFlowDynamicModels<CheckBoxCompModel> checkBoxCompModels;

  @override
  void initState(BuildContext context) {
    checkBoxCompModels = FlutterFlowDynamicModels(() => CheckBoxCompModel());
  }

  @override
  void dispose() {
    checkBoxCompModels.dispose();
  }
}
