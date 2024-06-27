import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/client_seating_comp_copy_widget.dart';
import '/components/client_seating_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'visitors_count_filters_widget.dart' show VisitorsCountFiltersWidget;
import 'package:flutter/material.dart';

class VisitorsCountFiltersModel
    extends FlutterFlowModel<VisitorsCountFiltersWidget> {
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

  // Models for ClientSeating_comp dynamic component.
  late FlutterFlowDynamicModels<ClientSeatingCompModel> clientSeatingCompModels;
  // Model for ClientSeating_compCopy component.
  late ClientSeatingCompCopyModel clientSeatingCompCopyModel1;
  // Model for ClientSeating_compCopy component.
  late ClientSeatingCompCopyModel clientSeatingCompCopyModel2;
  // Model for ClientSeating_compCopy component.
  late ClientSeatingCompCopyModel clientSeatingCompCopyModel3;

  @override
  void initState(BuildContext context) {
    clientSeatingCompModels =
        FlutterFlowDynamicModels(() => ClientSeatingCompModel());
    clientSeatingCompCopyModel1 =
        createModel(context, () => ClientSeatingCompCopyModel());
    clientSeatingCompCopyModel2 =
        createModel(context, () => ClientSeatingCompCopyModel());
    clientSeatingCompCopyModel3 =
        createModel(context, () => ClientSeatingCompCopyModel());
  }

  @override
  void dispose() {
    clientSeatingCompModels.dispose();
    clientSeatingCompCopyModel1.dispose();
    clientSeatingCompCopyModel2.dispose();
    clientSeatingCompCopyModel3.dispose();
  }
}
