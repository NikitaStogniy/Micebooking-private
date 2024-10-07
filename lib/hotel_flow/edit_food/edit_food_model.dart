import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/food_position_element_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'edit_food_widget.dart' show EditFoodWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditFoodModel extends FlutterFlowModel<EditFoodWidget> {
  ///  Local state fields for this component.

  List<String> uploadedImages = [];
  void addToUploadedImages(String item) => uploadedImages.add(item);
  void removeFromUploadedImages(String item) => uploadedImages.remove(item);
  void removeAtIndexFromUploadedImages(int index) =>
      uploadedImages.removeAt(index);
  void insertAtIndexInUploadedImages(int index, String item) =>
      uploadedImages.insert(index, item);
  void updateUploadedImagesAtIndex(int index, Function(String) updateFn) =>
      uploadedImages[index] = updateFn(uploadedImages[index]);

  FoodRow? editableFood;

  List<int> newFoodSet = [];
  void addToNewFoodSet(int item) => newFoodSet.add(item);
  void removeFromNewFoodSet(int item) => newFoodSet.remove(item);
  void removeAtIndexFromNewFoodSet(int index) => newFoodSet.removeAt(index);
  void insertAtIndexInNewFoodSet(int index, int item) =>
      newFoodSet.insert(index, item);
  void updateNewFoodSetAtIndex(int index, Function(int) updateFn) =>
      newFoodSet[index] = updateFn(newFoodSet[index]);

  HotelRow? editableHotel;

  List<FoodPositionRow> menu = [];
  void addToMenu(FoodPositionRow item) => menu.add(item);
  void removeFromMenu(FoodPositionRow item) => menu.remove(item);
  void removeAtIndexFromMenu(int index) => menu.removeAt(index);
  void insertAtIndexInMenu(int index, FoodPositionRow item) =>
      menu.insert(index, item);
  void updateMenuAtIndex(int index, Function(FoodPositionRow) updateFn) =>
      menu[index] = updateFn(menu[index]);

  bool addMenuOpen = false;

  String name = 'Без названия';

  bool typeChange = false;

  String? categooryName;

  int? categoryId;

  List<int> menuTest = [];
  void addToMenuTest(int item) => menuTest.add(item);
  void removeFromMenuTest(int item) => menuTest.remove(item);
  void removeAtIndexFromMenuTest(int index) => menuTest.removeAt(index);
  void insertAtIndexInMenuTest(int index, int item) =>
      menuTest.insert(index, item);
  void updateMenuTestAtIndex(int index, Function(int) updateFn) =>
      menuTest[index] = updateFn(menuTest[index]);

  List<int> currentFoodId = [];
  void addToCurrentFoodId(int item) => currentFoodId.add(item);
  void removeFromCurrentFoodId(int item) => currentFoodId.remove(item);
  void removeAtIndexFromCurrentFoodId(int index) =>
      currentFoodId.removeAt(index);
  void insertAtIndexInCurrentFoodId(int index, int item) =>
      currentFoodId.insert(index, item);
  void updateCurrentFoodIdAtIndex(int index, Function(int) updateFn) =>
      currentFoodId[index] = updateFn(currentFoodId[index]);

  int? menuCategoryId;

  List<int> mergePosition = [];
  void addToMergePosition(int item) => mergePosition.add(item);
  void removeFromMergePosition(int item) => mergePosition.remove(item);
  void removeAtIndexFromMergePosition(int index) =>
      mergePosition.removeAt(index);
  void insertAtIndexInMergePosition(int index, int item) =>
      mergePosition.insert(index, item);
  void updateMergePositionAtIndex(int index, Function(int) updateFn) =>
      mergePosition[index] = updateFn(mergePosition[index]);

  ///  State fields for stateful widgets in this component.

  Completer<List<ServiceCategoryRow>>? requestCompleter1;
  Completer<List<FoodPositionRow>>? requestCompleter2;
  // State field(s) for edit_name widget.
  FocusNode? editNameFocusNode;
  TextEditingController? editNameTextController;
  String? Function(BuildContext, String?)? editNameTextControllerValidator;
  // State field(s) for edit_category widget.
  String? editCategoryValue;
  FormFieldController<String>? editCategoryValueController;
  // Stores action output result for [Backend Call - Query Rows] action in edit_category widget.
  List<ServiceCategoryRow>? category;
  // State field(s) for edit_price widget.
  FocusNode? editPriceFocusNode;
  TextEditingController? editPriceTextController;
  String? Function(BuildContext, String?)? editPriceTextControllerValidator;
  // Models for food_position_element dynamic component.
  late FlutterFlowDynamicModels<FoodPositionElementModel>
      foodPositionElementModels;
  // State field(s) for create_addmenu widget.
  FocusNode? createAddmenuFocusNode;
  TextEditingController? createAddmenuTextController;
  String? Function(BuildContext, String?)? createAddmenuTextControllerValidator;
  // State field(s) for menuCategory widget.
  String? menuCategoryValue;
  FormFieldController<String>? menuCategoryValueController;
  // Stores action output result for [Backend Call - Query Rows] action in menuCategory widget.
  List<ServiceCategoryRow>? categoryDrop;
  Completer<List<ServiceCategoryRow>>? requestCompleter3;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  FoodPositionRow? newPosition;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<FoodRow>? here;

  @override
  void initState(BuildContext context) {
    foodPositionElementModels =
        FlutterFlowDynamicModels(() => FoodPositionElementModel());
  }

  @override
  void dispose() {
    editNameFocusNode?.dispose();
    editNameTextController?.dispose();

    editPriceFocusNode?.dispose();
    editPriceTextController?.dispose();

    foodPositionElementModels.dispose();
    createAddmenuFocusNode?.dispose();
    createAddmenuTextController?.dispose();
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
