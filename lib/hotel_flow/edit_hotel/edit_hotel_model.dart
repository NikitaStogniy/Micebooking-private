import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/uikit/check_box/check_box_widget.dart';
import 'edit_hotel_widget.dart' show EditHotelWidget;
import 'package:flutter/material.dart';

class EditHotelModel extends FlutterFlowModel<EditHotelWidget> {
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

  HotelRow? editableHotel;

  String? currentCity;

  int? currentCityId;

  bool newCity = false;

  List<String> allCity = [];
  void addToAllCity(String item) => allCity.add(item);
  void removeFromAllCity(String item) => allCity.remove(item);
  void removeAtIndexFromAllCity(int index) => allCity.removeAt(index);
  void insertAtIndexInAllCity(int index, String item) =>
      allCity.insert(index, item);
  void updateAllCityAtIndex(int index, Function(String) updateFn) =>
      allCity[index] = updateFn(allCity[index]);

  bool changeCity = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for hotelName_edit widget.
  FocusNode? hotelNameEditFocusNode;
  TextEditingController? hotelNameEditTextController;
  String? Function(BuildContext, String?)? hotelNameEditTextControllerValidator;
  // State field(s) for hotelAddress_edit widget.
  FocusNode? hotelAddressEditFocusNode;
  TextEditingController? hotelAddressEditTextController;
  String? Function(BuildContext, String?)?
      hotelAddressEditTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<CityRow>? cityId;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for canter widget.
  FocusNode? canterFocusNode;
  TextEditingController? canterTextController;
  String? Function(BuildContext, String?)? canterTextControllerValidator;
  // State field(s) for capacity widget.
  FocusNode? capacityFocusNode;
  TextEditingController? capacityTextController;
  String? Function(BuildContext, String?)? capacityTextControllerValidator;
  // State field(s) for max_capacity widget.
  FocusNode? maxCapacityFocusNode;
  TextEditingController? maxCapacityTextController;
  String? Function(BuildContext, String?)? maxCapacityTextControllerValidator;
  // State field(s) for link widget.
  FocusNode? linkFocusNode;
  TextEditingController? linkTextController;
  String? Function(BuildContext, String?)? linkTextControllerValidator;
  // State field(s) for hotelDescription_edit widget.
  FocusNode? hotelDescriptionEditFocusNode;
  TextEditingController? hotelDescriptionEditTextController;
  String? Function(BuildContext, String?)?
      hotelDescriptionEditTextControllerValidator;
  // State field(s) for RatingBar_edit widget.
  double? ratingBarEditValue;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // Models for checkBox dynamic component.
  late FlutterFlowDynamicModels<CheckBoxModel> checkBoxModels;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<HotelRow>? editHotCopy;

  @override
  void initState(BuildContext context) {
    checkBoxModels = FlutterFlowDynamicModels(() => CheckBoxModel());
  }

  @override
  void dispose() {
    hotelNameEditFocusNode?.dispose();
    hotelNameEditTextController?.dispose();

    hotelAddressEditFocusNode?.dispose();
    hotelAddressEditTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    canterFocusNode?.dispose();
    canterTextController?.dispose();

    capacityFocusNode?.dispose();
    capacityTextController?.dispose();

    maxCapacityFocusNode?.dispose();
    maxCapacityTextController?.dispose();

    linkFocusNode?.dispose();
    linkTextController?.dispose();

    hotelDescriptionEditFocusNode?.dispose();
    hotelDescriptionEditTextController?.dispose();

    checkBoxModels.dispose();
  }
}
