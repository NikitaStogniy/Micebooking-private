import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/hotel_flow/add_or_edit_food/add_or_edit_food_widget.dart';
import '/hotel_flow/add_or_edit_hall/add_or_edit_hall_widget.dart';
import '/hotel_flow/add_or_edit_room/add_or_edit_room_widget.dart';
import '/superuser_flow/client_search/client_search_widget.dart';
import '/superuser_flow/company_requests_component/company_requests_component_widget.dart';
import '/superuser_flow/edit_about/edit_about_widget.dart';
import '/superuser_flow/edit_about_us/edit_about_us_widget.dart';
import '/superuser_flow/edit_p_i/edit_p_i_widget.dart';
import '/superuser_flow/edit_p_p/edit_p_p_widget.dart';
import '/superuser_flow/edit_q_a/edit_q_a_widget.dart';
import '/superuser_flow/edit_terms/edit_terms_widget.dart';
import '/superuser_flow/edit_whyus/edit_whyus_widget.dart';
import '/superuser_flow/food_full_info/food_full_info_widget.dart';
import '/superuser_flow/food_settings/food_settings_widget.dart';
import '/superuser_flow/hall_full_info/hall_full_info_widget.dart';
import '/superuser_flow/hall_settings/hall_settings_widget.dart';
import '/superuser_flow/hotel_detail/hotel_detail_widget.dart';
import '/superuser_flow/hotel_full_info/hotel_full_info_widget.dart';
import '/superuser_flow/hotel_search/hotel_search_widget.dart';
import '/superuser_flow/hotel_settings/hotel_settings_widget.dart';
import '/superuser_flow/room_full_info/room_full_info_widget.dart';
import '/superuser_flow/room_settings/room_settings_widget.dart';
import '/superuser_flow/super_hotel_juridical/super_hotel_juridical_widget.dart';
import '/superuser_flow/super_requests/super_requests_widget.dart';
import 's_u_p_e_r_home_widget.dart' show SUPERHomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SUPERHomeModel extends FlutterFlowModel<SUPERHomeWidget> {
  ///  Local state fields for this page.

  SuperUserPage? activePage = SuperUserPage.hotel_search;

  int? foodId = 88;

  int? roomId = 88;

  int? hallId = 88;

  int? hotelId = 88;

  int? userId;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // Model for hotel_settings component.
  late HotelSettingsModel hotelSettingsModel;
  // Model for room_settings component.
  late RoomSettingsModel roomSettingsModel;
  // Model for hall_settings component.
  late HallSettingsModel hallSettingsModel;
  // Model for food_settings component.
  late FoodSettingsModel foodSettingsModel;
  // Model for hotel_search component.
  late HotelSearchModel hotelSearchModel;
  // Model for hotel_detail component.
  late HotelDetailModel hotelDetailModel;
  // Model for client_search component.
  late ClientSearchModel clientSearchModel;
  // Model for add_or_edit_room component.
  late AddOrEditRoomModel addOrEditRoomModel;
  // Model for add_or_edit_hall component.
  late AddOrEditHallModel addOrEditHallModel;
  // Model for add_or_edit_food component.
  late AddOrEditFoodModel addOrEditFoodModel;
  // Model for EditAbout component.
  late EditAboutModel editAboutModel;
  // Model for EditWhyus component.
  late EditWhyusModel editWhyusModel;
  // Model for EditAboutUs component.
  late EditAboutUsModel editAboutUsModel;
  // Model for EditQA component.
  late EditQAModel editQAModel;
  // Model for super_requests component.
  late SuperRequestsModel superRequestsModel;
  // Model for hotel_full_info component.
  late HotelFullInfoModel hotelFullInfoModel;
  // Model for hall_full_info component.
  late HallFullInfoModel hallFullInfoModel;
  // Model for food_full_info component.
  late FoodFullInfoModel foodFullInfoModel;
  // Model for room_full_info component.
  late RoomFullInfoModel roomFullInfoModel;
  // Model for company_requests_component component.
  late CompanyRequestsComponentModel companyRequestsComponentModel;
  // Model for super_Hotel_juridical component.
  late SuperHotelJuridicalModel superHotelJuridicalModel;
  // Model for EditPP component.
  late EditPPModel editPPModel;
  // Model for EditTerms component.
  late EditTermsModel editTermsModel;
  // Model for EditPI component.
  late EditPIModel editPIModel;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    hotelSettingsModel = createModel(context, () => HotelSettingsModel());
    roomSettingsModel = createModel(context, () => RoomSettingsModel());
    hallSettingsModel = createModel(context, () => HallSettingsModel());
    foodSettingsModel = createModel(context, () => FoodSettingsModel());
    hotelSearchModel = createModel(context, () => HotelSearchModel());
    hotelDetailModel = createModel(context, () => HotelDetailModel());
    clientSearchModel = createModel(context, () => ClientSearchModel());
    addOrEditRoomModel = createModel(context, () => AddOrEditRoomModel());
    addOrEditHallModel = createModel(context, () => AddOrEditHallModel());
    addOrEditFoodModel = createModel(context, () => AddOrEditFoodModel());
    editAboutModel = createModel(context, () => EditAboutModel());
    editWhyusModel = createModel(context, () => EditWhyusModel());
    editAboutUsModel = createModel(context, () => EditAboutUsModel());
    editQAModel = createModel(context, () => EditQAModel());
    superRequestsModel = createModel(context, () => SuperRequestsModel());
    hotelFullInfoModel = createModel(context, () => HotelFullInfoModel());
    hallFullInfoModel = createModel(context, () => HallFullInfoModel());
    foodFullInfoModel = createModel(context, () => FoodFullInfoModel());
    roomFullInfoModel = createModel(context, () => RoomFullInfoModel());
    companyRequestsComponentModel =
        createModel(context, () => CompanyRequestsComponentModel());
    superHotelJuridicalModel =
        createModel(context, () => SuperHotelJuridicalModel());
    editPPModel = createModel(context, () => EditPPModel());
    editTermsModel = createModel(context, () => EditTermsModel());
    editPIModel = createModel(context, () => EditPIModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    hotelSettingsModel.dispose();
    roomSettingsModel.dispose();
    hallSettingsModel.dispose();
    foodSettingsModel.dispose();
    hotelSearchModel.dispose();
    hotelDetailModel.dispose();
    clientSearchModel.dispose();
    addOrEditRoomModel.dispose();
    addOrEditHallModel.dispose();
    addOrEditFoodModel.dispose();
    editAboutModel.dispose();
    editWhyusModel.dispose();
    editAboutUsModel.dispose();
    editQAModel.dispose();
    superRequestsModel.dispose();
    hotelFullInfoModel.dispose();
    hallFullInfoModel.dispose();
    foodFullInfoModel.dispose();
    roomFullInfoModel.dispose();
    companyRequestsComponentModel.dispose();
    superHotelJuridicalModel.dispose();
    editPPModel.dispose();
    editTermsModel.dispose();
    editPIModel.dispose();
  }
}
