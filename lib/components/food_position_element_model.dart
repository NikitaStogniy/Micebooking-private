import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'food_position_element_widget.dart' show FoodPositionElementWidget;
import 'package:flutter/material.dart';

class FoodPositionElementModel
    extends FlutterFlowModel<FoodPositionElementWidget> {
  ///  Local state fields for this component.

  bool edit = false;

  int? categoryId;

  String? categotyName;

  List<int> mergePosition = [];
  void addToMergePosition(int item) => mergePosition.add(item);
  void removeFromMergePosition(int item) => mergePosition.remove(item);
  void removeAtIndexFromMergePosition(int index) =>
      mergePosition.removeAt(index);
  void insertAtIndexInMergePosition(int index, int item) =>
      mergePosition.insert(index, item);
  void updateMergePositionAtIndex(int index, Function(int) updateFn) =>
      mergePosition[index] = updateFn(mergePosition[index]);

  String? name;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<ServiceCategoryRow>? category;
  Completer<List<ServiceCategoryRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
