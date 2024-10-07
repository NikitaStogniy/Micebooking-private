import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_room_widget.dart' show EditRoomWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditRoomModel extends FlutterFlowModel<EditRoomWidget> {
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

  RoomRow? editableRoom;

  bool singlePerson = false;

  List<int> newRoomSet = [];
  void addToNewRoomSet(int item) => newRoomSet.add(item);
  void removeFromNewRoomSet(int item) => newRoomSet.remove(item);
  void removeAtIndexFromNewRoomSet(int index) => newRoomSet.removeAt(index);
  void insertAtIndexInNewRoomSet(int index, int item) =>
      newRoomSet.insert(index, item);
  void updateNewRoomSetAtIndex(int index, Function(int) updateFn) =>
      newRoomSet[index] = updateFn(newRoomSet[index]);

  HotelRow? editableHotel;

  List<String> newImages = [];
  void addToNewImages(String item) => newImages.add(item);
  void removeFromNewImages(String item) => newImages.remove(item);
  void removeAtIndexFromNewImages(int index) => newImages.removeAt(index);
  void insertAtIndexInNewImages(int index, String item) =>
      newImages.insert(index, item);
  void updateNewImagesAtIndex(int index, Function(String) updateFn) =>
      newImages[index] = updateFn(newImages[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for hotelName_edit widget.
  FocusNode? hotelNameEditFocusNode;
  TextEditingController? hotelNameEditTextController;
  String? Function(BuildContext, String?)? hotelNameEditTextControllerValidator;
  // State field(s) for hotelDescription_edit widget.
  FocusNode? hotelDescriptionEditFocusNode;
  TextEditingController? hotelDescriptionEditTextController;
  String? Function(BuildContext, String?)?
      hotelDescriptionEditTextControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for count_edit widget.
  FocusNode? countEditFocusNode;
  TextEditingController? countEditTextController;
  String? Function(BuildContext, String?)? countEditTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for price_edit widget.
  FocusNode? priceEditFocusNode;
  TextEditingController? priceEditTextController;
  String? Function(BuildContext, String?)? priceEditTextControllerValidator;
  // State field(s) for single_price_edit widget.
  FocusNode? singlePriceEditFocusNode;
  TextEditingController? singlePriceEditTextController;
  String? Function(BuildContext, String?)?
      singlePriceEditTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    hotelNameEditFocusNode?.dispose();
    hotelNameEditTextController?.dispose();

    hotelDescriptionEditFocusNode?.dispose();
    hotelDescriptionEditTextController?.dispose();

    countEditFocusNode?.dispose();
    countEditTextController?.dispose();

    priceEditFocusNode?.dispose();
    priceEditTextController?.dispose();

    singlePriceEditFocusNode?.dispose();
    singlePriceEditTextController?.dispose();
  }
}
