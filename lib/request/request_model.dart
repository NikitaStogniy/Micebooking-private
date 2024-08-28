import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/menu/menu_widget.dart';
import 'request_widget.dart' show RequestWidget;
import 'package:flutter/material.dart';

class RequestModel extends FlutterFlowModel<RequestWidget> {
  ///  Local state fields for this page.

  int? choosedHotel;

  int step = 0;

  List<int> choosenHall = [];
  void addToChoosenHall(int item) => choosenHall.add(item);
  void removeFromChoosenHall(int item) => choosenHall.remove(item);
  void removeAtIndexFromChoosenHall(int index) => choosenHall.removeAt(index);
  void insertAtIndexInChoosenHall(int index, int item) =>
      choosenHall.insert(index, item);
  void updateChoosenHallAtIndex(int index, Function(int) updateFn) =>
      choosenHall[index] = updateFn(choosenHall[index]);

  List<FoodPositionStruct> chosenFood = [];
  void addToChosenFood(FoodPositionStruct item) => chosenFood.add(item);
  void removeFromChosenFood(FoodPositionStruct item) => chosenFood.remove(item);
  void removeAtIndexFromChosenFood(int index) => chosenFood.removeAt(index);
  void insertAtIndexInChosenFood(int index, FoodPositionStruct item) =>
      chosenFood.insert(index, item);
  void updateChosenFoodAtIndex(
          int index, Function(FoodPositionStruct) updateFn) =>
      chosenFood[index] = updateFn(chosenFood[index]);

  List<int> choosenRooms = [];
  void addToChoosenRooms(int item) => choosenRooms.add(item);
  void removeFromChoosenRooms(int item) => choosenRooms.remove(item);
  void removeAtIndexFromChoosenRooms(int index) => choosenRooms.removeAt(index);
  void insertAtIndexInChoosenRooms(int index, int item) =>
      choosenRooms.insert(index, item);
  void updateChoosenRoomsAtIndex(int index, Function(int) updateFn) =>
      choosenRooms[index] = updateFn(choosenRooms[index]);

  String requestName = 'name';

  List<int> requestId = [];
  void addToRequestId(int item) => requestId.add(item);
  void removeFromRequestId(int item) => requestId.remove(item);
  void removeAtIndexFromRequestId(int index) => requestId.removeAt(index);
  void insertAtIndexInRequestId(int index, int item) =>
      requestId.insert(index, item);
  void updateRequestIdAtIndex(int index, Function(int) updateFn) =>
      requestId[index] = updateFn(requestId[index]);

  int? wrapperId;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Menu component.
  late MenuModel menuModel;
  // State field(s) for EventNam widget.
  FocusNode? eventNamFocusNode;
  TextEditingController? eventNamTextController;
  String? Function(BuildContext, String?)? eventNamTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<RequestWrapperRow>? request;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<RequestWrapperRow>? requestMob;
  // Stores action output result for [Backend Call - API (sendemail)] action in Button widget.
  ApiCallResponse? apiResultows;
  // Stores action output result for [Backend Call - API (sendemail)] action in Button widget.
  ApiCallResponse? apiResultows2;

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    menuModel.dispose();
    eventNamFocusNode?.dispose();
    eventNamTextController?.dispose();
  }
}
