import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pop_up/confirm_action/confirm_action_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_hall_widget.dart' show EditHallWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  // State field(s) for theatre widget.
  FocusNode? theatreFocusNode;
  TextEditingController? theatreTextController;
  String? Function(BuildContext, String?)? theatreTextControllerValidator;
  // State field(s) for clas widget.
  FocusNode? clasFocusNode;
  TextEditingController? clasTextController;
  String? Function(BuildContext, String?)? clasTextControllerValidator;
  // State field(s) for comm widget.
  FocusNode? commFocusNode;
  TextEditingController? commTextController;
  String? Function(BuildContext, String?)? commTextControllerValidator;
  // State field(s) for ushape widget.
  FocusNode? ushapeFocusNode;
  TextEditingController? ushapeTextController;
  String? Function(BuildContext, String?)? ushapeTextControllerValidator;
  // State field(s) for oshape widget.
  FocusNode? oshapeFocusNode;
  TextEditingController? oshapeTextController;
  String? Function(BuildContext, String?)? oshapeTextControllerValidator;
  // State field(s) for kabare widget.
  FocusNode? kabareFocusNode;
  TextEditingController? kabareTextController;
  String? Function(BuildContext, String?)? kabareTextControllerValidator;
  // State field(s) for banket widget.
  FocusNode? banketFocusNode;
  TextEditingController? banketTextController;
  String? Function(BuildContext, String?)? banketTextControllerValidator;
  // State field(s) for furshet widget.
  FocusNode? furshetFocusNode;
  TextEditingController? furshetTextController;
  String? Function(BuildContext, String?)? furshetTextControllerValidator;
  // State field(s) for price_edit widget.
  FocusNode? priceEditFocusNode;
  TextEditingController? priceEditTextController;
  String? Function(BuildContext, String?)? priceEditTextControllerValidator;
  // State field(s) for half_price_edit widget.
  FocusNode? halfPriceEditFocusNode;
  TextEditingController? halfPriceEditTextController;
  String? Function(BuildContext, String?)? halfPriceEditTextControllerValidator;

  @override
  void initState(BuildContext context) {}

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

    theatreFocusNode?.dispose();
    theatreTextController?.dispose();

    clasFocusNode?.dispose();
    clasTextController?.dispose();

    commFocusNode?.dispose();
    commTextController?.dispose();

    ushapeFocusNode?.dispose();
    ushapeTextController?.dispose();

    oshapeFocusNode?.dispose();
    oshapeTextController?.dispose();

    kabareFocusNode?.dispose();
    kabareTextController?.dispose();

    banketFocusNode?.dispose();
    banketTextController?.dispose();

    furshetFocusNode?.dispose();
    furshetTextController?.dispose();

    priceEditFocusNode?.dispose();
    priceEditTextController?.dispose();

    halfPriceEditFocusNode?.dispose();
    halfPriceEditTextController?.dispose();
  }
}
