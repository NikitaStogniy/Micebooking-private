import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'room_settings_widget.dart' show RoomSettingsWidget;
import 'package:flutter/material.dart';

class RoomSettingsModel extends FlutterFlowModel<RoomSettingsWidget> {
  ///  Local state fields for this component.

  int? editService;

  String? addNew;

  bool newCategory = false;

  bool newService = false;

  int? newServiceChosenCategory;

  List<int> servicesList = [];
  void addToServicesList(int item) => servicesList.add(item);
  void removeFromServicesList(int item) => servicesList.remove(item);
  void removeAtIndexFromServicesList(int index) => servicesList.removeAt(index);
  void insertAtIndexInServicesList(int index, int item) =>
      servicesList.insert(index, item);
  void updateServicesListAtIndex(int index, Function(int) updateFn) =>
      servicesList[index] = updateFn(servicesList[index]);

  ///  State fields for stateful widgets in this component.

  Completer<List<ServiceCategoryRow>>? requestCompleter2;
  Completer<List<ServiceCategoryRow>>? requestCompleter1;
  // State field(s) for newCategory widget.
  FocusNode? newCategoryFocusNode;
  TextEditingController? newCategoryTextController;
  String? Function(BuildContext, String?)? newCategoryTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in super_service_elment widget.
  ServiceRow? newServiceRoom;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newCategoryFocusNode?.dispose();
    newCategoryTextController?.dispose();
  }

  /// Additional helper methods.
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
}
