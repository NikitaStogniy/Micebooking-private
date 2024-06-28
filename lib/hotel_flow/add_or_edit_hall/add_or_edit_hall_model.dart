import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/hall_seating_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/edit_hall/edit_hall_widget.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'add_or_edit_hall_widget.dart' show AddOrEditHallWidget;
import 'package:flutter/material.dart';

class AddOrEditHallModel extends FlutterFlowModel<AddOrEditHallWidget> {
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

  List<int> selectedServices = [0];
  void addToSelectedServices(int item) => selectedServices.add(item);
  void removeFromSelectedServices(int item) => selectedServices.remove(item);
  void removeAtIndexFromSelectedServices(int index) =>
      selectedServices.removeAt(index);
  void insertAtIndexInSelectedServices(int index, int item) =>
      selectedServices.insert(index, item);
  void updateSelectedServicesAtIndex(int index, Function(int) updateFn) =>
      selectedServices[index] = updateFn(selectedServices[index]);

  List<int> hallList = [];
  void addToHallList(int item) => hallList.add(item);
  void removeFromHallList(int item) => hallList.remove(item);
  void removeAtIndexFromHallList(int index) => hallList.removeAt(index);
  void insertAtIndexInHallList(int index, int item) =>
      hallList.insert(index, item);
  void updateHallListAtIndex(int index, Function(int) updateFn) =>
      hallList[index] = updateFn(hallList[index]);

  HotelRow? hotel;

  List<HotelSeatingStruct> seating = [];
  void addToSeating(HotelSeatingStruct item) => seating.add(item);
  void removeFromSeating(HotelSeatingStruct item) => seating.remove(item);
  void removeAtIndexFromSeating(int index) => seating.removeAt(index);
  void insertAtIndexInSeating(int index, HotelSeatingStruct item) =>
      seating.insert(index, item);
  void updateSeatingAtIndex(int index, Function(HotelSeatingStruct) updateFn) =>
      seating[index] = updateFn(seating[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for size widget.
  FocusNode? sizeFocusNode;
  TextEditingController? sizeTextController;
  String? Function(BuildContext, String?)? sizeTextControllerValidator;
  // State field(s) for capacity widget.
  FocusNode? capacityFocusNode;
  TextEditingController? capacityTextController;
  String? Function(BuildContext, String?)? capacityTextControllerValidator;
  // Models for hall_seating_comp dynamic component.
  late FlutterFlowDynamicModels<HallSeatingCompModel> hallSeatingCompModels;
  // Models for checkBox dynamic component.
  late FlutterFlowDynamicModels<CheckBoxModel> checkBoxModels;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // State field(s) for half_price widget.
  FocusNode? halfPriceFocusNode;
  TextEditingController? halfPriceTextController;
  String? Function(BuildContext, String?)? halfPriceTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<HotelRow>? hotelOfHall;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  HallRow? newHall;
  // Model for edit_hall component.
  late EditHallModel editHallModel;

  @override
  void initState(BuildContext context) {
    hallSeatingCompModels =
        FlutterFlowDynamicModels(() => HallSeatingCompModel());
    checkBoxModels = FlutterFlowDynamicModels(() => CheckBoxModel());
    editHallModel = createModel(context, () => EditHallModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    sizeFocusNode?.dispose();
    sizeTextController?.dispose();

    capacityFocusNode?.dispose();
    capacityTextController?.dispose();

    hallSeatingCompModels.dispose();
    checkBoxModels.dispose();
    priceFocusNode?.dispose();
    priceTextController?.dispose();

    halfPriceFocusNode?.dispose();
    halfPriceTextController?.dispose();

    editHallModel.dispose();
  }
}
