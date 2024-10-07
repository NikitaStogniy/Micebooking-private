import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/cms/super_service_elment/super_service_elment_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pop_up/confirm_action/confirm_action_widget.dart';
import '/superuser_flow/add_new/add_new_widget.dart';
import '/superuser_flow/info_component/info_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'hotel_settings_widget.dart' show HotelSettingsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HotelSettingsModel extends FlutterFlowModel<HotelSettingsWidget> {
  ///  Local state fields for this component.

  int? editService;

  int? editCity;

  int? editDestination;

  String? addNew;

  int? editCategoryService;

  bool newCategory = false;

  int? updater;

  List<int> newServices = [];
  void addToNewServices(int item) => newServices.add(item);
  void removeFromNewServices(int item) => newServices.remove(item);
  void removeAtIndexFromNewServices(int index) => newServices.removeAt(index);
  void insertAtIndexInNewServices(int index, int item) =>
      newServices.insert(index, item);
  void updateNewServicesAtIndex(int index, Function(int) updateFn) =>
      newServices[index] = updateFn(newServices[index]);

  ///  State fields for stateful widgets in this component.

  Completer<List<ServiceCategoryRow>>? requestCompleter1;
  Completer<List<ServiceCategoryRow>>? requestCompleter2;
  // State field(s) for newCategory widget.
  FocusNode? newCategoryFocusNode;
  TextEditingController? newCategoryTextController;
  String? Function(BuildContext, String?)? newCategoryTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in super_service_elment widget.
  ServiceRow? newService;
  Completer<List<CityRow>>? requestCompleter4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for addNew component.
  late AddNewModel addNewModel1;
  // Models for InfoComponent dynamic component.
  late FlutterFlowDynamicModels<InfoComponentModel> infoComponentModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Model for addNew component.
  late AddNewModel addNewModel2;
  Completer<List<CenterDistanceRow>>? requestCompleter3;

  @override
  void initState(BuildContext context) {
    addNewModel1 = createModel(context, () => AddNewModel());
    infoComponentModels = FlutterFlowDynamicModels(() => InfoComponentModel());
    addNewModel2 = createModel(context, () => AddNewModel());
  }

  @override
  void dispose() {
    newCategoryFocusNode?.dispose();
    newCategoryTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    addNewModel1.dispose();
    infoComponentModels.dispose();
    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    addNewModel2.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
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
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
