import '/backend/supabase/supabase.dart';
import '/components/client_food_component_widget.dart';
import '/components/client_hall_component_widget.dart';
import '/components/client_hotel_component_widget.dart';
import '/components/client_optional_widget.dart';
import '/components/client_room_component_widget.dart';
import '/components/edit_request_hotel_component_widget.dart';
import '/components/footer_widget.dart';
import '/components/hotel_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/menu/menu_widget.dart';
import 'dart:async';
import 'hotel_search_page_widget.dart' show HotelSearchPageWidget;
import 'package:flutter/material.dart';

class HotelSearchPageModel extends FlutterFlowModel<HotelSearchPageWidget> {
  ///  Local state fields for this page.

  bool isRegister = false;

  bool isHotel = true;

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

  bool foodIsOpen = false;

  bool roomsIsOpen = false;

  bool foodIsSkip = false;

  bool roomisSkip = false;

  List<int> chosenFood = [];
  void addToChosenFood(int item) => chosenFood.add(item);
  void removeFromChosenFood(int item) => chosenFood.remove(item);
  void removeAtIndexFromChosenFood(int index) => chosenFood.removeAt(index);
  void insertAtIndexInChosenFood(int index, int item) =>
      chosenFood.insert(index, item);
  void updateChosenFoodAtIndex(int index, Function(int) updateFn) =>
      chosenFood[index] = updateFn(chosenFood[index]);

  List<int> choosenRooms = [];
  void addToChoosenRooms(int item) => choosenRooms.add(item);
  void removeFromChoosenRooms(int item) => choosenRooms.remove(item);
  void removeAtIndexFromChoosenRooms(int index) => choosenRooms.removeAt(index);
  void insertAtIndexInChoosenRooms(int index, int item) =>
      choosenRooms.insert(index, item);
  void updateChoosenRoomsAtIndex(int index, Function(int) updateFn) =>
      choosenRooms[index] = updateFn(choosenRooms[index]);

  List<double> priceHall = [];
  void addToPriceHall(double item) => priceHall.add(item);
  void removeFromPriceHall(double item) => priceHall.remove(item);
  void removeAtIndexFromPriceHall(int index) => priceHall.removeAt(index);
  void insertAtIndexInPriceHall(int index, double item) =>
      priceHall.insert(index, item);
  void updatePriceHallAtIndex(int index, Function(double) updateFn) =>
      priceHall[index] = updateFn(priceHall[index]);

  List<RequestsRow> requestList = [];
  void addToRequestList(RequestsRow item) => requestList.add(item);
  void removeFromRequestList(RequestsRow item) => requestList.remove(item);
  void removeAtIndexFromRequestList(int index) => requestList.removeAt(index);
  void insertAtIndexInRequestList(int index, RequestsRow item) =>
      requestList.insert(index, item);
  void updateRequestListAtIndex(int index, Function(RequestsRow) updateFn) =>
      requestList[index] = updateFn(requestList[index]);

  List<int> chosenHotels = [];
  void addToChosenHotels(int item) => chosenHotels.add(item);
  void removeFromChosenHotels(int item) => chosenHotels.remove(item);
  void removeAtIndexFromChosenHotels(int index) => chosenHotels.removeAt(index);
  void insertAtIndexInChosenHotels(int index, int item) =>
      chosenHotels.insert(index, item);
  void updateChosenHotelsAtIndex(int index, Function(int) updateFn) =>
      chosenHotels[index] = updateFn(chosenHotels[index]);

  List<int> listHallRequest = [];
  void addToListHallRequest(int item) => listHallRequest.add(item);
  void removeFromListHallRequest(int item) => listHallRequest.remove(item);
  void removeAtIndexFromListHallRequest(int index) =>
      listHallRequest.removeAt(index);
  void insertAtIndexInListHallRequest(int index, int item) =>
      listHallRequest.insert(index, item);
  void updateListHallRequestAtIndex(int index, Function(int) updateFn) =>
      listHallRequest[index] = updateFn(listHallRequest[index]);

  List<int> listFoodRequest = [];
  void addToListFoodRequest(int item) => listFoodRequest.add(item);
  void removeFromListFoodRequest(int item) => listFoodRequest.remove(item);
  void removeAtIndexFromListFoodRequest(int index) =>
      listFoodRequest.removeAt(index);
  void insertAtIndexInListFoodRequest(int index, int item) =>
      listFoodRequest.insert(index, item);
  void updateListFoodRequestAtIndex(int index, Function(int) updateFn) =>
      listFoodRequest[index] = updateFn(listFoodRequest[index]);

  List<int> listRoomRequest = [];
  void addToListRoomRequest(int item) => listRoomRequest.add(item);
  void removeFromListRoomRequest(int item) => listRoomRequest.remove(item);
  void removeAtIndexFromListRoomRequest(int index) =>
      listRoomRequest.removeAt(index);
  void insertAtIndexInListRoomRequest(int index, int item) =>
      listRoomRequest.insert(index, item);
  void updateListRoomRequestAtIndex(int index, Function(int) updateFn) =>
      listRoomRequest[index] = updateFn(listRoomRequest[index]);

  List<int> hotelFilterStars = [];
  void addToHotelFilterStars(int item) => hotelFilterStars.add(item);
  void removeFromHotelFilterStars(int item) => hotelFilterStars.remove(item);
  void removeAtIndexFromHotelFilterStars(int index) =>
      hotelFilterStars.removeAt(index);
  void insertAtIndexInHotelFilterStars(int index, int item) =>
      hotelFilterStars.insert(index, item);
  void updateHotelFilterStarsAtIndex(int index, Function(int) updateFn) =>
      hotelFilterStars[index] = updateFn(hotelFilterStars[index]);

  bool hotelFilterOpen = false;

  List<int> hotelFilterServices = [];
  void addToHotelFilterServices(int item) => hotelFilterServices.add(item);
  void removeFromHotelFilterServices(int item) =>
      hotelFilterServices.remove(item);
  void removeAtIndexFromHotelFilterServices(int index) =>
      hotelFilterServices.removeAt(index);
  void insertAtIndexInHotelFilterServices(int index, int item) =>
      hotelFilterServices.insert(index, item);
  void updateHotelFilterServicesAtIndex(int index, Function(int) updateFn) =>
      hotelFilterServices[index] = updateFn(hotelFilterServices[index]);

  int? hotelFilterMaxDistance = 100000;

  int? hotelFilterMinDistance = 0;

  bool filterShowAllServices = false;

  bool hallFilterOpen = false;

  List<int> favoriteHotelsList = [];
  void addToFavoriteHotelsList(int item) => favoriteHotelsList.add(item);
  void removeFromFavoriteHotelsList(int item) =>
      favoriteHotelsList.remove(item);
  void removeAtIndexFromFavoriteHotelsList(int index) =>
      favoriteHotelsList.removeAt(index);
  void insertAtIndexInFavoriteHotelsList(int index, int item) =>
      favoriteHotelsList.insert(index, item);
  void updateFavoriteHotelsListAtIndex(int index, Function(int) updateFn) =>
      favoriteHotelsList[index] = updateFn(favoriteHotelsList[index]);

  String? chosenHotelName;

  List<double> foodPrice = [];
  void addToFoodPrice(double item) => foodPrice.add(item);
  void removeFromFoodPrice(double item) => foodPrice.remove(item);
  void removeAtIndexFromFoodPrice(int index) => foodPrice.removeAt(index);
  void insertAtIndexInFoodPrice(int index, double item) =>
      foodPrice.insert(index, item);
  void updateFoodPriceAtIndex(int index, Function(double) updateFn) =>
      foodPrice[index] = updateFn(foodPrice[index]);

  List<double> roomPrice = [];
  void addToRoomPrice(double item) => roomPrice.add(item);
  void removeFromRoomPrice(double item) => roomPrice.remove(item);
  void removeAtIndexFromRoomPrice(int index) => roomPrice.removeAt(index);
  void insertAtIndexInRoomPrice(int index, double item) =>
      roomPrice.insert(index, item);
  void updateRoomPriceAtIndex(int index, Function(double) updateFn) =>
      roomPrice[index] = updateFn(roomPrice[index]);

  bool showMoreHalls = false;

  int? lastRequestId;

  int? hallFilterMaxCapacity = 100000;

  int? hallFilterMinCapacity = 0;

  List<String> hallFilterChosenSeatings = [];
  void addToHallFilterChosenSeatings(String item) =>
      hallFilterChosenSeatings.add(item);
  void removeFromHallFilterChosenSeatings(String item) =>
      hallFilterChosenSeatings.remove(item);
  void removeAtIndexFromHallFilterChosenSeatings(int index) =>
      hallFilterChosenSeatings.removeAt(index);
  void insertAtIndexInHallFilterChosenSeatings(int index, String item) =>
      hallFilterChosenSeatings.insert(index, item);
  void updateHallFilterChosenSeatingsAtIndex(
          int index, Function(String) updateFn) =>
      hallFilterChosenSeatings[index] =
          updateFn(hallFilterChosenSeatings[index]);

  int? theaterMin = 0;

  int? classMin = 0;

  int? comMin = 0;

  int? uShapeMin = 0;

  int? oShapeMin = 0;

  int? cabareMin = 0;

  int? banketMin = 0;

  int? furshetMin = 0;

  double? filterMaxPrice = 10000.0;

  List<int> filteredRooms = [];
  void addToFilteredRooms(int item) => filteredRooms.add(item);
  void removeFromFilteredRooms(int item) => filteredRooms.remove(item);
  void removeAtIndexFromFilteredRooms(int index) =>
      filteredRooms.removeAt(index);
  void insertAtIndexInFilteredRooms(int index, int item) =>
      filteredRooms.insert(index, item);
  void updateFilteredRoomsAtIndex(int index, Function(int) updateFn) =>
      filteredRooms[index] = updateFn(filteredRooms[index]);

  double? filterMinPrice = 1.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in HotelSearchPage widget.
  List<HallRow>? filteredHalls;
  // Stores action output result for [Backend Call - Query Rows] action in HotelSearchPage widget.
  List<RoomRow>? loadRooms;
  Completer<List<HotelRow>>? requestCompleter;
  // Model for Menu component.
  late MenuModel menuModel;
  // Model for HotelSearchComp component.
  late HotelSearchCompModel hotelSearchCompModel;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<RoomRow>? rooms;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<RoomRow>? deleteFiltersRooms;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RequestWrapperRow? requestWrapperCopy;
  // Models for ClientHotelComponent dynamic component.
  late FlutterFlowDynamicModels<ClientHotelComponentModel>
      clientHotelComponentModels;
  // Model for EditRequestHotelComponent component.
  late EditRequestHotelComponentModel editRequestHotelComponentModel;
  // Models for Client_Hall_Component dynamic component.
  late FlutterFlowDynamicModels<ClientHallComponentModel>
      clientHallComponentModels;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Client_Hall_Component widget.
  List<RequestsHallVarRow>? deletedHall;
  // Stores action output result for [Backend Call - Insert Row] action in Client_Hall_Component widget.
  RequestsHallVarRow? hallRequest;
  // Models for Client_Food_Component dynamic component.
  late FlutterFlowDynamicModels<ClientFoodComponentModel>
      clientFoodComponentModels;
  // Stores action output result for [Backend Call - Insert Row] action in Client_Food_Component widget.
  RequestsFoodVarRow? foodRequest;
  // Models for ClientRoomComponent dynamic component.
  late FlutterFlowDynamicModels<ClientRoomComponentModel>
      clientRoomComponentModels;
  // Stores action output result for [Backend Call - Insert Row] action in ClientRoomComponent widget.
  RequestsRoomVarRow? roomRequest;
  // Model for ClientOptional component.
  late ClientOptionalModel clientOptionalModel1;
  // Model for ClientOptional component.
  late ClientOptionalModel clientOptionalModel2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RequestsRow? requestWr;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RequestWrapperRow? requestWrapper;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RequestsRow? request;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
    hotelSearchCompModel = createModel(context, () => HotelSearchCompModel());
    clientHotelComponentModels =
        FlutterFlowDynamicModels(() => ClientHotelComponentModel());
    editRequestHotelComponentModel =
        createModel(context, () => EditRequestHotelComponentModel());
    clientHallComponentModels =
        FlutterFlowDynamicModels(() => ClientHallComponentModel());
    clientFoodComponentModels =
        FlutterFlowDynamicModels(() => ClientFoodComponentModel());
    clientRoomComponentModels =
        FlutterFlowDynamicModels(() => ClientRoomComponentModel());
    clientOptionalModel1 = createModel(context, () => ClientOptionalModel());
    clientOptionalModel2 = createModel(context, () => ClientOptionalModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuModel.dispose();
    hotelSearchCompModel.dispose();
    clientHotelComponentModels.dispose();
    editRequestHotelComponentModel.dispose();
    clientHallComponentModels.dispose();
    clientFoodComponentModels.dispose();
    clientRoomComponentModels.dispose();
    clientOptionalModel1.dispose();
    clientOptionalModel2.dispose();
    footerModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
