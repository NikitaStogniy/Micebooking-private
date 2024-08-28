import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/edit_room/edit_room_widget.dart';
import 'add_or_edit_room_widget.dart' show AddOrEditRoomWidget;
import 'package:flutter/material.dart';

class AddOrEditRoomModel extends FlutterFlowModel<AddOrEditRoomWidget> {
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

  ///  State fields for stateful widgets in this component.

  // State field(s) for hotelName widget.
  FocusNode? hotelNameFocusNode1;
  TextEditingController? hotelNameTextController1;
  String? Function(BuildContext, String?)? hotelNameTextController1Validator;
  // State field(s) for hotelName widget.
  FocusNode? hotelNameFocusNode2;
  TextEditingController? hotelNameTextController2;
  String? Function(BuildContext, String?)? hotelNameTextController2Validator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for count widget.
  FocusNode? countFocusNode;
  TextEditingController? countTextController;
  String? Function(BuildContext, String?)? countTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // State field(s) for single_price widget.
  FocusNode? singlePriceFocusNode;
  TextEditingController? singlePriceTextController;
  String? Function(BuildContext, String?)? singlePriceTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RoomRow? newRoom;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<HotelRow>? hotel;
  // Model for edit_room component.
  late EditRoomModel editRoomModel;

  @override
  void initState(BuildContext context) {
    editRoomModel = createModel(context, () => EditRoomModel());
  }

  @override
  void dispose() {
    hotelNameFocusNode1?.dispose();
    hotelNameTextController1?.dispose();

    hotelNameFocusNode2?.dispose();
    hotelNameTextController2?.dispose();

    countFocusNode?.dispose();
    countTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    singlePriceFocusNode?.dispose();
    singlePriceTextController?.dispose();

    editRoomModel.dispose();
  }
}
