import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/footer_widget.dart';
import '/components/hotel_search_comp_widget.dart';
import '/components/login_home_pop_up_widget.dart';
import '/components/support_bottomsheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/menu/menu_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool isRegister = false;

  bool isHotel = true;

  ///  State fields for stateful widgets in this page.

  // Model for Menu component.
  late MenuModel menuModel1;
  // Model for HotelSearchComp component.
  late HotelSearchCompModel hotelSearchCompModel1;
  // Model for Menu component.
  late MenuModel menuModel2;
  // Model for HotelSearchComp component.
  late HotelSearchCompModel hotelSearchCompModel2;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    menuModel1 = createModel(context, () => MenuModel());
    hotelSearchCompModel1 = createModel(context, () => HotelSearchCompModel());
    menuModel2 = createModel(context, () => MenuModel());
    hotelSearchCompModel2 = createModel(context, () => HotelSearchCompModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    menuModel1.dispose();
    hotelSearchCompModel1.dispose();
    menuModel2.dispose();
    hotelSearchCompModel2.dispose();
    footerModel.dispose();
  }
}
