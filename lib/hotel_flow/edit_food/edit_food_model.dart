import '/backend/supabase/supabase.dart';
import '/components/dropdown_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_food_widget.dart' show EditFoodWidget;
import 'package:flutter/material.dart';

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

  String? type;

  ///  State fields for stateful widgets in this component.

  // State field(s) for edit_name widget.
  FocusNode? editNameFocusNode;
  TextEditingController? editNameTextController;
  String? Function(BuildContext, String?)? editNameTextControllerValidator;
  // State field(s) for edit_category widget.
  String? editCategoryValue;
  FormFieldController<String>? editCategoryValueController;
  // State field(s) for edit_price widget.
  FocusNode? editPriceFocusNode;
  TextEditingController? editPriceTextController;
  String? Function(BuildContext, String?)? editPriceTextControllerValidator;
  // Models for dropdownComp dynamic component.
  late FlutterFlowDynamicModels<DropdownCompModel> dropdownCompModels;
  // State field(s) for AddMenuPosition widget.
  FocusNode? addMenuPositionFocusNode;
  TextEditingController? addMenuPositionTextController;
  String? Function(BuildContext, String?)?
      addMenuPositionTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  FoodPositionRow? newRow;

  @override
  void initState(BuildContext context) {
    dropdownCompModels = FlutterFlowDynamicModels(() => DropdownCompModel());
  }

  @override
  void dispose() {
    editNameFocusNode?.dispose();
    editNameTextController?.dispose();

    editPriceFocusNode?.dispose();
    editPriceTextController?.dispose();

    dropdownCompModels.dispose();
    addMenuPositionFocusNode?.dispose();
    addMenuPositionTextController?.dispose();
  }
}
