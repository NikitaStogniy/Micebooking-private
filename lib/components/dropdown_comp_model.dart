import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dropdown_comp_widget.dart' show DropdownCompWidget;
import 'package:flutter/material.dart';

class DropdownCompModel extends FlutterFlowModel<DropdownCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<ServiceCategoryRow>? category;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
