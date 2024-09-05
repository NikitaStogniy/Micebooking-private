import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/add_or_edit_food/add_or_edit_food_widget.dart';
import '/hotel_flow/add_or_edit_hall/add_or_edit_hall_widget.dart';
import '/hotel_flow/add_or_edit_hotel/add_or_edit_hotel_widget.dart';
import '/hotel_flow/add_or_edit_room/add_or_edit_room_widget.dart';
import '/hotel_flow/hotel_juridical/hotel_juridical_widget.dart';
import '/hotel_flow/hotels_requests/hotels_requests_widget.dart';
import '/hotel_flow/manager_info/manager_info_widget.dart';
import '/hotel_flow/profile_food/profile_food_widget.dart';
import '/hotel_flow/profile_halls/profile_halls_widget.dart';
import '/hotel_flow/profile_hotels/profile_hotels_widget.dart';
import '/hotel_flow/profile_rooms/profile_rooms_widget.dart';
import '/superuser_flow/super_requests/super_requests_widget.dart';
import 'hotel_home_widget.dart' show HotelHomeWidget;
import 'package:flutter/material.dart';

class HotelHomeModel extends FlutterFlowModel<HotelHomeWidget> {
  ///  Local state fields for this page.

  EnumHotelPage? page = EnumHotelPage.PROFILE;

  int? id = 0;

  int? hotelId = 0;

  ///  State fields for stateful widgets in this page.

  // Model for ManagerInfo component.
  late ManagerInfoModel managerInfoModel;
  // Model for profile_hotels component.
  late ProfileHotelsModel profileHotelsModel;
  // Model for add_or_edit_hotel component.
  late AddOrEditHotelModel addOrEditHotelModel;
  // Model for profile_rooms component.
  late ProfileRoomsModel profileRoomsModel;
  // Model for add_or_edit_room component.
  late AddOrEditRoomModel addOrEditRoomModel;
  // Model for profile_halls component.
  late ProfileHallsModel profileHallsModel;
  // Model for profile_food component.
  late ProfileFoodModel profileFoodModel;
  // Model for add_or_edit_hall component.
  late AddOrEditHallModel addOrEditHallModel;
  // Model for add_or_edit_food component.
  late AddOrEditFoodModel addOrEditFoodModel;
  // Model for Hotel_juridical component.
  late HotelJuridicalModel hotelJuridicalModel;
  // Model for Hotels_requests component.
  late HotelsRequestsModel hotelsRequestsModel;
  // Model for super_requests component.
  late SuperRequestsModel superRequestsModel;

  @override
  void initState(BuildContext context) {
    managerInfoModel = createModel(context, () => ManagerInfoModel());
    profileHotelsModel = createModel(context, () => ProfileHotelsModel());
    addOrEditHotelModel = createModel(context, () => AddOrEditHotelModel());
    profileRoomsModel = createModel(context, () => ProfileRoomsModel());
    addOrEditRoomModel = createModel(context, () => AddOrEditRoomModel());
    profileHallsModel = createModel(context, () => ProfileHallsModel());
    profileFoodModel = createModel(context, () => ProfileFoodModel());
    addOrEditHallModel = createModel(context, () => AddOrEditHallModel());
    addOrEditFoodModel = createModel(context, () => AddOrEditFoodModel());
    hotelJuridicalModel = createModel(context, () => HotelJuridicalModel());
    hotelsRequestsModel = createModel(context, () => HotelsRequestsModel());
    superRequestsModel = createModel(context, () => SuperRequestsModel());
  }

  @override
  void dispose() {
    managerInfoModel.dispose();
    profileHotelsModel.dispose();
    addOrEditHotelModel.dispose();
    profileRoomsModel.dispose();
    addOrEditRoomModel.dispose();
    profileHallsModel.dispose();
    profileFoodModel.dispose();
    addOrEditHallModel.dispose();
    addOrEditFoodModel.dispose();
    hotelJuridicalModel.dispose();
    hotelsRequestsModel.dispose();
    superRequestsModel.dispose();
  }
}
