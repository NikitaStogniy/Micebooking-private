import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/client/client_favorite/client_favorite_widget.dart';
import '/client/client_profile/client_profile_widget.dart';
import '/client/client_request/client_request_widget.dart';
import '/client/client_request_mob_for_test/client_request_mob_for_test_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/menu/menu_widget.dart';
import 'client_home_widget.dart' show ClientHomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientHomeModel extends FlutterFlowModel<ClientHomeWidget> {
  ///  Local state fields for this page.

  EnumClientPage? currentPage = EnumClientPage.PROFILE;

  ///  State fields for stateful widgets in this page.

  // Model for Menu component.
  late MenuModel menuModel;
  // Model for Client_profile component.
  late ClientProfileModel clientProfileModel;
  // Model for Client_request component.
  late ClientRequestModel clientRequestModel;
  // Model for Client_favorite component.
  late ClientFavoriteModel clientFavoriteModel;
  // Model for Client_requestMobForTest component.
  late ClientRequestMobForTestModel clientRequestMobForTestModel;

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
    clientProfileModel = createModel(context, () => ClientProfileModel());
    clientRequestModel = createModel(context, () => ClientRequestModel());
    clientFavoriteModel = createModel(context, () => ClientFavoriteModel());
    clientRequestMobForTestModel =
        createModel(context, () => ClientRequestMobForTestModel());
  }

  @override
  void dispose() {
    menuModel.dispose();
    clientProfileModel.dispose();
    clientRequestModel.dispose();
    clientFavoriteModel.dispose();
    clientRequestMobForTestModel.dispose();
  }
}
