import '/backend/supabase/supabase.dart';
import '/components/calendar_seasons_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pop_up/confirm_action/confirm_action_widget.dart';
import 'room_season_element_widget.dart' show RoomSeasonElementWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RoomSeasonElementModel extends FlutterFlowModel<RoomSeasonElementWidget> {
  ///  Local state fields for this component.

  bool isEdit = false;

  DateTime? dayStart;

  DateTime? dayEnd;

  String? seasonName;

  double? price;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in room_season_element widget.
  List<RoomSeasonElementRow>? elementMain;
  // Stores action output result for [Backend Call - Query Rows] action in room_season_element widget.
  List<RoomSeasonElementRow>? element;
  // Stores action output result for [Backend Call - Query Rows] action in room_season_element widget.
  List<RoomSeasonElementRow>? elementMain2;
  // Stores action output result for [Backend Call - Query Rows] action in room_season_element widget.
  List<RoomSeasonElementRow>? element2;
  // State field(s) for name_edit widget.
  FocusNode? nameEditFocusNode;
  TextEditingController? nameEditTextController;
  String? Function(BuildContext, String?)? nameEditTextControllerValidator;
  // State field(s) for dateHover widget.
  bool dateHoverHovered = false;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameEditFocusNode?.dispose();
    nameEditTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();
  }
}
