import '/flutter_flow/flutter_flow_util.dart';
import '/superuser_flow/add_new/add_new_widget.dart';
import '/superuser_flow/info_component/info_component_widget.dart';
import 'food_settings_widget.dart' show FoodSettingsWidget;
import 'package:flutter/material.dart';

class FoodSettingsModel extends FlutterFlowModel<FoodSettingsWidget> {
  ///  Local state fields for this component.

  int? editService;

  String? addNew;

  ///  State fields for stateful widgets in this component.

  // Models for InfoComponent dynamic component.
  late FlutterFlowDynamicModels<InfoComponentModel> infoComponentModels;
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
}
