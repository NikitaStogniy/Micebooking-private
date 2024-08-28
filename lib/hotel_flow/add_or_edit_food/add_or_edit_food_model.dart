import '/backend/supabase/supabase.dart';
import '/components/food_position_element_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/hotel_flow/edit_food/edit_food_widget.dart';
import 'add_or_edit_food_widget.dart' show AddOrEditFoodWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AddOrEditFoodModel extends FlutterFlowModel<AddOrEditFoodWidget> {
  ///  Local state fields for this component.

  FoodRow? editableFood;

  List<int> newFoodSet = [];
  void addToNewFoodSet(int item) => newFoodSet.add(item);
  void removeFromNewFoodSet(int item) => newFoodSet.remove(item);
  void removeAtIndexFromNewFoodSet(int index) => newFoodSet.removeAt(index);
  void insertAtIndexInNewFoodSet(int index, int item) =>
      newFoodSet.insert(index, item);
  void updateNewFoodSetAtIndex(int index, Function(int) updateFn) =>
      newFoodSet[index] = updateFn(newFoodSet[index]);

  List<FoodPositionRow> menu = [];
  void addToMenu(FoodPositionRow item) => menu.add(item);
  void removeFromMenu(FoodPositionRow item) => menu.remove(item);
  void removeAtIndexFromMenu(int index) => menu.removeAt(index);
  void insertAtIndexInMenu(int index, FoodPositionRow item) =>
      menu.insert(index, item);
  void updateMenuAtIndex(int index, Function(FoodPositionRow) updateFn) =>
      menu[index] = updateFn(menu[index]);

  bool addMenuOpen = false;

  int? categoryId = 11;

  HotelRow? hotel;

  List<int> newFoods = [];
  void addToNewFoods(int item) => newFoods.add(item);
  void removeFromNewFoods(int item) => newFoods.remove(item);
  void removeAtIndexFromNewFoods(int index) => newFoods.removeAt(index);
  void insertAtIndexInNewFoods(int index, int item) =>
      newFoods.insert(index, item);
  void updateNewFoodsAtIndex(int index, Function(int) updateFn) =>
      newFoods[index] = updateFn(newFoods[index]);

  int? menuCategoryId = 38;

  List<int> newPositionMerge = [];
  void addToNewPositionMerge(int item) => newPositionMerge.add(item);
  void removeFromNewPositionMerge(int item) => newPositionMerge.remove(item);
  void removeAtIndexFromNewPositionMerge(int index) =>
      newPositionMerge.removeAt(index);
  void insertAtIndexInNewPositionMerge(int index, int item) =>
      newPositionMerge.insert(index, item);
  void updateNewPositionMergeAtIndex(int index, Function(int) updateFn) =>
      newPositionMerge[index] = updateFn(newPositionMerge[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for create_name widget.
  FocusNode? createNameFocusNode;
  TextEditingController? createNameTextController;
  String? Function(BuildContext, String?)? createNameTextControllerValidator;
  // State field(s) for create_category widget.
  String? createCategoryValue;
  FormFieldController<String>? createCategoryValueController;
  // Stores action output result for [Backend Call - Query Rows] action in create_category widget.
  List<ServiceCategoryRow>? currentcategotyId;
  Completer<List<ServiceCategoryRow>>? requestCompleter1;
  // State field(s) for create_price widget.
  FocusNode? createPriceFocusNode;
  TextEditingController? createPriceTextController;
  String? Function(BuildContext, String?)? createPriceTextControllerValidator;
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
  List<ServiceCategoryRow>? category;
  Completer<List<ServiceCategoryRow>>? requestCompleter2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  FoodPositionRow? newPosition;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  FoodRow? newFood;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<HotelRow>? submitHotel;
  // Model for edit_food component.
  late EditFoodModel editFoodModel;

  @override
  void initState(BuildContext context) {
    foodPositionElementModels =
        FlutterFlowDynamicModels(() => FoodPositionElementModel());
    editFoodModel = createModel(context, () => EditFoodModel());
  }

  @override
  void dispose() {
    createNameFocusNode?.dispose();
    createNameTextController?.dispose();

    createPriceFocusNode?.dispose();
    createPriceTextController?.dispose();

    foodPositionElementModels.dispose();
    createAddmenuFocusNode?.dispose();
    createAddmenuTextController?.dispose();

    editFoodModel.dispose();
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
