import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/superuser_flow/add_new/add_new_widget.dart';
import '/superuser_flow/info_component/info_component_widget.dart';
import 'dart:async';
import 'food_settings_widget.dart' show FoodSettingsWidget;
import 'package:flutter/material.dart';

class FoodSettingsModel extends FlutterFlowModel<FoodSettingsWidget> {
  ///  Local state fields for this component.

  int? editService;

  String? addNew;

  ///  State fields for stateful widgets in this component.

  // Models for InfoComponent dynamic component.
  late FlutterFlowDynamicModels<InfoComponentModel> infoComponentModels1;
  Completer<List<ServiceCategoryRow>>? requestCompleter1;
  // State field(s) for newFood widget.
  FocusNode? newFoodFocusNode;
  TextEditingController? newFoodTextController;
  String? Function(BuildContext, String?)? newFoodTextControllerValidator;
  // Model for addNew component.
  late AddNewModel addNewModel1;
  // Models for InfoComponent dynamic component.
  late FlutterFlowDynamicModels<InfoComponentModel> infoComponentModels2;
  Completer<List<ServiceCategoryRow>>? requestCompleter2;
  // State field(s) for newPos widget.
  FocusNode? newPosFocusNode;
  TextEditingController? newPosTextController;
  String? Function(BuildContext, String?)? newPosTextControllerValidator;
  // Model for addNew component.
  late AddNewModel addNewModel2;

  @override
  void initState(BuildContext context) {
    infoComponentModels1 = FlutterFlowDynamicModels(() => InfoComponentModel());
    addNewModel1 = createModel(context, () => AddNewModel());
    infoComponentModels2 = FlutterFlowDynamicModels(() => InfoComponentModel());
    addNewModel2 = createModel(context, () => AddNewModel());
  }

  @override
  void dispose() {
    infoComponentModels1.dispose();
    newFoodFocusNode?.dispose();
    newFoodTextController?.dispose();

    addNewModel1.dispose();
    infoComponentModels2.dispose();
    newPosFocusNode?.dispose();
    newPosTextController?.dispose();

    addNewModel2.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
