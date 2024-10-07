import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/empty_states/images_empty/images_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'room_full_info_widget.dart' show RoomFullInfoWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
