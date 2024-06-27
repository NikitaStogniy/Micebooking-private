import '/backend/schema/structs/index.dart';
import '/components/hall_seating_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'edit_hall_widget.dart' show EditHallWidget;
import 'package:flutter/material.dart';

class EditHallModel extends FlutterFlowModel<EditHallWidget> {
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

  List<int> selectedServices = [];
  void addToSelectedServices(int item) => selectedServices.add(item);
  void removeFromSelectedServices(int item) => selectedServices.remove(item);
  void removeAtIndexFromSelectedServices(int index) =>
      selectedServices.removeAt(index);
  void insertAtIndexInSelectedServices(int index, int item) =>
      selectedServices.insert(index, item);
  void updateSelectedServicesAtIndex(int index, Function(int) updateFn) =>
      selectedServices[index] = updateFn(selectedServices[index]);

  List<HotelSeatingStruct> seating = [];
  void addToSeating(HotelSeatingStruct item) => seating.add(item);
  void removeFromSeating(HotelSeatingStruct item) => seating.remove(item);
  void removeAtIndexFromSeating(int index) => seating.removeAt(index);
  void insertAtIndexInSeating(int index, HotelSeatingStruct item) =>
      seating.insert(index, item);
  void updateSeatingAtIndex(int index, Function(HotelSeatingStruct) updateFn) =>
      seating[index] = updateFn(seating[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for name_edit widget.
  FocusNode? nameEditFocusNode;
  TextEditingController? nameEditTextController;
  String? Function(BuildContext, String?)? nameEditTextControllerValidator;
  // State field(s) for description_edit widget.
  FocusNode? descriptionEditFocusNode;
  TextEditingController? descriptionEditTextController;
  String? Function(BuildContext, String?)?
      descriptionEditTextControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for size_edit widget.
  FocusNode? sizeEditFocusNode;
  TextEditingController? sizeEditTextController;
  String? Function(BuildContext, String?)? sizeEditTextControllerValidator;
  // State field(s) for capacity_edit widget.
  FocusNode? capacityEditFocusNode;
  TextEditingController? capacityEditTextController;
  String? Function(BuildContext, String?)? capacityEditTextControllerValidator;
  // Models for hall_seating_comp dynamic component.
  late FlutterFlowDynamicModels<HallSeatingCompModel> hallSeatingCompModels;
  // Models for checkBox dynamic component.
  late FlutterFlowDynamicModels<CheckBoxModel> checkBoxModels;
  // State field(s) for price_edit widget.
  FocusNode? priceEditFocusNode;
  TextEditingController? priceEditTextController;
  String? Function(BuildContext, String?)? priceEditTextControllerValidator;
  // State field(s) for half_price_edit widget.
  FocusNode? halfPriceEditFocusNode;
  TextEditingController? halfPriceEditTextController;
  String? Function(BuildContext, String?)? halfPriceEditTextControllerValidator;

  @override
  void initState(BuildContext context) {
    hallSeatingCompModels =
        FlutterFlowDynamicModels(() => HallSeatingCompModel());
    checkBoxModels = FlutterFlowDynamicModels(() => CheckBoxModel());
  }

  @override
  void dispose() {
    nameEditFocusNode?.dispose();
    nameEditTextController?.dispose();

    descriptionEditFocusNode?.dispose();
    descriptionEditTextController?.dispose();

    sizeEditFocusNode?.dispose();
    sizeEditTextController?.dispose();

    capacityEditFocusNode?.dispose();
    capacityEditTextController?.dispose();

    hallSeatingCompModels.dispose();
    checkBoxModels.dispose();
    priceEditFocusNode?.dispose();
    priceEditTextController?.dispose();

    halfPriceEditFocusNode?.dispose();
    halfPriceEditTextController?.dispose();
  }
}
