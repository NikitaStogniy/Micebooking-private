import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'hall_seating_comp_widget.dart' show HallSeatingCompWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HallSeatingCompModel extends FlutterFlowModel<HallSeatingCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for seat_capacity widget.
  FocusNode? seatCapacityFocusNode;
  TextEditingController? seatCapacityTextController;
  String? Function(BuildContext, String?)? seatCapacityTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    seatCapacityFocusNode?.dispose();
    seatCapacityTextController?.dispose();
  }
}
