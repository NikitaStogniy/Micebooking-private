import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'hotel_requests_component_widget.dart' show HotelRequestsComponentWidget;
import 'package:flutter/material.dart';

class HotelRequestsComponentModel
    extends FlutterFlowModel<HotelRequestsComponentWidget> {
  ///  Local state fields for this component.

  bool showMore = false;

  bool onlyCompleteFilter = false;

  int? rebuilder;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<RequestsRow, bool> checkboxValueMap1 = {};
  List<RequestsRow> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<RequestsRow, bool> checkboxValueMap2 = {};
  List<RequestsRow> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
