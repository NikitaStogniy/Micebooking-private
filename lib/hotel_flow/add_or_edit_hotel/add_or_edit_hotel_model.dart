import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/hotel_flow/edit_hotel/edit_hotel_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_or_edit_hotel_widget.dart' show AddOrEditHotelWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddOrEditHotelModel extends FlutterFlowModel<AddOrEditHotelWidget> {
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

  bool haventCity = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for hotelName widget.
  FocusNode? hotelNameFocusNode;
  TextEditingController? hotelNameTextController;
  String? Function(BuildContext, String?)? hotelNameTextControllerValidator;
  // State field(s) for adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressTextController;
  String? Function(BuildContext, String?)? adressTextControllerValidator;
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
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
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
  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descTextController;
  String? Function(BuildContext, String?)? descTextControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for Checkbox widget.
  Map<ServiceRow, bool> checkboxValueMap2 = {};
  List<ServiceRow> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  HotelRow? newHot2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  HotelRow? newHot;
  // Model for edit_hotel component.
  late EditHotelModel editHotelModel;

  @override
  void initState(BuildContext context) {
    editHotelModel = createModel(context, () => EditHotelModel());
  }

  @override
  void dispose() {
    hotelNameFocusNode?.dispose();
    hotelNameTextController?.dispose();

    adressFocusNode?.dispose();
    adressTextController?.dispose();

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

    descFocusNode?.dispose();
    descTextController?.dispose();

    editHotelModel.dispose();
  }
}
