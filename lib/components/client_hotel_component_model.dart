import '/backend/supabase/supabase.dart';
import '/empty_states/images_empty/images_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pop_up/hotel_pop_up/hotel_pop_up_widget.dart';
import '/pop_up/pop_up_images/pop_up_images_widget.dart';
import '/uikit/favorite/favorite_widget.dart';
import 'client_hotel_component_widget.dart' show ClientHotelComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientHotelComponentModel
    extends FlutterFlowModel<ClientHotelComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // Model for favorite component.
  late FavoriteModel favoriteModel1;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // Model for favorite component.
  late FavoriteModel favoriteModel2;

  @override
  void initState(BuildContext context) {
    favoriteModel1 = createModel(context, () => FavoriteModel());
    favoriteModel2 = createModel(context, () => FavoriteModel());
  }

  @override
  void dispose() {
    favoriteModel1.dispose();
    favoriteModel2.dispose();
  }
}
