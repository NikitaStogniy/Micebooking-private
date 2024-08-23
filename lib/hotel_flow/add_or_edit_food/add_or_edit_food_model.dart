import '/backend/supabase/supabase.dart';
import '/components/dropdown_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/hotel_flow/edit_food/edit_food_widget.dart';
import 'add_or_edit_food_widget.dart' show AddOrEditFoodWidget;
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
  // State field(s) for create_price widget.
  FocusNode? createPriceFocusNode;
  TextEditingController? createPriceTextController;
  String? Function(BuildContext, String?)? createPriceTextControllerValidator;
  // Models for dropdownComp dynamic component.
  late FlutterFlowDynamicModels<DropdownCompModel> dropdownCompModels;
  // State field(s) for create_addmenu widget.
  FocusNode? createAddmenuFocusNode;
  TextEditingController? createAddmenuTextController;
  String? Function(BuildContext, String?)? createAddmenuTextControllerValidator;
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
    dropdownCompModels = FlutterFlowDynamicModels(() => DropdownCompModel());
    editFoodModel = createModel(context, () => EditFoodModel());
  }

  @override
  void dispose() {
    createNameFocusNode?.dispose();
    createNameTextController?.dispose();

    createPriceFocusNode?.dispose();
    createPriceTextController?.dispose();

    dropdownCompModels.dispose();
    createAddmenuFocusNode?.dispose();
    createAddmenuTextController?.dispose();

    editFoodModel.dispose();
  }
}
