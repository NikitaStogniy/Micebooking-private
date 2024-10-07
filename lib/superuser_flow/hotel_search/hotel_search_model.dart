import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/check_box/check_box_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'hotel_search_widget.dart' show HotelSearchWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HotelSearchModel extends FlutterFlowModel<HotelSearchWidget> {
  ///  Local state fields for this component.

  int? editService;

  String? addNew;

  int? updater = 88;

  bool? filterActive = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Models for checkBox dynamic component.
  late FlutterFlowDynamicModels<CheckBoxModel> checkBoxModels;

  @override
  void initState(BuildContext context) {
    checkBoxModels = FlutterFlowDynamicModels(() => CheckBoxModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    checkBoxModels.dispose();
  }
}
