import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'hotel_detail_widget.dart' show HotelDetailWidget;
import 'package:flutter/material.dart';

class HotelDetailModel extends FlutterFlowModel<HotelDetailWidget> {
  ///  Local state fields for this component.

  int? editService;

  String? addNew;

  List<int> idList = [];
  void addToIdList(int item) => idList.add(item);
  void removeFromIdList(int item) => idList.remove(item);
  void removeAtIndexFromIdList(int index) => idList.removeAt(index);
  void insertAtIndexInIdList(int index, int item) => idList.insert(index, item);
  void updateIdListAtIndex(int index, Function(int) updateFn) =>
      idList[index] = updateFn(idList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  HallRow? newHall;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  RoomRow? newItemCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
