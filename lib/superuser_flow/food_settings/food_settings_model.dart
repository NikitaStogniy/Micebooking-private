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
  late FlutterFlowDynamicModels<InfoComponentModel> infoComponentModels;
  Completer<List<ServiceRow>>? requestCompleter;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for addNew component.
  late AddNewModel addNewModel;

  @override
  void initState(BuildContext context) {
    infoComponentModels = FlutterFlowDynamicModels(() => InfoComponentModel());
    addNewModel = createModel(context, () => AddNewModel());
  }

  @override
  void dispose() {
    infoComponentModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    addNewModel.dispose();
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
