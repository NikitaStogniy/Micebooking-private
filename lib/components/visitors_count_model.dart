import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/client_seating_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'visitors_count_widget.dart' show VisitorsCountWidget;
import 'package:flutter/material.dart';

class VisitorsCountModel extends FlutterFlowModel<VisitorsCountWidget> {
  ///  Local state fields for this component.

  int? countDublicate;

  List<HotelSeatingStruct> seatings = [];
  void addToSeatings(HotelSeatingStruct item) => seatings.add(item);
  void removeFromSeatings(HotelSeatingStruct item) => seatings.remove(item);
  void removeAtIndexFromSeatings(int index) => seatings.removeAt(index);
  void insertAtIndexInSeatings(int index, HotelSeatingStruct item) =>
      seatings.insert(index, item);
  void updateSeatingsAtIndex(
          int index, Function(HotelSeatingStruct) updateFn) =>
      seatings[index] = updateFn(seatings[index]);

  bool fieldActive = true;

  int? seatingTest;

  List<EnumSeating> enumSeatings = [];
  void addToEnumSeatings(EnumSeating item) => enumSeatings.add(item);
  void removeFromEnumSeatings(EnumSeating item) => enumSeatings.remove(item);
  void removeAtIndexFromEnumSeatings(int index) => enumSeatings.removeAt(index);
  void insertAtIndexInEnumSeatings(int index, EnumSeating item) =>
      enumSeatings.insert(index, item);
  void updateEnumSeatingsAtIndex(int index, Function(EnumSeating) updateFn) =>
      enumSeatings[index] = updateFn(enumSeatings[index]);

  HotelSeatingStruct? hall1Filter;
  void updateHall1FilterStruct(Function(HotelSeatingStruct) updateFn) {
    updateFn(hall1Filter ??= HotelSeatingStruct());
  }

  EnumSeating? seating1 = EnumSeating.theatre;

  EnumSeating? seating2 = EnumSeating.theatre;

  EnumSeating? seating3 = EnumSeating.theatre;

  ///  State fields for stateful widgets in this component.

  // State field(s) for countmob widget.
  FocusNode? countmobFocusNode;
  TextEditingController? countmobTextController;
  String? Function(BuildContext, String?)? countmobTextControllerValidator;
  // Models for ClientSeating_comp dynamic component.
  late FlutterFlowDynamicModels<ClientSeatingCompModel> clientSeatingCompModels;

  @override
  void initState(BuildContext context) {
    clientSeatingCompModels =
        FlutterFlowDynamicModels(() => ClientSeatingCompModel());
  }

  @override
  void dispose() {
    countmobFocusNode?.dispose();
    countmobTextController?.dispose();

    clientSeatingCompModels.dispose();
  }
}
