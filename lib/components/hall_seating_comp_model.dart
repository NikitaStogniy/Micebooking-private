import '/flutter_flow/flutter_flow_util.dart';
import 'hall_seating_comp_widget.dart' show HallSeatingCompWidget;
import 'package:flutter/material.dart';

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
